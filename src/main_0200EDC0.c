#include "main_0200EDC0.h"
#include "item.h"
#include "main_0204C938.h"
#include "main_0204CB94.h"
#include "main_020517D4.h"
#include "scripting.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

extern bool8 GetPerformanceFlagWithChecks(s32 flag_id);

s32 GetCurrentBagCapacity()
{
    s32 special_episode_type = GetExecuteSpecialEpisodeType();
    if (special_episode_type == EPISODE_NONE)
    {
        if (GetPerformanceFlagWithChecks(2) == 0)
            return 1;

        return GetBagCapacity(GetScenarioBalance());
    }
    return GetBagCapacitySpecialEpisode(special_episode_type);
}

bool8 IsBagFull()
{
    s32 last_item_index = GetCurrentBagCapacity() - 1;
    if (BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[last_item_index].flags & ITEM_FLAG_EXISTS)
        return TRUE;
    return FALSE;
}
