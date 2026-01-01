#include "dungeon_init_2.h"
#include "enums.h"

extern u8 DUNGEON_SWAP_ID_TABLE[];

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
