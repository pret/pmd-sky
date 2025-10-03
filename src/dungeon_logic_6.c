#include "dungeon_logic_6.h"

#include "dungeon_mode.h"
#include "util.h"

bool8 IsLoneOutlaw(enum monster_behavior behavior)
{
    bool8 result;

    // If behavior is 1, 2 or 3
    if ((u32) (u8) (behavior + 0xFF) <= BEHAVIOR_FLEEING_OUTLAW) {
        result = TRUE;
    } else {
        result = FALSE;
    }
    return result;
}
