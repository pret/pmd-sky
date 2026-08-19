#include "overlay_29_0232B7C0.h"

extern void TryInflictMagicCoatStatus(struct entity *user, struct entity *target);
extern void TryInflictProtectStatus(struct entity *user, struct entity *target);

bool8 DoMoveMagicCoat(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictMagicCoatStatus(attacker, defender);

    return TRUE;
}

bool8 DoMoveProtect(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictProtectStatus(attacker, defender);

    return TRUE;
}
