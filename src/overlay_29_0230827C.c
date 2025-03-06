#include "overlay_29_0230827C.h"

bool8 EntityIsValid__0230827C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
