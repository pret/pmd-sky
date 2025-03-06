#ifndef PMDSKY_OVERLAY_29_022EE348_H
#define PMDSKY_OVERLAY_29_022EE348_H

#include "dungeon_mode.h"

// Checks if a monster is holding a certain item that isn't disabled by Klutz.
bool8 ItemIsActive__022EE318(struct entity *entity, enum item_id item_id);
// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__022EE348(struct entity *entity);

#endif //PMDSKY_OVERLAY_29_022EE348_H
