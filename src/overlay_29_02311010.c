#include "overlay_29_02311010.h"

extern bool8 AbilityIsActiveVeneer(struct entity *entity, enum ability_id ability_id);
extern bool8 HasHeldItem(struct entity* entity, enum item_id item_id);

bool8 EntityIsValid__02311010(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}

bool8 ItemIsActive__02311034(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}
