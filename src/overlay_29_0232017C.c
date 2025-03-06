#include "overlay_29_0232017C.h"

bool8 EntityIsValid__0232017C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
