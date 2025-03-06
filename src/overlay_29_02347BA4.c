#include "overlay_29_02347BA4.h"

bool8 EntityIsValid__02347BA4(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
