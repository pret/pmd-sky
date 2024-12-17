#ifndef PMDSKY_OVERLAY_29_02340CAC_H
#define PMDSKY_OVERLAY_29_02340CAC_H

#include "util.h"

// Checks if a position (x, y) is out of bounds on the map: !((0 <= x <= 55) && (0 <= y <= 31)).
bool8 PosIsOutOfBounds(s32 x, s32 y);

#endif //PMDSKY_OVERLAY_29_02340CAC_H
