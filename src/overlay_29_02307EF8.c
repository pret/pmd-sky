#include "overlay_29_02307EF8.h"

u8 EntityIsValid__02307EF8(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
