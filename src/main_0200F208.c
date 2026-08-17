#include "main_0200F208.h"
#include "item.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

s16 GetEquippedThrowableItem(void)
{
    struct item *item = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
    s32 i;

    for (i = 0; i < INVENTORY_SIZE; i++, item++) {
        bool8 exists = (((struct item_volatile *)item)->flags & ITEM_FLAG_EXISTS) != 0;

        if (exists) {
            if (((struct item_volatile *)item)->flags & ITEM_FLAG_SET) {
                return i;
            }
        }
    }
    return -1;
}
