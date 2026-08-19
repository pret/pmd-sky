#include "overlay_29_02326088.h"
#include "move_orb_effects.h"

extern struct StatIndex ATK_STAT_IDX;

extern struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveSweetScent(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    LowerHitChanceStat(attacker, defender, SPATK_STAT_IDX, TRUE);

    return TRUE;
}
