#include "overlay_29_02305C04.h"
#include "dungeon_util_static.h"

extern s32 EndNegativeStatusCondition(struct entity *user, struct entity *target, bool8 a, bool8 b, bool8 c);

bool8 EntityIsValid__02305C04(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

void EndNegativeStatusConditionWrapper(struct entity *user, struct entity *target, bool8 displayMessage, bool8 fromMove)
{
    EndNegativeStatusCondition(user, target, displayMessage, fromMove, FALSE);
}
