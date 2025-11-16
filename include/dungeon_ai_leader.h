#ifndef PMDSKY_DUNGEON_AI_LEADER_H
#define PMDSKY_DUNGEON_AI_LEADER_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__0230827C(struct entity *entity);
// Checks if the monster should follow the leader. Always returns false for enemy monsters.
// This function may actually be should monster target leader position.
bool8 ShouldMonsterFollowLeader(struct entity *monster);
// For allied monsters, gets the leader monster if they are visible to the ally. Always returns null for enemy monsters.
struct entity* GetLeaderIfVisible(struct entity *monster);

#endif //PMDSKY_DUNGEON_AI_LEADER_H
