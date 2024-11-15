#include "overlay_29_02325620.h"

bool EntityIsValid__02325620(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
