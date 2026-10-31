// Standalone C Simulation testbench for conv1.cpp.
// CPU reference separately recomputes Conv1, ReLU and MaxPool.
// This compares the HLS architecture with an integer arithmetic reference.
// Exact equivalence with the deployed TFLite interpreter needs a later test.

#include <cstdint>
#include <cstdio>
#include <algorithm>
#include "ap_int.h"
#include "ap_axi_sdata.h"
#include "hls_stream.h"
#include "conv1_int8_params.h"

typedef ap_axiu<8, 0, 0, 0> in_axis_t;
typedef ap_axiu<64, 0, 0, 0> out_axis_t;
void conv1_hls(hls::stream<in_axis_t>&, hls::stream<out_axis_t>&);

static int32_t requantize_cpu(int32_t accumulator, int32_t multiplier,
                               int shift) {
    int64_t product = (int64_t)accumulator * multiplier;
    const int64_t half = (int64_t)1 << 30;
    int64_t nudge = (product >= 0) ? half : 1-half;
    int32_t high = (int32_t)((product+nudge) / ((int64_t)1 << 31));
    int32_t right = -shift;
    int32_t mask = (1 << right)-1;
    int32_t remainder = high & mask;
    int32_t threshold = (mask >> 1) + (high < 0);
    return (high >> right) + (remainder > threshold);
}

static int8_t image[96][96];
static int8_t conv[94][94][8];

int main() {
    hls::stream<in_axis_t> input;
    hls::stream<out_axis_t> output;

    // Deterministic full-range signed INT8 test image.
    for (int y = 0; y < 96; ++y) {
        for (int x = 0; x < 96; ++x) {
            int8_t p = (int8_t)(((y*37 + x*23 + y*x*3) & 255)-128);
            image[y][x] = p;
            in_axis_t word;
            word.data = (ap_uint<8>)((ap_int<8>)p);
            word.keep = 1;
            word.strb = 1;
            word.last = (y==95 && x==95) ? 1 : 0;
            input.write(word);
        }
    }

    // Independent CPU reference for all 94*94*8 Conv1 outputs.
    for (int y = 0; y < 94; ++y) {
        for (int x = 0; x < 94; ++x) {
            for (int f = 0; f < 8; ++f) {
                int32_t acc = conv1_b_int32[f];
                for (int ky = 0; ky < 3; ++ky)
                    for (int kx = 0; kx < 3; ++kx)
                        acc += ((int32_t)image[y+ky][x+kx]+128) *
                               (int32_t)conv1_w_int8[f][ky][kx];
                int32_t q = requantize_cpu(
                    acc, conv1_multiplier[f], conv1_shift[f]) - 128;
                if (q < -128) q = -128;
                if (q > 127) q = 127;
                conv[y][x][f] = (int8_t)q;
            }
        }
    }

    conv1_hls(input, output);
    int errors=0, words=0;
    for (int y=0; y<47; ++y) {
        for (int x=0; x<47; ++x) {
            if (output.empty()) {
                std::printf("FAIL: missing output word %d\n",words);
                return 1;
            }
            out_axis_t got=output.read();
            for (int f=0; f<8; ++f) {
                int8_t expected=conv[2*y][2*x][f];
                expected=std::max(expected,conv[2*y+1][2*x][f]);
                expected=std::max(expected,conv[2*y][2*x+1][f]);
                expected=std::max(expected,conv[2*y+1][2*x+1][f]);
                ap_uint<8> raw=got.data.range(8*f+7,8*f);
                int actual=(int)((ap_int<8>)raw);
                if (actual != (int)expected) {
                    if (errors<10)
                        std::printf("Mismatch y=%d x=%d f=%d: got=%d expected=%d\n",
                                    y,x,f,actual,(int)expected);
                    ++errors;
                }
            }
            bool expected_last = (y==46 && x==46);
            if ((bool)got.last != expected_last) {
                std::printf("FAIL: TLAST mismatch at word %d\n",words);
                ++errors;
            }
            ++words;
        }
    }
    if (!output.empty()) {
        std::printf("FAIL: unexpected extra output words\n");
        ++errors;
    }
    std::printf("Verified %d pooled vectors, %d INT8 channels; errors=%d\n",
                words,words*8,errors);
    if (errors) return 1;
    std::puts("PASS: Conv1 + ReLU + MaxPool INT8 CPU vs HLS C simulation");
    return 0;
}
