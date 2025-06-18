#ifndef PMDSKY_OVERLAY_29_02301118_H
#define PMDSKY_OVERLAY_29_02301118_H

#include "dungeon_mode.h"

// True if the given monster is cornered (it can't move in any direction)
bool8 IsMonsterCornered(struct entity *monster);
// Checks if the given monster can move in the specified direction. Includes if an allied or neutral monster is standing on an adjacent tile, as the monsters can swap places.
// Returns false if an enemy monster is standing on the target tile
bool8 CanMonsterMoveOrSwapWithAllyInDirection(struct entity *monster, s32 direction);

#endif //PMDSKY_OVERLAY_29_02301118_H
