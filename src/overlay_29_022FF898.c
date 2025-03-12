#include "overlay_29_022FF898.h"
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"

bool8 ItemIsActive__022FF898(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActive(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}
