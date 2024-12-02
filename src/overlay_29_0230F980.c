#include "overlay_29_0230F980.h"

bool8 IsMonster__0230F980(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type == ENTITY_MONSTER;
}
