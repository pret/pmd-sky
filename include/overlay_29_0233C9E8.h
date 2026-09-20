#ifndef PMDSKY_OVERLAY_29_0233C9E8_H
#define PMDSKY_OVERLAY_29_0233C9E8_H

#include "dungeon_mode.h"

struct unk_0233C9E8 {
    s16 field_0x0;
    s16 field_0x2;
    s16 field_0x4;
    s16 field_0x6;
    u8 field_0x8;
    u8 field_0x9;
    u8 field_0xa;
    u8 field_0xb;
    u8 field_0xc;
    u8 field_0xd;
    u8 field_0xe;
    u8 field_0xf;
    u8 field_0x10;
    u8 field_0x11[0xd];
};

struct unk_0237CFBC {
    u8 field_0x0;
    u8 field_0x1;
    u8 field_0x2;
    u8 field_0x3;
    u8 field_0x4;
    u8 field_0x5;
    u8 field_0x6;
};

extern struct unk_0237CFBC FLOOR_GENERATION_STATUS;

void GenerateExtraHallways(struct unk_0233C9E8 (*grid)[15], s32 grid_size_x, s32 grid_size_y,
                           s32 n_extra_hallways);

#endif //PMDSKY_OVERLAY_29_0233C9E8_H
