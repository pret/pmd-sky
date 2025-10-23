#include "overlay_29_023018AC.h"
#include "dungeon_util_static.h"
#include "joined_at_checks.h"

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
