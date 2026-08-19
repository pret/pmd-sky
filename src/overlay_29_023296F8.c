#include "overlay_29_023296F8.h"
#include "move_orb_effects.h"

extern struct StatIndex ATK_STAT_IDX;

extern struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveBoostDefense2(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostDefensiveStat(attacker, defender, ATK_STAT_IDX, 2);

    return TRUE;
}

extern void TryWarp(struct entity *user, struct entity *target, s32, s32);

bool8 DoMoveWarp(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryWarp(attacker, defender, 0, 0);

    return TRUE;
}
