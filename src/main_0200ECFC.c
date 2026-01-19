#include "main_0200ECFC.h"
#include "item.h"

extern struct bag_items* BAG_ITEMS_PTR_MIRROR;

extern void ItemZInit(struct item *item);

void SetActiveInventoryToMain(void)
{
    SetActiveInventory(MAIN_INVENTORY_INDEX);
}

void AllInventoriesZInit(void)
{
    for(int inventory_index = MAIN_INVENTORY_INDEX; inventory_index < NUM_INVENTORIES; inventory_index++)
    {
        for(int bag_index = 0; bag_index < INVENTORY_SIZE - 2; bag_index++)
        {
            ItemZInit(&BAG_ITEMS_PTR_MIRROR->inventories[inventory_index].bag_items[bag_index]);
        }      
        BAG_ITEMS_PTR_MIRROR->maybeMoney[inventory_index] = 0;
    }

    SetActiveInventory(MAIN_INVENTORY_INDEX);
}

void SpecialEpisodeInventoryZInit(void)
{
    for(int index = 0; index < INVENTORY_SIZE - 2; index++)
    {
        ItemZInit(&BAG_ITEMS_PTR_MIRROR->inventories[SPECIAL_EPISODE_INVENTORY_INDEX].bag_items[index]);
    }
    BAG_ITEMS_PTR_MIRROR->maybeMoney[SPECIAL_EPISODE_INVENTORY_INDEX] = 0;
}


void RescueInventoryZInit(void)
{
    for(int index = 0; index < INVENTORY_SIZE - 2; index++)
    {
        ItemZInit(&BAG_ITEMS_PTR_MIRROR->inventories[RESCUE_INVENTORY_INDEX].bag_items[index]);
    }
    BAG_ITEMS_PTR_MIRROR->maybeMoney[RESCUE_INVENTORY_INDEX] = 0;
}


void SetActiveInventory(s8 index)
{
    BAG_ITEMS_PTR_MIRROR->active_inventory_idx = index;
    BAG_ITEMS_PTR_MIRROR->bag_items = &BAG_ITEMS_PTR_MIRROR->inventories[index];
}

u32 GetMoneyCarried(void)
{
    int tmp = BAG_ITEMS_PTR_MIRROR->active_inventory_idx;
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
    
    BAG_ITEMS_PTR_MIRROR->maybeMoney[BAG_ITEMS_PTR_MIRROR->active_inventory_idx] = var_r0;
}

void AddMoneyCarried(s32 amount)
{
    SetMoneyCarried(amount + BAG_ITEMS_PTR_MIRROR->maybeMoney[BAG_ITEMS_PTR_MIRROR->active_inventory_idx]);
}

