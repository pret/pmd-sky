#include "overlay_29_02315118.h"

bool EntityIsValid__02315118(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
