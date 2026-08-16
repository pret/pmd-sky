#include "main_0200F370.h"
#include "item.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;
u32 RemoveEmptyItems(struct item *items, s32 count);

struct item* GetItemAtIdx(s16 idx)
{
    if (idx < 0) {
        return NULL;
    }
    return &BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[idx];
}

u32 RemoveEmptyItemsInBag(void)
{
    return RemoveEmptyItems(BAG_ITEMS_PTR_MIRROR->bag_items->bag_items, INVENTORY_SIZE);
}
