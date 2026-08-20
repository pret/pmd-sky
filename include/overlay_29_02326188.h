#ifndef PMDSKY_OVERLAY_29_02326188_H
#define PMDSKY_OVERLAY_29_02326188_H

#include "util.h"

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveHealStatus(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveBubble(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
