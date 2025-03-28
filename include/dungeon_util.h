#ifndef PMDSKY_DUNGEON_UTIL_H
#define PMDSKY_DUNGEON_UTIL_H

#include "dungeon_mode.h"

// An array mapping each direction index to its x and y displacements.
// Directions start with 0=down and proceed counterclockwise (see enum direction_id). Displacements for x and y are interleaved and encoded as 2-byte signed integers.
// For example, the first two integers are [0, 1], which correspond to the x and y displacements for the "down" direction (positive y means down).
extern const struct position DIRECTIONS_XY[NUM_DIRECTIONS];

// Checks a monster's monster_behavior to see whether or not the monster should use AI. Only called on monsters with
// a monster_behavior greater than or equal to BEHAVIOR_FIXED_ENEMY. Returns false for BEHAVIOR_FIXED_ENEMY,
// BEHAVIOR_WANDERING_ENEMY_0x8, BEHAVIOR_SECRET_BAZAAR_KIRLIA, BEHAVIOR_SECRET_BAZAAR_MIME_JR,
// BEHAVIOR_SECRET_BAZAAR_SWALOT, BEHAVIOR_SECRET_BAZAAR_LICKILICKY, and BEHAVIOR_SECRET_BAZAAR_SHEDINJA.
bool8 ShouldRunMonsterAi(struct entity *monster);

#endif //PMDSKY_DUNGEON_UTIL_H
