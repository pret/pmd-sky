#include "overlay_29_02320764.h"

bool8 EntityIsValid__02320764(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
