#include "overlay_29_0231B194.h"

bool8 EntityIsValid__0231B194(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
