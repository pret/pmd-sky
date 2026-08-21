#ifndef PMDSKY_OVERLAY_11_022E9E74_H
#define PMDSKY_OVERLAY_11_022E9E74_H

#include "util.h"

struct unk_0238916C {
    u8 field_0x0[0x44];
};

void ov11_022E9E74(s32 idx, u16 a, s32 b);
void ov11_022E9EBC(s32 idx, u16 a, s32 b);
s32 ov11_022E9EFC(void);
s32 ov11_022E9F48(void);
s32 IsScreenFadeInProgress(void);
bool8 ov11_022E9FA4(s32 idx);
s32 ov11_022E9FC8(s32 a);
s16 ov11_022E9FF4(void);
s16 ov11_022EA004(void);
s16 ov11_022EA014(void);

#endif
