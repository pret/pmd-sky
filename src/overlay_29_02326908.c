#include "overlay_29_02326908.h"

extern void EndFrozenStatus(struct entity *user, struct entity *target);

extern void TryInflictMirrorMoveStatus(struct entity *user, struct entity *target);

bool8 DoMoveMirrorMove(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    EndFrozenStatus(attacker, defender);
    TryInflictMirrorMoveStatus(attacker, defender);

    return TRUE;
}
