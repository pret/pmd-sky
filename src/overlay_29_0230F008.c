#include "overlay_29_0230F008.h"

u8 EntityIsValid__0230F008(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
