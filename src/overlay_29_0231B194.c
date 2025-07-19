#include "overlay_29_0231B194.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__0231B194(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
