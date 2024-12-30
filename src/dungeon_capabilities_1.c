#include "dungeon_capabilities_1.h"
#include "dungeon_ai_targeting.h"
#include "dungeon_capabilities.h"
#include "dungeon_capabilities_2.h"
#include "dungeon_move.h"
#include "dungeon_util_static.h"
#include "joined_at_checks.h"

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

    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_WRAP)
        return TRUE;

    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_WRAPPED)
        return TRUE;

    return FALSE;
}
