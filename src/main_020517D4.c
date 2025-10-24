#include "main_020517D4.h"

extern u32 BAG_CAPACITY_TABLE[8];

u32 GetBagCapacity(s32 scenario_balance)
{
    return BAG_CAPACITY_TABLE[scenario_balance];
}
