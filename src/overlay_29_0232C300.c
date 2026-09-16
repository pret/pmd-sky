#include "overlay_29_0232C300.h"
#include "dungeon_util_2.h"
#include "dungeon_util_static.h"
#include "main_0200D81C.h"
#include "main_0200EDC0.h"
#include "overlay_29_0232C500.h"
#include "overlay_29_0234B340.h"

extern s32 DealDamage(struct entity *attacker, struct entity *defender, struct move *move, s32 damageMultiplier, enum item_id item_id);
extern bool8 DungeonRandOutcomeUserTargetInteraction(struct entity *user, struct entity *target, s16 chance);
#ifdef JAPAN
extern bool8 DefenderAbilityIsActiveMoveEffects__0232BDD0(struct entity *attacker, struct entity *defender, enum ability_id ability_id);
#else
extern bool8 DefenderAbilityIsActiveMoveEffects__0232BDD0(struct entity *attacker, struct entity *defender, enum ability_id ability_id, bool8 attacker_ability_enabled);
#endif
extern bool8 AddHeldItemToBag(struct monster *monster);
extern bool8 RemoveEquivItem(struct item *item);
extern void ov29_022F9EA0(struct entity *entity);

extern void RevealTrapsNearby(struct entity *user, struct entity *target);

bool8 DoMoveSeeTrap(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    RevealTrapsNearby(attacker, defender);

    return TRUE;
}

#ifdef JAPAN
#define DO_MOVE_TAKEAWAY_OFFSET -0x2BE
#else
#define DO_MOVE_TAKEAWAY_OFFSET 0
#endif

bool8 DoMoveTakeaway(struct entity *attacker, struct entity *defender, struct move *move, enum item_id item_id)
{
    bool8 result = FALSE;

    if (DealDamage(attacker, defender, move, 0x100, item_id) != 0) {
        result = TRUE;
        if (DungeonRandOutcomeUserTargetInteraction(attacker, defender, 0)) {
            struct monster *attacker_info = GetEntInfo(attacker);
            struct monster *defender_info = GetEntInfo(defender);

            SubstitutePlaceholderStringTags(0, attacker, 0);
            SubstitutePlaceholderStringTags(1, defender, 0);

#ifdef JAPAN
            if (DefenderAbilityIsActiveMoveEffects__0232BDD0(attacker, defender, ABILITY_STICKY_HOLD)) {
#else
            if (DefenderAbilityIsActiveMoveEffects__0232BDD0(attacker, defender, ABILITY_STICKY_HOLD, TRUE)) {
#endif
                LogMessageByIdWithPopupCheckUserTarget(attacker, defender, 0xEFE + DO_MOVE_TAKEAWAY_OFFSET);
                return TRUE;
            }

            if (ItemExists(attacker_info->held_item.flags)) {
                LogMessageByIdWithPopupCheckUserTarget(attacker, defender, 0xEFA + DO_MOVE_TAKEAWAY_OFFSET);
                return TRUE;
            }

            if (!ItemExists(defender_info->held_item.flags)) {
                LogMessageByIdWithPopupCheckUserTarget(attacker, defender, 0xEFB + DO_MOVE_TAKEAWAY_OFFSET);
                return TRUE;
            }

            if (!attacker_info->is_not_team_member && IsBagFull()) {
                LogMessageByIdWithPopupCheckUserTarget(attacker, defender, 0xEFC + DO_MOVE_TAKEAWAY_OFFSET);
                return TRUE;
            }

            attacker_info->held_item = defender_info->held_item;

            if (!attacker_info->is_not_team_member) {
                AddHeldItemToBag(attacker_info);
            }

            if (!defender_info->is_not_team_member) {
                RemoveEquivItem(&defender_info->held_item);
            }

            ItemZInit(&defender_info->held_item);

            ov29_022F9EA0(attacker);
            ov29_022F9EA0(defender);

            if (attacker_info->exp_yield < 1) {
                attacker_info->exp_yield = 1;
            }

            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, 0xEF9 + DO_MOVE_TAKEAWAY_OFFSET);
        } else if (EntityIsValidMoveEffects__0232C500(defender)) {
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, 0xEFD + DO_MOVE_TAKEAWAY_OFFSET);
        }
    }

    return result;
}