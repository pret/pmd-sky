#include "overlay_29_0232D400.h"

extern const s16 HEAL_ORDER_HP_RESTORATION;

extern void TryIncreaseHp(struct entity *user, struct entity *target, s32 hp, s32 a, bool8 b);

bool8 DoMoveHealOrder(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryIncreaseHp(attacker, defender, HEAL_ORDER_HP_RESTORATION, 0, TRUE);

    return TRUE;
}

extern void TryInflictHealBlockStatus(struct entity *user, struct entity *target, bool8 displayMessage, bool8 onlyCheck);

bool8 DoMoveHealBlock(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictHealBlockStatus(attacker, defender, TRUE, FALSE);

    return TRUE;
}
