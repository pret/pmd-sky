#ifndef PMDSKY_MAIN_0207BC20_H
#define PMDSKY_MAIN_0207BC20_H

// Calls EnableIrqFlag and WaitForInterrupt in an infinite loop.
// This is called on fatal errors to hang the program indefinitely.
void WaitForever2(void);
// Presumably blocks until the program receives an interrupt.
// This just calls (in Ghidra terminology) coproc_moveto_Wait_for_interrupt(0). See https://en.wikipedia.org/wiki/ARM_architecture_family#Coprocessors.
void WaitForInterrupt(void);

#endif //PMDSKY_MAIN_0207BC20_H
