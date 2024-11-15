#include "overlay_29_023047B8.h"

bool EntityIsValid__023047B8(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
