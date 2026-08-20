#include "overlay_29_0232D1DC.h"
#include "move_orb_effects.h"

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);

extern void TryInflictPierceStatus(struct entity *user, struct entity *target);

extern void TryInflictLongTossStatus(struct entity *user, struct entity *target);

extern void RevealStairs(struct entity *user, struct entity *target);

extern void TryInflictMobileStatus(struct entity *user, struct entity *target);

extern void TryHurl(struct entity *user, struct entity *target);

bool8 DoMoveHurl(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryHurl(attacker, defender);

    return TRUE;
}

bool8 DoMoveMobile(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictMobileStatus(attacker, defender);

    return TRUE;
}

bool8 DoMoveSeeStairs(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    RevealStairs(attacker, defender);

    return TRUE;
}

bool8 DoMoveLongToss(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictLongTossStatus(attacker, defender);

    return TRUE;
}

bool8 DoMovePierce(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictPierceStatus(attacker, defender);

    return TRUE;
}

bool8 DoMoveHammerArm(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    if (DealDamage(attacker, defender, move, 0x100, item_id) == 0) {
        return FALSE;
    }

    LowerSpeed(attacker, attacker, 1, TRUE);

    return TRUE;
}
