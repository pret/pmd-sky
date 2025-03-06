#include "overlay_29_0231F570.h"

bool8 EntityIsValid__0231F570(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
