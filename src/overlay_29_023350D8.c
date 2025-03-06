#include "overlay_29_023350D8.h"

bool8 EntityIsValid__023350D8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
