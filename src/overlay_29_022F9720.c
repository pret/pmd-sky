#include "overlay_29_022F9720.h"

bool8 IsMonster__022F9720(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type == ENTITY_MONSTER;
}
