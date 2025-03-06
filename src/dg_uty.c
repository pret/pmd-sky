#include "dg_uty.h"

// file starts at 0x022e9020

bool8 EntityIsValid__022E95F4(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
