#include "main_02011DF0.h"

s16 GetRecycleItemId(struct unk_02011DF0** p)
{
    return (*p)->field_0x0;
}

bool8 RecycleItemHasTradeTypePrizeTicket(struct unk_02011DF0** p)
{
    return (*p)->field_0x4 == 1;
}

u16 GetRecycleItemBonusOdds(struct unk_02011DF0** p)
{
    return (*p)->field_0x12;
}
