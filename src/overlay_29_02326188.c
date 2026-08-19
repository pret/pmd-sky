#include "overlay_29_02326188.h"

extern void EndNegativeStatusConditionWrapper(struct entity *user, struct entity *target, bool8 displayMessage, bool8 fromMove);

bool8 DoMoveHealStatus(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    EndNegativeStatusConditionWrapper(attacker, defender, TRUE, FALSE);

    return TRUE;
}
