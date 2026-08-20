#ifndef PMDSKY_OVERLAY_29_02328A54_H
#define PMDSKY_OVERLAY_29_02328A54_H

#include "util.h"

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveLowerAccuracy1(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveDamagePoison40(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
