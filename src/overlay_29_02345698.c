#include "overlay_29_02345698.h"

bool EntityIsValid__02345698(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
