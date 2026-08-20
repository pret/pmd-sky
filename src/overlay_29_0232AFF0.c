#include "overlay_29_0232AFF0.h"
#include "move_orb_effects.h"

extern const struct StatIndex ATK_STAT_IDX;

bool8 DoMoveFeatherDance(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    LowerOffensiveStat(attacker, defender, ATK_STAT_IDX, 2, TRUE, TRUE);

    return TRUE;
}
