#include "has_played_old_game.h"
#include "enums.h"
#include "script_variable.h"
#include "util.h"

bool8 HasPlayedOldGame()
{
    if(LoadScriptVariableValue(0, VAR_PLAY_OLD_GAME)) {
        return TRUE;
    } else {
        return FALSE;
    }
}
