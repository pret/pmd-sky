#include "overlay_29_02311010.h"

bool8 EntityIsValid__02311010(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
