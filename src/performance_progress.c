#include "enums.h"
#include "performance_progress.h"
#include "script_variable.h"

extern enum game_mode GetGameMode();

u8 GetResolvedPerformanceProgressFlag(u32 idx) {
    switch (idx) {
        case 0:
            if (LoadScriptVariableValueAtIndex(0, VAR_SCENARIO_MAIN, 0) == 0x35) {
                return TRUE;
            } else {
                return FALSE;
            }
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
            if (GetGameMode() == GAME_MODE_SPECIAL_EPISODE) {
                return FALSE;
            }
            break;
        case 1:
        case 2:
            if (GetGameMode() == GAME_MODE_SPECIAL_EPISODE) {
                return TRUE;
            }
            break;
    }
    return LoadScriptVariableValueAtIndex(0, VAR_PERFORMANCE_PROGRESS_LIST, idx);
}

void SetResolvedPerformanceProgressFlag(u32 idx, s32 value) {
    switch (idx) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
            if (GetGameMode() == GAME_MODE_SPECIAL_EPISODE) {
                return;
            }
        default:
        case 0:
            s32 new_val;
            if (value != 0) {
                new_val = 1;
            } else {
                new_val = 0;
            }
            SaveScriptVariableValueAtIndex(0, VAR_PERFORMANCE_PROGRESS_LIST, idx, new_val);
            return;
    }
}
