#include "overlay_29_02328AE0.h"
#include "move_orb_effects.h"

extern struct StatIndex ATK_STAT_IDX;

extern struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveGrowth(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostOffensiveStat(attacker, defender, SPATK_STAT_IDX, 1);

    return TRUE;
}
