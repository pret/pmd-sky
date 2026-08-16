#include "main_020107DC.h"
#include "item.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

u16 GetEggHatchTimer(void)
{
    return BAG_ITEMS_PTR_MIRROR->field_0x13A8;
}
