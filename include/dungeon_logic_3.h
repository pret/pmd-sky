#ifndef PMDSKY_DUNGEON_LOGIC_3_H
#define PMDSKY_DUNGEON_LOGIC_3_H

#include "dungeon_mode.h"

// Checks if the given monster can move in the specified direction
// Returns false if any monster is standing on the target tile
bool8 CanMonsterMoveInDirection(struct entity *monster, u16 direction);

#endif //PMDSKY_DUNGEON_LOGIC_3_H
