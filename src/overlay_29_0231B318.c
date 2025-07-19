#include "overlay_29_0231B318.h"
#include "dungeon_util_static.h"

bool8 IsMonster__0231B318(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) == ENTITY_MONSTER;
}
