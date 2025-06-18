#ifndef PMDSKY_DUNGEON_MISC_H
#define PMDSKY_DUNGEON_MISC_H

#include "dungeon_mode.h"

// Given a monster, updates its target_pos field based on its current position and the direction in which it plans to attack.
void UpdateAiTargetPos(struct entity *monster);

#endif //PMDSKY_DUNGEON_MISC_H
