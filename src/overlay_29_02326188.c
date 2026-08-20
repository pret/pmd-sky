#include "overlay_29_02326188.h"
#include "dungeon_mode.h"
#include "item.h"
#include "move.h"
#include "move_orb_effects.h"

extern const s16 BUBBLE_LOWER_SPEED_CHANCE;

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);

extern bool8 DungeonRandOutcomeUserTargetInteraction(struct entity *user, struct entity *target, s16 chance);

extern void EndNegativeStatusConditionWrapper(struct entity *user, struct entity *target, bool8 displayMessage, bool8 fromMove);

bool8 DoMoveHealStatus(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    EndNegativeStatusConditionWrapper(attacker, defender, TRUE, FALSE);

    return TRUE;
}

bool8 DoMoveBubble(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    bool8 result = FALSE;

    if (DealDamage(attacker, defender, move, 0x100, item_id) != 0) {
        result = TRUE;
        if (DungeonRandOutcomeUserTargetInteraction(attacker, defender, BUBBLE_LOWER_SPEED_CHANCE)) {
            LowerSpeed(attacker, defender, result, FALSE);
        }
    }

    return result;
}
