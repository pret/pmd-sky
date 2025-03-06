#include "overlay_29_02319F8C.h"

bool8 EntityIsValid__02319F8C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
