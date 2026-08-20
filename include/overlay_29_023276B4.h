#ifndef PMDSKY_OVERLAY_29_023276B4_H
#define PMDSKY_OVERLAY_29_023276B4_H

#include "util.h"

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveMetalSound(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveTickle(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
