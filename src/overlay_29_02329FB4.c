#include "overlay_29_02329FB4.h"
#include "dungeon_mode.h"
#include "item.h"
#include "move.h"
#include "move_orb_effects.h"

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);

extern bool8 DungeonRandOutcomeUserTargetInteraction(struct entity *user, struct entity *target, s16 chance);

extern const struct StatIndex ATK_STAT_IDX;

extern void ActivateSportCondition(bool8 water_sport);

bool8 DoMoveSport(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    if (move->id == 0xD4) {
        ActivateSportCondition(FALSE);
    } else {
        ActivateSportCondition(TRUE);
    }

    return TRUE;
}

bool8 DoMoveMudSlap(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    bool8 result = FALSE;

    if (DealDamage(attacker, defender, move, 0x100, item_id) != 0) {
        result = TRUE;
        if (DungeonRandOutcomeUserTargetInteraction(attacker, defender, 0)) {
            LowerHitChanceStat(attacker, defender, ATK_STAT_IDX, FALSE);
        }
    }

    return result;
}
