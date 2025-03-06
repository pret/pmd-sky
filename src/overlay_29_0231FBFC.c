#include "overlay_29_0231FBFC.h"

bool8 EntityIsValid__0231FBFC(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
