#include <nitro.h>
#include <nitro/os/common/interrupt_shared.h>

asm OSIntrMode ClearIrqFlag()
{
	mrs r0, cpsr
	bic r1, r0, #HW_PSR_IRQ_DISABLE
	msr cpsr_c, r1
	and r0, r0, #HW_PSR_IRQ_DISABLE
	bx lr
}

asm OSIntrMode EnableIrqFlag()
{
	mrs r0, cpsr
	orr r1, r0, #HW_PSR_IRQ_DISABLE
	msr cpsr_c, r1
	and r0, r0, #HW_PSR_IRQ_DISABLE
	bx lr
}

asm OSIntrMode SetIrqFlag(u8 flag)
{
	mrs r1, cpsr
	bic r2, r1, #HW_PSR_IRQ_DISABLE
	orr r2, r2, r0
	msr cpsr_c, r2
	and r0, r1, #HW_PSR_IRQ_DISABLE
	bx lr
}

asm OSIntrMode EnableIrqFiqFlags(void)
{
	mrs r0, cpsr
	orr r1, r0, #HW_PSR_IRQ_DISABLE | HW_PSR_FIQ_DISABLE
	msr cpsr_c, r1
	and r0, r0, #HW_PSR_IRQ_DISABLE | HW_PSR_FIQ_DISABLE
	bx lr
}

asm OSIntrMode SetIrqFiqFlags(u8 flags)
{
	mrs r1, cpsr
	bic r2, r1, #HW_PSR_IRQ_DISABLE | HW_PSR_FIQ_DISABLE
	orr r2, r2, r0
	msr cpsr_c, r2
	and r0, r1, #HW_PSR_IRQ_DISABLE | HW_PSR_FIQ_DISABLE
	bx lr
}

asm OSIntrMode GetIrqFlag()
{
	mrs r0, cpsr
	and r0, r0, #HW_PSR_IRQ_DISABLE
	bx lr
}

asm OSProcMode GetProcessorMode()
{
	mrs r0, cpsr
	and r0, r0, #HW_PSR_CPU_MODE_MASK
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
void sub_02078900(BOOL, s32);

void sub_0207B860(void) // OS_WaitVBlankIntr
{
    SVC_WaitByLoop(1);
    sub_02078900(TRUE, OS_IE_VBLANK);
}

