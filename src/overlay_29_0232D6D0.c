#include "overlay_29_0232D6D0.h"

extern void TryInflictEmbargoStatus(struct entity *user, struct entity *target, bool8 displayMessage, bool8 onlyCheck);

bool8 DoMoveEmbargo(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictEmbargoStatus(attacker, defender, TRUE, FALSE);

    return TRUE;
}
