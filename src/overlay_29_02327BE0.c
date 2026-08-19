#include "overlay_29_02327BE0.h"
#include "move_orb_effects.h"

extern void TryInflictEndureStatus(struct entity *user, struct entity *target);

bool8 DoMoveEndure(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictEndureStatus(attacker, defender);

    return TRUE;
}

bool8 DoMoveLowerSpeed1(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    LowerSpeed(attacker, defender, 1, TRUE);

    return TRUE;
}
