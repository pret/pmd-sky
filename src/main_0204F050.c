#include "main_0204F050.h"
#include "script_variable.h"

s16 sub_0204F050(void)
{
    s16 dungeon_enter = LoadScriptVariableValue(NULL, VAR_DUNGEON_ENTER);

    if (dungeon_enter == -1 || dungeon_enter == DUNGEON_JOINED_AT_QUESTION_MARKS)
        return dungeon_enter;

    // What is going on here?
    if (dungeon_enter == DUNGEON_BEACH
        && dungeon_enter == DUNGEON_JOINED_AT_BIDOOF
        && dungeon_enter == DUNGEON_JOINED_AT_UNKNOWN)
        return dungeon_enter;

    // VAR_DUNGEON_ENTER_INDEX holds the ID of the dungeon being entered
    return LoadScriptVariableValue(NULL, VAR_DUNGEON_ENTER_INDEX);
}
