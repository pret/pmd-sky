#ifndef PMDSKY_OVERLAY_29_02329FB4_H
#define PMDSKY_OVERLAY_29_02329FB4_H

#include "util.h"

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveSport(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveMudSlap(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
