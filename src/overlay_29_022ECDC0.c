#include "overlay_29_022ECDC0.h"
#include "dungeon_util_static.h"
#include "overlay_29_023000E4.h"

extern char ov29_0237C974[40];

void ov29_022ECD84(struct entity *entity)
{
    if (!EntityIsValid__022ECDC0(entity))
        return;
    if (entity->type != ENTITY_MONSTER)
        return;
    if (entity->info == 0)
        return;
    GetMonsterName(ov29_0237C974, (struct monster *)entity->info);
}

bool8 EntityIsValid__022ECDC0(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
