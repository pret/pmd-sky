#include "overlay_29_0234D460.h"

bool8 IsMonster__0234D460(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type == ENTITY_MONSTER;
}
