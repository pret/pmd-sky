#include "overlay_29_022F0590.h"
#include "dungeon_util_static.h"

bool8 EntityIsValid__022F0590(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
