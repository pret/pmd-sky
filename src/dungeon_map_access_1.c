#include "dungeon_map_access_1.h"
#include "dungeon.h"
#include "dungeon_util_static.h"
#include "secondary_terrain_types.h"
#include "tileset.h"

bool8 IsTileGround(struct tile *tile)
{
    bool8 is_ground = FALSE;
    if (IsWaterTileset())
    {
        if (GetTerrainType(tile) == TERRAIN_TYPE_WALL)
            is_ground = TRUE;
    }
    else if (GetTerrainType(tile) != TERRAIN_TYPE_SECONDARY ||
        SECONDARY_TERRAIN_TYPES[DUNGEON_PTR[0]->gen_info.tileset_id] == SECONDARY_TERRAIN_LAVA)
    {
        is_ground = TRUE;
    }
    return is_ground;
}

bool8 IsWaterTileset()
{
    return TILESET_PROPERTIES[DUNGEON_PTR[0]->gen_info.tileset_id].is_water_tileset;
}
