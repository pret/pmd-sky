#include "overlay_29_0234DDD0.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__0234DDD0(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
