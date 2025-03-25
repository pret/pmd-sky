#include "dungeon_map_access.h"
#include "dungeon.h"

extern struct tile* DEFAULT_TILE;
extern struct dungeon* DUNGEON_PTR[];

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
