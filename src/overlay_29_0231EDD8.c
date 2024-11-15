#include "overlay_29_0231EDD8.h"

bool EntityIsValid__0231EDD8(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
