#ifndef PMDSKY_OVERLAY_29_0232CA14_H
#define PMDSKY_OVERLAY_29_0232CA14_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveSlowDown(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveSearchlight(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMovePetrify(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMovePounce(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveTrawl(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
