#include "dungeon_ai_leader.h"
#include "dg_uty.h"
#include "dungeon_ai_targeting_1.h"
#include "dungeon_util_static.h"
#include "dungeon_visibility.h"
#include "main_02058C3C.h"

bool8 EntityIsValid__0230827C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

bool8 ShouldMonsterFollowLeader(struct entity *monster)
{
    if (GetEntInfo(monster)->is_not_team_member)
        return FALSE;

    return DoesTacticFollowLeader(GetEntInfo(monster)->tactic);
}

struct entity* GetLeaderIfVisible(struct entity *monster)
{
    if (GetEntInfo(monster)->is_not_team_member)
        return NULL;

    struct entity *leader = GetLeader();
    if (leader != NULL)
    {
        if (GetEntInfo(leader)->curse_class_status.curse == STATUS_CURSE_DECOY)
            return NULL;

        if (GetTreatmentBetweenMonsters(monster, leader, FALSE, FALSE) != TREATMENT_TREAT_AS_ALLY)
            return NULL;

        if (CanTargetEntity(monster, leader))
            return leader;
    }

    return NULL;
}
