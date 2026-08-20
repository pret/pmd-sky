#include "overlay_29_0232C300.h"

extern void RevealTrapsNearby(struct entity *user, struct entity *target);

bool8 DoMoveSeeTrap(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    RevealTrapsNearby(attacker, defender);

    return TRUE;
}
