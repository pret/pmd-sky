#include "overlay_29_0230E578.h"
#include "dungeon_pokemon_attributes.h"

extern bool8 HasHeldItem(struct entity* entity, enum item_id item_id);

bool8 ItemIsActive__0230E578(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}
