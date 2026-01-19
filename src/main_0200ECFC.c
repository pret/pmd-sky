#include "main_0200ECFC.h"
#include "item.h"

extern struct bag_items* BAG_ITEMS_PTR_MIRROR;

u32 GetMoneyCarried(void)
{
    int tmp = BAG_ITEMS_PTR_MIRROR->unk388;
    return BAG_ITEMS_PTR_MIRROR->maybeMoney[tmp];
}

void SetMoneyCarried(s32 amount)
{
    s32 var_r0;

    var_r0 = amount;
    if (var_r0 > 99999) {
        var_r0 = 99999;
    } else if (var_r0 < 0) {
        var_r0 = 0;
    }
    
    BAG_ITEMS_PTR_MIRROR->maybeMoney[BAG_ITEMS_PTR_MIRROR->unk388] = var_r0;
}

void AddMoneyCarried(s32 amount)
{
    SetMoneyCarried(amount + BAG_ITEMS_PTR_MIRROR->maybeMoney[BAG_ITEMS_PTR_MIRROR->unk388]);
}

