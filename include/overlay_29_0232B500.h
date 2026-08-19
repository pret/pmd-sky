#ifndef PMDSKY_OVERLAY_29_0232B500_H
#define PMDSKY_OVERLAY_29_0232B500_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveBlowback(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
