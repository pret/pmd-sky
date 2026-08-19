#include "overlay_29_0232B8D4.h"

extern void TryInflictMirrorCoatStatus(struct entity *user, struct entity *target);

bool8 DoMoveMirrorCoat(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictMirrorCoatStatus(attacker, defender);

    return TRUE;
}
