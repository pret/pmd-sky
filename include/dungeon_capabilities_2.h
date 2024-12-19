#ifndef PMDSKY_DUNGEON_CAPABILITIES_2_H
#define PMDSKY_DUNGEON_CAPABILITIES_2_H

#include "dungeon_mode.h"

// Returns 0 if none of these conditions holds for the given entity: asleep, frozen, petrified, biding.
bool8 CheckVariousStatuses(struct entity *pokemon);

#endif //PMDSKY_DUNGEON_CAPABILITIES_2_H
