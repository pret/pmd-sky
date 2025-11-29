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
