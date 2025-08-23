#ifndef PMDSKY_ITEM_UTIL_4_H
#define PMDSKY_ITEM_UTIL_4_H

#include "item.h"

BOOL IsLosableItem(struct item* item);
u8 IsTreasureBox(s16 item_id);
u8 IsStorableItem(s16 item_id);
u8 IsShoppableItem(s16 item_id);

#endif //PMDSKY_ITEM_UTIL_4_H

