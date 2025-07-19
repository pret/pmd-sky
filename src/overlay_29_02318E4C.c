#include "overlay_29_02318E4C.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__02318E4C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
