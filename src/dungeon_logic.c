#include "dungeon_logic.h"
#include "dungeon_statuses.h"
#include "dungeon_util_static.h"

bool8 IsMonsterDrowsy(struct entity *monster)
{
    struct monster *pokemon_info = GetEntInfo(monster);
    if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_SLEEP)
        return TRUE;

    if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_NIGHTMARE)
        return TRUE;

    if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_YAWNING)
        return TRUE;

    return FALSE;
}

bool8 MonsterHasNonvolatileNonsleepStatus(struct entity *monster)
{
    return GetEntInfo(monster)->burn_class_status.burn != STATUS_BURN_NONE;
}

bool8 MonsterHasImmobilizingStatus(struct entity *monster)
{
    struct monster *pokemon_info = GetEntInfo(monster);
    if (pokemon_info->frozen_class_status.freeze != STATUS_FROZEN_WRAP &&
        pokemon_info->frozen_class_status.freeze != STATUS_FROZEN_INGRAIN &&
        pokemon_info->frozen_class_status.freeze != STATUS_FROZEN_NONE)
        return TRUE;

    return FALSE;
}

bool8 MonsterHasAttackInterferingStatus(struct entity *monster)
{
    return GetEntInfo(monster)->cringe_class_status.cringe != STATUS_NONE;
}

bool8 MonsterHasSkillInterferingStatus(struct entity *monster)
{
    struct monster *pokemon_info = GetEntInfo(monster);
    if (pokemon_info->curse_class_status.curse == STATUS_CURSE_CURSED)
        return TRUE;

    if (pokemon_info->curse_class_status.curse == STATUS_CURSE_DECOY)
        return TRUE;

    if (pokemon_info->curse_class_status.curse == STATUS_CURSE_GASTRO_ACID)
        return TRUE;

    if (pokemon_info->curse_class_status.curse == STATUS_CURSE_HEAL_BLOCK)
        return TRUE;

    if (pokemon_info->curse_class_status.curse == STATUS_CURSE_EMBARGO)
        return TRUE;

    return FALSE;
}

bool8 MonsterHasLeechSeedStatus(struct entity *monster)
{
    return GetEntInfo(monster)->leech_seed_class_status.leech_seed == STATUS_LEECH_SEED_LEECH_SEED;
}

bool8 MonsterHasWhifferStatus(struct entity *monster)
{
    return GetEntInfo(monster)->sure_shot_class_status.sure_shot == STATUS_SURE_SHOT_WHIFFER;
}

bool8 IsMonsterVisuallyImpaired(struct entity *monster, bool8 check_held_item)
{
    struct monster *pokemon_info = GetEntInfo(monster);
    if (IsBlinded(monster, check_held_item))
        return TRUE;

    if (pokemon_info->blinker_class_status.blinded == STATUS_BLINKER_CROSS_EYED)
        return TRUE;

    if (pokemon_info->blinker_class_status.blinded == STATUS_BLINKER_DROPEYE)
        return TRUE;

    return FALSE;
}

bool8 IsMonsterMuzzled(struct entity *monster)
{
    if (GetEntInfo(monster)->muzzled == TRUE)
        return TRUE;

    return FALSE;
}

bool8 MonsterHasMiracleEyeStatus(struct entity *monster)
{
    if (GetEntInfo(monster)->miracle_eye == TRUE)
        return TRUE;

    return FALSE;
}
