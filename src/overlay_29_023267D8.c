#include "overlay_29_023267D8.h"
#include "move_orb_effects.h"

extern const struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveFakeTears(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    LowerDefensiveStat(attacker, defender, SPATK_STAT_IDX, 2, TRUE, TRUE);

    return TRUE;
}
