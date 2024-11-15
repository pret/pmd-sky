#include "overlay_29_02308FBC.h"

bool EntityIsValid__02308FBC(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
