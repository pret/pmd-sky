#include "overlay_29_0232A2AC.h"

extern void TryInflictWishStatus(struct entity *user, struct entity *target);

bool8 DoMoveWish(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictWishStatus(attacker, defender);

    return TRUE;
}
