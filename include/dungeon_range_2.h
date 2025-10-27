#ifndef PMDSKY_DUNGEON_RANGE_2_H
#define PMDSKY_DUNGEON_RANGE_2_H

#include "dungeon_mode.h"

// Checks if a given target position is within two tiles of a given origin position.
bool8 IsPositionWithinTwoTiles(struct position *origin, struct position *target);

#endif //PMDSKY_DUNGEON_RANGE_2_H
