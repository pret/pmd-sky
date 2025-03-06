#include "dg.h"

// file starts at 0x022dea5c

bool8 EntityIsValid__022E0354(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
