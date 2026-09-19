#include "overlay_29_022E563C.h"
#include "dg_effect.h"
#include "dungeon.h"
#include "dungeon_util_static.h"
#include "dungeon_util.h"
#include "dungeon_util_2.h"
#include "dg_uty.h"
#include "run_dungeon_1.h"
#include "dungeon_recruitment_2.h"
#include "overlay_29_022E272C.h"
#include "overlay_29_022E9FC0.h"
#include "overlay_29_022EAC7C.h"
#include "overlay_29_022EAE14.h"
#include "overlay_29_0234B104.h"
#include "overlay_29_0234B4BC.h"

#ifdef JAPAN
#define MESSAGE_B92 0x8A4
#else
#define MESSAGE_B92 0xB92
#endif

extern s32 GetEffectAnimationWanOffset(s32 id);
extern struct dungeon *DUNGEON_PTR[];

extern bool8 ov29_022E2CA0(struct position *pos);
extern void ChangeMonsterAnimation(struct entity *entity, s32 animation_id, s32 direction);
extern bool8 AnimationHasMoreFrames(s16 param_1);
extern void FillPixelOffsetArrayFromSprite(struct position *offsets, u8 count,
                                           struct animation_control *anim_ctrl);
extern void InitOamAdjustmentInfo(struct unk_0201C000 *oam);
extern s32 PlayEffectAnimationPixelPos(struct pixel_position *pixel_pos, s32 effect_id,
                                       s32 param_3);
extern void PlayEffectAnimationPos(struct position *pos, s32 effect_id, s32 param_3);
extern u32 GetFloorType(void);

extern s32 ov10_022BDC68(void);
extern s32 ov10_022BEC08(s32 trap_id, struct position *pos);
extern s32 ov10_022BEC94(s32 item_id, struct position *pos, struct position *offsets,
                         s32 param_4, s32 param_5);
extern void ov10_022BF274(struct unk_022BF274 *params);
extern s32 ov10_022BF2B4(struct unk_022BF274 *params, s32 param_2);
extern void ov10_022BF45C(s16 handle, struct position *pos, struct position *param_3,
                          s32 param_4, s32 param_5);

extern void ov29_022E6A00(s32 param_1, s32 param_2, s32 param_3);
extern bool8 ov29_022E6C08(void);
extern void ov29_022E6CE0(void);
extern void ov29_02339148(void);

extern const u16 ov29_02351194[4];
extern const u16 ov29_0235119C[4];
extern const u16 ov29_023511DC[8];
extern const s32 ov29_0235122C[8];
extern const s32 ov29_0235124C[8];

void ov29_022E563C(struct pixel_position *pixel_pos)
{
    PlayEffectAnimationPixelPos(pixel_pos, 0x90, 1);
}

void ov29_022E5650(struct entity *a, struct entity *b)
{
    PlayEffectAnimationEntity(b, 0x167, 1, GetEffectAnimationWanOffset(0x167), 2, 0, -1, 0);
}

void PlaySeByIdIfShouldDisplayEntity(struct entity *entity, s32 se_id)
{
    if (entity == NULL) {
        PlaySeByIdIfNotSilence(se_id);
        return;
    }
    if (!ShouldDisplayEntityAdvanced(entity))
        return;
    PlaySeByIdIfNotSilence(se_id);
}

void ov29_022E56D4(struct position *pos, s32 se_id)
{
    if (!ov29_022E2CA0(pos))
        return;
    PlaySeByIdIfNotSilence(se_id);
}

void ov29_022E56F4(struct entity *entity, s32 id)
{
    if (entity == NULL) {
        PlayMeByIdIfNot998(id);
        return;
    }
    if (!ShouldDisplayEntityAdvanced(entity))
        return;
    PlaySeByIdIfNotSilence(id);
}

void PlayItemThrowSfx(struct entity *entity, enum item_category category)
{
    if (category == CATEGORY_THROWN_LINE) {
        PlaySeByIdIfNotSilence(0x130E);
        return;
    }
    if (category == CATEGORY_THROWN_ARC) {
        PlaySeByIdIfNotSilence(0x130D);
        return;
    }
    PlaySeByIdIfNotSilence(0x130C);
}

void PlayMissSfx__022E611C(struct entity *attacker, struct entity *defender)
{
    if (GetEntInfo(defender)->is_not_team_member)
        PlaySeByIdIfNotSilence(0x1306);
    else
        PlaySeByIdIfNotSilence(0x1307);
}

void PlayMissSfx__022E6150(struct entity *entity)
{
    if (GetEntInfo(entity)->is_not_team_member)
        PlaySeByIdIfNotSilence(0x1306);
    else
        PlaySeByIdIfNotSilence(0x1307);
}

void ov29_022E57D4(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x25A, 1, GetEffectAnimationWanOffset(0x25A), 2, 0, -1, 0);
    PlayEffectAnimationEntity(entity, 0x25B, 1, GetEffectAnimationWanOffset(0x25B), 2, 0, -1, 0);
}

void ov29_022E5864(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x16, 1, GetEffectAnimationWanOffset(0x16), 2, 0, -1, 0);
}

void ov29_022E58B0(struct entity *entity, struct position *pos, s32 trap_id)
{
    struct position p;
    struct monster *info;
    s32 handle;
    s32 i;
    s32 direction;

    if (trap_id == 0x11)
        return;
    if (!ov29_022E2CA0(pos))
        return;

    p.x = (pos->x * 24 + 12) << 8 >> 8;
    p.y = (pos->y * 24 + 16) << 8 >> 8;
    handle = ov10_022BEC08(trap_id, &p);

    if (trap_id == 4 || trap_id == 0x18) {
        PlaySeByIdIfShouldDisplayEntity(NULL, 0x308);
        ov29_022EA370(0x28, 0x33);
    } else if (trap_id == 8) {
        info = GetEntInfo(entity);
        direction = info->action.direction;
        for (i = 0; i < 1000; i += 2) {
            direction = (direction - 1) & 7;
            ChangeMonsterAnimation(entity, 0, direction);
            ov29_022EA370(2, 0x33);
            if (!AnimationHasMoreFrames(handle))
                break;
        }
        info->action.direction = direction & 7;
    } else {
        ov29_022EA370(0x28, 0x33);
    }

    for (i = 0; i < 1000; i++) {
        AdvanceFrame(0x42);
        if (!AnimationHasMoreFrames(handle))
            return;
    }
}

void ov29_022E5A00(struct entity *entity, struct item *item)
{
    struct position offsets[4];
    struct position pos;
    s32 item_id;
    s32 dy;
    s32 handle;
    s32 i;

    if (!ShouldDisplayEntityAdvanced(entity))
        return;

    if (ItemSticky(item->flags))
        item_id = 0;
    else
        item_id = item->id;

    pos.x = (s32)entity->pixel_pos.x >> 8;
    pos.y = (s32)entity->pixel_pos.y >> 8;
    dy = (pos.y - DUNGEON_PTR[0]->display_data.camera_pixel_pos.y) / 2 + 1;
    FillPixelOffsetArrayFromSprite(offsets, 4, &entity->anim_ctrl);
    handle = ov10_022BEC94(item_id, &pos, offsets, 0, dy);

    for (i = 0; i < 1000; i++) {
        AdvanceFrame(0x42);
        if (!AnimationHasMoreFrames(handle))
            return;
    }
}

void ov29_022E5AE4(struct entity *entity, struct item *item)
{
    struct position offsets[4];
    struct position pos;
    s32 item_id;
    s16 dy;
    s32 handle;
    s16 i;

    if (!ShouldDisplayEntityAdvanced(entity))
        return;

    if (ItemSticky(item->flags))
        item_id = 0;
    else
        item_id = item->id;

    pos.x = (s32)entity->pixel_pos.x >> 8;
    pos.y = (s32)entity->pixel_pos.y >> 8;
    dy = (pos.y - DUNGEON_PTR[0]->display_data.camera_pixel_pos.y) / 2 + 1;
    FillPixelOffsetArrayFromSprite(offsets, 4, &entity->anim_ctrl);
    handle = ov10_022BEC94(item_id, &pos, offsets, 1, dy);

    for (i = 0; i < 1000; i++) {
        AdvanceFrame(0x42);
        if (!AnimationHasMoreFrames(handle))
            return;
    }
}

s32 ov29_022E5BD8(struct entity *entity)
{
    struct unk_022BF274 params;
    struct position pos;
    struct position dir;
    struct pixel_position pixel_pos;
    s32 handle;
    s32 i;
    s32 dy;
    u8 direction;
    s32 result;

    if (ShouldDisplayEntityWrapper(entity)) {
        direction = GetEntInfo(entity)->action.direction;
        pos.x = (s32)entity->pixel_pos.x >> 8;
        pos.y = (s32)entity->pixel_pos.y >> 8;
        dy = (pos.y - DUNGEON_PTR[0]->display_data.camera_pixel_pos.y) / 2;

        ov10_022BF274(&params);
        params.field_0x0 = 0x165;
        params.field_0x4 = 0;
        params.field_0x8 = direction;
        params.field_0xc = pos.x;
        params.field_0xe = pos.y;
        params.field_0x10 = 0;
        params.field_0x12 = 0;
        params.field_0x14 = -1;
        params.field_0x18 = dy;
        InitOamAdjustmentInfo(&params.field_0x1c);
        handle = ov10_022BF2B4(&params, 0);

        dir = DIRECTIONS_XY[direction];
        for (i = 0; i < 6; i++) {
            ov10_022BF45C(handle, &pos, NULL, dy, 0);
            AdvanceFrame(0x42);
            pos.x += dir.x * 4;
            pos.y += dir.y * 4;
            dy = (pos.y - DUNGEON_PTR[0]->display_data.camera_pixel_pos.y) / 2;
        }
        ov10_022BDC68();
        pixel_pos.x = pos.x << 8;
        pixel_pos.y = pos.y << 8;
        result = PlayEffectAnimationPixelPos(&pixel_pos, 0x1A0, 1);
    } else {
        result = -1;
    }
    return result;
}

void PlayStairsSfx(void)
{
    s32 se_id = 0x3F00;

    switch (GetFloorType()) {
    case 1:
    case 2:
        break;
    case 0:
    default:
        if (DungeonGoesUp(DUNGEON_PTR[0]->id))
            se_id = 0x130A;
        else
            se_id = 0x1309;
        break;
    }
    PlaySeByIdIfNotSilence(se_id);
}

void ov29_022E5DBC(s32 param_1, s32 param_2)
{
    if (param_2 == 3)
        ChangeDungeonMusic(MUSIC_NONE_0x0);

    if (param_1 != 4) {
        if (param_2 == 3)
            PlaySeByIdIfNotSilence(ov29_0235119C[param_2]);
        else
            PlayMeByIdIfNot998(ov29_0235119C[param_2]);
    } else {
        if (param_2 == 3)
            PlaySeByIdIfNotSilence(ov29_02351194[param_2]);
        else
            PlayMeByIdIfNot998(ov29_0235119C[param_2]);
    }

    ov29_022E6A00(param_1, param_2, 0x80);
    while (ov29_022E6C08())
        AdvanceFrame(0x46);
    ov29_022E6CE0();
    ov29_02339148();
    ov29_0234B1A4(1);
}

void ov29_022E5E84(struct entity *a, struct entity *b)
{
    s32 i;

    ChangeMonsterAnimation(a, 8, 8);
    for (i = 0; i < 100; i++) {
        AdvanceFrame(0x51);
        if ((a->anim_ctrl.anim_frame_flag_sum & 3) != 0 || a->animation_group_id_mirror != 8)
            return;
    }
}

bool8 ShouldDisplayEntityAdvanced(struct entity *entity)
{
    if (!entity->is_visible)
        return FALSE;
    if (DUNGEON_PTR[0]->display_data.blinded)
        return DUNGEON_PTR[0]->display_data.camera_target == entity;
    return ShouldDisplayEntityWrapper(entity);
}

void ov29_022E5F20(void)
{
    s32 i;
    struct entity *entity;
    struct monster *info;

    for (i = 0; i < 20; i++) {
        entity = DUNGEON_PTR[0]->active_monster_ptrs[i];
        if (EntityIsValid__022E37B8(entity) && GetEntInfo(entity)->pickup_flag) {
            info = GetEntInfo(entity);
            info->pickup_flag = FALSE;
            PlayEffectAnimationEntity(entity, 0x199, 0, GetEffectAnimationWanOffset(0x199), 2,
                                      0, -1, 0);
            if (!info->is_not_team_member) {
                SubstitutePlaceholderStringTags(0, entity, 0);
                LogMessageByIdWithPopup(entity, MESSAGE_B92);
            }
        }
    }
}

void ov29_022E5FE8(enum weather_id weather, bool8 param_2)
{
    struct entity *entity;
    s32 se_id;
    s32 effect_id;
    s32 alt_effect_id;

    entity = DUNGEON_PTR[0]->display_data.camera_target;
    if (entity == NULL)
        entity = GetLeader();

    se_id = ov29_023511DC[weather];
    if (se_id != 0x3F00)
        PlaySeByIdIfShouldDisplayEntity(entity, se_id);

    effect_id = ov29_0235122C[weather];
    if (effect_id < 0)
        return;

    if (param_2 && !IsCurrentFixedRoomBossFight()) {
        PlayEffectAnimationEntity(entity, effect_id, 0, GetEffectAnimationWanOffset(effect_id),
                                  2, 0, -1, 0);
    } else {
        alt_effect_id = ov29_0235124C[weather];
        PlayEffectAnimationEntity(entity, alt_effect_id, 0,
                                  GetEffectAnimationWanOffset(alt_effect_id), 2, 0, -1, 0);
    }
}

void ov29_022E60E4(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x29, 1, GetEffectAnimationWanOffset(0x29), 2, 0, -1, 0);
}

void PlayEffectAnimation0x1A9__022E6130(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1A9, 0, GetEffectAnimationWanOffset(0x1A9), 2, 0, -1, 0);
}

void PlayEffectAnimation0x1A9__022E617C(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1A9, 0, GetEffectAnimationWanOffset(0x1A9), 2, 0, -1, 0);
}

void PlayEffectAnimation0x1A9__022E61C8(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1A9, 0, GetEffectAnimationWanOffset(0x1A9), 2, 0, -1, 0);
}

void PlayEffectAnimation0x1A9__022E6214(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1A9, 0, GetEffectAnimationWanOffset(0x1A9), 2, 0, -1, 0);
}

void ov29_022E6260(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1A8, 0, GetEffectAnimationWanOffset(0x1A8), 2, 0, -1, 0);
}

void PlayEffectAnimation0x29(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x29, 0, GetEffectAnimationWanOffset(0x29), 2, 0, -1, 0);
}

void ov29_022E62F0(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x48, 0, GetEffectAnimationWanOffset(0x48), 2, 0, -1, 0);
}

void ov29_022E6338(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1A6, 1, GetEffectAnimationWanOffset(0x1A6), 2, 0, -1, 0);
}

void ov29_022E6388(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x297, 1, GetEffectAnimationWanOffset(0x297), 2, 0, -1, 0);
}

void PlayEffectAnimation0x18E(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x18E, 0, GetEffectAnimationWanOffset(0x18E), 2, 0, -1, 0);
}

void ov29_022E6424(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1B0, 1, GetEffectAnimationWanOffset(0x1B0), 2, 0, -1, 0);
    ov29_022EA370(10, 0x42);
}

void ov29_022E647C(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1A8, 0, GetEffectAnimationWanOffset(0x1A8), 2, 0, -1, 0);
}

void PlayEffectAnimation0x1A9__022E64C4(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1A9, 0, GetEffectAnimationWanOffset(0x1A9), 2, 0, -1, 0);
}

void PlayEffectAnimation0x1A9__022E6510(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1A9, 0, GetEffectAnimationWanOffset(0x1A9), 2, 0, -1, 0);
}

void ov29_022E655C(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1AB, 0, GetEffectAnimationWanOffset(0x1AB), 2, 0, -1, 0);
}

void ov29_022E65A8(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 4, 1, GetEffectAnimationWanOffset(4), 2, 0, -1, 0);
}

void ov29_022E65F4(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x11E, 1, GetEffectAnimationWanOffset(0x11E), 2, 0, -1, 0);
}

void ov29_022E6644(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x11D, 1, GetEffectAnimationWanOffset(0x11D), 2, 0, -1, 0);
}

void PlayKeyDoorUnlockEffect(struct position *pos, bool8 param_2)
{
    PlayEffectAnimationPos(pos, 0x19E, 1);
    if (!param_2)
        return;
    ov29_022E56F4(NULL, 9);
}
