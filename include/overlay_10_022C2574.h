#ifndef PMDSKY_OVERLAY_10_022C2574_H
#define PMDSKY_OVERLAY_10_022C2574_H

#include "util.h"

// Given a tileset ID, returns whether it's a background or a regular tileset
// In particular, returns r0 >= 170
bool8 IsBackgroundTileset(s32 tileset_id);

#endif //PMDSKY_OVERLAY_10_022C2574_H
