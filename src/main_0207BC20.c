#include "main_0207BC20.h"
#include "main_0207B848.h"

void WaitForever2(void)
{
    while (TRUE) {
        EnableIrqFlag();
        WaitForInterrupt();
    }
}

asm void WaitForInterrupt(void)
{
    mov r0, #0
    // System Control Coprocessor command: Wait For Interrupt
    // https://problemkaputt.de/gbatek.htm#armcp15cachecontrol
    mcr p15, 0, r0, c7, c0, 4
	bx lr
}

