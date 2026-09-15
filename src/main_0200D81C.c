#include "main_0200D81C.h"

extern u8* BAG_ITEMS_PTR_MIRROR[];
extern s32 _02094D0C[];

extern s32 MultiplyByFixedPoint(s32, s32);
extern s32 MONEY_QUANTITY_TABLE[];

s32 sub_0200D76C(s32 value, u8 *buf, bool8 pad)
{
#ifdef JAPAN
    s32 i;
    s32 count;
    int digit;
    s32 seen;
    const u8 *tail;

    seen = 0;
    count = 0;
    for (i = 0; i < 5; i++) {
        digit = 0;
        while (value >= _02094D0C[i]) {
            value -= _02094D0C[i];
            digit++;
        }
        if (digit > 9) {
            digit = 9;
        }
        if (digit != 0) {
            seen = 1;
            count++;
            buf[0] = BAG_ITEMS_PTR_MIRROR[1][digit * 2];
            buf[1] = BAG_ITEMS_PTR_MIRROR[1][digit * 2 + 1];
            buf += 2;
        } else if (seen) {
            count++;
            buf[0] = BAG_ITEMS_PTR_MIRROR[1][digit * 2];
            buf[1] = BAG_ITEMS_PTR_MIRROR[1][digit * 2 + 1];
            buf += 2;
        } else if (pad) {
            *buf++ = 0x7F;
        }
    }
    tail = ((const u8 **)BAG_ITEMS_PTR_MIRROR)[1];
    buf[0] = tail[value * 2];
    buf[1] = tail[value * 2 + 1];
    buf[2] = 0;
    return count + 1;
#else
    s32 count;
    s32 i;
    s32 seen;
    int digit;
    u8 *digits;

    digits = BAG_ITEMS_PTR_MIRROR[1];
    seen = 0;
    count = 0;
    for (i = 0; i < 5; i++) {
        digit = 0;
        while (value >= _02094D0C[i]) {
            value -= _02094D0C[i];
            digit++;
        }
        if (digit > 9) {
            digit = 9;
        }
        if (digit != 0) {
            seen = 1;
            count++;
            *buf++ = digits[digit];
        } else if (seen) {
            count++;
            *buf++ = digits[digit];
        } else if (pad) {
            *buf++ = 0x7F;
        }
    }
    buf[0] = digits[value];
    buf[1] = 0;
    return count + 1;
#endif
}

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
