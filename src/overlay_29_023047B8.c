#include "overlay_29_023047B8.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__023047B8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
