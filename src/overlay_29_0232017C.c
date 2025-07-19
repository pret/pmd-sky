#include "overlay_29_0232017C.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__0232017C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
