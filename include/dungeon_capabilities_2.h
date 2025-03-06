#ifndef PMDSKY_DUNGEON_CAPABILITIES_2_H
#define PMDSKY_DUNGEON_CAPABILITIES_2_H

#include "dungeon_mode.h"

// Returns false if none of these conditions holds for the given entity: asleep, frozen, petrified, biding.
bool8 CheckVariousStatuses(struct entity *entity);

#endif //PMDSKY_DUNGEON_CAPABILITIES_2_H
