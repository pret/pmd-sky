#ifndef PMDSKY_POSITION_UTIL_H
#define PMDSKY_POSITION_UTIL_H

#include "dungeon_mode.h"

// Gets the direction in which a monster should move to go from the origin position to the target position
s32 GetDirectionTowardsPosition(struct position *origin, struct position *target);
// Returns the Chebyshev distance between two positions. Calculated as max(abs(x0-x1), abs(y0-y1)).
s32 GetChebyshevDistance(struct position *position_a, struct position *position_b);

#endif //PMDSKY_POSITION_UTIL_H
