#ifndef PMDSKY_OVERLAY_29_0231B194_H
#define PMDSKY_OVERLAY_29_0231B194_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__0231B194(struct entity *entity);
void TryActivateBadDreams(struct entity *attacker);

#endif //PMDSKY_OVERLAY_29_0231B194_H
