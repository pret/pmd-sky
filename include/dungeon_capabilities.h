#ifndef PMDSKY_DUNGEON_CAPABILITIES_H
#define PMDSKY_DUNGEON_CAPABILITIES_H

#include "dungeon_mode.h"

// Returns false if none of these conditions holds for the given entity:
// blinded (checked only if blind_check == true),
// asleep, frozen, paused, infatuated, wrapping, wrapped, biding, petrified, or terrified.
// entity: Entity pointer
// blind_check: If true, return true if entity is blinded
bool8 CheckVariousStatuses2(struct entity *entity, bool8 blind_check);

#endif //PMDSKY_DUNGEON_CAPABILITIES_H
