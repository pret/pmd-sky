#include <nitro.h>

extern u32 OSi_vramExclusive;
extern u16 OSi_vramLockId[9];

asm u32 OsCountZeroBits(u32 bitmap) {
    clz r0, r0
    bx lr
}

void OSi_InitVramExclusive(void) {
    int i;

    OSi_vramExclusive = 0;
    for (i = 0; i < 9; i++) {
        OSi_vramLockId[i] = 0;
    }
}

void OSi_UnlockVram(u16 bank, u16 lockId) {
    u32 workMap;
    s32 zeroBits;
    OSIntrMode enabled = EnableIrqFlag();

    workMap = bank & OSi_vramExclusive & 0x1FF;
    while (TRUE) {
        zeroBits = 31 - OsCountZeroBits(workMap);
        if (zeroBits < 0) {
            break;
        }
        workMap &= ~(1 << zeroBits);
        if (OSi_vramLockId[zeroBits] == lockId) {
            OSi_vramLockId[zeroBits] = 0;
            OSi_vramExclusive &= ~(1 << zeroBits);
        }
    }
    SetIrqFlag(enabled);
}

