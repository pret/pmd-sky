#include "overlay_29_022E3F20.h"
#include "dungeon.h"
#include "dungeon_util_static.h"
#include "dg_effect.h"

extern struct dungeon *DUNGEON_PTR[];

extern void PlaySeByIdIfShouldDisplayEntity(struct entity *entity, s32 se_id);

extern s32 GetEffectAnimationWanOffset(s32 id);

extern const u64 STATUS_ICON_ARRAY_SLEEP[];
extern const u64 STATUS_ICON_ARRAY_BURN[];
extern const u64 STATUS_ICON_ARRAY_FREEZE[];
extern const u64 STATUS_ICON_ARRAY_CRINGE[];
extern const u64 STATUS_ICON_ARRAY_BIDE[];
extern const u64 STATUS_ICON_ARRAY_REFLECT[];
extern const u64 STATUS_ICON_ARRAY_CURSE[];
extern const u64 STATUS_ICON_ARRAY_LEECH_SEED[];
extern const u64 STATUS_ICON_ARRAY_SURE_SHOT[];
extern const u64 STATUS_ICON_ARRAY_LONG_TOSS[];
extern const u64 STATUS_ICON_ARRAY_INVISIBLE[];
extern const u64 STATUS_ICON_ARRAY_BLINDED[];
extern const u64 STATUS_ICON_ARRAY_MUZZLED[];
extern const u64 STATUS_ICON_ARRAY_MIRACLE_EYE[];
extern const u64 STATUS_ICON_ARRAY_MAGNET_RISE[];

void UpdateStatusIconFlags(struct entity *entity)
{
    struct monster *info;
    u64 icons;
    bool32 show_sleep;
    s32 max_hp;

    if (!EntityIsValid__022E37B8(entity))
        return;

    info = GetEntInfo(entity);
    icons = 0;
    show_sleep = TRUE;
    if (info->id == MONSTER_SUDOWOODO || info->id == MONSTER_SUDOWOODO_SECONDARY) {
        if (info->sleep_class_status.sleep_turns == 0x7f)
            show_sleep = FALSE;
    }
    if (show_sleep)
        icons = icons | STATUS_ICON_ARRAY_SLEEP[info->sleep_class_status.sleep];

    icons = icons | STATUS_ICON_ARRAY_BURN[info->burn_class_status.burn];
    icons = icons | STATUS_ICON_ARRAY_FREEZE[info->frozen_class_status.freeze];
    icons = icons | STATUS_ICON_ARRAY_CRINGE[info->cringe_class_status.cringe];
    icons = icons | STATUS_ICON_ARRAY_BIDE[info->bide_class_status.bide];
    icons = icons | STATUS_ICON_ARRAY_REFLECT[info->reflect_class_status.reflect];
    icons = icons | STATUS_ICON_ARRAY_CURSE[info->curse_class_status.curse];
    icons = icons | STATUS_ICON_ARRAY_LEECH_SEED[info->leech_seed_class_status.leech_seed];
    icons = icons | STATUS_ICON_ARRAY_SURE_SHOT[info->sure_shot_class_status.sure_shot];
    icons = icons | STATUS_ICON_ARRAY_LONG_TOSS[info->long_toss_class_status.status];
    icons = icons | STATUS_ICON_ARRAY_INVISIBLE[info->invisible_class_status.status];
    icons = icons | STATUS_ICON_ARRAY_BLINDED[info->blinker_class_status.blinded];
    icons = icons | STATUS_ICON_ARRAY_MUZZLED[info->muzzled];
    icons = icons | STATUS_ICON_ARRAY_MIRACLE_EYE[info->miracle_eye];
    icons = icons | STATUS_ICON_ARRAY_MAGNET_RISE[info->magnet_rise];

    if (info->grudge)
        icons |= 0x1000000;
    if (info->exposed)
        icons |= 0x2000000;
    if (!info->is_not_team_member) {
        max_hp = info->max_hp_stat + info->max_hp_boost;
        if (max_hp > MAX_HP_LIMIT)
            max_hp = MAX_HP_LIMIT;
        if (info->hp < max_hp / 4)
            icons |= 0x2000;
    }
    if (DUNGEON_PTR[0]->identify_orb_flag) {
        if (ItemExists(info->held_item.flags))
            icons |= 0x2000;
    }
    if (info->stat_modifiers.offensive_multipliers[0] < 0x100 ||
        info->stat_modifiers.offensive_multipliers[1] < 0x100 ||
        info->stat_modifiers.defensive_multipliers[0] < 0x100 ||
        info->stat_modifiers.defensive_multipliers[1] < 0x100 ||
        info->stat_modifiers.offensive_stages[0] < DEFAULT_STAT_STAGE ||
        info->stat_modifiers.offensive_stages[1] < DEFAULT_STAT_STAGE ||
        info->stat_modifiers.defensive_stages[0] < DEFAULT_STAT_STAGE ||
        info->stat_modifiers.defensive_stages[1] < DEFAULT_STAT_STAGE ||
        info->stat_modifiers.hit_chance_stages[0] < DEFAULT_STAT_STAGE ||
        info->stat_modifiers.hit_chance_stages[1] < DEFAULT_STAT_STAGE)
        icons |= 0x8000000;

    *(u64 *)&info->status_icons = icons;
}

void PlayQuestionMarkEffect(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x144, 1, GetEffectAnimationWanOffset(0x144),
                              2, 0, -1, 0);
}

void PlayExclamationPointEffect__022E47D4(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x143, 1, GetEffectAnimationWanOffset(0x143),
                              2, 0, -1, 0);
}

void ov29_022E3E74(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x25, 1, GetEffectAnimationWanOffset(0x25),
                              2, 0, -1, 0);
    PlaySeByIdIfShouldDisplayEntity(entity, 0x30E);
}

void PlayExclamationPointEffect__022E4880(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x143, 1, GetEffectAnimationWanOffset(0x143),
                              2, 0, -1, 0);
}

void ov29_022E3F20(void)
{

}

void ov29_022E3F24(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x141, 1, GetEffectAnimationWanOffset(0x141),
                              2, 0, -1, 0);
}

void ov29_022E3F74(void)
{

}

void ov29_022E3F78(void)
{

}

void ov29_022E3F7C(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 7, 1, GetEffectAnimationWanOffset(7),
                              2, 0, -1, 0);
}

void ov29_022E3FC8(void)
{

}

void ov29_022E3FCC(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 4, 0, GetEffectAnimationWanOffset(4),
                              2, 0, -1, 0);
}

void ov29_022E4014(void)
{

}

void PlayEffectAnimation0x171Full(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x171, 1, GetEffectAnimationWanOffset(0x171),
                              2, 0, -1, 0);
}

void ov29_022E4068(void)
{

}
