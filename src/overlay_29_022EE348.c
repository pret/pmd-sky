#include "overlay_29_022EE348.h"

bool8 EntityIsValid__022EE348(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
