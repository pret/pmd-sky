#ifndef PMDSKY_MAIN_0200224C_H
#define PMDSKY_MAIN_0200224C_H

#include "main_02001BB4.h"

void ClampedLn(struct fixed_point_64 *out, s32 x);
void sub_02002228(u32 param_1);
u16 GetRngSeed(void);
void SetRngSeed(u16 seed);
u16 Rand16Bit();
u32 RandInt(u32 n);
s32 RandRange(s32 x, s32 y);
u32 Rand32Bit();

#endif //PMDSKY_MAIN_0200224C_H
