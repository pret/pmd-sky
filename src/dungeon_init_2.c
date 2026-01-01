#include "dungeon_init_2.h"
#include "enums.h"

extern u8 DUNGEON_SWAP_ID_TABLE[];

extern s32 GetDungeonMode();

s16 DungeonSwapIdToIdx(s16 id)
{
    for(s32 i = 0; i < 0xD5; i++) {
        if (DUNGEON_SWAP_ID_TABLE[(s16)i] == id) {
             return i;
        }
    }
    return ~0u;
}

s16 DungeonSwapIdxToId(s16 idx) {
    if (idx == -1) {
        return DUNGEON_DUMMY_0xFF;
    } else {
        return DUNGEON_SWAP_ID_TABLE[idx];
    }
}

s32 GetDungeonModeSpecial(s16 dungeon_id) {
    if (dungeon_id == DUNGEON_JOINED_AT_QUESTION_MARKS) {
        return 4;
    }
    if ((dungeon_id >= DUNGEON_NORMAL_FLY_MAZE) && (dungeon_id <= DUNGEON_DOJO_0xD3)) {
        return DMODE_OPEN_AND_REQUEST;
    }
    if (dungeon_id == DUNGEON_BEACH) {
        return DMODE_REQUEST;
    }
    if (dungeon_id == DUNGEON_JOINED_AT_UNKNOWN) {
        return DMODE_OPEN_AND_REQUEST;
    }
    u32 mode = GetDungeonMode();
    if (mode == DMODE_OPEN) {
        return DMODE_OPEN;
    }
    if ((mode - 2) <= 1) {
        return DMODE_REQUEST;
    }
    
    return DMODE_OPEN;
}
