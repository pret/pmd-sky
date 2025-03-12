#include "overlay_29_022EE348.h"
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"

bool8 ItemIsActive__022EE318(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}

bool8 EntityIsValid__022EE348(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}
