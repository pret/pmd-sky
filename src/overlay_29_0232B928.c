#include "overlay_29_0232B928.h"

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);

bool8 DoMoveHiddenPower(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    DealDamage(attacker, defender, move, 0x100, item_id);

    return TRUE;
}
