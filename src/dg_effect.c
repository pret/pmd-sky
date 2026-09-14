#include "dg_effect.h"
#include "dungeon.h"
#include "dungeon_util_static.h"
#include "overlay_29_022E9FC0.h"

extern struct dungeon *DUNGEON_PTR[];

extern bool8 ShouldDisplayEntityAdvanced(struct entity *entity);
extern void AnimationDelayOrSomething(bool8 param_1);
extern void GetPixelOffsetFromSprite(struct position *offset,
                                     struct animation_control *anim_ctrl, u32 idx);
extern void ov10_022BF274(struct unk_022BF274 *params);
extern s32 ov10_022BF2B4(struct unk_022BF274 *params, s32 param_2);
extern void InitOamAdjustmentInfo(struct unk_0201C000 *oam);
extern bool8 AnimationHasMoreFrames(s16 param_1);

s32 PlayEffectAnimationEntity(struct entity *entity, s32 id, s32 param_3, u8 param_4,
                              s32 param_5, u8 param_6, s16 param_7,
                              struct unk_0201C000 *param_8)
{
    struct position offset;
    struct unk_022BF274 params;
    struct monster *info;
    s32 dy;
    s32 px;
    s32 py;
    s32 handle;
    s32 i;

    if (!EntityIsValid__022E37B8(entity))
        return -1;

    info = GetEntInfo(entity);
    if (!ShouldDisplayEntityAdvanced(entity))
        return -1;

    if (param_6 == 0 && info->two_turn_move_invincible == 2)
        return -1;

    if (param_5 != 0)
        AnimationDelayOrSomething(param_5 == 2);

    GetPixelOffsetFromSprite(&offset, &entity->anim_ctrl, param_4);
    if (offset.x == 0x63 || offset.y == 0x63) {
        px = entity->pixel_pos.x;
        py = entity->pixel_pos.y - info->field_0x188;
    } else {
        px = entity->pixel_pos.x + (offset.x << 8);
        py = entity->pixel_pos.y + (offset.y << 8) - info->field_0x188;
    }
    dy = ((s32)entity->pixel_pos.y >> 8) -
         DUNGEON_PTR[0]->display_data.camera_pixel_pos.y;

    ov10_022BF274(&params);
    params.field_0x0 = id;
    params.field_0x4 = 0;
    if (param_7 < 0 || param_7 > 8)
        params.field_0x8 = -1;
    else
        params.field_0x8 = param_7;
    params.field_0xc = px >> 8;
    params.field_0xe = py >> 8;
    params.field_0x14 = -1;
    params.field_0x10 = 0;
    params.field_0x12 = 0;
    params.field_0x18 = dy / 2 + 1;
    if (param_8 == NULL)
        InitOamAdjustmentInfo(&params.field_0x1c);
    else
        params.field_0x1c = *param_8;

    handle = ov10_022BF2B4(&params, 0);
    if (param_3 == 0)
        return handle;

    for (i = 0; i < 100; i++) {
        if (!AnimationHasMoreFrames(handle))
            break;
        AdvanceFrame(0x42);
    }
    return -1;
}

// file starts at 0x022e35e4

bool8 EntityIsValid__022E37B8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
