#ifndef PMDSKY_MAIN_0207B848_H
#define PMDSKY_MAIN_0207B848_H

// Enables processor interrupts by clearing the i flag in the program status register (cpsr).
// return: Old value of cpsr & 0x80 (0x80 if interrupts were disabled, 0x0 if they were already enabled)
u8 ClearIrqFlag();
// Disables processor interrupts by setting the i flag in the program status register (cpsr).
// return: Old value of cpsr & 0x80 (0x80 if interrupts were already disabled, 0x0 if they were enabled)
u8 EnableIrqFlag();
// Sets the value of the processor's interrupt flag according to the specified parameter.
// flag: Value to set the flag to (0x80 to set it, which disables interrupts; 0x0 to unset it, which enables interrupts)
// return: Old value of cpsr & 0x80 (0x80 if interrupts were disabled, 0x0 if they were enabled)
u8 SetIrqFlag(u8 flag);
// Disables processor all interrupts (both standard and fast) by setting the i and f flags in the program status register (cpsr).
// return: Old value of cpsr & 0xC0 (contains the previous values of the i and f flags)
u8 EnableIrqFiqFlags(void);
// Sets the value of the processor's interrupt flags (i and f) according to the specified parameter.
// flags: Value to set the flags to (0xC0 to set both flags, 0x80 to set the i flag and clear the f flag, 0x40 to set the f flag and clear the i flag and 0x0 to clear both flags)
// return: Old value of cpsr & 0xC0 (contains the previous values of the i and f flags)
u8 SetIrqFiqFlags(u8 flags);
// Gets the current value of the processor's interrupt request (i) flag
// return: cpsr & 0x80 (0x80 if interrupts are disabled, 0x0 if they are enabled)
u8 GetIrqFlag();
// Gets the processor's current operating mode.
// See https://problemkaputt.de/gbatek.htm#armcpuflagsconditionfieldcond
// return: cpsr & 0x1f (the cpsr mode bits M4-M0)
u8 GetProcessorMode();

#endif //PMDSKY_MAIN_0207B848_H
