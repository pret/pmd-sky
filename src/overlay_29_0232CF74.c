#include "overlay_29_0232CF74.h"

extern void MakeFloorOneRoom(struct entity *user, struct entity *target);

bool8 DoMoveOneRoom(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    MakeFloorOneRoom(attacker, defender);

    return TRUE;
}
