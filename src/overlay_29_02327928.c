#include "overlay_29_02327928.h"
#include "move_orb_effects.h"

bool8 DoMoveBoostSpeed1(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostSpeedOneStage(attacker, defender, 0, TRUE);

    return TRUE;
}
