#include "overlay_29_0232BE34.h"

extern void TryInflictSnatchStatus(struct entity *user, struct entity *target);

bool8 DoMoveSnatch(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictSnatchStatus(attacker, defender);

    return TRUE;
}
