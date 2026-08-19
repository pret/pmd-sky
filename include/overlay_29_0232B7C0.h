#ifndef PMDSKY_OVERLAY_29_0232B7C0_H
#define PMDSKY_OVERLAY_29_0232B7C0_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveMagicCoat(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveProtect(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveDefenseCurl(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveDecoy(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
