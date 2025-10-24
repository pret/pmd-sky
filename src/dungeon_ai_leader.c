#include "dungeon_ai_leader.h"
#include "dungeon_util_static.h"

extern bool8 DoesTacticFollowLeader(enum tactic_id tactic_id);

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
