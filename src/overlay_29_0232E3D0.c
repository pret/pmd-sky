#include "overlay_29_0232E3D0.h"
#include "dungeon_util_static.h"

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);

extern void EndSleepClassStatus(struct entity *user, struct entity *target, bool8 a, bool8 b, bool8 c);

extern void TryInflictMiracleEyeStatus(struct entity *user, struct entity *target, s32 a);

extern void ResetHitChanceStat(struct entity *user, struct entity *target, s32 a, s32 b);

bool8 DoMoveMiracleEye(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictMiracleEyeStatus(attacker, defender, 0);
    ResetHitChanceStat(attacker, defender, 1, 1);

    return TRUE;
}

bool8 DoMoveWakeUpSlap(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    bool8 result;
    enum status_sleep_id sleep = GetEntInfo(defender)->sleep_class_status.sleep;

    if (sleep == STATUS_SLEEP || sleep == STATUS_NIGHTMARE || sleep == STATUS_NAPPING) {
        result = DealDamage(attacker, defender, move, 0x200, item_id) != 0;
        EndSleepClassStatus(attacker, defender, FALSE, TRUE, FALSE);
    } else {
        result = DealDamage(attacker, defender, move, 0x100, item_id) != 0;
    }

    return result;
}
