#include "overlay_29_02302A38.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__02302A38(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
