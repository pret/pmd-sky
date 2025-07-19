#include "overlay_29_0231CBC8.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__0231CBC8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
