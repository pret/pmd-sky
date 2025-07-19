#include "overlay_29_023350D8.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__023350D8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
