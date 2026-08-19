#include "overlay_29_02328230.h"
#include "move_orb_effects.h"

bool8 DoMoveParalyze__02328230(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictParalysisStatus(attacker, defender, TRUE, FALSE);

    return TRUE;
}
