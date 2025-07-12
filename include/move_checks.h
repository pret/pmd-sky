#ifndef PMDSKY_MOVE_CHECKS_H
#define PMDSKY_MOVE_CHECKS_H

#include "dungeon_mode.h"

bool8 StatusCheckerCheck(struct entity *attacker, struct move *move);
// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__02333FAC(struct entity *entity);

#endif //PMDSKY_MOVE_CHECKS_H
