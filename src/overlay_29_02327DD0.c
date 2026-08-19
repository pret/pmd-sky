#include "overlay_29_02327DD0.h"

extern void TryInflictSleeplessStatus(struct entity *user, struct entity *target);

bool8 DoMoveUproar(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictSleeplessStatus(attacker, defender);

    return TRUE;
}
