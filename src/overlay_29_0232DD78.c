#include "overlay_29_0232DD78.h"

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);

extern void BoostOrLowerSpeed(struct entity *user, struct entity *target);

bool8 DoMoveTrickRoom(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostOrLowerSpeed(attacker, defender);

    return TRUE;
}

bool8 DoMoveDamage__0232DD88(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    return DealDamage(attacker, defender, move, 0x100, item_id) != 0;
}
