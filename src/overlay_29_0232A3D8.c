#include "overlay_29_0232A3D8.h"

bool8 EntityIsValidMoveEffects__0232A3D8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
