#include "overlay_29_022F528C.h"

extern void ov29_02343D30(void);
#include "dungeon_util_static.h"

bool8 EntityIsValid__022F528C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

void ov29_022F52B0(void)
{
    ov29_02343D30();
}
