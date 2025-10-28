#include "dungeon_logic_6.h"

#include "dungeon_mode.h"
#include "util.h"

bool8 IsBehaviorLoneOutlaw(enum monster_behavior behavior)
{
    bool8 result;

    // If behavior is BEHAVIOR_OUTLAW, BEHAVIOR_HIDDEN_OUTLAW or BEHAVIOR_FLEEING_OUTLAW
    if ((u32) (u8) (behavior + 0xFF) <= BEHAVIOR_FLEEING_OUTLAW) {
        result = TRUE;
    } else {
        result = FALSE;
    }
    return result;
}

bool8 IsSecretBazaarNpcBehavior(enum monster_behavior behavior)
{
    // Includes the following behaviors:
    // BEHAVIOR_SECRET_BAZAAR_KIRLIA
    // BEHAVIOR_SECRET_BAZAAR_MIME_JR
    // BEHAVIOR_SECRET_BAZAAR_SWALOT
    // BEHAVIOR_SECRET_BAZAAR_LICKILICKY
    // BEHAVIOR_SECRET_BAZAAR_SHEDINJA
    if ((u8) ((behavior + 0xF0) & 0xFF) <= 4)
        return TRUE;
    return FALSE;
}
