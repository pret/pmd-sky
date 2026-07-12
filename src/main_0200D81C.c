#include "main_0200D81C.h"

extern s32 MultiplyByFixedPoint(s32, s32);
extern s32 MONEY_QUANTITY_TABLE[];

void ItemZInit(struct item* item)
{
    item->id = 0;
    item->quantity = 0;
    item->flags = 0;
    item->held_by = 0;
}

bool8 AreItemsEquivalent(struct item* item1, struct item* item2, s32 bitmask)
{
    if ((item1->flags & bitmask) != (item2->flags & bitmask)) {
        return FALSE;
    }
    if (item1->held_by != item2->held_by) {
        return FALSE;
    }
    if (item1->quantity != item2->quantity) {
        return FALSE;
    }
    if (item1->id != item2->id) {
        return FALSE;
    }
    return TRUE;
}

void sub_0200D894(struct item* item)
{
    item->held_by = 0;
    item->flags = item->flags & ~(ITEM_FLAG_STICKY | ITEM_FLAG_SET);
}

s32 GetMoneyQuantity(struct item* item)
{
    s32 moneyQuantity = MONEY_QUANTITY_TABLE[item->quantity];
    
    if (!(item->flags & ITEM_FLAG_UNK_MONEY_QUANTITY)) {
        return moneyQuantity;
    }

    return MultiplyByFixedPoint(moneyQuantity << 8, 0x133) >> 8;
}
