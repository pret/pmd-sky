#include "overlay_29_022E0A04.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR;

s32 AreLateGameTrapsEnabled(enum fixed_room_id fixed_room_id);

void SetDungeonEscapeFields(u32 tracker, bool8 end_floor)
{
    DUNGEON_PTR->successful_exit_tracker = tracker;
    DUNGEON_PTR->end_floor_no_death_check_flag = end_floor;
}

u32 GetSuccessfulExitTracker(void)
{
    return DUNGEON_PTR->successful_exit_tracker;
}
