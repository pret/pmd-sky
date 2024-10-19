#include "main_0200ECFC.h"

extern bag_items* BAG_ITEMS_PTR_MIRROR;

u32 GetMoneyCarried(void)
{
    int tmp = BAG_ITEMS_PTR_MIRROR->unk388;
    return BAG_ITEMS_PTR_MIRROR->maybeMoney[tmp];
}
