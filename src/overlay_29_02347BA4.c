#include "overlay_29_02347BA4.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__02347BA4(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
