#include "dungeon_init_2.h"
#include "script_variable.h"
#include "special_episode.h"

extern s32 sub_0204E6FC(void);

extern s32 sub_0204E780(void);

extern s32 sub_0204E770(void);
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

s16 sub_0206A7CC(s16 a)
{
    s32 v;

    if (a == 0x3E8) {
        a = (s16) LoadScriptVariableValue(NULL, 0x20);
    } else if (a == 0x3E9) {
        if (sub_0204E6FC() == 2) {
            v = sub_0204E780();
        } else {
            v = sub_0204E770();
        }

        if (v == 0xFF) {
            a = -1;
        } else {
            a = (s16) (v + 1);
        }
    }

    if (a == 0xD1 && GetExecuteSpecialEpisodeType() == 4) {
        a = 0xD2;
    }

    return a;
}
