#include "overlay_29_0232CD90.h"

extern void TryInflictInvisibleStatus(struct entity *user, struct entity *target);

bool8 DoMoveInvisify(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictInvisibleStatus(attacker, attacker);

    return TRUE;
}
