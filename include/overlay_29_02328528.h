#ifndef PMDSKY_OVERLAY_29_02328528_H
#define PMDSKY_OVERLAY_29_02328528_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveSafeguard(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
