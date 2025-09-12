#ifndef PMDSKY_MOVE_CHECKS_H
#define PMDSKY_MOVE_CHECKS_H

#include "dungeon_mode.h"

// Determines if using a given move against its intended targets would be redundant because all of them already have the effect caused by said move. Used for moves that affect the user or allies.
// attacker: Pointer to the entity that is considering using the move
// move: Move pointer
// return: True if it makes sense to use the move, false if it would be redundant given the effects it causes and the effects that all the targets already have.
bool8 StatusCheckerCheck(struct entity *attacker, struct move *move);
// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__02333FAC(struct entity *entity);
// Determines if using a given move against its intended target would be redundant because all of them already have the effect caused by said move. Used for moves that affect enemies.
// attacker: Pointer to the entity that is considering using the move
// target: Pointer to the entity being targeted by the move
// move: Move pointer
// return: True if it makes sense to use the move, false if it would be redundant given the effects it causes and the effects that the target already has.
bool8 StatusCheckerCheckOnTarget(struct entity *attacker, struct entity *target, struct move *move);
// Determines whether a monster has used any of its moves on this floor.
// This function takes in the monster's move list and checks if any moves have the f_last_used flag set.
bool8 HasLastUsedMove(struct move *moves);

#endif //PMDSKY_MOVE_CHECKS_H
