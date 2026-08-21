#include "overlay_10_022BFD58.h"

extern struct unk_022DC1C4 *ov10_022DC1C4;

extern void *MemAlloc(u32 size, u32 flags);

extern void MemZero(void *p, s32 n);

extern struct move_anim_info ov10_022C9070[];

extern s16 ov10_022C7A86[];

extern s16 ITEM_ANIMATION_INFO[];

extern s16 TRAP_ANIMATION_INFO[];

extern struct anim_06 SPECIAL_MONSTER_MOVE_ANIMATION_INFO[];

extern struct move_anim_info MOVE_ANIMATION_INFO[];

extern struct anim_1C EFFECT_ANIMATION_INFO[];

extern struct unk_022DC1C0 *ov10_022DC1C0;

extern s32 sub_02001808(void);

u8 ov10_022BFD58(s32 move_id)
{
    return GetMoveAnimation(move_id)->field_0x8 & 7;
}

bool8 ov10_022BFD6C(s32 move_id)
{
    return (GetMoveAnimation(move_id)->field_0x8 & 8) != 0;
}

bool8 ov10_022BFD8C(s32 move_id)
{
    return (GetMoveAnimation(move_id)->field_0x8 & 0x10) != 0;
}

bool8 ov10_022BFDAC(s32 move_id)
{
    return (GetMoveAnimation(move_id)->field_0x8 & 0x20) != 0;
}

bool8 ov10_022BFDCC(s32 move_id)
{
    return (GetMoveAnimation(move_id)->field_0x8 & 0x40) != 0;
}

s32 ov10_022BFDEC(s32 a)
{
    return a == 0x65 || a == 0x10E || a == 0x1BC;
}

u16 ov10_022BFE0C(s32 a)
{
    return a;
}

u16 ov10_022BFE18(s32 a)
{
    return a + 0x10C;
}

u16 ov10_022BFE28(s32 a)
{
    return a + 0x122;
}

bool8 ov10_022BFE3C(u32 a)
{
    return a - 1 <= 3;
}

bool8 ov10_022BFE54(u32 a)
{
    return a - 5 <= 1;
}

bool8 ov10_022BFE6C(s32 a)
{
    if (sub_02001808() < a) {
        ov10_022DC1C0->field_0x27A0 = TRUE;

        return TRUE;
    }

    return FALSE;
}

struct anim_1C* GetEffectAnimation(s32 id)
{
    return &EFFECT_ANIMATION_INFO[id];
}

struct move_anim_info* GetMoveAnimation(s32 move_id)
{
    return &MOVE_ANIMATION_INFO[move_id];
}

struct anim_06* GetSpecialMonsterMoveAnimation(s32 id)
{
    return &SPECIAL_MONSTER_MOVE_ANIMATION_INFO[id];
}

s16 GetTrapAnimation(s32 trap_id)
{
    return TRAP_ANIMATION_INFO[trap_id];
}

s16 GetItemAnimation1(s32 item_id)
{
    return ITEM_ANIMATION_INFO[item_id * 2];
}

s16 GetItemAnimation2(s32 item_id)
{
    return ov10_022C7A86[item_id * 2];
}

s32 GetMoveAnimationSpeed(s32 move_id)
{
    return ov10_022C9070[move_id].field_0x0;
}

void ov10_022BFF30(s32 a)
{
    if (ov10_022DC1C4 == NULL) {
        ov10_022DC1C4 = MemAlloc(0x84, 0xB);
        MemZero(ov10_022DC1C4, 0x84);
    }

    ov10_022DC1C4->field_0x0 = a;
}
