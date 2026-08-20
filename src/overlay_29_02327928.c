#include "overlay_29_02327928.h"
#include "move_orb_effects.h"
#include "dungeon_util_static.h"

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);

extern bool8 DungeonRandOutcomeUserAction(struct entity *user, s32 chance);

extern bool8 RAPID_SPIN_BINDING_REMOVAL;

bool8 DoMoveBoostSpeed1(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostSpeedOneStage(attacker, defender, 0, TRUE);

    return TRUE;
}

bool8 DoMoveRapidSpin(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    bool8 result = FALSE;

    if (DealDamage(attacker, defender, move, 0x100, item_id) != 0) {
        result = TRUE;
        if (DungeonRandOutcomeUserAction(attacker, 0)) {
            if (GetEntInfo(attacker)->contact_ability_trigger_bitflags & 2) {
                RAPID_SPIN_BINDING_REMOVAL = FALSE;
            } else {
                RAPID_SPIN_BINDING_REMOVAL = TRUE;
            }
        }
    }

    return result;
}
