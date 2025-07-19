#include "overlay_29_0232C500.h"
#include "dungeon_util_static.h"

bool8 EntityIsValidMoveEffects__0232C500(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
