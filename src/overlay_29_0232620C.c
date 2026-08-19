#include "overlay_29_0232620C.h"

extern void TryInflictEncoreStatus(struct entity *user, struct entity *target, bool8 onlyCheck);

bool8 DoMoveEncore(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictEncoreStatus(attacker, defender, FALSE);

    return TRUE;
}
