#include "dg_camera.h"
#include "dg_effect.h"
#include "dungeon.h"
#include "dungeon_items.h"
#include "dungeon_map_access.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "overlay_29_02336F4C.h"
#include "overlay_29_0234B104.h"

// file starts at 0x022e26b68

#ifdef JAPAN
#define REVEAL_WHOLE_FLOOR_MESSAGE 0x888
#else
#define REVEAL_WHOLE_FLOOR_MESSAGE 0xB77
#endif

struct unk_0235354C {
    u8 field_0x0;
    u8 field_0x1;
    u8 field_0x2;
    u8 field_0x3;
    void *field_0x4;
};

extern struct dungeon *DUNGEON_PTR[2];

extern const s32 ov29_0235110C[32];
extern struct unk_0235354C ov29_0235354C;

extern bool8 ov10_022BFD20(void);
extern void ov29_022E2C6C(void);
extern void DisplayUi(void);
extern void UpdateCamera(s32 param_1);
extern void UpdateMinimap(void);
extern bool8 ScreenEffectActive(s32 param_1);
extern s32 GetEffectAnimationWanOffset(s32 id);

bool8 EntityIsValid__022E32E8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

bool8 ItemIsActive__022E330C(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}

s16 GetVisibilityRange()
{
    s16 visibility_range = DUNGEON_PTR[0]->display_data.visibility_range;
    if (visibility_range == 0)
        return 2;

    return visibility_range;
}

void ov29_022E335C(void)
{
    struct display_data *display;
    struct monster *info;
    struct entity *camera_target;
    s32 max_hp;
    bool8 ok;

    ok = FALSE;
    camera_target = DUNGEON_PTR[0]->display_data.camera_target;
    if (!DUNGEON_PTR[0]->display_data.unk_fade_to_black_tracker && !ov10_022BFD20() &&
        camera_target != NULL && camera_target->type == ENTITY_MONSTER) {
        ok = TRUE;
    }
    if (!ok) {
        ov29_022E2C6C();
        return;
    }

    display = &DUNGEON_PTR[0]->display_data;
    info = GetEntInfo(display->camera_target);
    DisplayUi();
    display->floor_touch_screen =
        DUNGEON_PTR[0]->floor + DUNGEON_PTR[0]->number_completed_floors;
    max_hp = info->max_hp_stat + info->max_hp_boost;
    if (max_hp > MAX_HP_LIMIT)
        max_hp = MAX_HP_LIMIT;
    display->leader_max_hp_touch_screen = max_hp;
    display->leader_hp_touch_screen = info->hp;
    display->leader_level_touch_screen = info->level;
    display->field_0x44 = display->leader_max_hp_touch_screen / 8;
}

void RevealWholeFloor(struct entity *user, struct entity *target)
{
    s32 x;
    s32 y;

    DUNGEON_PTR[0]->display_data.luminous = TRUE;
    for (y = 0; y < DUNGEON_MAX_SIZE_Y; y++) {
        for (x = 0; x < DUNGEON_MAX_SIZE_X; x++) {
            GetTileSafe(x, y)->spawn_or_visibility_flags.visibility |= 1;
        }
    }
    UpdateCamera(0);
    UpdateTrapsVisibility();
    UpdateMinimap();
    LogMessageByIdWithPopupCheckUser(user, REVEAL_WHOLE_FLOOR_MESSAGE);
}

void ov29_022E34B0(u8 param_1)
{
    DUNGEON_PTR[0]->display_data.field_0x30 = param_1;
}

void ov29_022E34C8(void)
{
    struct dungeon *dungeon;
    s32 intensity;

    dungeon = DUNGEON_PTR[0];
    intensity = dungeon->display_data.screen_shake_intensity;
    if (intensity == 0)
        return;

    if (intensity >= 0x1F)
        intensity = 0x1F;
    dungeon->display_data.screen_shake_offset = ov29_0235110C[intensity];
    DUNGEON_PTR[0]->display_data.screen_shake_intensity--;
    if (DUNGEON_PTR[0]->display_data.screen_shake_intensity == 0) {
        DUNGEON_PTR[0]->display_data.screen_shake_intensity =
            DUNGEON_PTR[0]->display_data.screen_shake_intensity_reset;
    }
}

bool8 ov29_022E3534(struct display_data *display)
{
    if (display->field_0x34 == 0) {
        if (display->luminous || display->natural_lighting)
            return TRUE;
    }
    return FALSE;
}

void ov29_022E3560(u8 param_1)
{
    ov29_0235354C.field_0x0 = param_1;
}

u8 ov29_022E3570(void)
{
    return ov29_0235354C.field_0x0;
}

bool8 DungeonScreenEffectActive(void)
{
    return ScreenEffectActive(0);
}

void ov29_022E3590(struct entity *entity, s32 id, s32 param_3)
{
    PlayEffectAnimationEntity(entity, id, param_3, GetEffectAnimationWanOffset(id),
                              2, 0, -1, NULL);
}
