#include "overlay_29_0234DDD0.h"

bool8 EntityIsValid__0234DDD0(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
