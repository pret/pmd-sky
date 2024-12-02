#include "overlay_29_02322DB8.h"

bool8 IsMonster__02322DB8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type == ENTITY_MONSTER;
}
