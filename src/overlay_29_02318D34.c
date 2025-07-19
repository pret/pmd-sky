#include "overlay_29_02318D34.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__02318D34(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
