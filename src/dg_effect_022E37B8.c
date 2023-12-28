#include "dg_effect.h"

u8 EntityIsValid__022E37B8(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
