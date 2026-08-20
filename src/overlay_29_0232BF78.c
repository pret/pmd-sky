#include "overlay_29_0232BF78.h"

extern void TryInflictReflectStatus(struct entity *user, struct entity *target);

bool8 DoMoveReflect(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictReflectStatus(attacker, defender);

    return TRUE;
}
