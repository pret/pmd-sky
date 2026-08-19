#include "overlay_29_02329854.h"

extern void TryInflictShadowHoldStatus(struct entity *user, struct entity *target, bool8 onlyCheck);
extern void TryInflictPoisonedStatus(struct entity *user, struct entity *target, bool8 displayMessage, bool8 onlyCheck);
extern void TryInflictBadlyPoisonedStatus(struct entity *user, struct entity *target, bool8 displayMessage, bool8 onlyCheck);

bool8 DoMoveBlock(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictShadowHoldStatus(attacker, defender, FALSE);

    return TRUE;
}

bool8 DoMovePoison(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictPoisonedStatus(attacker, defender, TRUE, FALSE);

    return TRUE;
}

bool8 DoMoveToxic(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictBadlyPoisonedStatus(attacker, defender, TRUE, FALSE);

    return TRUE;
}
