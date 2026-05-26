	.include "asm/macros.inc"
	.include "include/nitro.inc"

	.text

    arm_func_start FSi_ReleaseCommand
FSi_ReleaseCommand: ; 0x0207DCC0
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl EnableIrqFlag
	ldr r1, [r5]
	mov r6, r0
	ldr r0, [r5, #4]
	cmp r1, #0
	strne r0, [r1, #4]
	cmp r0, #0
	strne r1, [r0]
	mov r0, #0
	str r0, [r5]
	str r0, [r5, #4]
	ldr r1, [r5, #0xc]
	add r0, r5, #0x18
	bic r1, r1, #0x4f
	str r1, [r5, #0xc]
	str r4, [r5, #0x14]
	bl OS_WakeupThread
	mov r0, r6
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end FSi_ReleaseCommand

	arm_func_start FSi_TranslateCommand
FSi_TranslateCommand: ; 0x0207DD1C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #0xc]
	ldr r5, [r8, #8]
	mov r7, r1
	mov r1, #1
	tst r0, #4
	mov r6, r1, lsl r7
	moveq r1, #0
	ldr r0, [r5, #0x1c]
	cmp r1, #0
	orrne r0, r0, #0x200
	orreq r0, r0, #0x100
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x58]
	tst r0, r6
	beq _0207DDC4
	ldr r2, [r5, #0x54]
	mov r0, r8
	mov r1, r7
	blx r2
	mov r4, r0
	cmp r4, #8
	addls pc, pc, r4, lsl #2
	b _0207DDC8
_0207DD80: ; jump table
	b _0207DDA4 ; case 0
	b _0207DDA4 ; case 1
	b _0207DDC8 ; case 2
	b _0207DDC8 ; case 3
	b _0207DDA4 ; case 4
	b _0207DDC8 ; case 5
	b _0207DDC8 ; case 6
	b _0207DDC8 ; case 7
	b _0207DDAC ; case 8
_0207DDA4:
	str r4, [r8, #0x14]
	b _0207DDC8
_0207DDAC:
	ldr r1, [r5, #0x58]
	mvn r0, r6
	and r0, r1, r0
	str r0, [r5, #0x58]
	mov r4, #7
	b _0207DDC8
_0207DDC4:
	mov r4, #7
_0207DDC8:
	cmp r4, #7
	bne _0207DDE4
	ldr r1, _0207DEA8 ; =_020AEBF8
	mov r0, r8
	ldr r1, [r1, r7, lsl #2]
	blx r1
	mov r4, r0
_0207DDE4:
	cmp r4, #6
	bne _0207DE5C
	ldr r0, [r8, #0xc]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207DEA0
	bl EnableIrqFlag
	ldr r1, [r5, #0x1c]
	mov r7, r0
	tst r1, #0x200
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207DE4C
	mov r4, #0
	mov r6, #1
_0207DE2C:
	add r0, r5, #0xc
	bl OS_SleepThread
	ldr r0, [r5, #0x1c]
	tst r0, #0x200
	movne r0, r6
	moveq r0, r4
	cmp r0, #0
	bne _0207DE2C
_0207DE4C:
	mov r0, r7
	ldr r4, [r8, #0x14]
	bl SetIrqFlag
	b _0207DEA0
_0207DE5C:
	ldr r0, [r8, #0xc]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _0207DE90
	ldr r1, [r5, #0x1c]
	mov r0, r8
	bic r2, r1, #0x100
	mov r1, r4
	str r2, [r5, #0x1c]
	bl FSi_ReleaseCommand
	b _0207DEA0
_0207DE90:
	ldr r0, [r5, #0x1c]
	bic r0, r0, #0x200
	str r0, [r5, #0x1c]
	str r4, [r8, #0x14]
_0207DEA0:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0207DEA8: .word _020AEBF8
	arm_func_end FSi_TranslateCommand

