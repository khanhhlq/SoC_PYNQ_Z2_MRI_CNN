// Exported from the attached Tiny CNN V5 INT8 TFLite FlatBuffer.
// Conv2D + fused RELU followed by MAX_POOL_2D 2x2 stride 2.
// TFLite Conv1 weight layout is [out_channel][ky][kx][input_channel].
// The per-channel multiplier / shift pair uses TFLite gemmlowp-style requantization.
// This header replaces Q1.15 conv1_params.h for the INT8 hardware architecture.
#ifndef CONV1_INT8_PARAMS_H
#define CONV1_INT8_PARAMS_H
#include <stdint.h>

#define CONV1_IN_ZERO_POINT (-128)
#define CONV1_OUT_ZERO_POINT (-128)
#define CONV1_FILTERS 8
#define CONV1_KERNEL 3

// Input scale: 0.0039215688593685627, Conv1/Pool1 output scale: 0.0039095692336559296
static const int8_t conv1_w_int8[8][3][3] = {
    {
        {88, 127, 10},
        {-110, 124, 57},
        {-46, 11, -26}
    },
    {
        {82, -127, -125},
        {10, -57, 121},
        {96, 47, 98}
    },
    {
        {-78, -62, 94},
        {127, 69, 41},
        {29, 53, 122}
    },
    {
        {17, 9, 41},
        {83, -97, -22},
        {-127, 95, 13}
    },
    {
        {74, -58, -127},
        {-28, 63, -12},
        {121, -122, 67}
    },
    {
        {-19, -127, -112},
        {38, 17, 23},
        {-12, 66, 27}
    },
    {
        {119, -127, -124},
        {76, -83, 59},
        {19, 111, -55}
    },
    {
        {5, 76, -32},
        {-13, -94, 53},
        {-57, 127, -79}
    }
};

static const int32_t conv1_b_int32[8] = {-2459, -2538, -27, -2171, 4374, 1278, 279, -16};
static const int32_t conv1_multiplier[8] = {1158760159, 1810225966, 1154895791, 1239728041, 2126019785, 1252803956, 2093223496, 1287922102};
static const int32_t conv1_shift[8] = {-8, -9, -8, -8, -9, -8, -9, -8};

// Per-output-channel scales (for checking / documentation only):
// 0.00210132286884, 0.00164135312662, 0.00209431513213, 0.00224815192632, 0.00192768708803, 0.00227186409757, 0.00189795030747, 0.00233554816805

#endif // CONV1_INT8_PARAMS_H
