#include "debug.h"
#include "enums.h"
#include "scenario_flag.h"
#include "script_variable.h"

extern u32 GetGameMode();

extern u8 SCENARIO_FLAG_RESUME_DEBUG_MSG;
extern u8 SCENARIO_FLAG_BACKUP_DEBUG_MSG;

void ScenarioFlagRestore() {
    u32 val;

    u32 game_mode = GetGameMode();
    if (game_mode <= GAME_MODE_1) {
        return;
    }

    u32 game_mode_adjusted = game_mode - 2;
    Debug_Print0(&SCENARIO_FLAG_RESUME_DEBUG_MSG, game_mode_adjusted);

    val = LoadScriptVariableValueAtIndex(0, VAR_SCENARIO_SELECT_BACKUP, game_mode_adjusted);
    SaveScriptVariableValueAtIndex(0, VAR_SCENARIO_SELECT, 0, val);
    val = LoadScriptVariableValueAtIndex(0, VAR_SCENARIO_SELECT_BACKUP, game_mode_adjusted + 4);
    SaveScriptVariableValueAtIndex(0, VAR_SCENARIO_SELECT, 1, val);
    
    s32 restore_idx = 0;
    s32 backup_idx = game_mode_adjusted << 7;
    do {
        val = LoadScriptVariableValueAtIndex(0, VAR_SCENARIO_MAIN_BIT_FLAG_BACKUP, backup_idx);
        SaveScriptVariableValueAtIndex(0, VAR_SCENARIO_MAIN_BIT_FLAG, restore_idx, val);
        backup_idx += 1;
        restore_idx += 1;
    } while (restore_idx < 128);
}

void ScenarioFlagBackup() {
    u32 val;

    u32 game_mode = GetGameMode();
    if (game_mode <= GAME_MODE_1) {
        return;
    }
    
    u32 game_mode_adjusted = game_mode - 2;
    Debug_Print0(&SCENARIO_FLAG_BACKUP_DEBUG_MSG, game_mode_adjusted);

    val = LoadScriptVariableValueAtIndex(0, VAR_SCENARIO_SELECT, 0);
    SaveScriptVariableValueAtIndex(0, VAR_SCENARIO_SELECT_BACKUP, game_mode_adjusted, val);
    val = LoadScriptVariableValueAtIndex(0, VAR_SCENARIO_SELECT, 1);
    SaveScriptVariableValueAtIndex(0, VAR_SCENARIO_SELECT_BACKUP, game_mode_adjusted + 4, val);
    
    s32 source_idx = 0;
    s32 backup_idx = game_mode_adjusted << 7;
    do {
        val = LoadScriptVariableValueAtIndex(0, VAR_SCENARIO_MAIN_BIT_FLAG, source_idx);
        SaveScriptVariableValueAtIndex(0, VAR_SCENARIO_MAIN_BIT_FLAG_BACKUP, backup_idx, val);
        source_idx += 1;
        backup_idx += 1;
    } while (source_idx < 128);
}
