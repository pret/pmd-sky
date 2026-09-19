#include "main_0200F798.h"



#include "main_0200D81C.h"
#include "item.h"
extern struct bag_items *BAG_ITEMS_PTR_MIRROR;
extern u32 RemoveEmptyItems(struct item *items, s32 count);
extern void sub_020582E0(u8 held_by);
u32 RemoveItemNoHoleCheck(s16 index)
{
    if (index != -1) {
        struct item *item = &BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[index];
        bool8 exists = (item->flags & ITEM_FLAG_EXISTS) != 0;

        if (exists) {
            if (item->held_by != 0)
                sub_020582E0(item->held_by);

            ItemZInit(item);
            RemoveEmptyItems(BAG_ITEMS_PTR_MIRROR->bag_items->bag_items, INVENTORY_SIZE);
            return 1;
        }
    }
    return 0;
}

u32 RemoveFirstUnequippedItemOfType(s16 type)
{
    return RemoveItemNoHoleCheck(GetFirstUnequippedItemOfType(type));
}
