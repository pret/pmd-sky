#include "overlay_29_0232CF74.h"

extern s16 ov10_022C45BC;

extern void TryDecreaseBelly(struct entity* user, struct entity* target, s16 amount, s32 a);

bool8 DoMoveFamish(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryDecreaseBelly(attacker, defender, ov10_022C45BC, 0);

    return TRUE;
}

extern void MakeFloorOneRoom(struct entity *user, struct entity *target);

bool8 DoMoveOneRoom(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    MakeFloorOneRoom(attacker, defender);

    return TRUE;
}
