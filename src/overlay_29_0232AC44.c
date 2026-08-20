#include "overlay_29_0232AC44.h"

extern void TryInflictSetDamageStatus(struct entity *user, struct entity *target);

bool8 DoMoveSetDamage(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictSetDamageStatus(attacker, defender);

    return TRUE;
}
