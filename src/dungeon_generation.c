#include "dungeon_generation.h"
#include "dg_random.h"
#include "dungeon_map_access.h"
#include "dungeon_util_static.h"
#include "overlay_29_02340CAC.h"

extern const s32 ov29_02353030[8];

extern void SetSecondaryTerrainOnWall(struct tile *tile);

// Helper functions for terrain flags
static inline void SetTerrainFlags(struct tile *tile, u32 terrain_flags)
{
    tile->terrain_flags &= ~(TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY);
    tile->terrain_flags |= terrain_flags;
}

static inline void SetTerrainNormal(struct tile *tile)
{
    SetTerrainFlags(tile, TERRAIN_TYPE_NORMAL);
}

static inline void SetTerrainWall(struct tile *tile)
{
    SetTerrainFlags(tile, TERRAIN_TYPE_WALL);
}

void GenerateSecondaryTerrainFormations(bool8 test_flag, struct floor_properties *floor_props)
{
    s32 numToGen;
    s32 num_tiles_fill;
    s32 densityN;
    s32 x, y;

	if (!(floor_props->room_flags & test_flag))
        return;

	// Generate 1-3 "river+lake" formations
    numToGen = ov29_02353030[DungeonRandInt(ARRAY_COUNT(ov29_02353030))];
    for (;numToGen != 0; numToGen--) {
		// Randomly pick between starting from the bottom going up, or from the top going down
		s32 offsetX, offsetY;
        s32 dir_x, dir_y;
        bool8 dir_y_upwards;
        s32 steps_until_lake;
        s32 j;

		if (DungeonRandInt(100) < 50) {
            dir_y_upwards = TRUE;
			y = DUNGEON_MAX_SIZE_Y - 1;
			dir_y = -1;
		}
		else {
		    dir_y_upwards = FALSE;
			y = 0;
			dir_y = 1;
		}

		steps_until_lake = DungeonRandInt(50) + 10;

		// Pick a random column in the interior to start the river on
		x = DungeonRandRange(2, DUNGEON_MAX_SIZE_X - 2);
		dir_x = 0;

		while (1) {
			// Fill in tiles in chunks of size 2-7 before changing the flow direction
			num_tiles_fill = DungeonRandInt(6) + 2;
			while (num_tiles_fill != 0) {
				if (x >= 0 && x < DUNGEON_MAX_SIZE_X) {
					if (GetTerrainType(GetTile(x, y)) != TERRAIN_TYPE_SECONDARY) {
						if (!PosIsOutOfBounds(x, y)) {
    						// Fill in secondary terrain as we go
    						SetSecondaryTerrainOnWall(GetTileSafe(x, y));
    					}
					}
                    else {
                        goto LABEL;
                    }
				}
                num_tiles_fill--;

				// Move to the next tile
				x += dir_x;
				y += dir_y;

				// Vertically out of bounds, stop
				if (y < 0 || y >= DUNGEON_MAX_SIZE_Y) {
                    break;
				}

				steps_until_lake--;
				if (steps_until_lake != 0)
                    continue;

				// After we go a certain number of steps, make a "lake"

				// This loop will attempt to generate new lake tiles up to 64 times
				// We select a random tile, check for space and nearby secondary terrain tiles,
				// then if verified add a new lake tile.
				for (j = 0; j < 64; j++) {
					// Each tile is in a random location +-3 tiles from the current cursor in either direction
					s32 offsetX = DungeonRandInt(7) - 3;
					s32 offsetY = DungeonRandInt(7) - 3;

                    // Check that there's enough space for a lake within a 2 tile margin of the map bounds
                    if (offsetX + x < 2 || offsetX + x >= DUNGEON_MAX_SIZE_X - 2 )
                        continue;
                    if (offsetY + y < 2 || offsetY + y >= DUNGEON_MAX_SIZE_Y - 2)
                        continue;

                    // Make secondary terrain here if it's within 2 tiles
                    // of a tile that's currently secondary terrain
                    // This results in a "cluster" akin to a lake
                    if (GetTerrainType(GetTile(offsetX + x + 1, offsetY + y + 1)) == TERRAIN_TYPE_SECONDARY ||
                        GetTerrainType(GetTile(offsetX + x + 1, offsetY + y + 0)) == TERRAIN_TYPE_SECONDARY ||
                        GetTerrainType(GetTile(offsetX + x + 1, offsetY + y - 1)) == TERRAIN_TYPE_SECONDARY ||
                        GetTerrainType(GetTile(offsetX + x + 0, offsetY + y + 1)) == TERRAIN_TYPE_SECONDARY ||
                        GetTerrainType(GetTile(offsetX + x + 0, offsetY + y - 1)) == TERRAIN_TYPE_SECONDARY ||
                        GetTerrainType(GetTile(offsetX + x - 1, offsetY + y + 1)) == TERRAIN_TYPE_SECONDARY ||
                        GetTerrainType(GetTile(offsetX + x - 1, offsetY + y + 0)) == TERRAIN_TYPE_SECONDARY ||
                        GetTerrainType(GetTile(offsetX + x - 1, offsetY + y - 1)) == TERRAIN_TYPE_SECONDARY)
                    {
                        s32 xx = x;
                        s32 yy = y;
                        xx += offsetX;
                        yy += offsetY;
                        if (!PosIsOutOfBounds(xx, yy)) {
                            SetSecondaryTerrainOnWall(GetTileSafe(x + offsetX , y + offsetY));
                        }
                    }
				}

				// Finalization/gap-filling step because the random approach
				// might leave weird gaps. Go through every tile and do an
				// on line nearest-neighbor interpolation of secondary terrain
				// tiles to smoothen out the "lake"
				for (offsetX = -3; offsetX <= 3; offsetX++) {
					for (offsetY = -3; offsetY <= 3; offsetY++) {
						s32 numAdjacent = 0;

                        if (offsetX + x < 2 || offsetX + x >= DUNGEON_MAX_SIZE_X - 2 || offsetY + y < 2 || offsetY + y >= DUNGEON_MAX_SIZE_Y - 2)
                            continue;

                        // Count the number of secondary terrain tiles adjacent (all 8 directions)

                        if (GetTerrainType(GetTile(offsetX + x  + 1, offsetY + y + 1)) == TERRAIN_TYPE_SECONDARY) numAdjacent++;
                        if (GetTerrainType(GetTile(offsetX + x  + 1, offsetY + y + 0)) == TERRAIN_TYPE_SECONDARY) numAdjacent++;
                        if (GetTerrainType(GetTile(offsetX + x  + 1, offsetY + y - 1)) == TERRAIN_TYPE_SECONDARY) numAdjacent++;
                        if (GetTerrainType(GetTile(offsetX + x  + 0, offsetY + y + 1)) == TERRAIN_TYPE_SECONDARY) numAdjacent++;
                        if (GetTerrainType(GetTile(offsetX + x  + 0, offsetY + y - 1)) == TERRAIN_TYPE_SECONDARY) numAdjacent++;
                        if (GetTerrainType(GetTile(offsetX + x  - 1, offsetY + y + 1)) == TERRAIN_TYPE_SECONDARY) numAdjacent++;
                        if (GetTerrainType(GetTile(offsetX + x  - 1, offsetY + y + 0)) == TERRAIN_TYPE_SECONDARY) numAdjacent++;
                        if (GetTerrainType(GetTile(offsetX + x  - 1, offsetY + y - 1)) == TERRAIN_TYPE_SECONDARY) numAdjacent++;

                        // If at least half are secondary terrain, make this tile secondary terrain as well
                        if (numAdjacent >= 4) {
                            s32 yy = y;
                            yy += offsetY;
                            if (!PosIsOutOfBounds(x + offsetX,  yy))
                                SetSecondaryTerrainOnWall(GetTileSafe(x + offsetX , y + offsetY));
                        }
					}
				}
			}

			// Creating a lake doesn't mean we are done yet
			// but it's likely that the next iteration will hit the tile
			// stopping condition for secondary terrain, if not the river continues

            // Alternate between horizontal and vertical movement each iteration
            if (dir_x != 0) {
                // The y direction never reverses, ensuring the river doesn't
                // double back on itself and cuts across the map only once
                if (dir_y_upwards) {
                    dir_y = -1;
                }
                else {
                    dir_y = 1;
                }

                dir_x = 0;
            }
            else {
                //Randomly pick between left and right
                if (DungeonRandInt(100) < 50) {
                    dir_x = -1;
                }
                else {
                    dir_x = 1;
                }

                dir_y = 0;
            }

			if (y < 0 || y >= DUNGEON_MAX_SIZE_Y) {
                LABEL:
				// Vertically out of bounds, stop
				break;
			}
		}
    }

	// Generate standalone lakes secondary_terrain_density # of times
	for (densityN = 0; densityN < floor_props->secondary_terrain_density; densityN++) {
        s32 x, y;
        bool8 table[10][10];
		s32 rnd_x, rnd_y;
        s32 n;

        // Try to pick a random tile in the interior to seed the "lake"
		// Incredibly unlikely to fail

        rnd_y = 0;
        rnd_x = 0;
        n = 0;
        // Up to 200 attempts
		while (n < 200) {
			rnd_x = DungeonRandRange(0, DUNGEON_MAX_SIZE_X);
			rnd_y = DungeonRandRange(0, DUNGEON_MAX_SIZE_Y);

			if (rnd_x >= 1 && rnd_x < DUNGEON_MAX_SIZE_X - 1 && rnd_y >= 1 && rnd_y < DUNGEON_MAX_SIZE_Y - 1)
                break;

			n++;
		}

		if (n == 200)
            continue;

		// Make a 10x10 grid with TRUE on the boundary and FALSE on the interior
		for (x = 0; x < 10; x++) {
			for (y = 0; y < 10; y++) {
				if (x == 0 || x == 9 || y == 0 || y == 9) {
					table[x][y] = TRUE;
				}
				else {
					table[x][y] = FALSE;
				}
			}
		}

		// Generate an "inverse lake" by spreading the TRUE values inwards
		for (n = 0; n < 80; n++) {
			// Pick a random interior point on the 10x10 grid
			x = DungeonRandInt(8) + 1;
			y = DungeonRandInt(8) + 1;

			if (table[x - 1][y] || table[x + 1][y] || table[x][y - 1] || table[x][y + 1]) {
				table[x][y] = TRUE;
			}
		}

		// Iterate through the grid, any spaces which are still FALSE form the inverse-inverse lake
		// or as some may prefer to call it, just a regular lake!
		for (x = 0; x < 10; x++) {
			for (y = 0; y < 10; y++) {
				if (!table[x][y]) {
					// Shift the 0-10 random offset position into +- 5 to center around the lake seed tile
                    SetSecondaryTerrainOnWall(GetTileSafe(x + rnd_x - 5, y + rnd_y - 5));
				}
			}
		}
	}

	// Clean up secondary terrain that got in places it shouldn't
	for (x = 0; x < DUNGEON_MAX_SIZE_X; x++) {
		for (y = 0; y < DUNGEON_MAX_SIZE_Y; y++) {
            struct tile *tile = GetTileSafe(x, y);
			if (GetTerrainType(tile) != TERRAIN_TYPE_SECONDARY)
                continue;

			// Revert tiles back to open terrain if:
			// - in a kecleon shop
			// - in a monster house
			// - is an unbreakable tile
			// - on a stairs spawn point
			// This really shouldn't happen since we only place terrain on wall tiles to begin with,
			// but it provides additional safety

			if (tile->terrain_flags & (TERRAIN_TYPE_SHOP | TERRAIN_TYPE_IN_MONSTER_HOUSE | TERRAIN_TYPE_UNBREAKABLE) || (tile->spawn_or_visibility_flags.spawn & SPAWN_FLAG_STAIRS)) {
                SetTerrainNormal(tile);
            }
            else {
                // Revert to wall tiles if they're on the soft/hard borders
                if (x <= 1 || x >= DUNGEON_MAX_SIZE_X - 1 || y <= 1 || y >= DUNGEON_MAX_SIZE_Y - 1) {
                    SetTerrainWall(tile);
                }
            }
		}
	}
}
