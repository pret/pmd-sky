#include "overlay_29_02301A60.h"
#include "dungeon_util_static.h"

bool8 IsMonster__02301A60(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) == ENTITY_MONSTER;
}
