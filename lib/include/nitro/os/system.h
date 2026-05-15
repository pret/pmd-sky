#ifndef NITRO_OS_SYSTEM_H_
#define NITRO_OS_SYSTEM_H_

#include <nitro/types.h>
#include <nitro/hw/io_reg.h>
#include <nitro/os/common/system_shared.h>
#include <nitro/os/common/armArch.h>

#ifdef SDK_ARM9
#include <nitro/os/ARM9/system.h>
#else
#include <nitro/os/ARM7/system.h>
#endif //SDK_ARM9

// Enables processor interrupts by clearing the i flag in the program status register (cpsr).
// return: Old value of cpsr & 0x80 (0x80 if interrupts were disabled, 0x0 if they were already enabled)
OSIntrMode ClearIrqFlag();
// Disables processor interrupts by setting the i flag in the program status register (cpsr).
// return: Old value of cpsr & 0x80 (0x80 if interrupts were already disabled, 0x0 if they were enabled)
OSIntrMode EnableIrqFlag();
// Sets the value of the processor's interrupt flag according to the specified parameter.
// flag: Value to set the flag to (0x80 to set it, which disables interrupts; 0x0 to unset it, which enables interrupts)
// return: Old value of cpsr & 0x80 (0x80 if interrupts were disabled, 0x0 if they were enabled)
OSIntrMode SetIrqFlag(u8 flag);
// Disables processor all interrupts (both standard and fast) by setting the i and f flags in the program status register (cpsr).
// return: Old value of cpsr & 0xC0 (contains the previous values of the i and f flags)
OSIntrMode EnableIrqFiqFlags(void);
// Sets the value of the processor's interrupt flags (i and f) according to the specified parameter.
// flags: Value to set the flags to (0xC0 to set both flags, 0x80 to set the i flag and clear the f flag, 0x40 to set the f flag and clear the i flag and 0x0 to clear both flags)
// return: Old value of cpsr & 0xC0 (contains the previous values of the i and f flags)
OSIntrMode SetIrqFiqFlags(u8 flags);
// Gets the current value of the processor's interrupt request (i) flag
// return: cpsr & 0x80 (0x80 if interrupts are disabled, 0x0 if they are enabled)
OSIntrMode GetIrqFlag();
// Gets the processor's current operating mode.
// See https://problemkaputt.de/gbatek.htm#armcpuflagsconditionfieldcond
// return: cpsr & 0x1f (the cpsr mode bits M4-M0)
OSProcMode GetProcessorMode();

void OS_SpinWait(u32 cycles);
void OS_WaitVBlankIntr(void);

#endif //NITRO_OS_SYSTEM_H_
