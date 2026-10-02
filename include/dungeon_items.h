#ifndef PMDSKY_DUNGEON_ITEMS_H
#define PMDSKY_DUNGEON_ITEMS_H

#include "dungeon_mode.h"

// Checks if a monster has a certain held item.
bool8 HasHeldItem(struct entity* entity, enum item_id item_id);
void GenerateMoneyQuantity(struct bulk_item* item, s32 arg1);
void ov29_02346888(void);

#endif //PMDSKY_DUNGEON_ITEMS_H
