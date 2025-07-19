#include "overlay_29_022ECDC0.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__022ECDC0(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
