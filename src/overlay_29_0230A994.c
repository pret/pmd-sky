#include "overlay_29_0230A994.h"

bool8 IsMonster__0230A994(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type == ENTITY_MONSTER;
}
