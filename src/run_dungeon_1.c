#include "run_dungeon_1.h"
#include "dungeon.h"
#include "enums.h"

extern struct dungeon *DUNGEON_PTR[];

extern bool8 IsBossFight(enum fixed_room_id fixed_room_id);

bool8 IsCurrentFixedRoomBossFight()
{
    IsBossFight(DUNGEON_PTR[0]->gen_info.fixed_room_id);
}
