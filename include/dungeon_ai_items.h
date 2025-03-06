#ifndef PMDSKY_DUNGEON_AI_ITEMS_H
#define PMDSKY_DUNGEON_AI_ITEMS_H

#include "dungeon_mode.h"

extern bool8 AI_THROWN_ITEM_DIRECTION_IS_USED[NUM_DIRECTIONS];
extern u32 AI_THROWN_ITEM_PROBABILITIES[NUM_DIRECTIONS];
extern u32 AI_THROWN_ITEM_DIRECTIONS[NUM_DIRECTIONS];

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__0230E8F0(struct entity *entity);
// Decides whether or not an AI should use its held item and updates its action_data fields accordingly.
void AiDecideUseItem(struct entity *entity);

#endif //PMDSKY_DUNGEON_AI_ITEMS_H
