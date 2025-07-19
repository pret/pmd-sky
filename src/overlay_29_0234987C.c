#include "overlay_29_0234987C.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__0234987C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
