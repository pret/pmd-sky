#include "main_0204F9B8.h"

extern void sub_02050E8C(u8 *p, s32 a);

extern void sub_02050E5C(u8 *p, s32 a);
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

void sub_0204F9F4(s32 a)
{
    sub_02050E5C(PLAY_TIME_SECONDS, a);
}

void sub_0204FA0C(s32 a)
{
    sub_02050E8C(PLAY_TIME_SECONDS, a);
}
