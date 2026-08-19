#include "overlay_29_023268BC.h"

extern void TryInflictFocusEnergyStatus(struct entity *user, struct entity *target);

bool8 DoMoveFocusEnergy(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictFocusEnergyStatus(attacker, defender);

    return TRUE;
}
