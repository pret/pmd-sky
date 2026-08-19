#include "overlay_29_0232DD78.h"

extern void BoostOrLowerSpeed(struct entity *user, struct entity *target);

bool8 DoMoveTrickRoom(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostOrLowerSpeed(attacker, defender);

    return TRUE;
}
