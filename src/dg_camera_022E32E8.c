#include "dg_camera.h"

u8 EntityIsValid__022E32E8(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
