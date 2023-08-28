#include "overlay_29_022E95F4.h"

u8 EntityIsValid__022E95F4(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
