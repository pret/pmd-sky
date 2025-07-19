#ifndef PMDSKY_DUNGEON_MAP_ACCESS_1_H
#define PMDSKY_DUNGEON_MAP_ACCESS_1_H

#include "dungeon_mode.h"

// Returns true if the given position is a ground tile, meaning that Dig can be used and Dive cannot be used.
// This depends on the terrain type of the position and the dungeon tileset.
bool8 IsTileGround(struct tile *tile);
// Returns flag tileset_property::is_water_tileset for the current tileset
bool8 IsWaterTileset();

#endif //PMDSKY_DUNGEON_MAP_ACCESS_1_H
