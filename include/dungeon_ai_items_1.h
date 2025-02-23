#ifndef PMDSKY_DUNGEON_AI_ITEMS_1_H
#define PMDSKY_DUNGEON_AI_ITEMS_1_H

#include "dungeon_mode.h"

// If the entity can throw an item at a target in a certain direction,
// adds that direction to AI_THROWN_ITEM_DIRECTIONS and the probability of throwing it to AI_THROWN_ITEM_PROBABILITIES (if it is not already present).
// The size of the arrays will be stored in AI_THROWN_ITEM_ACTION_CHOICE_COUNT.
// The caller function will select the direction to throw the item by iterating through the array(s), rolling the probability, and then throwing in that direction if the roll succeeds.
// Nothing will be thrown if all rolls fail.
//
// pokemon: Entity pointer
// thrown_ai_flag: Integer in {1, 2}. If 1, target allies; if 2, target enemies.
// item: Item struct pointer
// ignore_roll_chance: If false, will call GetAiUseItemProbability to get the probability of throwing in a certain direction.
// If true, the added probability will always be 100.
void GetPossibleAiThrownItemDirections(struct entity *pokemon, s32 thrown_ai_flag, struct item *item, bool8 ignore_roll_chance);
// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__0230F008(struct entity *entity);

#endif //PMDSKY_DUNGEON_AI_ITEMS_1_H
