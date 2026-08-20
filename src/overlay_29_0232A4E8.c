#include "overlay_29_0232A4E8.h"

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);

extern void TryInflictCurseStatus(struct entity *user, struct entity *target, bool8 displayMessage, bool8 onlyCheck);

bool8 DoMoveCurse(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictCurseStatus(attacker, defender, TRUE, FALSE);

    return TRUE;
}

bool8 DoMoveDamage__0232A500(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    return DealDamage(attacker, defender, move, 0x100, item_id) != 0;
}
