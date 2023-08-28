#include "overlay_29_0230558C.h"

u8 EntityIsValid__0230558C(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
