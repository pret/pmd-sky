#include "overlay_29_0232E250.h"

u8 EntityIsValid__0232E250(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
