#include "overlay_29_022EE348.h"

extern bool8 AbilityIsActiveVeneer(struct entity *entity, enum ability_id ability_id);
extern bool8 HasHeldItem(struct entity* entity, enum item_id item_id);

bool8 ItemIsActive__022EE318(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}

bool8 EntityIsValid__022EE348(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
