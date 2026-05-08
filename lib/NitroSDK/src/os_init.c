#include <nitro.h>

    extern void OS_InitArena();
    extern void PXI_Init();
    extern void OS_InitAlarm();
    extern void OS_InitLock();
    extern void OS_InitTick();
    extern void OS_InitArenaEx();
    extern void OS_InitIrqTable();
    extern void OS_SetIrqStackChecker();
    extern void OS_InitException();
    extern void MI_Init();
    extern void OS_InitVAlarm();
    extern void OSi_InitVramExclusive();
    extern void OS_InitThread();
    extern void OS_InitReset();
    extern void CTRDG_Init();
    extern void CARD_Init();
    extern void PM_Init();
    extern void OSi_WaitVCount0();


asm void OSi_WaitVCount0(void) {
    mov r12, #HW_REG_BASE
    ldr r1, [r12, #REG_IME_OFFSET]
    str r12, [r12, #REG_IME_OFFSET]
@spinWait:
    ldrh r0, [r12, #REG_VCOUNT_OFFSET]
    cmp r0, #0
    bne @spinWait
    str r1, [r12, #REG_IME_OFFSET]
    bx lr
}

void OS_Init(void)
{
#ifdef SDK_ARM9
    OS_InitArena();
    PXI_Init();
    OS_InitLock();
    OS_InitArenaEx();
    OS_InitIrqTable();
    OS_SetIrqStackChecker();
    OS_InitException();
    MI_Init();
    OS_InitVAlarm();
    OSi_InitVramExclusive();
    OS_InitThread();
    OS_InitReset();
    CTRDG_Init();
    CARD_Init();
    PM_Init();
    OSi_WaitVCount0();
#else
    OS_InitArena();
    PXI_Init();
    OS_InitLock();
    OS_InitIrqTable();
    OS_InitTick();
    OS_InitAlarm();
    OS_InitThread();
    OS_InitReset();
    CTRDG_Init();
#endif
}

