#include "overlay_29_023279AC.h"

extern s32 SURE_SHOT_TURN_RANGE;

extern s32 CalcStatusDuration(struct entity *target, s32 *turn_range, s32 a);

extern void TryInflictSureShotStatus(struct entity *user, struct entity *target, s32 turns);

bool8 DoMoveSureShot(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictSureShotStatus(attacker, defender, CalcStatusDuration(defender, &SURE_SHOT_TURN_RANGE, FALSE));

    return TRUE;
}
