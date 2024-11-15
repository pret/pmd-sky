#include "overlay_29_0230E8F0.h"

bool8 EntityIsValid__0230E8F0(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
