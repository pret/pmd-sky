#include "dungeon_recruitment_3.h"
#include "enums.h"
#include "util.h"

extern bool8 LoadScriptVariableValue(u8 local_var_table_ptr, u8 script_variable_id);

bool8 HasPlayedOldGame()
{
    if(LoadScriptVariableValue(0, PLAYED_OLD_GAME)) {
        return TRUE;
    } else {
        return FALSE;
    }
}
