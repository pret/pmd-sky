#include "dungeon_map_access.h"
#include "dungeon.h"

extern struct tile DEFAULT_TILE_COPY;
extern struct tile* DEFAULT_TILE;

struct tile* GetTile(s32 x, s32 y)
{
    if (x < 0)
        return DEFAULT_TILE;

    if (y < 0)
        return DEFAULT_TILE;

    if (x >= DUNGEON_MAX_SIZE_X)
        return DEFAULT_TILE;

    if (y >= DUNGEON_MAX_SIZE_Y)
        return DEFAULT_TILE;

    return DUNGEON_PTR[0]->tile_ptrs[y][x];
}

struct tile* GetTileSafe(s32 x, s32 y)
{
    if (x < 0 || y < 0 || x >= DUNGEON_MAX_SIZE_X || y >= DUNGEON_MAX_SIZE_Y)
    {
        struct tile *tile = &DEFAULT_TILE_COPY;
        DEFAULT_TILE_COPY = *DEFAULT_TILE;
        return tile;
    }

    return DUNGEON_PTR[0]->tile_ptrs[y][x];
}
