#include "overlay_29_0232E840.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__0232E840(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
