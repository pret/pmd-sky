#include "overlay_29_022ECDC0.h"

bool8 EntityIsValid__022ECDC0(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
