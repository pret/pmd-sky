#include "dungeon_logic_2.h"
#include "main_0205283C.h"
#include "dungeon.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_statuses.h"
#include "dungeon_util_2.h"
#include "dungeon_util_static.h"
#include "exclusive_item.h"
#include "joined_at_checks.h"
#include "main_02001A54.h"
#include "overlay_29_022FFF28.h"
#include "overlay_29_023000E4.h"
#include "overlay_29_023026CC.h"
#include "overlay_29_02344AF8.h"
#include "overlay_29_0234B340.h"

#ifdef JAPAN
#define NEGATIVE_STATUS_PROTECTION_LOG_MESSAGE 0x978
#else
#define NEGATIVE_STATUS_PROTECTION_LOG_MESSAGE 0xc39
#endif

extern struct dungeon *DUNGEON_PTR[];

extern const s16 EXP_ELITE_EXP_BOOST;
extern const s16 WONDER_CHEST_EXP_BOOST;
extern const s16 MIRACLE_CHEST_EXP_BOOST;
extern const s16 EXCLUSIVE_ITEM_EXP_BOOST;

extern bool8 LeafGuardIsActive(struct entity *user, struct entity *target, bool8 log_message);
extern bool8 ov29_02301A84(struct entity *user, struct entity *target, bool8 log_message);
extern bool8 GetExclusiveItemWithEffectFromBag(struct entity *, enum exclusive_item_effect_id effect_id, struct item *item);

bool8 MonsterCanThrowItems(struct monster *monster)
{
    return CanThrowItems(monster->id) ? TRUE : FALSE;
}

bool8 ov29_02302388(struct entity *entity)
{
    if (EntityIsValid__023000E4(entity) &&
        GetEntInfo(entity)->monster_behavior != BEHAVIOR_RESCUE_TARGET &&
        !IsExperienceLocked(GetEntInfo(entity)))
        return TRUE;
    return FALSE;
}

bool8 UpdateStateFlags(struct monster *monster, s32 flag, bool8 value)
{
    if (monster->state_flags & flag)
        monster->prev_state_flags |= flag;
    else
        monster->prev_state_flags &= ~flag;

    if (value)
        monster->state_flags |= flag;
    else
        monster->state_flags &= ~flag;

    if (!(monster->prev_state_flags & flag) && (monster->state_flags & flag))
        return TRUE;
    return FALSE;
}

bool8 IsProtectedFromNegativeStatus(struct entity *user, struct entity *target, bool8 log_message)
{
    struct item item;

    if (LeafGuardIsActive(user, target, log_message))
        return TRUE;

    if (ExclusiveItemEffectIsActive__022FFF28(target, EXCLUSIVE_EFF_NO_STATUS)) {
        if (log_message) {
            SubstitutePlaceholderStringTags(0, target, 0);
            GetExclusiveItemWithEffectFromBag(target, EXCLUSIVE_EFF_NO_STATUS, &item);
            PrepareItemForPrinting__02345728(1, &item);
            LogMessageByIdWithPopupCheckUserTarget(user, target, NEGATIVE_STATUS_PROTECTION_LOG_MESSAGE);
        }
        return TRUE;
    }

    return ov29_02301A84(user, target, log_message) ? TRUE : FALSE;
}

bool8 ov29_023024E0(struct entity *entity, bool8 check_blinded)
{
    if (!IqSkillIsEnabled(entity, IQ_NONTRAITOR)) {
        if ((check_blinded && IsBlinded(entity, TRUE)) ||
            GetEntInfo(entity)->cringe_class_status.cringe == STATUS_CRINGE_CONFUSED ||
            GetEntInfo(entity)->cringe_class_status.cringe == STATUS_CRINGE_COWERING)
            return TRUE;
    }

    return FALSE;
}

void AddExpSpecial(struct entity *attacker, struct entity *defender, s32 base_exp)
{
    struct monster *info = GetEntInfo(defender);
    s32 total;
    s32 gained;

    if (IsExperienceLocked(info))
        return;

    if (info->level == 100) {
        if (base_exp > 0)
            DUNGEON_PTR[0]->should_enemy_evolve = TRUE;
        return;
    }

    total = info->exp + base_exp;

    if (IqSkillIsEnabled(defender, IQ_EXP_ELITE))
        total += MultiplyByFixedPoint(base_exp << 8, (EXP_ELITE_EXP_BOOST << 8) / 100) >> 8;

    if (ItemIsActive__023026CC(defender, ITEM_WONDER_CHEST))
        total += MultiplyByFixedPoint(base_exp << 8, (WONDER_CHEST_EXP_BOOST << 8) / 100) >> 8;

    if (ItemIsActive__023026CC(defender, ITEM_MIRACLE_CHEST))
        total += MultiplyByFixedPoint(base_exp << 8, (MIRACLE_CHEST_EXP_BOOST << 8) / 100) >> 8;

    if (GetEntInfo(defender)->is_not_team_member
            ? FALSE
            : ExclusiveItemEffectFlagTest(GetEntInfo(defender)->exclusive_item_effect_flags,
                                          EXCLUSIVE_EFF_EXP_BOOST))
        total += MultiplyByFixedPoint(base_exp << 8, (EXCLUSIVE_ITEM_EXP_BOOST << 8) / 100) >> 8;

    if (total >= 9999999)
        total = 9999999;

    gained = total - info->exp;
    if (gained != 0) {
        info->unk_exp_tracker += gained;
        DUNGEON_PTR[0]->should_enemy_evolve = TRUE;
    }
}
