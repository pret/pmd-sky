#include "script_variable.h"
#include "script_variable_2.h"
#include "enums.h"
#include "game_mode.h"

extern void SetAdventureLogCompleted(u32);
extern u8 _0209E008[0x10];

void InitWorldMapScriptVars() {
    ZeroInitScriptVariable(0, VAR_WORLD_MAP_MARK_LIST_NORMAL);
    ZeroInitScriptVariable(0, VAR_WORLD_MAP_MARK_LIST_SPECIAL);
    SaveScriptVariableValue(0, VAR_WORLD_MAP_LEVEL, 1);
}

void sub_0204CDB8(void) {
    ZeroInitScriptVariable(0, VAR_WORLD_MAP_MARK_LIST_SPECIAL);
}

s8 sub_0204CDCC(void) {
    return LoadScriptVariableValue(0, VAR_WORLD_MAP_LEVEL);
}

void SetWorldMapLevel(s32 value) {
    SaveScriptVariableValue(0, VAR_WORLD_MAP_LEVEL, value);
}

bool8 sub_0204CE00(u32 idx) {
    s32 var;

    if (GetGameMode() == GAME_MODE_SPECIAL_EPISODE) {
        var = LoadScriptVariableValueAtIndex(0,VAR_WORLD_MAP_MARK_LIST_SPECIAL, idx);
    } else {
        var = LoadScriptVariableValueAtIndex(0,VAR_WORLD_MAP_MARK_LIST_NORMAL, idx);
    }
    return (var != 0);
}

void sub_0204CE48(u32 idx, s32 value) {
    if (GetGameMode() == GAME_MODE_SPECIAL_EPISODE) {
        SaveScriptVariableValueAtIndex(0,VAR_WORLD_MAP_MARK_LIST_SPECIAL, idx, value);
    } else {
        SaveScriptVariableValueAtIndex(0,VAR_WORLD_MAP_MARK_LIST_NORMAL, idx, value);
    }
}

void InitDungeonListScriptVars(void) {
    ZeroInitScriptVariable(0,  VAR_DUNGEON_OPEN_LIST);
    ZeroInitScriptVariable(0,  VAR_DUNGEON_REQUEST_LIST);
    ZeroInitScriptVariable(0,  VAR_DUNGEON_ENTER_LIST);
    ZeroInitScriptVariable(0,  VAR_DUNGEON_ARRIVE_LIST);
    ZeroInitScriptVariable(0,  VAR_DUNGEON_CONQUEST_LIST);
    ZeroInitScriptVariable(0,  VAR_DUNGEON_PRESENT_LIST);
}

bool8 sub_0204CEE0(u32 idx) {
    return LoadScriptVariableValueAtIndex(0,VAR_DUNGEON_ENTER_LIST, idx) != 0;
}

bool8 sub_0204CF0C(u32 idx) {
    return LoadScriptVariableValueAtIndex(0,VAR_DUNGEON_CONQUEST_LIST, idx) != 0;
}

void SetDungeonConquest(u32 dungeon_id, s32 bit_value)
{
    u32 var_r7;
    u8 byte;

    SaveScriptVariableValueAtIndex(0, VAR_DUNGEON_CONQUEST_LIST, (u16)dungeon_id, bit_value);

    var_r7 = 0;
    while(1)
    {
        byte = _0209E008[var_r7++];
        if (byte == 0xFF) {
            SetAdventureLogCompleted(0x23);
            return;
        }
        if (LoadScriptVariableValueAtIndex(0, VAR_DUNGEON_CONQUEST_LIST, byte) == 0) {
            return;
        }
    }
}
