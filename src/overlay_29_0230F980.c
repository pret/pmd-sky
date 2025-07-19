#include "overlay_29_0230F980.h"
#include "dungeon_util_static.h"

bool8 IsMonster__0230F980(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) == ENTITY_MONSTER;
}
