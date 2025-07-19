#include "overlay_29_0230827C.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__0230827C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
