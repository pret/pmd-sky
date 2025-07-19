#include "overlay_29_02305C04.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__02305C04(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
