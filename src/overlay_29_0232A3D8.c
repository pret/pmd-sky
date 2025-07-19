#include "overlay_29_0232A3D8.h"
#include "dungeon_util_static.h"

bool8 EntityIsValidMoveEffects__0232A3D8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
