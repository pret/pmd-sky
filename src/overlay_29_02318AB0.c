#include "overlay_29_02318AB0.h"

bool8 IsMonster__02318AB0(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type == ENTITY_MONSTER;
}
