#include "overlay_29_0232A480.h"

extern void TryInflictIngrainStatus(struct entity *user, struct entity *target);

bool8 DoMoveIngrain(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictIngrainStatus(attacker, defender);

    return TRUE;
}
