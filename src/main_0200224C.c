#include "main_0200224C.h"

extern u16 PRNG_SEQUENCE_NUM;

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
