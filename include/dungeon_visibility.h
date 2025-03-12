#ifndef PMDSKY_DUNGEON_VISIBILITY_H
#define PMDSKY_DUNGEON_VISIBILITY_H

#include "dungeon_mode.h"

// Checks if a given monster can see another monster.
// Calls IsPositionActuallyInSight. Also checks if the user is blinded, if the target is invisible, etc.
// This function is almost the same as CanTargetEntity, the only difference is that the latter calls IsPositionInSight instead.
bool8 CanSeeTarget(struct entity *user, struct entity *target);

#endif //PMDSKY_DUNGEON_VISIBILITY_H
