#include "overlay_29_022F7364.h"

bool8 EntityIsValid__022F7364(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
