#include "dg_camera.h"

// file starts at 0x022e26b68

extern bool8 AbilityIsActiveVeneer(struct entity *entity, enum ability_id ability_id);
extern bool8 HasHeldItem(struct entity* entity, enum item_id item_id);

bool8 EntityIsValid__022E32E8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}

bool8 ItemIsActive__022E330C(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}
