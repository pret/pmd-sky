#include "overlay_29_02345698.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__02345698(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
