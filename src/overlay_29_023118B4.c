#include "overlay_29_023118B4.h"

bool8 EntityIsValid__023118B4(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
