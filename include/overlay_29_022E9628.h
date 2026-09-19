#ifndef PMDSKY_OVERLAY_29_022E9628_H
#define PMDSKY_OVERLAY_29_022E9628_H

#include "dungeon_mode.h"

bool8 GetRandomTile(struct position *out, bool8 avoid_visited);
bool32 FindNearbyUnoccupiedTile(struct position *out, struct position *origin, const struct position *displacements, s32 count, bool8 avoid_stairs);

#endif //PMDSKY_OVERLAY_29_022E9628_H
