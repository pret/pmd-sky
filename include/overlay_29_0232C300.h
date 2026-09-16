#ifndef PMDSKY_OVERLAY_29_0232C300_H
#define PMDSKY_OVERLAY_29_0232C300_H

#include "util.h"

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveSeeTrap(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveTakeaway(struct entity *attacker, struct entity *defender, struct move *move, enum item_id item_id);

#endif
