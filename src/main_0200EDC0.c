#include "main_0200EDC0.h"
#include "item.h"
#include "main_020517D4.h"
#include "progression.h"
#include "script_variable.h"
#include "special_episode.h"

extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

s32 GetCurrentBagCapacity()
{
    s32 special_episode_type = GetExecuteSpecialEpisodeType();
    if (special_episode_type == EPISODE_NONE)
    {
        if (GetResolvedPerformanceProgressFlag(2) == 0)
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

u32 GetNbItemsInBag(void)
{
    struct item *item = BAG_ITEMS_PTR_MIRROR->bag_items->bag_items;
    s32 count = 0;
    s32 i;

    for (i = 0; i < INVENTORY_SIZE; i++, item++) {
        bool8 exists = (item->flags & ITEM_FLAG_EXISTS) != 0;

        if (exists) {
            count++;
        }
    }
    return count;
}
