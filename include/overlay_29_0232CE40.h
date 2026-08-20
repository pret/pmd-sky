#ifndef PMDSKY_OVERLAY_29_0232CE40_H
#define PMDSKY_OVERLAY_29_0232CE40_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveHpGauge(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveVacuumCut(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
