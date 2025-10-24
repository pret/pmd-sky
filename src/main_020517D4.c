#include "main_020517D4.h"

// Array of 4-byte integers containing the bag capacity for each bag level.
const u32 BAG_CAPACITY_TABLE[] = { 16, 24, 32, 40, 40, 40, 48, 48 };
const u32 BAG_CAPACITY_TABLE_SPECIAL_EPISODES[] = { 24, 48, 48, 48, 48 };

u32 GetBagCapacity(s32 scenario_balance)
{
    return BAG_CAPACITY_TABLE[scenario_balance];
}

u32 GetBagCapacitySpecialEpisode(s32 se_type)
{
    return BAG_CAPACITY_TABLE_SPECIAL_EPISODES[se_type];
}
