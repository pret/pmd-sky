#include "dg_uty.h"
#include "dungeon_util_static.h"

// file starts at 0x022e9020

bool8 EntityIsValid__022E95F4(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
