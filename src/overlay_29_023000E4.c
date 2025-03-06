#include "overlay_29_023000E4.h"

bool8 EntityIsValid__023000E4(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
