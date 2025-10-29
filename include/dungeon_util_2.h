#ifndef PMDSKY_DUNGEON_UTIL_2_H
#define PMDSKY_DUNGEON_UTIL_2_H

#include "dungeon_mode.h"

// Checks if a monster can target a position. This function just calls IsPositionInSight using the position of the user as the origin.
bool8 CanTargetPosition(struct entity *monster, struct position *position);

#endif //PMDSKY_DUNGEON_UTIL_2_H
