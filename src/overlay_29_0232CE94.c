#include "overlay_29_0232CE94.h"

extern void TryInflictCoweringStatus(struct entity *user, struct entity *target, bool8 displayMessage, bool8 onlyCheck);

bool8 DoMoveShocker(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictCoweringStatus(attacker, defender, TRUE, FALSE);

    return TRUE;
}
