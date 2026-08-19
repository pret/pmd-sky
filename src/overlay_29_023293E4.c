#include "overlay_29_023293E4.h"

extern void TryInflictTauntStatus(struct entity *user, struct entity *target, bool8 onlyCheck);

bool8 DoMoveTaunt(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictTauntStatus(attacker, defender, FALSE);

    return TRUE;
}
