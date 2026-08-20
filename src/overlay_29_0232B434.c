#include "overlay_29_0232B434.h"
#include "move_orb_effects.h"

bool8 DoMoveParalyze__0232B434(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictParalysisStatus(attacker, defender, TRUE, FALSE);

    return TRUE;
}
