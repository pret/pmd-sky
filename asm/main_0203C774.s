	.include "asm/macros.inc"
	.include "main_0203C774.inc"

	.text

	arm_func_start sub_0203C774
sub_0203C774: ; 0x0203C774
	cmp r0, #0
	movne r0, #7
	moveq r0, #8
	bx lr
	arm_func_end sub_0203C774

	arm_func_start sub_0203C784
sub_0203C784: ; 0x0203C784
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	mov r4, r0
	bl sub_02027B1C
	ldr r0, _0203C7DC ; =_020AFE5C
	ldr r1, _0203C7E0 ; =_0209C60C
	ldr r0, [r0, #0xc]
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	bl StringFromId
	str r0, [sp, #0x3c]
	add ip, sp, #4
#ifdef JAPAN
	ldr r3, _0203CBC8 ; =0x000023B4
#endif
	mov r0, r4
	mov r1, #0xa
	mov r2, #2
#ifndef JAPAN
	mov r3, #0x30c
#endif
	str ip, [sp]
	bl sub_020262E0
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0203C7DC: .word _020AFE5C
_0203C7E0: .word _0209C60C
#ifdef JAPAN
_0203CBC8: .word 0x000023B4
#endif
	arm_func_end sub_0203C784

	arm_func_start sub_0203C7E4
sub_0203C7E4: ; 0x0203C7E4
	stmdb sp!, {r4, lr}
	ldr r1, _0203C870 ; =_020AFE70
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _0203C810
	mov r0, #0x10
	mov r1, #8
	bl MemAlloc
	ldr r1, _0203C870 ; =_020AFE70
	str r0, [r1]
_0203C810:
	ldr r1, _0203C870 ; =_020AFE70
	mvn r3, #0
	ldr r2, [r1]
	mov r0, r4
	strh r3, [r2, #6]
	ldr r1, [r1]
	strh r3, [r1, #4]
	bl sub_0203C9A0
	ldr r0, _0203C870 ; =_020AFE70
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1]
	ldr r1, [r0]
	strb r2, [r1, #1]
	ldr r0, [r0]
	strb r2, [r0, #2]
	bl sub_0203C984
	ldr r0, _0203C870 ; =_020AFE70
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0xa]
	ldr r0, [r0]
	str r2, [r0, #0xc]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203C870: .word _020AFE70
	arm_func_end sub_0203C7E4

	arm_func_start sub_0203C874
sub_0203C874: ; 0x0203C874
	ldr r0, _0203C8DC ; =_020AFE70
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xa]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	bx lr
_0203C898: ; jump table
	b _0203C8AC ; case 0
	b _0203C8B8 ; case 1
	b _0203C8C4 ; case 2
	bx lr ; case 3
	b _0203C8D0 ; case 4
_0203C8AC:
	mov r0, #7
	str r0, [r1, #0xc]
	bx lr
_0203C8B8:
	mov r0, #7
	str r0, [r1, #0xc]
	bx lr
_0203C8C4:
	mov r0, #7
	str r0, [r1, #0xc]
	bx lr
_0203C8D0:
	mov r0, #5
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_0203C8DC: .word _020AFE70
	arm_func_end sub_0203C874

	arm_func_start sub_0203C8E0
sub_0203C8E0: ; 0x0203C8E0
	ldr r0, _0203C90C ; =_020AFE70
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0, #0xc]
	cmp r0, #0xa
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0203C90C: .word _020AFE70
	arm_func_end sub_0203C8E0
