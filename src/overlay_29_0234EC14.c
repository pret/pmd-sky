#include "overlay_29_0234EC14.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__0234EC14(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
