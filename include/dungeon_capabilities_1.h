#ifndef PMDSKY_DUNGEON_CAPABILITIES_1_H
#define PMDSKY_DUNGEON_CAPABILITIES_1_H

#include "dungeon_mode.h"

// Returns 0 if none of these conditions holds for the given entity: is a rescue client,
// doesn't gain experience (a mission client/story teammate?), is a terrified non-team-leader,
// meets any of the conditions in CheckVariousStatuses2 (with blind_check = 0), is charging a two-turn move.
bool8 CheckVariousConditions(struct entity *entity);

#endif //PMDSKY_DUNGEON_CAPABILITIES_H