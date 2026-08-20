#include "overlay_29_0232E3D0.h"

extern void TryInflictMiracleEyeStatus(struct entity *user, struct entity *target, s32 a);

extern void ResetHitChanceStat(struct entity *user, struct entity *target, s32 a, s32 b);

bool8 DoMoveMiracleEye(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictMiracleEyeStatus(attacker, defender, 0);
    ResetHitChanceStat(attacker, defender, 1, 1);

    return TRUE;
}
