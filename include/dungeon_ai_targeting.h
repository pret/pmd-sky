#ifndef PMDSKY_DUNGEON_AI_TARGETING_H
#define PMDSKY_DUNGEON_AI_TARGETING_H

#include "dungeon_mode.h"

// Checks if a monster should run away from other monsters
// return: True if the monster should run away, false otherwise
bool8 ShouldMonsterRunAway(struct entity *monster);

#endif //PMDSKY_DUNGEON_AI_TARGETING_H
