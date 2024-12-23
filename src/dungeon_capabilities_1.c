#include "dungeon_capabilities_1.h"
#include "dungeon_ai_targeting.h"
#include "dungeon_capabilities.h"
#include "dungeon_capabilities_2.h"
#include "dungeon_util.h"
#include "joined_at_checks.h"

extern bool8 IsChargingAnyTwoTurnMove(struct entity *pokemon, bool8 check_charge);

bool8 CheckVariousConditions(struct entity *pokemon)
{
    struct monster *pokemon_info = GetEntInfo(pokemon);

    if (pokemon_info->monster_behavior == BEHAVIOR_RESCUE_TARGET)
        return TRUE;

    if (IsExperienceLocked(pokemon_info))
        return TRUE;

    if (!pokemon_info->is_team_leader && ShouldMonsterRunAway(pokemon))
        return TRUE;

    if (CheckVariousStatuses2(pokemon, FALSE))
        return TRUE;

    if (CheckVariousStatuses(pokemon))
        return TRUE;

    if (IsChargingAnyTwoTurnMove(pokemon, FALSE))
        return TRUE;

    if (pokemon_info->frozen_class_status.freeze == FROZEN_STATUS_WRAP)
        return TRUE;

    if (pokemon_info->frozen_class_status.freeze == FROZEN_STATUS_WRAPPED)
        return TRUE;

    return FALSE;
}
