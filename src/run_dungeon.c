#include "run_dungeon.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR[];

extern bool8 IsBackgroundTileset(u32 tileset_id);

bool8 IsCurrentTilesetBackground()
{
    return IsBackgroundTileset(DUNGEON_PTR[0]->gen_info.tileset_id);
}
