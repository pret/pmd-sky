#include "overlay_29_023118B4.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__023118B4(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
