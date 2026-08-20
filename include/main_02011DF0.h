#ifndef PMDSKY_MAIN_02011DF0_H
#define PMDSKY_MAIN_02011DF0_H

#include "util.h"

struct unk_02011DF0 {
    s16 field_0x0;
    s32 field_0x4;
    u8 field_0x8[0xA];
    u16 field_0x12;
};


s16 GetRecycleItemId(struct unk_02011DF0** p);
bool8 RecycleItemHasTradeTypePrizeTicket(struct unk_02011DF0** p);
u16 GetRecycleItemBonusOdds(struct unk_02011DF0** p);

#endif
