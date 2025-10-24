#include "main_020517D4.h"
#include "enums.h"

// Array of 4-byte integers containing the bag capacity for each bag level.
const u32 BAG_CAPACITY_TABLE[8] = { 16, 24, 32, 40, 40, 40, 48, 48 };
const u32 BAG_CAPACITY_TABLE_SPECIAL_EPISODES[NUM_SPECIAL_EPISODES] =
{
    [EPISODE_BIDOOFS_WISH] = 24,
    [EPISODE_IGGLYBUFF_THE_PRODIGY] = 48,
    [EPISODE_TODAYS_OH_MY_GOSH] = 48,
    [EPISODE_HERE_COMES_TEAM_CHARM] = 48,
    [EPISODE_IN_THE_FUTURE_OF_DARKNESS] = 48
};

u32 GetBagCapacity(s32 scenario_balance)
{
    return BAG_CAPACITY_TABLE[scenario_balance];
}

u32 GetBagCapacitySpecialEpisode(s32 se_type)
{
    return BAG_CAPACITY_TABLE_SPECIAL_EPISODES[se_type];
}
