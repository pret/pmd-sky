#include "overlay_29_0232C560.h"

extern void TryWarp(struct entity *user, struct entity *target, s32, s32);

bool8 DoMoveStayAway(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryWarp(attacker, defender, 1, 0);

    return TRUE;
}
