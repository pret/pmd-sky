#include "overlay_29_0232A3D8.h"

u8 EntityIsValid__0232A3D8(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
