#ifndef PMDSKY_OVERLAY_29_02315118_H
#define PMDSKY_OVERLAY_29_02315118_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
// entity: entity pointer
// return: bool
u8 EntityIsValid__02315118(struct entity *entity);

#endif //PMDSKY_OVERLAY_29_02315118_H
