#include "overlay_29_02305C04.h"

bool8 EntityIsValid__02305C04(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
