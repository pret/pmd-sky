#include "overlay_29_0232E0E4.h"

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);

extern void EndProtectStatus(struct entity *user, struct entity *target);

extern void SwapUserAtkAndDefModifiers(struct entity *user, struct entity *target, s32);

bool8 DoMovePowerTrick(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    SwapUserAtkAndDefModifiers(attacker, defender, 1);

    return TRUE;
}

bool8 DoMoveFeint(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    if (DealDamage(attacker, defender, move, 0x100, item_id) == 0) {
        return FALSE;
    }

    EndProtectStatus(attacker, defender);

    return TRUE;
}
