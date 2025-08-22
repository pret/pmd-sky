#ifndef PMDSKY_ITEM_UTIL_4_H
#define PMDSKY_ITEM_UTIL_4_H

#include "item.h"

BOOL IsLosableItem(struct item* item);
bool8 IsTreasureBox(s16 item_id);
bool8 IsStorableItem(s16 item_id);
bool8 IsShoppableItem(s16 item_id);
bool8 IsValidTargetItem(s16 item_id);

#endif //PMDSKY_ITEM_UTIL_4_H

