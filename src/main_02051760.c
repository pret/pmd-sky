#include "main_02051760.h"
#include "enums.h"
#include "util.h"

bool32 JoinedAtRangeCheck2(u8 joined_at) {
    return joined_at == DUNGEON_BEACH || (joined_at >= DUNGEON_DUMMY_0xEC && DUNGEON_DUMMY_0xF0 >= joined_at);
}

