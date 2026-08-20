#include "overlay_29_0232E48C.h"

extern void SetReflectStatus(struct entity *user, struct entity *target, s32 status);

bool8 DoMoveMetalBurst(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    SetReflectStatus(attacker, defender, 15);

    return TRUE;
}
