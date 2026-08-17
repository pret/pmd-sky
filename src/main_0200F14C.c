#include "main_0200F14C.h"
#include "item_util_4.h"
#include "item.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

u32 HasStorableItems(void)
{
    struct item *item = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
    s32 i;

    for (i = 0; i < INVENTORY_SIZE; i++, item++) {
        bool8 exists = (item->flags & ITEM_FLAG_EXISTS) != 0;

        if (exists && IsStorableItem(item->id)) {
            return TRUE;
        }
    }
    return FALSE;
}

s16 GetItemIndex(struct item* item)
{
    struct item *cur = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
    s32 i;

    for (i = 0; i < INVENTORY_SIZE; i++, cur++) {
        if (cur == item) {
            return i;
        }
    }
    return -1;
}
