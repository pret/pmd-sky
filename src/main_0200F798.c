#include "main_0200F798.h"
#include "item_util_4.h"
#include "main_0200D81C.h"
#include "main_0200F874.h"

extern struct bag_items* BAG_ITEMS_PTR_MIRROR;

void RemoveEmptyItems(struct item *, s32);
void sub_020582E0();



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

void RemoveAllItems(void)
{
    struct item *item;
    s32 index;

    for(index = 0, item = &BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[0]; index < INVENTORY_SIZE; index++, item++)
    {    
        ItemZInit(item);
    }
}

void RemoveAllItemsStartingAt(s32 _index)
{
    s32 index;
    struct item *item;

    for(index = _index, item = &BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[index]; index < INVENTORY_SIZE; index++, item++)
    {
        if (item->held_by != 0) {
            sub_020582E0();
        }
        ItemZInit(&BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[index]);
    }
    
    RemoveEmptyItems(BAG_ITEMS_PTR_MIRROR->bag_items->bag_items, INVENTORY_SIZE);
}

void SpecialProcAddItemToBag(struct bulk_item *bulkItem)
{
    struct item item;

    BulkItemToItem(&item, bulkItem);
    AddItemToBag(&item, 0);
}
