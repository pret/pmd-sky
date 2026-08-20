#include "overlay_29_0232A118.h"
#include "move_orb_effects.h"

extern const struct StatIndex ATK_STAT_IDX;

bool8 DoMoveGrowl(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    LowerOffensiveStat(attacker, defender, ATK_STAT_IDX, 1, TRUE, TRUE);

    return TRUE;
}
