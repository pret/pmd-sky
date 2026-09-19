#ifndef PMDSKY_OVERLAY_29_022E99F0_H
#define PMDSKY_OVERLAY_29_022E99F0_H

#include "util.h"
#include "dungeon_mode.h"

bool32 FindClosestUnoccupiedTileWithin2(struct position* out, struct position* origin, bool8 a);
bool32 FindFarthestUnoccupiedTileWithin2(struct position* out, struct position* origin, bool8 a);
bool32 FindUnoccupiedTileWithin3(struct position* out, struct position* origin, bool8 a);
u8 TickStatusTurnCounter(u8 *counter);

#endif
