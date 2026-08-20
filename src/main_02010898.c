#include "main_02010898.h"
#include "item.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

u32* GetCurrentKecleonShop1ItemByIndex(s32 idx)
{
    return &BAG_ITEMS_PTR_MIRROR->field_0x132C[idx];
}
