#ifndef PMDSKY_DUNGEON_MOVE_H
#define PMDSKY_DUNGEON_MOVE_H

#include "dungeon_mode.h"

// Returns a boolean indicating whether or not the given entity is charging any two-turn move.
// pokemon: Entity pointer
// check_charge: Unused boolean which was supposed to make function return true if the entity is under the effect of Charge (the Electric-type move).
//     However, the conditional which uses this boolean will never be activated, as the loop will always terminate before getting to it.
bool8 IsChargingAnyTwoTurnMove(struct entity *entity, bool8 charge_check_unused);

#endif //PMDSKY_DUNGEON_MOVE_H
