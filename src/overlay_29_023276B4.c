#include "overlay_29_023276B4.h"
#include "move_orb_effects.h"

extern const struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveMetalSound(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    LowerDefensiveStat(attacker, defender, SPATK_STAT_IDX, 3, TRUE, TRUE);

    return TRUE;
}
