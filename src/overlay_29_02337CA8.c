#include "overlay_29_02337CA8.h"

bool8 EntityIsValid__02337CA8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
