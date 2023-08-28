#include "overlay_29_02302A38.h"

u8 EntityIsValid__02302A38(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
