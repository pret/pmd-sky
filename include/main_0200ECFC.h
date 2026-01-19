#ifndef PMDSKY_MAIN_0200ECFC_H
#define PMDSKY_MAIN_0200ECFC_H

// Set the active inventory to the main inventory
void SetActiveInventoryToMain(void);

// Init all inventories, all money the player is carrying, and set default active inventory
void AllInventoriesZInit(void);

// Init the special episode inventory and money the player is carrying
void SpecialEpisodeInventoryZInit(void);

// Init the rescue inventory and money the player is carrying
void RescueInventoryZInit(void);

// Set the active inventory to the current index
void SetActiveInventory(s8 index);

// Gets the amount of money the player is carrying.
// return: value
u32 GetMoneyCarried(void);

// Sets the amount of money the player is carrying.
void SetMoneyCarried(s32 amount);

// Adds the amount of to the money the player is carrying.
void AddMoneyCarried(s32 amount);

#endif //PMDSKY_MAIN_0200ECFC_H
