#ifndef PMDSKY_ITEM_UTIL_1_H
#define PMDSKY_ITEM_UTIL_1_H

#include "item.h"
#include "util.h"

void LoadItemPspi2n(void);

#ifdef EUROPE
void SprintfStatic__0200E808_EU(char* buf, const char* fmt, ...);
#endif

u8 GetExclusiveItemType(s16 item_id);

// Checks if an item is valid given its ID.
// In particular, checks if the "is valid" flag is set on its item_p.bin entry.
bool8 IsItemValid(s16 item_id);

s16 GetExclusiveItemParameter(s16 item_id);

// Returns the category of the specified item
enum item_category GetItemCategory(s16 item_id);

u8* GetItemName(s16 item_id);
void GetItemNameFormatted(char* name, s16 item_id, s32 arg2, s32 arg3);
u16 GetItemBuyPrice(s16 item_id);
u16 GetItemSellPrice(s16 item_id);
u8 GetItemSpriteId(s16 item_id);
u8 GetItemPaletteId(s16 item_id);
u8 GetItemActionName(s16 item_id);
u8 GetThrownItemQuantityLimit(s16 item_id, u8 arg1);
s16 GetItemMoveId(s16 item_id);

// Returns a boolean indicating whether the item is consumable, throwable at an ally, or throwable at an enemy, depending on item_flag.
// The table used for this is inaccessible in the code, as it is loaded from a file in the ROM at runtime.
// Bit 7 in the table corresponds to ITEM_FLAG_CONSUMABLE, bit 6 to ITEM_FLAG_THROWABLE_AT_ALLY, and bit 5 to ITEM_FLAG_THROWABLE_AT_ENEMY.
//
// item_id: item_id enum
// flag: item_flag enum. Function will test a different allowed AI action depending on the value.
// return: bool
bool8 TestItemAiFlag(s16 item_id, s32 flag);

#endif //PMDSKY_ITEM_UTIL_1_H
