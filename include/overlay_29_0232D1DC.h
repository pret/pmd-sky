#ifndef PMDSKY_OVERLAY_29_0232D1DC_H
#define PMDSKY_OVERLAY_29_0232D1DC_H

#include "util.h"

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveHurl(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveMobile(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveSeeStairs(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveLongToss(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMovePierce(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveHammerArm(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
