#include "overlay_29_0231A9D4.h"

bool8 IsMonster__0231A9D4(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type == ENTITY_MONSTER;
}
