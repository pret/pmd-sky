#include "overlay_29_0232E734.h"

extern void TryInflictTerrifiedStatus(struct entity *user, struct entity *target);

bool8 DoMoveTag0x1AB(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictTerrifiedStatus(attacker, defender);

    return TRUE;
}
