#ifndef PMDSKY_OVERLAY_29_0232D270_H
#define PMDSKY_OVERLAY_29_0232D270_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

bool8 DoMoveAquaRing(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);
bool8 DoMoveGastroAcid(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

#endif
