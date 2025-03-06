#include "dg_effect.h"

// file starts at 0x022e35e4

bool8 EntityIsValid__022E37B8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
