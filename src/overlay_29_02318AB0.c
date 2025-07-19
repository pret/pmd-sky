#include "overlay_29_02318AB0.h"
#include "dungeon_util_static.h"

bool8 IsMonster__02318AB0(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) == ENTITY_MONSTER;
}
