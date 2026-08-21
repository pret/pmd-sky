#ifndef PMDSKY_OVERLAY_29_022E1610_H
#define PMDSKY_OVERLAY_29_022E1610_H

#include "dungeon_mode.h"

// Given an item entity, returns the pointer to the item info struct it contains.
struct item* GetItemInfo(struct entity *item_entity);
void * ov29_022E1618(struct entity *entity);
void * ov29_022E1620(struct entity *entity);

#endif //PMDSKY_OVERLAY_29_022E1610_H
