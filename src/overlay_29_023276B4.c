#include "overlay_29_023276B4.h"
#include "move_orb_effects.h"

extern const struct StatIndex SPATK_STAT_IDX[];

bool8 DoMoveMetalSound(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    LowerDefensiveStat(attacker, defender, SPATK_STAT_IDX[0], 3, TRUE, TRUE);

    return TRUE;
}

bool8 DoMoveTickle(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    struct StatIndex stat = SPATK_STAT_IDX[1];

    LowerOffensiveStat(attacker, defender, stat, 1, TRUE, TRUE);
    LowerDefensiveStat(attacker, defender, stat, 1, TRUE, TRUE);

    return TRUE;
}
