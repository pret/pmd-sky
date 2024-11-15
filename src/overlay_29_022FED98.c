#include "overlay_29_022FED98.h"

#ifndef EUROPE
bool EntityIsValid__022FED98(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
#endif
