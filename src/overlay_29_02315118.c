#include "overlay_29_02315118.h"
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"

bool8 EntityIsValid__02315118(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}

bool8 ItemIsActive__0231513C(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}
