#include "overlay_29_02301A60.h"

bool8 IsMonster__02301A60(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type == ENTITY_MONSTER;
}
