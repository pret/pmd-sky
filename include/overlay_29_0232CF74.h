#ifndef PMDSKY_OVERLAY_29_0232CF74_H
#define PMDSKY_OVERLAY_29_0232CF74_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveFamish(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveOneRoom(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
