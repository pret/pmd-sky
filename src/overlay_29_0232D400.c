#include "overlay_29_0232D400.h"

extern void TryInflictHealBlockStatus(struct entity *user, struct entity *target, bool8 displayMessage, bool8 onlyCheck);

bool8 DoMoveHealBlock(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictHealBlockStatus(attacker, defender, TRUE, FALSE);

    return TRUE;
}
