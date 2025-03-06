#include "overlay_29_02308FBC.h"

bool8 EntityIsValid__02308FBC(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
