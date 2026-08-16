#include "main_0200F14C.h"
#include "item.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

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
