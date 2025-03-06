#include "overlay_29_022EF7A0.h"

bool8 EntityIsValid__022EF7A0(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
