#include "overlay_29_0232923C.h"
#include "move_orb_effects.h"

extern const struct StatIndex ATK_STAT_IDX;

extern const struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveMinimize(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostHitChanceStat(attacker, defender, SPATK_STAT_IDX);

    return TRUE;
}
