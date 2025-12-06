#include "script_variable.h"
#include "script_variable_2.h"
#include "enums.h"

void InitWorldMapScriptVars() {
    ZinitScriptVariable(0, VAR_WORLD_MAP_MARK_LIST_NORMAL);
    ZinitScriptVariable(0, VAR_WORLD_MAP_MARK_LIST_SPECIAL);
    SaveScriptVariableValue(0, VAR_WORLD_MAP_LEVEL, 1);
}
