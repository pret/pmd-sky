#include "overlay_29_02328A54.h"
#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);

extern bool8 DungeonRandOutcomeUserTargetInteraction(struct entity *user, struct entity *target, s16 chance);

extern const s16 SMOG_POISON_CHANCE;

extern void TryInflictPoisonedStatus(struct entity *user, struct entity *target, bool8 displayMessage, bool8 onlyCheck);
#include "move_orb_effects.h"

extern const struct StatIndex ATK_STAT_IDX;

extern const struct StatIndex SPATK_STAT_IDX;

bool8 DoMoveLowerAccuracy1(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    LowerHitChanceStat(attacker, defender, ATK_STAT_IDX, TRUE);

    return TRUE;
}

bool8 DoMoveDamagePoison40(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    bool8 result = FALSE;

    if (DealDamage(attacker, defender, move, 0x100, item_id) != 0) {
        result = TRUE;
        if (DungeonRandOutcomeUserTargetInteraction(attacker, defender, SMOG_POISON_CHANCE)) {
            TryInflictPoisonedStatus(attacker, defender, FALSE, FALSE);
        }
    }

    return result;
}
