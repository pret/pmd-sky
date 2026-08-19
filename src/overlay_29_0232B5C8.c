#include "overlay_29_0232B5C8.h"
#include "move_orb_effects.h"

extern struct StatIndex ATK_STAT_IDX;

extern struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveTailGlow(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostOffensiveStat(attacker, defender, SPATK_STAT_IDX, 2);

    return TRUE;
}
