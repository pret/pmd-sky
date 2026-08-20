#ifndef PMDSKY_OVERLAY_29_022E99F0_H
#define PMDSKY_OVERLAY_29_022E99F0_H

#include "util.h"

struct position* FindClosestUnoccupiedTileWithin2(struct position* out, struct position* origin, bool8 a);
struct position* FindFarthestUnoccupiedTileWithin2(struct position* out, struct position* origin, bool8 a);
struct position* FindUnoccupiedTileWithin3(struct position* out, struct position* origin, bool8 a);

#endif
