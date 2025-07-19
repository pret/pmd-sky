#include "overlay_29_02308FBC.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__02308FBC(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
