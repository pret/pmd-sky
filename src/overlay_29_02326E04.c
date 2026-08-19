#include "overlay_29_02326E04.h"
#include "move_orb_effects.h"

extern struct StatIndex ATK_STAT_IDX;

extern struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveDoubleTeam(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostHitChanceStat(attacker, defender, SPATK_STAT_IDX);

    return TRUE;
}
