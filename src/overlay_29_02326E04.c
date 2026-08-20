#include "overlay_29_02326E04.h"

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
