#include "dungeon_map_access_1.h"
#include "dungeon.h"
#include "secondary_terrain_types.h"

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
