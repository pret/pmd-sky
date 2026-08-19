#include "overlay_29_0232E0E4.h"

extern void SwapUserAtkAndDefModifiers(struct entity *user, struct entity *target, s32);

bool8 DoMovePowerTrick(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    SwapUserAtkAndDefModifiers(attacker, defender, 1);

    return TRUE;
}
