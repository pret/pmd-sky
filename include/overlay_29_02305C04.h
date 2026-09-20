#ifndef PMDSKY_OVERLAY_29_02305C04_H
#define PMDSKY_OVERLAY_29_02305C04_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__02305C04(struct entity *entity);
void EndNegativeStatusConditionWrapper(struct entity *user, struct entity *target, bool8 displayMessage, bool8 fromMove);

#endif //PMDSKY_OVERLAY_29_02305C04_H
