#include "overlay_29_02325620.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__02325620(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
