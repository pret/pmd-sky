#ifndef PMDSKY_OVERLAY_29_02326CB4_H
#define PMDSKY_OVERLAY_29_02326CB4_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveGrudge(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveCounter(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
