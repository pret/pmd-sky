#include "overlay_29_0231B318.h"

bool8 IsMonster__0231B318(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type == ENTITY_MONSTER;
}
