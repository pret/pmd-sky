#include "overlay_29_02318E4C.h"

bool EntityIsValid__02318E4C(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
