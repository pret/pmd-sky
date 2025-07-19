#include "dg.h"
#include "dungeon_util_static.h"

// file starts at 0x022dea5c

bool8 EntityIsValid__022E0354(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
