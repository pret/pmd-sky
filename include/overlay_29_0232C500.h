#ifndef PMDSKY_OVERLAY_29_0232C500_H
#define PMDSKY_OVERLAY_29_0232C500_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValidMoveEffects__0232C500(struct entity *entity);
bool8 DoMoveRebound(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif //PMDSKY_OVERLAY_29_0232C500_H
