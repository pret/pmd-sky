#ifndef PMDSKY_OVERLAY_29_0232C82C_H
#define PMDSKY_OVERLAY_29_0232C82C_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveNoMove(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveScan(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
