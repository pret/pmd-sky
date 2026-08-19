#include "overlay_29_02329664.h"

extern void TryInflictConversion2Status(struct entity *user, struct entity *target);

bool8 DoMoveConversion2(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictConversion2Status(attacker, defender);

    return TRUE;
}
