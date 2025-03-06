#include "overlay_29_022F62A8.h"

bool8 EntityIsValid__022F62A8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
