#ifndef PMDSKY_MAIN_0207B848_H
#define PMDSKY_MAIN_0207B848_H

u8 ClearIrqFlag();
u8 EnableIrqFlag();
u8 SetIrqFlag(u8 flag);
u8 EnableIrqFiqFlags(void);
u8 SetIrqFiqFlags(u8 flags);
u8 GetIrqFlag();
u8 GetProcessorMode();

#endif //PMDSKY_MAIN_0207B848_H
