#ifndef PMDSKY_OVERLAY_29_0232E250_H
#define PMDSKY_OVERLAY_29_0232E250_H

#include "dungeon_mode.h"
#include "move.h"
#include "item.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValidMoveEffects__0232E250(struct entity *entity);
// Move effect: Defend Order
// attacker: attacker pointer
// defender: defender pointer
// move: move
// item_id: item ID
// return: whether the move was successfully used
bool8 DoMoveDefendOrder(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif //PMDSKY_OVERLAY_29_0232E250_H
