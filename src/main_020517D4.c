#include "main_020517D4.h"

const u32 BAG_CAPACITY_TABLE[8] = { 16, 24, 32, 40, 40, 40, 48, 48 };

u32 GetBagCapacity(s32 scenario_balance)
{
    return BAG_CAPACITY_TABLE[scenario_balance];
}
