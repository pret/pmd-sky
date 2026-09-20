#include "overlay_29_02315118.h"
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "dungeon_logic_2.h"
#include "dungeon_util_2.h"
#include "move_orb_effects.h"
#include "overlay_29_022E3F20.h"
#include "overlay_29_022E41CC.h"
#include "overlay_29_0234B340.h"

extern bool8 SafeguardIsActive(struct entity *user ,struct entity *target, bool8 log_message);
extern s32 CalcStatusDuration(struct entity *entity, const s16 *turn_range, bool8 iq_skill_effects);

extern const s16 CONFUSED_TURN_RANGE[];

#ifdef JAPAN
#define MESSAGE_CFE 0xA3E
#define MESSAGE_CFF 0xA3F
#define MESSAGE_DA7 0xAE7
#define MESSAGE_DAF 0xAEF
#define MESSAGE_DBA 0xAFA
#else
#define MESSAGE_CFE 0xCFE
#define MESSAGE_CFF 0xCFF
#define MESSAGE_DA7 0xDA7
#define MESSAGE_DAF 0xDAF
#define MESSAGE_DBA 0xDBA
#endif

bool8 TryInflictConfusedStatus(struct entity *user, struct entity *target, bool8 log_failure, bool8 check_only)
{
    struct monster *entityInfo;
    bool8 ownTempo;

    if (!EntityIsValid__02315118(target))
        return FALSE;

    if (SafeguardIsActive(user, target, log_failure))
        return FALSE;

    if (IsProtectedFromNegativeStatus(user, target, log_failure))
        return FALSE;

    SubstitutePlaceholderStringTags(0, target, 0);

    if (ItemIsActive__0231513C(target, ITEM_PERSIM_BAND)) {
        if (log_failure)
            LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_DAF);
        return FALSE;
    }

    if (ExclusiveItemEffectIsActiveWithLogging(user, target, log_failure, MESSAGE_DBA, EXCLUSIVE_EFF_NO_CONFUSION))
        return FALSE;

    if (user != target && (user == NULL ? FALSE : (bool8)(GetEntityType(user) == ENTITY_MONSTER)) && AbilityIsActiveVeneer(user, ABILITY_MOLD_BREAKER))
        ownTempo = FALSE;
    else
        ownTempo = AbilityIsActiveVeneer(target, ABILITY_OWN_TEMPO);

    if (ownTempo) {
        if (log_failure)
            LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_DA7);
        return FALSE;
    }

    if (check_only)
        return TRUE;

    ov29_022E41CC(target);
    entityInfo = GetEntInfo(target);
    if (entityInfo->cringe_class_status.cringe != STATUS_CRINGE_CONFUSED) {
        entityInfo->cringe_class_status.cringe = STATUS_CRINGE_CONFUSED;
        entityInfo->cringe_class_status.cringe_turns = CalcStatusDuration(target, CONFUSED_TURN_RANGE, TRUE) + 1;
        LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_CFE);
        TryActivateQuickFeet(user, target);
    }
    else {
        LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_CFF);
    }

    UpdateStatusIconFlags(target);
    return TRUE;
}

bool8 EntityIsValid__02315118(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

bool8 ItemIsActive__0231513C(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}
