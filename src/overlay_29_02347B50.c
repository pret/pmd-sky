#include "overlay_29_02347B50.h"
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"

bool8 ItemIsActive__02347B50(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}
