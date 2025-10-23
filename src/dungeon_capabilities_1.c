#include "dungeon_capabilities_1.h"
#include "dungeon_ai_targeting.h"
#include "dungeon_capabilities.h"
#include "dungeon_move.h"
#include "dungeon_util_static.h"
#include "joined_at_checks.h"

extern bool8 CheckVariousStatuses2__02301308(struct entity *entity, bool8 blind_check);
extern bool8 CheckVariousStatuses__0230172C(struct entity *entity);

bool8 CheckVariousConditions__0230156C(struct entity *entity)
{
    struct monster *pokemon_info = GetEntInfo(entity);

    if (pokemon_info->monster_behavior == BEHAVIOR_RESCUE_TARGET)
        return TRUE;

    if (IsExperienceLocked(pokemon_info))
        return TRUE;

    if (!pokemon_info->is_team_leader && ShouldMonsterRunAway(entity))
        return TRUE;

    if (CheckVariousStatuses2__02301244(entity, FALSE))
        return TRUE;

    if (CheckVariousStatuses__023016DC(entity))
        return TRUE;

    if (IsChargingAnyTwoTurnMove(entity, FALSE))
        return TRUE;

    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_WRAP)
        return TRUE;

    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_WRAPPED)
        return TRUE;

    return FALSE;
}

bool8 CheckVariousConditions__02301624(struct entity *entity)
{
    struct monster *pokemon_info = GetEntInfo(entity);

    if (pokemon_info->monster_behavior == BEHAVIOR_RESCUE_TARGET)
        return TRUE;

    if (IsExperienceLocked(pokemon_info))
        return TRUE;

    if (!pokemon_info->is_team_leader && ShouldMonsterRunAway(entity))
        return TRUE;

    if (CheckVariousStatuses2__02301308(entity, FALSE))
        return TRUE;

    if (CheckVariousStatuses__0230172C(entity))
        return TRUE;

    if (IsChargingAnyTwoTurnMove(entity, FALSE))
        return TRUE;

    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_WRAP)
        return TRUE;

    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_WRAPPED)
        return TRUE;

    return FALSE;
}

bool8 CheckVariousStatuses__023016DC(struct entity *entity)
{
    struct monster *pokemon_info = GetEntInfo(entity);

    if (pokemon_info->sleep_class_status.sleep != STATUS_SLEEP_SLEEPLESS &&
        pokemon_info->sleep_class_status.sleep != STATUS_SLEEP_YAWNING &&
        pokemon_info->sleep_class_status.sleep != STATUS_SLEEP_NONE)
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_FROZEN)
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_PETRIFIED)
        return TRUE;
    if (pokemon_info->bide_class_status.bide == STATUS_TWO_TURN_BIDE)
        return TRUE;

    return FALSE;
}
