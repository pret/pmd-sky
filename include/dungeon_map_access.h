#ifndef PMDSKY_DUNGEON_MAP_ACCESS_H
#define PMDSKY_DUNGEON_MAP_ACCESS_H

#include "dungeon_mode.h"

// Get the tile at some position. If the coordinates are out of bounds, returns a default tile.
struct tile* GetTile(s32 x, s32 y);
// Get the tile at some position. If the coordinates are out of bounds, returns a pointer to a copy of the default tile.
struct tile* GetTileSafe(s32 x, s32 y);

#endif //PMDSKY_DUNGEON_MAP_ACCESS_H
