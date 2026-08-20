#ifndef PMDSKY_OVERLAY_29_02325F3C_H
#define PMDSKY_OVERLAY_29_02325F3C_H

#include "util.h"

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveNightmare(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveMorningSun(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
