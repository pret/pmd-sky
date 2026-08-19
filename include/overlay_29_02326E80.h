#ifndef PMDSKY_OVERLAY_29_02326E80_H
#define PMDSKY_OVERLAY_29_02326E80_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveBoostDefense1(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveParalyze__02326E80(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveBoostAttack1(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
