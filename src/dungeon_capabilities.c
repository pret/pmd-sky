#include "dungeon_capabilities.h"
#include "dungeon_capabilities_1.h"
#include "dungeon_statuses.h"
#include "dungeon_util_static.h"

bool8 IsMonsterSleeping(struct entity *monster)
{
    if (GetEntInfo(monster)->sleep_class_status.sleep == STATUS_SLEEP_SLEEP)
        return TRUE;

    if (GetEntInfo(monster)->sleep_class_status.sleep == STATUS_SLEEP_NAPPING)
        return TRUE;

    if (GetEntInfo(monster)->sleep_class_status.sleep == STATUS_SLEEP_NIGHTMARE)
        return TRUE;

    return FALSE;
}

bool8 MonsterHasQuarterHp(struct entity *monster)
{
    struct monster *entity_data = GetEntInfo(monster);
    s32 max_hp = entity_data->max_hp_stat + entity_data->max_hp_boost;
    if (max_hp > MAX_HP_LIMIT)
        max_hp = MAX_HP_LIMIT;

    if (entity_data->hp <= max_hp / 4)
        return TRUE;
    return FALSE;
}

bool8 CheckVariousStatuses2__02301244(struct entity *entity, bool8 blind_check)
{
    struct monster *pokemon_info = GetEntInfo(entity);

    if ((blind_check && IsBlinded(entity, TRUE)))
        return TRUE;
    if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_SLEEP)
        return TRUE;
    if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_NAPPING)
        return TRUE;
    if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_NIGHTMARE)
        return TRUE;
    if (pokemon_info->cringe_class_status.cringe == STATUS_CRINGE_PAUSED)
        return TRUE;
    if (pokemon_info->cringe_class_status.cringe == STATUS_CRINGE_INFATUATED)
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_WRAP)
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_WRAPPED)
        return TRUE;
    if (CheckVariousStatuses__023016DC(entity))
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_PETRIFIED)
        return TRUE;
    if (pokemon_info->terrified_turns != 0)
        return TRUE;

    return FALSE;
}
