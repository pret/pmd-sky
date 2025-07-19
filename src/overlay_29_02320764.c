#include "overlay_29_02320764.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__02320764(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
