#ifndef PMDSKY_ITEM_UTIL_3_H
#define PMDSKY_ITEM_UTIL_3_H

#include "util.h"

// Returns a boolean indicating whether the item is consumable, throwable at an ally, or throwable at an enemy, depending on item_flag.
// The table used for this is inaccessible in the code, as it is loaded from a file in the ROM at runtime.
// Bit 7 in the table corresponds to ITEM_FLAG_CONSUMABLE, bit 6 to ITEM_FLAG_THROWABLE_AT_ALLY, and bit 5 to ITEM_FLAG_THROWABLE_AT_ENEMY.
//
// item_id: item_id enum
// flag: item_flag enum. Function will test a different allowed AI action depending on the value.
// return: bool
bool8 TestItemAiFlag(s16 item_id, s32 flag);

#endif //PMDSKY_ITEM_UTIL_3_H
