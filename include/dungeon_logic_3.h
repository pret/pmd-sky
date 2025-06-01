#ifndef PMDSKY_DUNGEON_LOGIC_3_H
#define PMDSKY_DUNGEON_LOGIC_3_H

#include "dungeon_mode.h"

// Checks if the given monster can move in the specified direction
// Returns false if any monster is standing on the target tile
bool8 CanMonsterMoveInDirection(struct entity *monster, u16 direction);
#ifndef JAPAN
// Returns the mobility type of a monster, after accounting for things that could affect it.
// List of checks: Mobile status, Mobile Scarf, All-Terrain Hiker and Absolute Mover.
// If the specified direction is DIR_NONE, direction checks are skipped. If it's not, MOBILITY_INTANGIBLE is only returned if the direction is not diagonal.
// monster: Monster entity pointer
// base_mobility: Base mobility type
// direction: Direction of mobility
// return: Final mobility type
enum mobility_type GetDirectionalMobilityType(struct entity *monster, enum mobility_type base_mobility, u8 direction);
#endif

#endif //PMDSKY_DUNGEON_LOGIC_3_H
