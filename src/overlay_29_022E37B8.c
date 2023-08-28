#include "overlay_29_022E37B8.h"

u8 EntityIsValid__022E37B8(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
