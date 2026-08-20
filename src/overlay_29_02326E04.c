#include "overlay_29_02326E04.h"
#include "dungeon_util_static.h"

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);

extern void TryInflictExposedStatus(struct entity *user, struct entity *target, s32 a, s32 b);
#include "move_orb_effects.h"

bool8 DoMoveExpose(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictExposedStatus(attacker, defender, move->id == 0x13B ? 0x7A : 0x51, 0);

    return TRUE;
}

extern const struct StatIndex ATK_STAT_IDX;

extern const struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveDoubleTeam(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostHitChanceStat(attacker, defender, SPATK_STAT_IDX);

    return TRUE;
}

bool8 DoMoveGust(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    s32 multiplier = 1;

    if ((u8) (GetEntInfo(defender)->bide_class_status.bide + 0xF9) <= 1) {
        multiplier = 2;
    }

    return DealDamage(attacker, defender, move, multiplier << 8, item_id) != 0;
}
