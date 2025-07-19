#include "overlay_29_02321438.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__02321438(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
