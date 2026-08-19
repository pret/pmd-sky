#include "overlay_29_02329854.h"

extern void TryInflictShadowHoldStatus(struct entity *user, struct entity *target, bool8 onlyCheck);

bool8 DoMoveBlock(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictShadowHoldStatus(attacker, defender, FALSE);

    return TRUE;
}
