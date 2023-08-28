#include "overlay_29_022E0354.h"

u8 EntityIsValid__022E0354(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
