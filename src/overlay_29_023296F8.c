#include "overlay_29_023296F8.h"
#include "move_orb_effects.h"
#include "overlay_29_02320764.h"

extern const struct StatIndex ATK_STAT_IDX;

extern const struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveBoostDefense2(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostDefensiveStat(attacker, defender, ATK_STAT_IDX, 2);

    return TRUE;
}


bool8 DoMoveWarp(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryWarp(attacker, defender, 0, 0);

    return TRUE;
}
