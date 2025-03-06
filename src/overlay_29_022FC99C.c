#include "overlay_29_022FC99C.h"

bool8 EntityIsValid__022FC99C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
