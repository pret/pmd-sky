#include "overlay_29_0232CE40.h"

extern void TryActivateIdentifyCondition(struct entity *user, struct entity *target);

bool8 DoMoveHpGauge(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryActivateIdentifyCondition(attacker, defender);

    return TRUE;
}
