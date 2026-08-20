#include "overlay_29_02328A54.h"
#include "move_orb_effects.h"

extern const struct StatIndex ATK_STAT_IDX;

extern const struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveLowerAccuracy1(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    LowerHitChanceStat(attacker, defender, ATK_STAT_IDX, TRUE);

    return TRUE;
}
