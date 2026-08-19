#include "overlay_29_02328528.h"

extern void TryInflictSafeguardStatus(struct entity *user, struct entity *target);

bool8 DoMoveSafeguard(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictSafeguardStatus(attacker, defender);

    return TRUE;
}
