#include "overlay_29_0232017C.h"

bool EntityIsValid__0232017C(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
