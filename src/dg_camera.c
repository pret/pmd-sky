#include "dg_camera.h"

// file starts at 0x022e26b68

bool8 EntityIsValid__022E32E8(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
