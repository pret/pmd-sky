#include "overlay_29_02338350.h"
#include "dungeon_map_access.h"
#include "dungeon_util.h"
#include "dungeon_util_static.h"

struct entity* FindAdjacentEnemy(struct entity *monster)
{
    s16 i;
    bool8 is_not_team_member = FALSE;
    if (GetEntInfo(monster)->is_not_team_member)
        is_not_team_member = TRUE;

    for (i = 0; i < NUM_DIRECTIONS; i++)
    {
        struct entity *monster_in_direction = GetTile(monster->pos.x + DIRECTIONS_XY[i].x, monster->pos.y + DIRECTIONS_XY[i].y)->monster;
        if (monster_in_direction != NULL && GetEntityType(monster_in_direction) == ENTITY_MONSTER)
        {
            bool8 monster_in_direction_not_team_member = GetEntInfo(monster_in_direction)->is_not_team_member;
            if (is_not_team_member)
            {
                if (!monster_in_direction_not_team_member)
                    return monster_in_direction;
            }
            else if (monster_in_direction_not_team_member)
                return monster_in_direction;
        }
    }
    return NULL;
}

bool8 IsAdjacentToEnemyIgnoreTreatment(struct entity *monster)
{
    if (FindAdjacentEnemy(monster) != NULL)
        return TRUE;
    return FALSE;
}
