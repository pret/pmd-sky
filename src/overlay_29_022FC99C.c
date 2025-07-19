#include "overlay_29_022FC99C.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__022FC99C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
