#include "overlay_29_022F0590.h"

bool EntityIsValid__022F0590(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
