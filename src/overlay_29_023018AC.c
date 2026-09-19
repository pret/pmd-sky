#include "overlay_29_023018AC.h"
#include "dungeon_util_static.h"
#include "joined_at_checks.h"
#include "dungeon_util_2.h"
#include "weather.h"
#include "overlay_29_02301A60.h"
#include "overlay_29_0234B340.h"

#ifdef JAPAN
#define MESSAGE_C36 0x975
#define MESSAGE_C37 0x976
#else
#define MESSAGE_C36 0xC36
#define MESSAGE_C37 0xC37
#endif

enum monster_treatment GetTreatmentBetweenMonstersIgnoreStatus(struct entity *entity1, struct entity *entity2)
{
    struct monster* monster1 = GetEntInfo(entity1);
    struct monster* monster2 = GetEntInfo(entity2);
    if (monster1->monster_behavior == BEHAVIOR_RESCUE_TARGET)
        return TREATMENT_IGNORE;

    if (IsExperienceLocked(monster1))
        return TREATMENT_IGNORE;

    #ifdef JAPAN
    if (monster1->shopkeeper != SHOPKEEPER_MODE_NORMAL)
    #else
    if (monster1->shopkeeper != SHOPKEEPER_MODE_NORMAL && monster1->shopkeeper != SHOPKEEPER_MODE_ATTACK_TEAM)
    #endif
        return TREATMENT_IGNORE;

    if (monster2->monster_behavior == BEHAVIOR_RESCUE_TARGET)
        return TREATMENT_IGNORE;

    if (IsExperienceLocked(monster2))
        return TREATMENT_IGNORE;

    #ifdef JAPAN
    if (monster2->shopkeeper != SHOPKEEPER_MODE_NORMAL)
    #else
    if (monster2->shopkeeper != SHOPKEEPER_MODE_NORMAL && monster2->shopkeeper != SHOPKEEPER_MODE_ATTACK_TEAM)
    #endif
        return TREATMENT_IGNORE;

    #ifdef JAPAN
    return (enum monster_treatment) (monster1->is_not_team_member != monster2->is_not_team_member);
    #else
    if (monster1->is_not_team_member != monster2->is_not_team_member)
        return TREATMENT_TREAT_AS_ENEMY;
    return TREATMENT_TREAT_AS_ALLY;
    #endif
}

bool8 SafeguardIsActive(struct entity *user, struct entity *target, bool8 log_message)
{
    if (GetEntInfo(target)->reflect_class_status.reflect == STATUS_REFLECT_SAFEGUARD)
    {
        if (log_message)
        {
            SubstitutePlaceholderStringTags(0, target, 0);
            LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_C36);
        }
        return TRUE;
    }
    return FALSE;
}

bool8 LeafGuardIsActive(struct entity *user, struct entity *target, bool8 log_message)
{
    if (GetApparentWeather(target) == WEATHER_SUNNY &&
#ifdef JAPAN
        DefenderAbilityIsActive__02301A0C(user, target, ABILITY_LEAF_GUARD))
#else
        DefenderAbilityIsActive__02301A0C(user, target, ABILITY_LEAF_GUARD, TRUE))
#endif
    {
        if (log_message)
        {
            SubstitutePlaceholderStringTags(0, target, 0);
            LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_C37);
        }
        return TRUE;
    }
    return FALSE;
}
