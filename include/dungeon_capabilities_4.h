#ifndef PMDSKY_DUNGEON_CAPABILITIES_4_H
#define PMDSKY_DUNGEON_CAPABILITIES_4_H

#include "dungeon_mode.h"

// True if the given monster is cornered (it can't move in any direction)
bool8 IsMonsterCornered(struct entity *monster);
// Checks if the given monster can move in the specified direction. Includes if an allied or neutral monster is standing on an adjacent tile, as the monsters can swap places.
// Returns false if an enemy monster is standing on the target tile
bool8 CanMonsterMoveOrSwapWithAllyInDirection(struct entity *monster, s32 direction);
// Returns whether a monster can attack in a given direction.
// The check fails if the destination tile is impassable, contains a monster that isn't of type entity_type::ENTITY_MONSTER or if the monster can't directly move from the current tile into the destination tile.
bool8 CanAttackInDirection(struct entity *monster, s32 direction);

#endif //PMDSKY_DUNGEON_CAPABILITIES_4_H
