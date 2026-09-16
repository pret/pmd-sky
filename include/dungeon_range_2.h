#ifndef PMDSKY_DUNGEON_RANGE_2_H
#define PMDSKY_DUNGEON_RANGE_2_H

#include "dungeon_mode.h"

// Checks if a given target position is within two tiles of a given origin position.
bool8 IsPositionWithinTwoTiles(struct position *origin, struct position *target);
bool8 DisplayThrownItemShadow(s32 x, s32 y, u8 index);

#endif //PMDSKY_DUNGEON_RANGE_2_H
