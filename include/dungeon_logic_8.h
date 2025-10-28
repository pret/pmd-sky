#ifndef PMDSKY_DUNGEON_LOGIC_8_H
#define PMDSKY_DUNGEON_LOGIC_8_H

#include "dungeon_mode.h"

// Checks if a given monster can move through walls, including both the innate ability of Ghost types and outside modifiers like Mobile Scarf/Orb.
bool8 CanMoveThroughWalls(struct entity *monster);

#endif //PMDSKY_DUNGEON_LOGIC_8_H
