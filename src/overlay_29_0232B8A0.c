#include "overlay_29_0232B8A0.h"

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);

extern void TryInflictDestinyBondStatus(struct entity *user, struct entity *target);

bool8 DoMoveDestinyBond(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictDestinyBondStatus(attacker, defender);

    return TRUE;
}

bool8 DoMoveDamage__0232B8B0(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    return DealDamage(attacker, defender, move, 0x100, item_id) != 0;
}
