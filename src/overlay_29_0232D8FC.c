#include "overlay_29_0232D8FC.h"

extern void TryActivateGravity(struct entity *user, struct entity *target);

bool8 DoMoveGravity(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryActivateGravity(attacker, defender);

    return TRUE;
}
