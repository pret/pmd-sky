#include "overlay_29_02329534.h"
#include "move_orb_effects.h"

extern const struct StatIndex ATK_STAT_IDX;

extern const struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveSwordsDance(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostOffensiveStat(attacker, defender, ATK_STAT_IDX, 2);

    return TRUE;
}
