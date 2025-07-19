#include "dungeon_map_access_1.h"
#include "dungeon.h"

// Secondary terrain type for a dungeon
enum secondary_terrain_type {
    SECONDARY_TERRAIN_WATER = 0,
    SECONDARY_TERRAIN_LAVA = 1,
    SECONDARY_TERRAIN_CHASM = 2,
};

extern const enum secondary_terrain_type SECONDARY_TERRAIN_TYPES[200];

extern bool8 IsWaterTileset();

bool8 IsTileGround(struct tile *tile)
{
    bool8 is_ground = FALSE;
    if (IsWaterTileset())
    {
        if (!(tile->terrain_flags & (TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY)))
        {
            is_ground = TRUE;
        }
    }
    else if ((tile->terrain_flags & (TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY)) != TERRAIN_TYPE_SECONDARY ||
        SECONDARY_TERRAIN_TYPES[DUNGEON_PTR[0]->gen_info.tileset_id] == SECONDARY_TERRAIN_LAVA)
    {
        is_ground = TRUE;
    }
    return is_ground;
}
