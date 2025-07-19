#include "dg_effect.h"
#include "dungeon_util_static.h"

// file starts at 0x022e35e4

bool8 EntityIsValid__022E37B8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
