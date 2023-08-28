#include "overlay_29_0232E840.h"

u8 EntityIsValid__0232E840(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
