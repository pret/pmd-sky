#ifndef PMDSKY_DUNGEON_AI_ITEM_WEIGHT_H
#define PMDSKY_DUNGEON_AI_ITEM_WEIGHT_H

#include "dungeon_mode.h"

// Called to get the probability of an item being used or thrown by an AI on the current turn.
// item_consumer: Pointer to either the user if it is an item used by the AI or the target if it is an item thrown by the AI
// item: Pointer to item
// flags: Size-2 bitvector: if bit 0 is set, the AI is throwing the item. If bit 1 is set, it is targeting an ally with the item.
// return: Integer in range [0, 100]
u32 GetAiUseItemProbability(struct entity *item_consumer, struct item *item, u32 flags);
// Called to check if a hostile entity is present in any of the tiles adjacent to an entity.
// return: True if yes, false if no
bool8 IsAdjacentToEnemy(struct entity *entity);

#endif //PMDSKY_DUNGEON_AI_ITEM_WEIGHT_H
