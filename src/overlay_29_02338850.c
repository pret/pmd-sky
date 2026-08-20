#include "overlay_29_02338850.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR;

s32 AreLateGameTrapsEnabled(enum fixed_room_id fixed_room_id);

enum hidden_stairs_type GetHiddenStairsField(void)
{
    return DUNGEON_PTR->gen_info.hidden_stairs_type;
}

void SetHiddenStairsField(enum hidden_stairs_type value)
{
    DUNGEON_PTR->gen_info.hidden_stairs_type = value;
}

enum hidden_stairs_type GetHiddenFloorField(void)
{
    return DUNGEON_PTR->gen_info.hidden_floor_type;
}

void SetHiddenFloorField(enum hidden_stairs_type value)
{
    DUNGEON_PTR->gen_info.hidden_floor_type = value;
}
