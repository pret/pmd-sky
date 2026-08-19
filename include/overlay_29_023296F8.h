#ifndef PMDSKY_OVERLAY_29_023296F8_H
#define PMDSKY_OVERLAY_29_023296F8_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveBoostDefense2(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveWarp(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
