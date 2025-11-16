#include "dg_uty.h"
#include "dungeon.h"
#include "dungeon_util_static.h"

// file starts at 0x022e9020

extern struct entity *LEADER_PTR;

struct entity* GetLeader()
{
    struct entity *leader = LEADER_PTR;
    if (leader == NULL)
    {
        for (s32 i = 0; i < MAX_TEAM_MEMBERS; i++)
        {
            struct entity *current_pokemon = DUNGEON_PTR[0]->monster_slots.party_members[i];
            if (EntityIsValid__022E95F4(current_pokemon) && GetEntInfo(current_pokemon)->is_team_leader)
            {
                LEADER_PTR = current_pokemon;
                return current_pokemon;
            }
        }
        return NULL;
    }
    return leader;
}

bool8 EntityIsValid__022E95F4(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
