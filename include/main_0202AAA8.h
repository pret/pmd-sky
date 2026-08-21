#ifndef PMDSKY_MAIN_0202AAA8_H
#define PMDSKY_MAIN_0202AAA8_H

#include "util.h"
#include "main_02028080.h"

struct unk_0202AAA8 {
    u8 field_0x0[8];
    u8 field_0x8;
    u8 field_0x9[0x17];
    u16 field_0x20;
    u8 field_0x22[0x7E];
    s32 field_0xA0;
    u8 field_0xA4[0x54];
    u32 field_0xF8;
    u8 field_0xFC[8];
    u32 field_0x104;
    u8 field_0x108[0x90];
    void *field_0x198;
    s32 field_0x19C;
    u8 field_0x1A0;
    u8 field_0x1A1;
    u8 field_0x1A2[2];
    s32 field_0x1A4;
    u8 field_0x1A8[4];
    s32 field_0x1AC;
    s32 field_0x1B0;
    u8 field_0x1B4[8];
    s32 field_0x1BC;
    u8 field_0x1C0[2];
    u8 field_0x1C2;
    u8 field_0x1C3;
    u8 field_0x1C4;
};

void *GetWindowContents(s32 window_id);

void SetParentMenuState7(s32 window_id);
void CloseParentMenu(s32 window_id);
bool8 sub_0202AAE8(s32 window_id);

#endif
