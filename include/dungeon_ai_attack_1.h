#ifndef PMDSKY_DUNGEON_AI_ATTACK_1_H
#define PMDSKY_DUNGEON_AI_ATTACK_1_H

#include "dungeon_mode.h"

// Returns true if the target is within range of the user's move, false otherwise.
// If the user does not have Course Checker, it simply checks if the distance between user and target is less or equal than the move range.
// Otherwise, it will iterate through all tiles in the direction specified, checking for walls or other monsters in the way, and return false if they are found.
// user: user pointer
// target: target pointer
// direction: direction ID
// n_tiles: move range (in number of tiles)
bool8 IsTargetInRange(struct entity *user, struct entity *target, enum direction_id direction, s32 n_tiles);

#endif //PMDSKY_DUNGEON_AI_ATTACK_1_H
