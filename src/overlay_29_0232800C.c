#include "overlay_29_0232800C.h"
#include "dungeon_util_static.h"

bool8 EntityIsValidMoveEffects__0232800C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
