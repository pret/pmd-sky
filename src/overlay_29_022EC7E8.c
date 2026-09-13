#include "overlay_29_022EC7E8.h"
#include "dungeon.h"
#include "dg_uty.h"

extern struct dungeon *DUNGEON_PTR[];

bool8 IsFloorOver(void)
{
    if (DUNGEON_PTR[0]->end_floor_no_death_check_flag != 0)
        return TRUE;

    if (GetLeader() == NULL) {
        DUNGEON_PTR[0]->floor_loop_status = FLOOR_LOOP_LEADER_FAINTED;
        return TRUE;
    }

    if (DUNGEON_PTR[0]->end_floor_flag == 1) {
        DUNGEON_PTR[0]->floor_loop_status = FLOOR_LOOP_NEXT_FLOOR;
        return TRUE;
    }

    if (DUNGEON_PTR[0]->end_floor_flag == 2) {
        DUNGEON_PTR[0]->floor_loop_status = FLOOR_LOOP_NEXT_FLOOR;
        return TRUE;
    }

    return FALSE;
}
