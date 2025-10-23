#include "overlay_29_02336428.h"
#include "dungeon.h"
#include "dungeon_map_access.h"

u8 GetStairsRoom()
{
    return GetTile(DUNGEON_PTR[0]->gen_info.stairs_pos.x, DUNGEON_PTR[0]->gen_info.stairs_pos.y)->room;
}
