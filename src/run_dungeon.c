#include "run_dungeon.h"
#include "dungeon.h"
#include "overlay_10_022C2574.h"

extern struct dungeon *DUNGEON_PTR[];

bool8 IsCurrentTilesetBackground()
{
    return IsBackgroundTileset(DUNGEON_PTR[0]->gen_info.tileset_id);
}
