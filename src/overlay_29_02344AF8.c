#include "overlay_29_02344AF8.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__02344AF8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
