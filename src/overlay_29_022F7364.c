#include "overlay_29_022F7364.h"

bool EntityIsValid__022F7364(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
