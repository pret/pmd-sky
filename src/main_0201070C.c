#include "main_0201070C.h"
#include "item.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

u32 GetMoneyStored(void)
{
    return BAG_ITEMS_PTR_MIRROR->field_0x13A0;
}

void SetMoneyStored(s32 money)
{
    if (money > 9999999) {
        money = 9999999;
    } else if (money < 0) {
        money = 0;
    }
    BAG_ITEMS_PTR_MIRROR->field_0x13A0 = money;
}
