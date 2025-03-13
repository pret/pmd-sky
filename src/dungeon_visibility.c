#include "dungeon_visibility.h"
#include "dg_object.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_range.h"
#include "dungeon_statuses.h"
#include "dungeon_util_static.h"

bool8 CanSeeTarget(struct entity *user, struct entity *target)
{
    if (!EntityIsValid__022E1A1C(user))
        return FALSE;

    if (!EntityIsValid__022E1A1C(target))
        return FALSE;

    if (!target->is_visible)
        return FALSE;

    if (target->type == ENTITY_MONSTER)
    {
        if (user->type == ENTITY_MONSTER)
        {
            if (!CanSeeInvisibleMonsters(user) && GetEntInfo(target)->invisible_class_status.status == STATUS_INVISIBLE_INVISIBLE)
                return FALSE;

            if (IsBlinded(user, TRUE))
                return FALSE;
        }
        else if (GetEntInfo(target)->invisible_class_status.status == STATUS_INVISIBLE_INVISIBLE)
            return FALSE;
    }

    return IsPositionActuallyInSight(&user->pos, &target->pos, HasDropeyeStatus(user));
}
