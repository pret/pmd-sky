#include "dungeon_items.h"
#include "dungeon_util_static.h"

bool8 HasHeldItem(struct entity* entity, enum item_id item_id)
{
    struct monster *pokemon_info = GetEntInfo(entity);
    if (!ItemExists(pokemon_info->held_item.flags))
        return FALSE;

    if (ItemSticky(pokemon_info->held_item.flags))
        return FALSE;

    if (pokemon_info->held_item.id != item_id)
        return FALSE;

    return TRUE;
}
