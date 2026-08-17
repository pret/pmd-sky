#ifndef PMDSKY_MAIN_0202C5E0_H
#define PMDSKY_MAIN_0202C5E0_H

#include "util.h"
#include "main_0202AAA8.h"

struct unk_0202C5E0 {
    u8 field_0x0[0x1A0];
    s32 field_0x1A0;
    s32 field_0x1A4;
    void *field_0x1A8;
    u8 field_0x1AC[6];
    u8 field_0x1B2;
    u8 field_0x1B3;
    u8 field_0x1B4[8];
    s32 field_0x1BC;
    u8 field_0x1C0[8];
    u8 field_0x1C8;
};


void SetCollectionMenuField0x1BC(s32 window_id, s32 value);

#endif
