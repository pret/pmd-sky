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

#endif //PMDSKY_MOVE_CHECKS_H
