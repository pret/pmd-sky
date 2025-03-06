#include "dungeon_move.h"
#include "dungeon_util_static.h"
#include "overlay_29_02321438.h"

const enum status_two_turn_id TWO_TURN_STATUSES[11] =
{
    STATUS_TWO_TURN_SOLARBEAM,
    STATUS_TWO_TURN_SKY_ATTACK,
    STATUS_TWO_TURN_RAZOR_WIND,
    STATUS_TWO_TURN_FOCUS_PUNCH,
    STATUS_TWO_TURN_SKULL_BASH,
    STATUS_TWO_TURN_FLYING,
    STATUS_TWO_TURN_BOUNCING,
    STATUS_TWO_TURN_DIVING,
    STATUS_TWO_TURN_DIGGING,
    STATUS_TWO_TURN_SHADOW_FORCE,
    STATUS_TWO_TURN_NONE
};

bool8 IsChargingAnyTwoTurnMove(struct entity *entity, bool8 charge_check_unused)
{
    if (!EntityIsValid__02321438(entity))
        return FALSE;

    struct monster *pokemon_info = GetEntInfo(entity);
    for (s32 i = 0; i < 100; i++)
    {
        if (TWO_TURN_STATUSES[i] == STATUS_NONE)
            return FALSE;

        if (pokemon_info->bide_class_status.bide == TWO_TURN_STATUSES[i])
            return TRUE;
    }

    // BUG: This condition is never reached because the for loop terminates by returning FALSE at the end of the TWO_TURN_STATUSES array.
    if (charge_check_unused && pokemon_info->bide_class_status.bide == STATUS_TWO_TURN_CHARGING)
        return TRUE;
    return FALSE;
}
