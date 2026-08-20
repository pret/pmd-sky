#include "overlay_29_0232CB08.h"

extern void TryDrought(struct entity *user, struct entity *target);

bool8 DoMoveDrought(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryDrought(attacker, defender);

    return TRUE;
}
