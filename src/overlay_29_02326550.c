#include "overlay_29_02326550.h"
#include "move_orb_effects.h"

bool8 DoMoveStringShot(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    LowerSpeed(attacker, defender, 1, TRUE);

    return TRUE;
}
