#include "main_0200F874.h"
#include "item_util.h"
#include "item_util_1.h"
#include "item_util_4.h"
#include "main_0200D81C.h"
#include "main_0200ECFC.h"
#include "main_0200EDC0.h"
#include "main_02001188.h"
#include "main_020502B0.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

extern void SortItemList(struct item *items, s32 count);
extern void RemoveEmptyItems(struct item *items, s32 count);
extern s32 GetRankStorageSize(void);

u32 AddItemToBagNoHeld(struct item *item)
{
    return AddItemToBag(item, 0);
}

u32 AddItemToBag(struct item *item, u32 flag)
{
    struct item *bag = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
    s32 capacity = GetCurrentBagCapacity();
    s32 i;

    for (i = 0; i < capacity; i++, bag++) {
        bool8 exists = (bag->flags & ITEM_FLAG_EXISTS) != 0;

        if (!exists) {
            *bag = *item;
            bag->held_by = flag;
            SetItemAcquired(item);
            return TRUE;
        }
    }
    return FALSE;
}

void CleanStickyItemsInBag(void)
{
    struct item *item = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
    s32 i;

    for (i = 0; i < INVENTORY_SIZE; i++, item++) {
        item->flags &= ~ITEM_FLAG_STICKY;
    }
}

s16 CountStickyItemsInBag(void)
{
    struct item *item = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
    s32 count = 0;
    s32 i;

    for (i = 0; i < INVENTORY_SIZE; i++, item++) {
        bool8 exists = (item->flags & ITEM_FLAG_EXISTS) != 0;

        if (exists) {
            bool8 sticky = (item->flags & ITEM_FLAG_STICKY) != 0;

            if (sticky) {
                count++;
            }
        }
    }
    return count;
}

void sub_0200F9B4(u8 *a)
{
    struct item *item = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
    s32 i;

    for (i = 0; i < INVENTORY_SIZE; i++, item++) {
        bool8 exists = (item->flags & ITEM_FLAG_EXISTS) != 0;

        if (exists && item->held_by != 0) {
            item->held_by = a[item->held_by];
        }
    }
}

void sub_0200FA0C(u8 *a, s32 b)
{
    struct item *item = BAG_ITEMS_PTR_MIRROR->inventories[b].bag_items;
    s32 i;

    for (i = 0; i < INVENTORY_SIZE; i++, item++) {
        bool8 exists = (item->flags & ITEM_FLAG_EXISTS) != 0;

        if (exists && item->held_by != 0) {
            item->held_by = a[item->held_by];
        }
    }
}

u32 TransmuteHeldItemInBag(struct item *item)
{
    struct item *bag = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
    s32 i;

    for (i = 0; i < INVENTORY_SIZE; i++, bag++) {
        bool8 exists = (bag->flags & ITEM_FLAG_EXISTS) != 0;

        if (exists && bag->held_by == item->held_by) {
            *bag = *item;
            return TRUE;
        }
    }
    return FALSE;
}

void SetFlagsForHeldItemInBag(s32 held_by, u32 flags)
{
    struct item *item;
    s32 i;

    if (held_by == 0) {
        return;
    }
    item = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
    for (i = 0; i < INVENTORY_SIZE; i++, item++) {
        bool8 exists = (item->flags & ITEM_FLAG_EXISTS) != 0;

        if (exists && item->held_by == held_by) {
            item->flags |= flags;
        }
    }
}

bool8 RemoveHolderForItemInBag(struct item *item)
{
    struct item *bag = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
    s32 i;

    for (i = 0; i < INVENTORY_SIZE; i++, bag++) {
        bool8 exists = (bag->flags & ITEM_FLAG_EXISTS) != 0;

        if (exists && AreItemsEquivalent(bag, item, 1)) {
            bag->held_by = 0;
            bag->flags = item->flags;
            return TRUE;
        }
    }
    return FALSE;
}

void SetHolderForItemInBag(s16 index, struct item *item, u8 held_by)
{
    struct item *slot = &BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[index];

    slot->flags &= ~ITEM_FLAG_SET;
    item->held_by = held_by;
    slot->held_by = item->held_by;
    slot->flags = item->flags;
}

void SortItemsInBag(void)
{
    s32 i;

    for (i = 0; i < INVENTORY_SIZE; i++) {
        struct item *item = &BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[i];
        bool8 exists = (item->flags & ITEM_FLAG_EXISTS) != 0;

        if (exists && item->id == ITEM_POKE) {
            AddMoneyCarried(GetMoneyQuantity(item));
            ItemZInit(item);
        }
    }
    SortItemList(BAG_ITEMS_PTR_MIRROR->bag_items->bag_items, INVENTORY_SIZE);
}

void RemovePokeItemsInBag(void)
{
    struct item *item = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
    s32 i;

    for (i = 0; i < INVENTORY_SIZE; i++, item++) {
        bool8 exists = (item->flags & ITEM_FLAG_EXISTS) != 0;

        if (exists && item->id == ITEM_POKE) {
            item->flags &= ~ITEM_FLAG_STICKY;
            AddMoneyCarried(GetMoneyQuantity(item));
            ItemZInit(item);
        }
    }
    RemoveEmptyItems(BAG_ITEMS_PTR_MIRROR->bag_items->bag_items, INVENTORY_SIZE);
}

void sub_0200FD38(void)
{
}

void sub_0200FD3C(void)
{
    StorageZInit();
}

s32 sub_0200FD48(void)
{
    return GetRankStorageSize();
}

bool8 IsStorageFull(void)
{
    s32 size = GetRankStorageSize();

    return CountNbOfItemsInStorage() >= size;
}

s32 CountNbOfItemsInStorage(void)
{
    s32 count = 0;
    s32 i;

    for (i = 0; i < 1000; i++) {
        if (BAG_ITEMS_PTR_MIRROR->field_0x38A[i] != 0) {
            count++;
        }
    }
    return count;
}

u32 CountNbOfValidItemsInStorage(void)
{
    s32 count = 0;
    s32 i;

    for (i = 0; i < 1000; i++) {
        if (((const struct bag_items *)BAG_ITEMS_PTR_MIRROR)->field_0x38A[i] != 0 &&
            IsItemValidVeneer(BAG_ITEMS_PTR_MIRROR->field_0x38A[i])) {
            count++;
        }
    }
    return count;
}

u32 CountNbOfValidItemsInTimeDarknessInStorage(void)
{
    s32 count = 0;
    s32 i;

    for (i = 0; i < 1000; i++) {
        s16 id = BAG_ITEMS_PTR_MIRROR->field_0x38A[i];

        if (id != 0 && IsItemValidVeneer(id) && IsItemInTimeDarkness(id)) {
            if (IsTreasureBox(id)) {
                id = (s16)BAG_ITEMS_PTR_MIRROR->field_0xB5A[i];
                if (IsItemValidVeneer(id) && IsItemInTimeDarkness(id)) {
                    count++;
                }
            } else {
                count++;
            }
        }
    }
    return count;
}

u32 CountNbItemsOfTypeInStorage(s16 id)
{
    s32 count = 0;
    s32 i;

    for (i = 0; i < 1000; i++) {
        if (id == BAG_ITEMS_PTR_MIRROR->field_0x38A[i]) {
            count++;
        }
    }
    return count;
}

u32 CountItemTypeInStorage(struct bulk_item *bulk_item)
{
    s32 count = 0;
    s32 i;

    for (i = 0; i < 1000; i++) {
        if (bulk_item->id == BAG_ITEMS_PTR_MIRROR->field_0x38A[i]) {
            if (IsThrownItem(bulk_item->id)) {
                count += BAG_ITEMS_PTR_MIRROR->field_0xB5A[i];
            } else {
                count++;
            }
        }
    }
    return count;
}

s16 GetEquivBulkItemIdxInStorage(struct bulk_item *bulk_item)
{
    s32 i;

    for (i = 0; i < 1000; i++) {
        if (bulk_item->id == BAG_ITEMS_PTR_MIRROR->field_0x38A[i] &&
            bulk_item->quantity == BAG_ITEMS_PTR_MIRROR->field_0xB5A[i]) {
            return i;
        }
    }
    return -1;
}

bool8 ConvertStorageItemAtIdxToBulkItem(s32 idx, struct bulk_item *bulk_item)
{
    bulk_item->id = BAG_ITEMS_PTR_MIRROR->field_0x38A[idx];
    bulk_item->quantity = BAG_ITEMS_PTR_MIRROR->field_0xB5A[idx];
    return bulk_item->id != 0;
}

bool8 ConvertStorageItemAtIdxToItem(s32 idx, struct item *item)
{
    item->id = BAG_ITEMS_PTR_MIRROR->field_0x38A[idx];
    item->quantity = BAG_ITEMS_PTR_MIRROR->field_0xB5A[idx];
    item->flags = 0;
    item->held_by = 0;
    return item->id != 0;
}

s16 sub_02010044(s32 a)
{
    return BAG_ITEMS_PTR_MIRROR->field_0x38A[a];
}

u16 sub_02010060(s32 a)
{
    return BAG_ITEMS_PTR_MIRROR->field_0xB5A[a];
}

void MaybeUpdateStorage(void)
{
    s32 i;
    s32 j;

    for (i = 0; i < 1000; i++) {
        if (BAG_ITEMS_PTR_MIRROR->field_0x38A[i] == 0) {
            j = i;
            for (i = i + 1; i < 1000; i++) {
                if (BAG_ITEMS_PTR_MIRROR->field_0x38A[i] != 0) {
                    BAG_ITEMS_PTR_MIRROR->field_0x38A[j] = BAG_ITEMS_PTR_MIRROR->field_0x38A[i];
                    BAG_ITEMS_PTR_MIRROR->field_0xB5A[j] = BAG_ITEMS_PTR_MIRROR->field_0xB5A[i];
                    j++;
                }
            }
            for (; j < 1000; j++) {
                BAG_ITEMS_PTR_MIRROR->field_0x38A[j] = 0;
                BAG_ITEMS_PTR_MIRROR->field_0xB5A[j] = 0;
            }
            return;
        }
    }
}

bool8 sub_02010154(s32 a)
{
    if (BAG_ITEMS_PTR_MIRROR->field_0x38A[a] == 0) {
        return FALSE;
    }
    BAG_ITEMS_PTR_MIRROR->field_0x38A[a] = 0;
    BAG_ITEMS_PTR_MIRROR->field_0xB5A[a] = 0;
    MaybeUpdateStorage();
    return TRUE;
}

bool8 RemoveItemAtIdxInStorage(s32 idx)
{
    if (BAG_ITEMS_PTR_MIRROR->field_0x38A[idx] == 0) {
        return FALSE;
    }
    BAG_ITEMS_PTR_MIRROR->field_0x38A[idx] = 0;
    BAG_ITEMS_PTR_MIRROR->field_0xB5A[idx] = 0;
    return TRUE;
}

bool8 RemoveBulkItemInStorage(struct bulk_item *bulk_item)
{
    s32 i;

    for (i = 0; i < 1000; i++) {
        if (bulk_item->id == BAG_ITEMS_PTR_MIRROR->field_0x38A[i] &&
            bulk_item->quantity == BAG_ITEMS_PTR_MIRROR->field_0xB5A[i]) {
            BAG_ITEMS_PTR_MIRROR->field_0x38A[i] = 0;
            BAG_ITEMS_PTR_MIRROR->field_0xB5A[i] = 0;
            MaybeUpdateStorage();
            return TRUE;
        }
    }
    return FALSE;
}

bool8 RemoveItemInStorage(struct item *item)
{
    s32 i;

    for (i = 0; i < 1000; i++) {
        if (item->id == BAG_ITEMS_PTR_MIRROR->field_0x38A[i] &&
            item->quantity == BAG_ITEMS_PTR_MIRROR->field_0xB5A[i]) {
            BAG_ITEMS_PTR_MIRROR->field_0x38A[i] = 0;
            BAG_ITEMS_PTR_MIRROR->field_0xB5A[i] = 0;
            MaybeUpdateStorage();
            return TRUE;
        }
    }
    return FALSE;
}

void StorageZInit(void)
{
    s32 i;

    for (i = 0; i < 1000; i++) {
        BAG_ITEMS_PTR_MIRROR->field_0x38A[i] = 0;
        BAG_ITEMS_PTR_MIRROR->field_0xB5A[i] = 0;
    }
}

bool8 AddBulkItemToStorage(struct bulk_item *bulk_item)
{
    struct item item;
    s32 size = GetRankStorageSize();
    s32 i;

    BulkItemToItem(&item, bulk_item);
    for (i = 0; i < size; i++) {
        if (BAG_ITEMS_PTR_MIRROR->field_0x38A[i] == 0) {
            BAG_ITEMS_PTR_MIRROR->field_0x38A[i] = bulk_item->id;
            BAG_ITEMS_PTR_MIRROR->field_0xB5A[i] = bulk_item->quantity;
            SetItemAcquired(&item);
            return TRUE;
        }
    }
    return FALSE;
}

bool8 AddItemToStorage(struct item *item)
{
    s32 size = GetRankStorageSize();
    s32 i;

    for (i = 0; i < size; i++) {
        if (BAG_ITEMS_PTR_MIRROR->field_0x38A[i] == 0) {
            BAG_ITEMS_PTR_MIRROR->field_0x38A[i] = item->id;
            BAG_ITEMS_PTR_MIRROR->field_0xB5A[i] = item->quantity;
            SetItemAcquired(item);
            return TRUE;
        }
    }
    return FALSE;
}

void SortItemsInStorage(u8 *selected, s32 count)
{
    struct item *items = MemAlloc(count * sizeof(struct item), 0);
    int i;
    int j;

    for (i = 0; i < count; i++) {
        if (BAG_ITEMS_PTR_MIRROR->field_0x38A[i] == 0) {
            break;
        }
        ItemZInit(&items[i]);
        items[i].flags = (selected[i] != 0 ? ITEM_FLAG_UNK_MISSION_ITEM_2 : 0) | ITEM_FLAG_EXISTS;
        items[i].id = BAG_ITEMS_PTR_MIRROR->field_0x38A[i];
        items[i].quantity = BAG_ITEMS_PTR_MIRROR->field_0xB5A[i];
    }
    SortItemList(items, i);
    for (j = 0; j < i; j++) {
        BAG_ITEMS_PTR_MIRROR->field_0x38A[j] = items[j].id;
        BAG_ITEMS_PTR_MIRROR->field_0xB5A[j] = items[j].quantity;
        selected[j] = (items[j].flags & ITEM_FLAG_UNK_MISSION_ITEM_2) != 0;
    }
    for (; j < count; j++) {
        BAG_ITEMS_PTR_MIRROR->field_0x38A[j] = 0;
        BAG_ITEMS_PTR_MIRROR->field_0xB5A[j] = 0;
        selected[j] = 0;
    }
    MemFree(items);
}

void sub_02010590(void)
{
}

void AllKecleonShopsZInit(void)
{
    s32 i;
    s32 j;

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 8; j++) {
            struct bulk_item *slot = &BAG_ITEMS_PTR_MIRROR->field_0x1330[i][j];

            slot->id = 0;
            slot->quantity = 0;
        }
        for (j = 0; j < 4; j++) {
            struct bulk_item *slot = &BAG_ITEMS_PTR_MIRROR->field_0x1374[i][j];

            slot->id = 0;
            slot->quantity = 0;
        }
    }
    BAG_ITEMS_PTR_MIRROR->field_0x13A0 = 0;
    BAG_ITEMS_PTR_MIRROR->field_0x13A4 = 0;
    BAG_ITEMS_PTR_MIRROR->field_0x13A6 = 0;
    BAG_ITEMS_PTR_MIRROR->field_0x13A8 = 0;
}

void SpecialEpisodeKecleonShopZInit(void)
{
    s32 i;

    for (i = 0; i < 8; i++) {
        struct bulk_item *slot = &BAG_ITEMS_PTR_MIRROR->field_0x1330[1][i];

        slot->id = 0;
        slot->quantity = 0;
    }
    for (i = 0; i < 4; i++) {
        struct bulk_item *slot = &BAG_ITEMS_PTR_MIRROR->field_0x1374[1][i];

        slot->id = 0;
        slot->quantity = 0;
    }
}

void SetActiveKecleonShop(s32 idx)
{
    BAG_ITEMS_PTR_MIRROR->field_0x132A = idx;
    BAG_ITEMS_PTR_MIRROR->field_0x132C = BAG_ITEMS_PTR_MIRROR->field_0x1330[idx];
    BAG_ITEMS_PTR_MIRROR->field_0x1370 = BAG_ITEMS_PTR_MIRROR->field_0x1374[idx];
}
