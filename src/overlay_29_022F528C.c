#include "overlay_29_022F528C.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__022F528C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
