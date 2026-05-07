#include <nitro.h>

//static u16 OSi_TimerReserved = 0;
extern u16 OSi_TimerReserved;

void OSi_SetTimerReserved(s32 timerNum) {
    OSi_TimerReserved |= (1 << timerNum);
}
