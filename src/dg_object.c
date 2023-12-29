#include "dg_object.h"

// file starts at 0x022e1608

u8 EntityIsValid__022E1A1C(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
