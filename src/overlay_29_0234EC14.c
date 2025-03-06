#include "overlay_29_0234EC14.h"

bool8 EntityIsValid__0234EC14(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
