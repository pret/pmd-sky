#include "dungeon_move.h"
#include "dungeon_util.h"
#include "overlay_29_02321438.h"

const u8 TWO_TURN_STATUSES[11] =
{
    BIDE_STATUS_SOLARBEAM,
    BIDE_STATUS_SKY_ATTACK,
    BIDE_STATUS_RAZOR_WIND,
    BIDE_STATUS_FOCUS_PUNCH,
    BIDE_STATUS_SKULL_BASH,
    BIDE_STATUS_FLYING,
    BIDE_STATUS_BOUNCING,
    BIDE_STATUS_DIVING,
    BIDE_STATUS_DIGGING,
    BIDE_STATUS_SHADOW_FORCE,
    STATUS_NONE
};

bool8 IsChargingAnyTwoTurnMove(struct entity *pokemon, bool8 check_charge)
{
    if (!EntityIsValid__02321438(pokemon))
        return FALSE;

    struct monster *pokemon_info = GetEntInfo(pokemon);
    for (s32 i = 0; i < 100; i++)
    {
        if (TWO_TURN_STATUSES[i] == STATUS_NONE)
            return FALSE;

        if (pokemon_info->bide_class_status.bide == TWO_TURN_STATUSES[i])
            return TRUE;
    }

    // BUG: This condition is never reached because the for loop terminates by returning FALSE at the end of the TWO_TURN_STATUSES array.
    if (check_charge && pokemon_info->bide_class_status.bide == BIDE_STATUS_CHARGING)
        return TRUE;
    return FALSE;
}
