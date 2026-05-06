	.include "asm/macros.inc"

	.text

	.public OS_InitArena
	.public PXI_Init
	.public OS_InitLock
	.public OS_InitArenaEx
	.public OS_InitIrqTable
	.public OS_SetIrqStackChecker
	.public OS_InitException
	.public MI_Init
	.public OS_InitVAlarm
	.public OSi_InitVramExclusive
	.public OS_InitThread
	.public OS_InitReset
	.public CTRDG_Init
	.public CARD_Init
	.public PM_Init
	.public OSi_WaitVCount0

    arm_func_start OSi_WaitVCount0
OSi_WaitVCount0: ; 0x0207A34C
	mov ip, #0x4000000
	ldr r1, [ip, #0x208]
	str ip, [ip, #0x208]
_0207A358:
	ldrh r0, [ip, #6]
	cmp r0, #0
	bne _0207A358
	str r1, [ip, #0x208]
	bx lr
	arm_func_end OSi_WaitVCount0

; https://decomp.me/scratch/EcUDd
	arm_func_start OS_Init
OS_Init: ; 0x0207A36C
	stmdb sp!, {r3, lr}
	bl OS_InitArena
	bl PXI_Init
	bl OS_InitLock
	bl OS_InitArenaEx
	bl OS_InitIrqTable
	bl OS_SetIrqStackChecker
	bl OS_InitException
	bl MI_Init
	bl OS_InitVAlarm
	bl OSi_InitVramExclusive
	bl OS_InitThread
	bl OS_InitReset
	bl CTRDG_Init
	bl CARD_Init
	bl PM_Init
	bl OSi_WaitVCount0
	ldmia sp!, {r3, pc}
	arm_func_end OS_Init


