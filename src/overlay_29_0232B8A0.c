#include "overlay_29_0232B8A0.h"

extern void TryInflictDestinyBondStatus(struct entity *user, struct entity *target);

bool8 DoMoveDestinyBond(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictDestinyBondStatus(attacker, defender);

    return TRUE;
}
