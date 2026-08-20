#include "overlay_29_0232A04C.h"
#include "move_orb_effects.h"

extern const struct StatIndex ATK_STAT_IDX;

extern const struct StatIndex SPATK_STAT_IDX;

extern bool8 DoMoveTakeaway(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

bool8 DoMoveDamageStealItem(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    return DoMoveTakeaway(attacker, defender, move, item_id);
}

bool8 DoMoveAmnesia(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostDefensiveStat(attacker, defender, SPATK_STAT_IDX, 2);

    return TRUE;
}
