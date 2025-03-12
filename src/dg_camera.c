#include "dg_camera.h"
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"

// file starts at 0x022e26b68

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
