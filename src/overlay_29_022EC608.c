#include "overlay_29_022EC608.h"

u8 EntityIsValid__022EC608(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
