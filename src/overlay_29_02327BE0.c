#include "overlay_29_02327BE0.h"

extern void TryInflictEndureStatus(struct entity *user, struct entity *target);

bool8 DoMoveEndure(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictEndureStatus(attacker, defender);

    return TRUE;
}
