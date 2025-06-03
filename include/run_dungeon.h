#ifndef PMDSKY_RUN_DUNGEON_H
#define PMDSKY_RUN_DUNGEON_H

#include "util.h"

// Calls IsBackgroundTileset with the current tileset ID
// return: True if the current dungeon tileset is a background, false if it's a regular tileset.
bool8 IsCurrentTilesetBackground();

#endif //PMDSKY_RUN_DUNGEON_H
