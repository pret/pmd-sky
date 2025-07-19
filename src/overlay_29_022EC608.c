#include "overlay_29_022EC608.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__022EC608(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
