#include "overlay_29_0232B7C0.h"
#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);

extern bool8 DungeonRandOutcomeUserTargetInteraction(struct entity *user, struct entity *target, s16 chance);

extern const s16 MIST_BALL_LOWER_SPECIAL_ATTACK_CHANCE;

extern void TryInflictDecoyStatus(struct entity *user, struct entity *target, s32 a, s32 b, s32 c);
#include "move_orb_effects.h"

extern const struct StatIndex ATK_STAT_IDX;

extern const struct StatIndex SPATK_STAT_IDX;

extern void TryInflictMagicCoatStatus(struct entity *user, struct entity *target);
extern void TryInflictProtectStatus(struct entity *user, struct entity *target);

bool8 DoMoveMagicCoat(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictMagicCoatStatus(attacker, defender);

    return TRUE;
}

bool8 DoMoveProtect(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictProtectStatus(attacker, defender);

    return TRUE;
}

bool8 DoMoveDefenseCurl(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostDefensiveStat(attacker, defender, ATK_STAT_IDX, 1);

    return TRUE;
}

bool8 DoMoveDecoy(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictDecoyStatus(attacker, defender, 1, 1, 0);

    return TRUE;
}

bool8 DoMoveMistBall(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    bool8 result = FALSE;

    if (DealDamage(attacker, defender, move, 0x100, item_id) != 0) {
        result = TRUE;
        if (DungeonRandOutcomeUserTargetInteraction(attacker, defender, MIST_BALL_LOWER_SPECIAL_ATTACK_CHANCE)) {
            LowerOffensiveStat(attacker, defender, SPATK_STAT_IDX, result, result, FALSE);
        }
    }

    return result;
}
