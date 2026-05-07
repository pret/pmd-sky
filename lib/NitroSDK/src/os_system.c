#include <nitro.h>

asm u8 ClearIrqFlag()
{
	mrs r0, cpsr
	bic r1, r0, #0x80
	msr cpsr_c, r1
	and r0, r0, #0x80
	bx lr
}

asm u8 EnableIrqFlag()
{
	mrs r0, cpsr
	orr r1, r0, #0x80
	msr cpsr_c, r1
	and r0, r0, #0x80
	bx lr
}

asm u8 SetIrqFlag(u8 flag)
{
	mrs r1, cpsr
	bic r2, r1, #0x80
	orr r2, r2, r0
	msr cpsr_c, r2
	and r0, r1, #0x80
	bx lr
}

asm u8 EnableIrqFiqFlags(void)
{
	mrs r0, cpsr
	orr r1, r0, #0xc0
	msr cpsr_c, r1
	and r0, r0, #0xc0
	bx lr
}

asm u8 SetIrqFiqFlags(u8 flags)
{
	mrs r1, cpsr
	bic r2, r1, #0xc0
	orr r2, r2, r0
	msr cpsr_c, r2
	and r0, r1, #0xc0
	bx lr
}

asm u8 GetIrqFlag()
{
	mrs r0, cpsr
	and r0, r0, #0x80
	bx lr
}

asm u8 GetProcessorMode()
{
	mrs r0, cpsr
	and r0, r0, #0x1f
	bx lr
}

asm void sub_0207B854(u32 cycles) // OS_SpinWait
{
    @loop
	subs r0, r0, #4
	bhs @loop
	bx lr
}

void SVC_WaitByLoop(s32);
void sub_02078900(s32, s32);

void sub_0207B860(void) // OS_WaitVBlankIntr
{
    SVC_WaitByLoop(1);
    sub_02078900(1, 1);
}

