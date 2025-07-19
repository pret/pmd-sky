#include "overlay_29_0231EDD8.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__0231EDD8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
