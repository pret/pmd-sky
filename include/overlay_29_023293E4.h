#ifndef PMDSKY_OVERLAY_29_023293E4_H
#define PMDSKY_OVERLAY_29_023293E4_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveConfuse(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveTaunt(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
