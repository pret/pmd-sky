#include "overlay_29_0231FBFC.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__0231FBFC(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
