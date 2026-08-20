#include "overlay_29_02326088.h"

extern const struct StatIndex ATK_STAT_IDX;
#include "move_orb_effects.h"

extern const struct StatIndex ATK_STAT_IDX;

extern const struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveSweetScent(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    LowerHitChanceStat(attacker, defender, SPATK_STAT_IDX, TRUE);

    return TRUE;
}

bool8 DoMoveCharm(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    ApplyOffensiveStatMultiplier(attacker, defender, ATK_STAT_IDX, 0x80, TRUE);

    return TRUE;
}
