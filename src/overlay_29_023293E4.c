#include "overlay_29_023293E4.h"

extern void TryInflictConfusedStatus(struct entity *user, struct entity *target, bool8 displayMessage, bool8 onlyCheck);

bool8 DoMoveConfuse(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictConfusedStatus(attacker, defender, TRUE, FALSE);

    return TRUE;
}

extern void TryInflictTauntStatus(struct entity *user, struct entity *target, bool8 onlyCheck);

bool8 DoMoveTaunt(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictTauntStatus(attacker, defender, FALSE);

    return TRUE;
}
