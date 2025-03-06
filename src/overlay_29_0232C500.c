#include "overlay_29_0232C500.h"

bool8 EntityIsValidMoveEffects__0232C500(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
