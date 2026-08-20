#include "main_0204F9B8.h"
#include "script_variable.h"

extern u8 PLAY_TIME_SECONDS[];

extern void sub_0204F9B8(void);

extern void ResetPlayTimer(u8 *timer);

extern void PlayTimerTick(u8 *timer);

extern s32 GetPlayTimeSeconds(u8 *timer);

void sub_0204F9B8(void)
{
    ResetPlayTimer(PLAY_TIME_SECONDS);
}

void sub_0204F9CC(void)
{
    PlayTimerTick(PLAY_TIME_SECONDS);
}

s32 sub_0204F9E0(void)
{
    return GetPlayTimeSeconds(PLAY_TIME_SECONDS);
}
