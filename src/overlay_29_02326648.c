#include "overlay_29_02326648.h"
#include "move_orb_effects.h"

extern const struct StatIndex ATK_STAT_IDX;

bool8 DoMoveScreech(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    ApplyDefensiveStatMultiplier(attacker, defender, ATK_STAT_IDX, 0x40, TRUE);

    return TRUE;
}
