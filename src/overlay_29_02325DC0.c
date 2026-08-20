#include "overlay_29_02325DC0.h"

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);

bool8 DoMoveDamage__02325DC0(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    return DealDamage(attacker, defender, move, 0x100, item_id) != 0;
}
