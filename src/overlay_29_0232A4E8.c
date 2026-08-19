#include "overlay_29_0232A4E8.h"

extern void TryInflictCurseStatus(struct entity *user, struct entity *target, bool8 displayMessage, bool8 onlyCheck);

bool8 DoMoveCurse(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictCurseStatus(attacker, defender, TRUE, FALSE);

    return TRUE;
}
