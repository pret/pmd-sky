#include "enums.h"
#include "script_variable.h"
#include "special_episode.h"

extern s32 DEBUG_SPECIAL_EPISODE_NUMBER;

s32 GetSpecialEpisodeType()
{
    LoadScriptVariableValue(0, VAR_SPECIAL_EPISODE_TYPE);
}

void SetSpecialEpisodeType(u32 type)
{
    SaveScriptVariableValue(0, VAR_SPECIAL_EPISODE_TYPE, type);
}

s32 GetDebugSpecialEpisodeNumber()
{
    return DEBUG_SPECIAL_EPISODE_NUMBER;
}

void SetDebugSpecialEpisodeNumber(s32 num)
{
    DEBUG_SPECIAL_EPISODE_NUMBER = num;
}

s32 GetExecuteSpecialEpisodeType()
{
    return LoadScriptVariableValue(0, VAR_EXECUTE_SPECIAL_EPISODE_TYPE);
}

bool8 IsSpecialEpisodeOpen(u32 idx)
{
    s32 val = LoadScriptVariableValueAtIndex(0, VAR_SPECIAL_EPISODE_OPEN, idx);
    return val != 0;
}

void SetSpecialEpisodeOpen(u32 idx, u32 episode_open)
{
    s32 val;
    if(episode_open != FALSE) {
        val = TRUE;
    } else {
        val = FALSE;
    }

    SaveScriptVariableValueAtIndex(0, VAR_SPECIAL_EPISODE_OPEN, idx, val);
}

bool8 IsSpecialEpisodeOpenMismatch()
{
    u32 ret;
    bool8 result = ScriptVariablesEqual(0, VAR_SPECIAL_EPISODE_OPEN, VAR_SPECIAL_EPISODE_OPEN_OLD);
    if(result == FALSE)
    {
        ret = TRUE;
    } else {
        ret = FALSE;
    }

    return ret;
}

bool8 IsSpecialEpisodeOpenOld(u32 idx)
{
    s32 val = LoadScriptVariableValueAtIndex(0, VAR_SPECIAL_EPISODE_OPEN_OLD, idx);
    if(val == 0) {
        return FALSE;
    } else {
        return TRUE;
    }
}

void SetSpecialEpisodeOpenOld(u32 idx, u32 episode_open)
{
    s32 new_val;
    if(episode_open == 0) {
        new_val = 0;
    } else {
        new_val = 1;
    }
    SaveScriptVariableValueAtIndex(0, VAR_SPECIAL_EPISODE_OPEN_OLD, idx, new_val);
}

bool8 IsSpecialEpisodeBeaten(u32 idx)
{
    s32 val = LoadScriptVariableValueAtIndex(0, VAR_SPECIAL_EPISODE_CONQUEST, idx);
    if(val == 0) {
        return FALSE;
    } else {
        return TRUE;
    }
}

void SetSpecialEpisodeBeaten(u32 idx, u32 special_ep_beaten)
{
    s32 new_val;
    if(special_ep_beaten == 0)
    {
        new_val = 0;
    } else {
        new_val = 1;
    }
    SaveScriptVariableValueAtIndex(0, VAR_SPECIAL_EPISODE_CONQUEST, idx, new_val);
}
