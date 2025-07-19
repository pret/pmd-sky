#include "overlay_29_02322DB8.h"
#include "dungeon_util_static.h"

bool8 IsMonster__02322DB8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) == ENTITY_MONSTER;
}
