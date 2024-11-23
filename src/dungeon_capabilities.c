#include "dungeon_capabilities.h"
#include "dungeon_ai_targeting.h"
#include "dungeon_util.h"
#include "joined_at_checks.h"

extern bool8 CheckVariousStatuses2(struct entity *pokemon, bool8 check_blinker);
extern bool8 CheckVariousStatuses(struct entity *pokemon);
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

    if (pokemon_info->frozen_class_status.freeze == FREEZE_STATUS_WRAPPED)
        return TRUE;

    if (pokemon_info->frozen_class_status.freeze == FREEZE_STATUS_WRAP)
        return TRUE;

    return FALSE;
}
