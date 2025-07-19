#include "overlay_29_0234D460.h"
#include "dungeon_util_static.h"

bool8 IsMonster__0234D460(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) == ENTITY_MONSTER;
}
