	.include "asm/macros.inc"
	.include "include/os_thread.inc"

	.text

    arm_func_start OS_InitContext
OS_InitContext: ; 0x02079C84
	add r1, r1, #4
	str r1, [r0, #0x40]
	str r2, [r0, #0x44]
	sub r2, r2, #0x40
	tst r2, #4
	bne _02079CA0
	b _02079CA4
_02079CA0:
	sub r2, r2, #4
_02079CA4:
	str r2, [r0, #0x38]
	ands r1, r1, #1
	bne _02079CB4
	b _02079CB8
_02079CB4:
	mov r1, #0x3f
_02079CB8:
	beq _02079CC0
	b _02079CC4
_02079CC0:
	mov r1, #0x1f
_02079CC4:
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	str r1, [r0, #0x34]
	str r1, [r0, #0x3c]
	bx lr
	arm_func_end OS_InitContext

	arm_func_start OS_SaveContext
OS_SaveContext: ; 0x02079D08
	stmdb sp!, {r0, lr}
	add r0, r0, #0x48
	ldr r1, _02079D50 ; =CP_SaveContext
	blx r1
	ldmia sp!, {r0, lr}
	add r1, r0, #0
	mrs r2, cpsr
	str r2, [r1], #4
	mov r0, #0xd3
	msr cpsr_c, r0
	str sp, [r1, #0x40]
	msr cpsr_c, r2
	mov r0, #1
	stmia r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr}
	add r0, pc, #0x8 ; =_02079D50
	str r0, [r1, #0x3c]
	mov r0, #0
	bx lr
	.align 2, 0
_02079D50: .word CP_SaveContext
	arm_func_end OS_SaveContext

	arm_func_start OS_LoadContext
OS_LoadContext: ; 0x02079D54
	stmdb sp!, {r0, lr}
	add r0, r0, #0x48
	ldr r1, _02079D94 ; =CPi_RestoreContext
	blx r1
	ldmia sp!, {r0, lr}
	mrs r1, cpsr
	bic r1, r1, #0x1f
	orr r1, r1, #0xd3
	msr cpsr_c, r1
	ldr r1, [r0], #4
	msr spsr_fsxc, r1
	ldr sp, [r0, #0x40]
	ldr lr, [r0, #0x3c]
	ldmia r0, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	mov r0, r0
	subs pc, lr, #4
	.align 2, 0
_02079D94: .word CPi_RestoreContext
	arm_func_end OS_LoadContext

