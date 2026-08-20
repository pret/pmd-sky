#include "run_dungeon_1.h"
#include "dungeon.h"
#include "enums.h"

extern struct dungeon *DUNGEON_PTR[];

bool8 IsBossFight(enum fixed_room_id fixed_room_id)
{
    if (fixed_room_id != FIXED_NONE && fixed_room_id < FIXED_ZERO_ISLE_NORTH)
        return TRUE;
    return FALSE;
}

bool8 IsCurrentFixedRoomBossFight()
{
    IsBossFight(DUNGEON_PTR[0]->gen_info.fixed_room_id);
}

bool8 IsMarowakTrainingMaze(void)
{
    enum dungeon_id id = DUNGEON_PTR[0]->id;

    if (id >= DUNGEON_NORMAL_FLY_MAZE && id <= DUNGEON_EXPLORER_MAZE) {
        return TRUE;
    }
    return FALSE;
}

bool8 FixedRoomIsSubstituteRoom(void)
{
    return DUNGEON_PTR[0]->gen_info.fixed_room_id == FIXED_SUBSTITUTE_ROOM;
}
