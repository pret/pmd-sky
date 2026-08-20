#include "overlay_29_0232DC54.h"

extern void TryInflictMagnetRiseStatus(struct entity *user, struct entity *target);

bool8 DoMoveMagnetRise(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictMagnetRiseStatus(attacker, defender);

    return TRUE;
}
