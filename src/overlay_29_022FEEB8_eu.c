#include "overlay_29_022FED98.h"
#include "dungeon_util_static.h"

#ifdef EUROPE
bool8 EntityIsValid__022FED98(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
#endif
