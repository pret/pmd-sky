#include "main_0200EEE0.h"
#include "item.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

u32 IsItemInBag(s16 id)
{
    struct item *item = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
    s32 i;

    for (i = 0; i < INVENTORY_SIZE; i++, item++) {
        if (item->id == id) {
            return TRUE;
        }
    }
    return FALSE;
}

u32 IsItemWithFlagsInBag(s16 id, u8 flags)
{
    struct item *item = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
    s32 i;

    for (i = 0; i < INVENTORY_SIZE; i++, item++) {
        if (item->id == id && (item->flags & flags) != 0) {
            return TRUE;
        }
    }
    return FALSE;
}
