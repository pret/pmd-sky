#include "dungeon_logic_0.h"
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
