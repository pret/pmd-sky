#ifndef PMDSKY_OVERLAY_10_022BFD58_H
#define PMDSKY_OVERLAY_10_022BFD58_H

#include "util.h"

struct unk_022DC1C4 { s32 field_0x0; u8 field_0x4[0x80]; };

struct unk_022DC1C0 { u8 field_0x0[0x27A0]; bool8 field_0x27A0; };

struct anim_06 { u8 x[6]; };

struct anim_1C { u8 x[0x1C]; };

struct move_anim_info {
    s32 field_0x0;
    u8 field_0x4[4];
    u8 field_0x8;
    u8 field_0x9[0xF];
};

u8 ov10_022BFD58(s32 move_id);
bool8 ov10_022BFD6C(s32 move_id);
bool8 ov10_022BFD8C(s32 move_id);
bool8 ov10_022BFDAC(s32 move_id);
bool8 ov10_022BFDCC(s32 move_id);
s32 ov10_022BFDEC(s32 a);
u16 ov10_022BFE0C(s32 a);
u16 ov10_022BFE18(s32 a);
u16 ov10_022BFE28(s32 a);
bool8 ov10_022BFE3C(u32 a);
bool8 ov10_022BFE54(u32 a);
bool8 ov10_022BFE6C(s32 a);
struct anim_1C* GetEffectAnimation(s32 id);
struct move_anim_info* GetMoveAnimation(s32 move_id);
struct anim_06* GetSpecialMonsterMoveAnimation(s32 id);
s16 GetTrapAnimation(s32 trap_id);
s16 GetItemAnimation1(s32 item_id);
s16 GetItemAnimation2(s32 item_id);
s32 GetMoveAnimationSpeed(s32 move_id);
void ov10_022BFF30(s32 a);

#endif
