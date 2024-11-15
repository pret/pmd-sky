#include "overlay_29_0234987C.h"

bool EntityIsValid__0234987C(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
