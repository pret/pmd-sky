#ifndef PMDSKY_DUNGEON_AI_ITEM_WEIGHT_H
#define PMDSKY_DUNGEON_AI_ITEM_WEIGHT_H

#include "dungeon_mode.h"

u32 GetAiUseItemProbability(struct entity *item_consumer, struct item *item, u32 flags);
bool8 IsAdjacentToEnemy(struct entity *entity);

#endif //PMDSKY_DUNGEON_AI_ITEM_WEIGHT_H
