#include "overlay_29_02337CA8.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__02337CA8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
