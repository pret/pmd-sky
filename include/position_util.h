#ifndef PMDSKY_POSITION_UTIL_H
#define PMDSKY_POSITION_UTIL_H

#include "dungeon_mode.h"

// Gets the direction in which a monster should move to go from the origin position to the target position
s32 GetDirectionTowardsPosition(struct position *origin, struct position *target);

#endif //PMDSKY_POSITION_UTIL_H
