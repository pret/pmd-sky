#include "script_variable.h"
#include "script_variable_2.h"
#include "enums.h"
#include "game_mode.h"

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

void sub_0204CDE8(s32 value) {
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


