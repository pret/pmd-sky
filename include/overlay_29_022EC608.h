#ifndef PMDSKY_OVERLAY_29_022EC608_H
#define PMDSKY_OVERLAY_29_022EC608_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
// entity: entity pointer
// return: bool
u8 EntityIsValid__022EC608(struct entity *entity);

#endif //PMDSKY_OVERLAY_29_022EC608_H
