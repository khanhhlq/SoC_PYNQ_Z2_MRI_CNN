
#include "ap_int.h"
#include "ap_axi_sdata.h"
#include "hls_stream.h"
#include "conv1_int8_params.h"

// ==========================================
// Tiny CNN V5 - Optimized Conv1 INT8
// Target: PYNQ-Z2 / Zynq-7020
// Vitis HLS 2026.1
//
// Input : 96 x 96 x 1, INT8
// Conv1 : 3 x 3, 8 filters, VALID
// ReLU  : Fused activation
// Pool  : MaxPooling 2 x 2, stride 2
// Output: 47 x 47 x 8, INT8
//
// AXI Input : 8 bits
// AXI Output: 64 bits (8 channels)
// Clock target: 100 MHz
// ==========================================

typedef ap_axiu<8, 0, 0, 0> in_axis_t;
typedef ap_axiu<64, 0, 0, 0> out_axis_t;

// ==========================================
// INTEGER REQUANTIZATION
// ==========================================

static ap_int<32> requantize(
    ap_int<32> acc,
    ap_int<32> mult,
    ap_int<32> shift
) {
#pragma HLS INLINE

    ap_int<64> product =
        (ap_int<64>)acc * mult;

    const ap_int<64> half =
        ((ap_int<64>)1 << 30);

    // Avoid ambiguous ternary operators
    ap_int<64> nudge;

    if (product >= 0) {
        nudge = half;
    } else {
        nudge = (ap_int<64>)1 - half;
    }

    ap_int<64> rounded_product =
        product + nudge;

    // Rounded high multiplication.
    // Signed division is truncated toward zero.
    ap_int<32> high;

    if (rounded_product >= 0) {
        high = (ap_int<32>)(
            rounded_product >> 31
        );
    } else {
        ap_int<64> magnitude =
            -rounded_product;

        high = -(ap_int<32>)(
            magnitude >> 31
        );
    }

    // Extracted TFLite shifts are -8 or -9
    ap_uint<5> right_shift =
        (ap_uint<5>)(-shift);

    ap_int<32> mask =
        (((ap_int<32>)1 << right_shift) - 1);

    ap_int<32> remainder =
        high & mask;

    ap_int<32> threshold =
        (mask >> 1) +
        ((high < 0) ? 1 : 0);

    ap_int<32> result =
        (high >> right_shift) +
        ((remainder > threshold) ? 1 : 0);

    return result;
}

// ==========================================
// CONV2D 3x3 - 8 PARALLEL FILTERS
// ==========================================

static ap_uint<64> conv_at(
    ap_int<8> window[3][3]
) {
#pragma HLS INLINE

    ap_uint<64> packed = 0;

FILTER_LOOP:
    for (int f = 0; f < 8; f++) {
#pragma HLS UNROLL

        ap_int<32> acc =
            conv1_b_int32[f];

KERNEL_Y:
        for (int ky = 0; ky < 3; ky++) {
#pragma HLS UNROLL

KERNEL_X:
            for (int kx = 0; kx < 3; kx++) {
#pragma HLS UNROLL

                // Input zero-point = -128
                ap_int<9> centered =
                    (ap_int<9>)window[ky][kx]
                    + 128;

                ap_int<8> weight =
                    conv1_w_int8[f][ky][kx];

                ap_int<18> product =
                    centered * weight;

                acc += (ap_int<32>)product;
            }
        }

        // INT32 -> INT8 requantization
        ap_int<32> q = requantize(
            acc,
            conv1_multiplier[f],
            conv1_shift[f]
        );

        q += CONV1_OUT_ZERO_POINT;

        // Fused ReLU and INT8 saturation
        if (q < -128) {
            q = -128;
        }

        if (q > 127) {
            q = 127;
        }

        // Pack eight INT8 output channels
        packed.range(
            8 * f + 7,
            8 * f
        ) = (ap_uint<8>)((ap_int<8>)q);
    }

    return packed;
}

// ==========================================
// TOP FUNCTION - CONV1 HLS
// ==========================================

void conv1_hls(
    hls::stream<in_axis_t>& s_axis,
    hls::stream<out_axis_t>& m_axis
) {
#pragma HLS INTERFACE mode=axis port=s_axis
#pragma HLS INTERFACE mode=axis port=m_axis
#pragma HLS INTERFACE mode=s_axilite port=return bundle=control

    // ======================================
    // LINE BUFFERS
    // ======================================

    ap_int<8> row_old[96];
    ap_int<8> row_mid[96];

#pragma HLS BIND_STORAGE variable=row_old type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=row_mid type=ram_2p impl=bram

    // ======================================
    // SLIDING WINDOW 3x3
    // ======================================

    ap_int<8> window[3][3];

#pragma HLS ARRAY_PARTITION variable=window complete dim=0

    // Store one Conv1 row for MaxPooling
    ap_uint<64> pool_top[94];

#pragma HLS BIND_STORAGE variable=pool_top type=ram_2p impl=bram

    ap_uint<64> pool_bottom_left = 0;

    // ======================================
    // PROCESS INPUT IMAGE
    // ======================================

ROW_LOOP:
    for (int y = 0; y < 96; y++) {

COL_LOOP:
        for (int x = 0; x < 96; x++) {
#pragma HLS PIPELINE II=1

            in_axis_t in_word =
                s_axis.read();

            ap_int<8> pixel =
                (ap_int<8>)in_word.data;

            ap_int<8> top = 0;
            ap_int<8> middle = 0;

            // Read previous rows
            if (y >= 2) {
                top = row_old[x];
            }

            if (y >= 1) {
                middle = row_mid[x];
                row_old[x] = middle;
            }

            row_mid[x] = pixel;

            // ==================================
            // UPDATE SLIDING WINDOW
            // ==================================

SHIFT_WINDOW:
            for (int r = 0; r < 3; r++) {
#pragma HLS UNROLL

                window[r][0] =
                    window[r][1];

                window[r][1] =
                    window[r][2];
            }

            window[0][2] = top;
            window[1][2] = middle;
            window[2][2] = pixel;

            // ==================================
            // VALID CONVOLUTION REGION
            // ==================================

            if (y >= 2 && x >= 2) {

                const int cy = y - 2;
                const int cx = x - 2;

                // Compute 8 filters in parallel
                ap_uint<64> current =
                    conv_at(window);

                // ==================================
                // MAXPOOLING 2x2
                // ==================================

                if ((cy & 1) == 0) {

                    // First pooling row
                    pool_top[cx] = current;

                } else if ((cx & 1) == 0) {

                    // Bottom-left value
                    pool_bottom_left = current;

                } else {

                    // Bottom-right value
                    ap_uint<64> top_left =
                        pool_top[cx - 1];

                    ap_uint<64> top_right =
                        pool_top[cx];

                    ap_uint<64> pooled = 0;

POOL_CHANNEL:
                    for (int f = 0; f < 8; f++) {
#pragma HLS UNROLL

                        ap_int<8> a =
                            (ap_int<8>)top_left.range(
                                8 * f + 7, 8 * f
                            );

                        ap_int<8> b =
                            (ap_int<8>)top_right.range(
                                8 * f + 7, 8 * f
                            );

                        ap_int<8> c =
                            (ap_int<8>)pool_bottom_left.range(
                                8 * f + 7, 8 * f
                            );

                        ap_int<8> d =
                            (ap_int<8>)current.range(
                                8 * f + 7, 8 * f
                            );

                        // Maximum of 2x2 values
                        ap_int<8> value = a;

                        if (b > value) {
                            value = b;
                        }

                        if (c > value) {
                            value = c;
                        }

                        if (d > value) {
                            value = d;
                        }

                        pooled.range(
                            8 * f + 7, 8 * f
                        ) = (ap_uint<8>)value;
                    }

                    // ==================================
                    // WRITE AXI4-STREAM OUTPUT
                    // ==================================

                    out_axis_t out_word;

                    out_word.data = pooled;
                    out_word.keep = -1;
                    out_word.strb = -1;

                    // TLAST on final pooled vector
                    if (cy == 93 && cx == 93) {
                        out_word.last = 1;
                    } else {
                        out_word.last = 0;
                    }

                    m_axis.write(out_word);
                }
            }
        }
    }
}
