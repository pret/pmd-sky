#ifndef PMDSKY_MAIN_0200F874_H
#define PMDSKY_MAIN_0200F874_H

#include "item.h"


u32 AddItemToBagNoHeld(struct item *item);
u32 AddItemToBag(struct item *item, u32 flag);
void CleanStickyItemsInBag(void);
s16 CountStickyItemsInBag(void);
void sub_0200F9B4(u8 *a);
void sub_0200FA0C(u8 *a, s32 b);
u32 TransmuteHeldItemInBag(struct item *item);
void SetFlagsForHeldItemInBag(s32 held_by, u32 flags);
bool8 RemoveHolderForItemInBag(struct item *item);
void SetHolderForItemInBag(s16 index, struct item *item, u8 held_by);
void SortItemsInBag(void);
void RemovePokeItemsInBag(void);
void sub_0200FD38(void);
void sub_0200FD3C(void);
s32 sub_0200FD48(void);
bool8 IsStorageFull(void);
s32 CountNbOfItemsInStorage(void);
u32 CountNbOfValidItemsInStorage(void);
u32 CountNbOfValidItemsInTimeDarknessInStorage(void);
u32 CountNbItemsOfTypeInStorage(s16 id);
u32 CountItemTypeInStorage(struct bulk_item *bulk_item);
s16 GetEquivBulkItemIdxInStorage(struct bulk_item *bulk_item);
bool8 ConvertStorageItemAtIdxToBulkItem(s32 idx, struct bulk_item *bulk_item);
bool8 ConvertStorageItemAtIdxToItem(s32 idx, struct item *item);
s16 sub_02010044(s32 a);
u16 sub_02010060(s32 a);
void MaybeUpdateStorage(void);
bool8 sub_02010154(s32 a);
bool8 RemoveItemAtIdxInStorage(s32 idx);
bool8 RemoveBulkItemInStorage(struct bulk_item *bulk_item);
bool8 RemoveItemInStorage(struct item *item);
void StorageZInit(void);
bool8 AddBulkItemToStorage(struct bulk_item *bulk_item);
bool8 AddItemToStorage(struct item *item);
void SortItemsInStorage(u8 *selected, s32 count);
void sub_02010590(void);
void AllKecleonShopsZInit(void);
void SpecialEpisodeKecleonShopZInit(void);
void SetActiveKecleonShop(s32 idx);

#endif
