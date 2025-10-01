#include "fixed_room_data_1.h"

#include "dungeon.h"

bool8 IsFullFloorFixedRoom()
{
    u8 fixed_room_id = DUNGEON_PTR[0]->gen_info.fixed_room_id;

    if(fixed_room_id != 0 && fixed_room_id < FIXED_SEALED_CHAMBER) {
        return TRUE;
    }

    return FALSE;
}
