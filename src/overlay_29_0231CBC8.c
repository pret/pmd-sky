#include "overlay_29_0231CBC8.h"

bool8 EntityIsValid__0231CBC8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
