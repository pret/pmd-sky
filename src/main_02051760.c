#include "main_02051760.h"
#include "enums.h"
#include "util.h"

bool8 IsSkyExclusiveDungeon(enum dungeon_id dungeon_id)
{
    if (dungeon_id >= DUNGEON_ZERO_ISLE_CENTER && dungeon_id <= DUNGEON_ARMALDOS_SHELTER) {
        return TRUE;
    }
    return FALSE;
}

bool32 JoinedAtRangeCheck2(u8 joined_at) {
    return joined_at == DUNGEON_BEACH || (joined_at >= DUNGEON_DUMMY_0xEC && DUNGEON_DUMMY_0xF0 >= joined_at);
}

