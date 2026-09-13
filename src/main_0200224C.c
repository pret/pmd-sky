#include "main_0200224C.h"

extern s16 NATURAL_LOG_VALUE_TABLE[];


void ClampedLn(struct fixed_point_64 *out, s32 x)
{
    if (x < 1) {
        x = 1;
    }
    if (x >= 0x800) {
        x = 0x7FF;
    }
    out->lower = NATURAL_LOG_VALUE_TABLE[x] << 4;
    out->upper = 0;
}

void sub_02002228(u32 param_1)
{
}

extern u16 PRNG_SEQUENCE_NUM;

u16 GetRngSeed(void)
{
    return PRNG_SEQUENCE_NUM;
}

void SetRngSeed(u16 seed)
{
    PRNG_SEQUENCE_NUM = seed;
}

u16 Rand16Bit() {
    PRNG_SEQUENCE_NUM = (PRNG_SEQUENCE_NUM * 0x6D) + 0x3FD;
    return PRNG_SEQUENCE_NUM;
}

u32 RandInt(u32 n) {
    return ((s32)n * Rand16Bit()) >> 0x10;
}

s32 RandRange(s32 x, s32 y) {
    return x + ((s32) ((y - x) * Rand16Bit()) >> 0x10);
}

u32 Rand32Bit() {
    return (Rand16Bit() << 0x10) | Rand16Bit();
}
