#include "main_02010BA4.h"
#include "item.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

u32* GetCurrentKecleonShop2ItemByIndex(s32 idx)
{
    return &BAG_ITEMS_PTR_MIRROR->field_0x1370[idx];
}
