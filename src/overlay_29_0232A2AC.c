#include "overlay_29_0232A2AC.h"
#include "move_orb_effects.h"

extern const struct StatIndex ATK_STAT_IDX;

bool8 DoMoveLowerDefense1(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    LowerDefensiveStat(attacker, defender, ATK_STAT_IDX, 1, TRUE, TRUE);

    return TRUE;
}

extern void TryInflictWishStatus(struct entity *user, struct entity *target);

bool8 DoMoveWish(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictWishStatus(attacker, defender);

    return TRUE;
}
