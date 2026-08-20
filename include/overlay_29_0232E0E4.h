#ifndef PMDSKY_OVERLAY_29_0232E0E4_H
#define PMDSKY_OVERLAY_29_0232E0E4_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMovePowerTrick(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveFeint(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
