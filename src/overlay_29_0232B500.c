#include "overlay_29_0232B500.h"
#include "dungeon_util_static.h"

extern void TryBlowAway(struct entity *user, struct entity *target, s32 direction);

bool8 DoMoveBlowback(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryBlowAway(attacker, defender, GetEntInfo(attacker)->action.direction);

    return TRUE;
}
