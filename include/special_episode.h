#ifndef PMDSKY_SPECIAL_EPISODE_H
#define PMDSKY_SPECIAL_EPISODE_H

s32 GetSpecialEpisodeType();
void SetSpecialEpisodeType(u32 type);
s32 GetDebugSpecialEpisodeNumber();
void SetDebugSpecialEpisodeNumber(s32 num);
// Gets the special episode type from the EXECUTE_SPECIAL_EPISODE_TYPE script variable.
s32 GetExecuteSpecialEpisodeType();
bool8 IsSpecialEpisodeOpen(u32 idx);
void SetSpecialEpisodeOpen(u32 idx, u32 episode_open);
bool8 IsSpecialEpisodeOpenMismatch();
bool8 IsSpecialEpisodeOpenOld(u32 idx);
void SetSpecialEpisodeOpenOld(u32 idx, u32 val);
bool8 IsSpecialEpisodeBeaten(u32 idx);
void SetSpecialEpisodeBeaten(u32 idx, u32 special_ep_beaten);

#endif //PMDSKY_SCRIPTING_H
