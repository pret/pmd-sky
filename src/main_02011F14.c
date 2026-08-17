#include "main_02011F14.h"
#include "item.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

void ClearRecycleShopOffer(void)
{
    BAG_ITEMS_PTR_MIRROR->field_0x13B2 = -1;
}

u32 GetGameStateRecycleCount(void)
{
    return BAG_ITEMS_PTR_MIRROR->field_0x13AC;
}

u8 GetRankForRecycleShop(void)
{
    return BAG_ITEMS_PTR_MIRROR->field_0x13AA;
}
