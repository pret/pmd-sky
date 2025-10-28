#include "dungeon_ai_leader.h"
#include "dungeon_util_static.h"
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
