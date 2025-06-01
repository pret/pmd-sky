#ifndef PMDSKY_DUNGEON_MOBILITY_H
#define PMDSKY_DUNGEON_MOBILITY_H

#include "dungeon_mode.h"

// Returns the mobility type of a monster species, accounting for STATUS_SLIP.
// The function also converts MOBILITY_LAVA and MOBILITY_WATER to other values if required.
// species: Monster species
// walk_on_water: True if the monster can walk on water
// return: Mobility type
enum mobility_type GetMobilityTypeCheckSlip(s16 species, bool8 walk_on_water);
// Returns the mobility type of a monster, accounting for STATUS_SLIP and the result of a call to IsFloating.
enum mobility_type GetMobilityTypeCheckSlipAndFloating(struct entity *monster, s16 species);

#endif //PMDSKY_DUNGEON_MOBILITY_H
