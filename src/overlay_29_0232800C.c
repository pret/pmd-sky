#include "overlay_29_0232800C.h"

bool EntityIsValidMoveEffects__0232800C(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
