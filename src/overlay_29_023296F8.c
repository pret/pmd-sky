#include "overlay_29_023296F8.h"

extern void TryWarp(struct entity *user, struct entity *target, s32, s32);

bool8 DoMoveWarp(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryWarp(attacker, defender, 0, 0);

    return TRUE;
}
