#include "overlay_29_02326CB4.h"

extern void SetReflectStatus(struct entity *user, struct entity *target, s32 status);

bool8 DoMoveCounter(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    SetReflectStatus(attacker, defender, 4);

    return TRUE;
}
