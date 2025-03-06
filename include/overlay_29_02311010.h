#ifndef PMDSKY_OVERLAY_29_02311010_H
#define PMDSKY_OVERLAY_29_02311010_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__02311010(struct entity *entity);
// Checks if a monster is holding a certain item that isn't disabled by Klutz.
bool8 ItemIsActive__02311034(struct entity *entity, enum item_id item_id);

#endif //PMDSKY_OVERLAY_29_02311010_H
