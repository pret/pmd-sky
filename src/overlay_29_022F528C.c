#include "overlay_29_022F528C.h"

bool EntityIsValid__022F528C(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
