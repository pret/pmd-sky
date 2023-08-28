#include "overlay_29_022E1A1C.h"

u8 EntityIsValid__022E1A1C(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
