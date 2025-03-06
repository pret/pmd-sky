#include "overlay_29_02344AF8.h"

bool8 EntityIsValid__02344AF8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
