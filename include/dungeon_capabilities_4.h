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
// Checks whether an AI-controlled monster can move in the specified direction.
// Accounts for walls, other monsters on the target position and IQ skills that might prevent a monster from moving into a specific location, such as House Avoider, Trap Avoider or Lava Evader.
// monster: Entity pointer
// direction: Direction
// out_monster_in_target_position: [output] True if movement was not possible because there was another monster on the target tile, false otherwise.
// return: True if the monster can move in the specified direction, false otherwise.
bool8 CanAiMonsterMoveInDirection(struct entity *monster, s32 direction, bool8 *out_monster_in_target_position);

#endif //PMDSKY_DUNGEON_CAPABILITIES_4_H
