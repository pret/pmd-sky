#include "overlay_29_022F528C.h"
#include "dungeon_util_static.h"
#include "overlay_29_0234396C.h"

bool8 EntityIsValid__022F528C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

void ov29_022F52B0(struct entity *entity)
{
    ov29_02343D30(entity);
}
