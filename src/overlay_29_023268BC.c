#include "overlay_29_023268BC.h"

extern const s32 SMOKESCREEN_TURN_RANGE;

extern s32 CalcStatusDuration(struct entity *target, const s32 *turn_range, s32 a);

extern void TryInflictWhifferStatus(struct entity *user, struct entity *target, s32 turns, s32 a);

extern void TryInflictFocusEnergyStatus(struct entity *user, struct entity *target);

bool8 DoMoveFocusEnergy(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictFocusEnergyStatus(attacker, defender);

    return TRUE;
}

bool8 DoMoveSmokescreen(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictWhifferStatus(attacker, defender, CalcStatusDuration(defender, &SMOKESCREEN_TURN_RANGE, TRUE), 0);

    return TRUE;
}
