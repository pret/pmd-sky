#include "overlay_29_02325FB4.h"

extern void TryInflictVitalThrowStatus(struct entity *user, struct entity *target);

bool8 DoMoveVitalThrow(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictVitalThrowStatus(attacker, defender);

    return TRUE;
}
