#include "overlay_29_02327744.h"

extern void TryInflictShadowHoldStatus(struct entity *user, struct entity *target, bool8 onlyCheck);
extern void TryResetStatChanges(struct entity *user, struct entity *target, bool8 displayMessage);

bool8 DoMoveShadowHold(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictShadowHoldStatus(attacker, defender, FALSE);

    return TRUE;
}

bool8 DoMoveHaze(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryResetStatChanges(attacker, defender, TRUE);

    return TRUE;
}
