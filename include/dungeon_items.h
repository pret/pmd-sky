#ifndef PMDSKY_DUNGEON_ITEMS_H
#define PMDSKY_DUNGEON_ITEMS_H

#include "dungeon_mode.h"

// Checks if a monster has a certain held item.
bool8 HasHeldItem(struct entity* entity, enum item_id item_id);

#endif //PMDSKY_DUNGEON_ITEMS_H
