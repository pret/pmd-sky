#include "overlay_29_022F9720.h"
#include "dungeon_util_static.h"

bool8 IsMonster__022F9720(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) == ENTITY_MONSTER;
}
