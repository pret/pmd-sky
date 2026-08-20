#include "main_020107DC.h"
#include "item.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

u16 GetEggHatchTimer(void)
{
    return BAG_ITEMS_PTR_MIRROR->field_0x13A8;
}

void SetEggHatchTimer(u16 timer)
{
    BAG_ITEMS_PTR_MIRROR->field_0x13A8 = timer;
}

void DecrementEggHatchTimer(void)
{
    if (BAG_ITEMS_PTR_MIRROR->field_0x13A8 != 0) {
        BAG_ITEMS_PTR_MIRROR->field_0x13A8--;
    }
}
