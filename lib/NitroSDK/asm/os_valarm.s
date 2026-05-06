	.include "asm/macros.inc"
	.include "include/os_timer.inc"

	.text

    arm_func_start OS_InitVAlarm
OS_InitVAlarm: ; 0x0207B370
	stmdb sp!, {r3, lr}
	ldr r1, _0207B3B4 ; =_022B99BC
	ldrh r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strh r0, [r1]
	mov r2, #0
	str r2, [r1, #0xc]
	mov r0, #4
	str r2, [r1, #0x10]
	bl OS_DisableIrqMask
	ldr r0, _0207B3B4 ; =_022B99BC
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B3B4: .word _022B99BC
	arm_func_end OS_InitVAlarm

	arm_func_start sub_0207B3B8
sub_0207B3B8: ; 0x0207B3B8
	stmdb sp!, {r3, lr}
	ldr r1, _0207B430 ; =_022B99BC
	ldr r3, [r1, #0xc]
	cmp r3, #0
	beq _0207B428
	ldr ip, [r0, #0xc]
_0207B3D0:
	ldr r1, [r3, #0xc]
	cmp r1, ip
	blo _0207B41C
	bne _0207B3F0
	ldrsh r2, [r3, #0x10]
	ldrsh r1, [r0, #0x10]
	cmp r2, r1
	ble _0207B41C
_0207B3F0:
	ldr r1, [r3, #0x14]
	str r1, [r0, #0x14]
	str r3, [r0, #0x18]
	str r0, [r3, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	ldmneia sp!, {r3, pc}
	ldr r1, _0207B430 ; =_022B99BC
	str r0, [r1, #0xc]
	bl sub_0207B544
	ldmia sp!, {r3, pc}
_0207B41C:
	ldr r3, [r3, #0x18]
	cmp r3, #0
	bne _0207B3D0
_0207B428:
	bl sub_0207B434
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B430: .word _022B99BC
	arm_func_end sub_0207B3B8

	arm_func_start sub_0207B434
sub_0207B434: ; 0x0207B434
	stmdb sp!, {r3, lr}
	ldr r1, _0207B468 ; =_022B99BC
	mov r2, #0
	ldr r3, [r1, #0x10]
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r0, [r1, #0x10]
	cmp r3, #0
	strne r0, [r3, #0x18]
	ldmneia sp!, {r3, pc}
	str r0, [r1, #0xc]
	bl sub_0207B544
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B468: .word _022B99BC
	arm_func_end sub_0207B434

	arm_func_start sub_0207B46C
sub_0207B46C: ; 0x0207B46C
	cmp r0, #0
	bxeq lr
	ldr r2, [r0, #0x18]
	ldr r1, [r0, #0x14]
	cmp r2, #0
	ldreq r0, _0207B4A0 ; =_022B99BC
	strne r1, [r2, #0x14]
	streq r1, [r0, #0x10]
	cmp r1, #0
	ldreq r0, _0207B4A0 ; =_022B99BC
	strne r2, [r1, #0x18]
	streq r2, [r0, #0xc]
	bx lr
	.align 2, 0
_0207B4A0: .word _022B99BC
	arm_func_end sub_0207B46C

	arm_func_start sub_0207B4A4
sub_0207B4A4: ; 0x0207B4A4
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_0207B4A4

	arm_func_start sub_0207B4B8
sub_0207B4B8: ; 0x0207B4B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl EnableIrqFlag
	mov r4, r0
	cmp r8, #0
	beq _0207B4E8
	ldr r0, [r8]
	cmp r0, #0
	beq _0207B4EC
_0207B4E8:
	bl WaitForever2
_0207B4EC:
	ldr r0, _0207B540 ; =0x04000006
	ldrh sb, [r0]
	mov r0, sb
	bl sub_0207B790
	mov r1, #1
	str r1, [r8, #0x1c]
	cmp r7, sb
	strh r7, [r8, #0x10]
	addle r0, r0, #1
	str r0, [r8, #0xc]
	strh r6, [r8, #0x12]
	ldr r1, [sp, #0x20]
	str r5, [r8]
	str r1, [r8, #4]
	mov r1, #0
	mov r0, r8
	str r1, [r8, #0x24]
	bl sub_0207B3B8
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0207B540: .word 0x04000006
	arm_func_end sub_0207B4B8

	arm_func_start sub_0207B544
sub_0207B544: ; 0x0207B544
	stmdb sp!, {r4, lr}
	ldr r1, _0207B57C ; =sub_0207B5CC
	mov r4, r0
	mov r0, #4
	bl OS_SetIrqFunction
	ldrsh r0, [r4, #0x10]
	bl GX_HBlankIntr
	ldr r2, _0207B580 ; =0x04000004
	mov r0, #4
	ldrh r1, [r2]
	orr r1, r1, #0x20
	strh r1, [r2]
	bl OS_EnableIrqMask
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207B57C: .word sub_0207B5CC
_0207B580: .word 0x04000004
	arm_func_end sub_0207B544

	arm_func_start sub_0207B584
sub_0207B584: ; 0x0207B584
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	mov r1, #1
	str r1, [r5, #0x24]
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _0207B5B0
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
_0207B5B0:
	mov r0, r5
	bl sub_0207B46C
	mov r1, #0
	mov r0, r4
	str r1, [r5]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207B584

	arm_func_start sub_0207B5CC
sub_0207B5CC: ; 0x0207B5CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #4
	bl OS_DisableIrqMask
	ldr r2, _0207B734 ; =0x04000004
	ldr r0, _0207B738 ; =OS_IRQTable
	ldrh r1, [r2]
	add r0, r0, #0x3000
	bic r1, r1, #0x20
	strh r1, [r2]
	ldr r1, [r0, #0xff8]
	orr r1, r1, #4
	str r1, [r0, #0xff8]
	ldrh r0, [r2]
	mov r1, r0, asr #8
	mov r0, r0, lsl #1
	and r1, r1, #0xff
	and r0, r0, #0x100
	orr r0, r1, r0
	sub r0, r0, #1
	bl sub_0207B790
	ldr r4, _0207B73C ; =_022B99BC
	ldr sl, [r4, #0xc]
	cmp sl, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr sb, _0207B740 ; =0x04000006
	mov fp, #4
	sub r6, sb, #2
	mov r5, #0
_0207B63C:
	ldrh r8, [sb]
	mov r0, r8
	bl sub_0207B790
	mov r7, r0
	mov r0, sl
	mov r1, r7
	mov r2, r8
	bl sub_0207B744
	cmp r0, #0
	beq _0207B678
	cmp r0, #1
	beq _0207B6B4
	cmp r0, #2
	beq _0207B708
	b _0207B724
_0207B678:
	mov r0, sl
	bl sub_0207B544
	ldrh r1, [sb]
	ldrsh r0, [sl, #0x10]
	cmp r0, r1
	ldreq r0, [sl, #0xc]
	cmpeq r0, r7
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, fp
	bl OS_DisableIrqMask
	ldrh r1, [r6]
	mov r0, #4
	bic r1, r1, #0x20
	strh r1, [r6]
	bl OS_ResetRequestIrqMask
_0207B6B4:
	ldr r7, [sl]
	mov r0, sl
	bl sub_0207B46C
	str r5, [sl]
	cmp r7, #0
	beq _0207B6D4
	ldr r0, [sl, #4]
	blx r7
_0207B6D4:
	ldr r0, [sl, #0x1c]
	cmp r0, #0
	beq _0207B724
	ldr r0, [sl, #0x24]
	cmp r0, #0
	bne _0207B724
	str r7, [sl]
	ldr r1, [r4, #8]
	mov r0, sl
	add r1, r1, #1
	str r1, [sl, #0xc]
	bl sub_0207B3B8
	b _0207B724
_0207B708:
	mov r0, sl
	bl sub_0207B46C
	ldr r1, [r4, #8]
	mov r0, sl
	add r1, r1, #1
	str r1, [sl, #0xc]
	bl sub_0207B3B8
_0207B724:
	ldr sl, [r4, #0xc]
	cmp sl, #0
	bne _0207B63C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0207B734: .word 0x04000004
_0207B738: .word OS_IRQTable
_0207B73C: .word _022B99BC
_0207B740: .word 0x04000006
	arm_func_end sub_0207B5CC

	arm_func_start sub_0207B744
sub_0207B744: ; 0x0207B744
	ldrsh r3, [r0, #0x10]
	ldr ip, [r0, #0xc]
	subs r1, r1, ip
	sub r2, r2, r3
	bmi _0207B768
	cmp r1, #0
	bne _0207B770
	cmp r2, #0
	bge _0207B770
_0207B768:
	mov r0, #0
	bx lr
_0207B770:
	ldrsh r0, [r0, #0x12]
	cmp r2, #0
	addlt r1, r2, #7
	addlt r2, r1, #0x100
	cmp r2, r0
	movle r0, #1
	movgt r0, #2
	bx lr
	arm_func_end sub_0207B744

	arm_func_start sub_0207B790
sub_0207B790: ; 0x0207B790
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _0207B7CC ; =_022B99BC
	ldr r2, [r1, #4]
	cmp r4, r2
	ldrlt r2, [r1, #8]
	addlt r2, r2, #1
	strlt r2, [r1, #8]
	ldr r1, _0207B7CC ; =_022B99BC
	str r4, [r1, #4]
	bl SetIrqFlag
	ldr r0, _0207B7CC ; =_022B99BC
	ldr r0, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207B7CC: .word _022B99BC
	arm_func_end sub_0207B790

