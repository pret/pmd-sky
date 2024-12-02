#ifndef PMDSKY_DUNGEON_STATUSES_H
#define PMDSKY_DUNGEON_STATUSES_H

#include "dungeon_mode.h"

// Returns true if the monster has the blinded status (see statuses::blinded), or if it is not the leader and is holding Y-Ray Specs.
// entity: pointer to entity
// check_held_item: flag for whether to check for the held item
bool8 IsBlinded(struct entity *entity, bool8 check_held_item);

#endif //PMDSKY_DUNGEON_STATUSES_H
