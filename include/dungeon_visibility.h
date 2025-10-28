#ifndef PMDSKY_DUNGEON_VISIBILITY_H
#define PMDSKY_DUNGEON_VISIBILITY_H

#include "dungeon_mode.h"

// Checks if a given monster can see another monster.
// Calls IsPositionActuallyInSight. Also checks if the user is blinded, if the target is invisible, etc.
// This function is almost the same as CanTargetEntity, the only difference is that the latter calls IsPositionInSight instead.
bool8 CanSeeTarget(struct entity *user, struct entity *target);
// Checks if a monster can target another entity when controlled by the AI.
// More specifically, it checks if the target is invisible, if the user can see invisible monsters, if the user is blinded and if the target position is in sight from the position of the user (this last check is done by calling IsPositionInSight with the user's and the target's position).
// This function is almost the same as CanSeeTarget, the only difference is that the latter calls IsPositionActuallyInSight instead.
bool8 CanTargetEntity(struct entity *user, struct entity *target);

#endif //PMDSKY_DUNGEON_VISIBILITY_H
