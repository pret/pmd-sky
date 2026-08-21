#include "main_02051760.h"

extern u8 _020A20B1[];
extern u8 ARM9_UNKNOWN_TABLE__NA_20A20B0[];
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


u8 sub_02051788(s32 i)
{
    return _020A20B1[i * 2];
}

u8 sub_02051798(u8 v)
{
    s32 i;

    for (i = 0; i < 0x100; i++) {
        if (v == ARM9_UNKNOWN_TABLE__NA_20A20B0[i * 2 + 1]) {
            return ARM9_UNKNOWN_TABLE__NA_20A20B0[i * 2];
        }
    }

    return 0xFF;
}
