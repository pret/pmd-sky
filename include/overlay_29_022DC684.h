#ifndef PMDSKY_OVERLAY_29_022DC684_H
#define PMDSKY_OVERLAY_29_022DC684_H

struct unk_02353518 {
    u8 field_0x0[4];
    u8 field_0x4;
    u8 field_0x5[3];
    s32 field_0x8;
    u8 field_0xC[0x44];
};

struct unk_022DC694 {
    u32 field_0x0[5];
};

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

void ov29_022DC684(s32 a);
void ov29_022DC694(s32 a, s32 b);
void ov29_022DC6D0(void);
void ov29_022DC6DC(void);
void ov29_022DC6E8(s32 a, s32 b, s32 c, s32 d, u8 e, s16 f, s16 g, s16 h, s16 i, u8 j);
void ov29_022DC728(void);
void ov29_022DC738(s32 a, s32 b);
void ov29_022DC76C(void);
void ov29_022DC778(void);
void ov29_022DC77C(void);
u8 * ov29_022DC78C(s32 id);

#endif
