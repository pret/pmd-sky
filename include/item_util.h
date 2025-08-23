#ifndef PMDSKY_ITEM_UTIL_H
#define PMDSKY_ITEM_UTIL_H

#include "item.h"

// Likely a linker-generated veneer for GetItemCategory.
// See https://developer.arm.com/documentation/dui0474/k/image-structure-and-generation/linker-generated-veneers/what-is-a-veneer-
enum item_category GetItemCategoryVeneer(s16 item_id);
u16 GetItemMoveId16(s16 item_id);
u8 IsThrownItem(s16 item_id);
u8 IsNotMoney(s16 item_id);
u8 IsEdible(s16 item_id);
u8 IsHM(s16 item_id);
u8 IsGummi(s16 item_id);
u8 IsGummi(s16 item_id);
BOOL IsAuraBow(s32 item_id);
extern BOOL IsLosableItem(struct item* item);

#endif //PMDSKY_ITEM_UTIL_H
