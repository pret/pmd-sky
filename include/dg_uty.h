#ifndef PMDSKY_OVERLAY_29_022E95F4_H
#define PMDSKY_OVERLAY_29_022E95F4_H

#include "dungeon_mode.h"

// Gets the pointer to the entity that is currently leading the team, or null if none of the first 4 entities is a valid monster with its is_team_leader flag set. It also sets LEADER_PTR to the result before returning it.
struct entity* GetLeader();
// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__022E95F4(struct entity *entity);

#endif //PMDSKY_OVERLAY_29_022E95F4_H
