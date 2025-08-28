#ifndef PMDSKY_ITEM_UTIL_4_H
#define PMDSKY_ITEM_UTIL_4_H

#include "item.h"

struct bulk_item
{
    /* 0x0 */ s16 id;
    /* 0x2 */ u16 quantity;
} BulkItem;

BOOL IsLosableItem(struct item* item);
bool8 IsTreasureBox(s16 item_id);
bool8 IsStorableItem(s16 item_id);
bool8 IsShoppableItem(s16 item_id);
bool8 IsValidTargetItem(s16 item_id);
bool8 IsItemUsableNow(struct item *item);
bool8 IsTicketItem(s16 item_id);
void InitItem(struct item* item, s16 id, s16 quantity, bool8 isSticky);
void InitStandardItem(struct item* item, s16 id, bool8 isSticky);
void sub_0200CF6C(struct item* item, s16 id, s16 quantity, bool8 isSticky);
//void InitBulkItem(struct bulk_item* item, s16 id);

#endif //PMDSKY_ITEM_UTIL_4_H

