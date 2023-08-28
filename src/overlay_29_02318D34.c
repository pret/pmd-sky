#include "overlay_29_02318D34.h"

u8 EntityIsValid__02318D34(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
