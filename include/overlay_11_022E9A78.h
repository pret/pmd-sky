#ifndef PMDSKY_OVERLAY_11_022E9A78_H
#define PMDSKY_OVERLAY_11_022E9A78_H

#include "util.h"

struct unk_02388FC0 {
    bool8 field_0x0;
    u8 field_0x1;
    bool8 field_0x2;
    u8 field_0x3;
    u8 field_0x4[8];
    s32 field_0xC;
};

struct unk_023890A0 {
    u8 field_0x0[0x44];
};

void ov11_022E9A78(s32 a);
void ov11_022E9A90(s32 a);
void ov11_022E9AA8(s32 a);
void ov11_022E9AC0(s32 a);
void ov11_022E9AD8(s32 a);
void ov11_022E9AF0(s32 a, u8 b);
void ov11_022E9B0C(s32 a);
void ov11_022E9B24(s32 a);
void ov11_022E9B40(s32 a);
void ov11_022E9B5C(s32 a, s32 b, s32 c);

#endif
