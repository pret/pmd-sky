#ifndef PMDSKY_OVERLAY_29_0232A04C_H
#define PMDSKY_OVERLAY_29_0232A04C_H

#include "util.h"

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveDamageStealItem(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveAmnesia(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveNightShade(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
