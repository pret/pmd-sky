	.include "asm/macros.inc"
	.include "main_02029A68.inc"

	.text

	arm_func_start sub_02029A68
sub_02029A68: ; 0x02029A68
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r2, r3
	beq _02029AAC
	mov r3, #0
	strb r3, [r1, #4]
	ldr r2, [r1]
	stmia r0, {r2, r3}
	ldr r3, [r1, #8]
	ldr r2, [r1, #0xc]
	str r3, [r0, #8]
	str r2, [r0, #0xc]
	ldr r3, [r1, #0x10]
	ldr r2, [r1, #0x14]
	str r3, [r0, #0x10]
	str r2, [r0, #0x14]
	b _02029AE8
_02029AAC:
	cmp r3, #0
	ldrneb r2, [r1, #4]
	cmpne r2, #0
	beq _02029AE8
	mov r2, #0
	strb r2, [r1, #4]
	str r2, [r0, #4]
	ldr r3, [r1, #8]
	ldr r2, [r1, #0xc]
	str r3, [r0, #8]
	str r2, [r0, #0xc]
	ldr r3, [r1, #0x10]
	ldr r2, [r1, #0x14]
	str r3, [r0, #0x10]
	str r2, [r0, #0x14]
_02029AE8:
	ldrb r2, [r1, #0x19]
	strb r2, [r0, #0x19]
	ldrb r2, [r1, #0x18]
	strb r2, [r0, #0x18]
	ldr r2, [r1, #0x1c]
	ldr r1, [r1, #0x20]
	str r2, [r0, #0x1c]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_02029A68

	arm_func_start sub_02029B0C
sub_02029B0C: ; 0x02029B0C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x24
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _02029EB0
	cmp r0, #2
	ldrne r0, [r4, #4]
	addne r0, r0, #1
	strne r0, [r4, #4]
	ldr r0, [r4, #4]
	tst r0, #0x10
	bne _02029EB0
	ldr r0, [r4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02029EB0
_02029B50: ; jump table
	b _02029EB0 ; case 0
	b _02029B70 ; case 1
	b _02029B70 ; case 2
	b _02029BBC ; case 3
	b _02029C08 ; case 4
	b _02029C64 ; case 5
	b _02029D38 ; case 6
	b _02029D94 ; case 7
_02029B70:
	mov r0, r4
	mov r1, #0
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029BA4
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl DisplayAndSwitchAnimationControlCurrentFrame
	b _02029EB0
_02029BA4:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl DisplayAndSwitchAnimationControlCurrentFrame
	b _02029EB0
_02029BBC:
	mov r0, r4
	mov r1, #0
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029BF0
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl DisplayAndSwitchAnimationControlCurrentFrame
	b _02029EB0
_02029BF0:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl DisplayAndSwitchAnimationControlCurrentFrame
	b _02029EB0
_02029C08:
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029C44
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl DisplayAndSwitchAnimationControlCurrentFrame
	b _02029EB0
_02029C44:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl DisplayAndSwitchAnimationControlCurrentFrame
	b _02029EB0
_02029C64:
	ldr r1, _02029EC0 ; =0x0000FFFF
	mov ip, #0
	str ip, [sp]
	mov r0, #0x2000
	str r0, [sp, #4]
	add r0, sp, #0x18
	mov r2, r1
	mov r3, r1
	str ip, [sp, #8]
	bl sub_0201C028
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	add r1, sp, #0x18
	cmp r0, #0
	bne _02029CF0
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl FillOamAttributeInfo
	ldr r1, [r4, #8]
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl DisplayAndSwitchAnimationControlCurrentFrame
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
	b _02029EB0
_02029CF0:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl FillOamAttributeInfo
	ldr r1, [r4, #8]
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl DisplayAndSwitchAnimationControlCurrentFrame
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
	b _02029EB0
_02029D38:
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029D74
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl DisplayAndSwitchAnimationControlCurrentFrame
	b _02029EB0
_02029D74:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl DisplayAndSwitchAnimationControlCurrentFrame
	b _02029EB0
_02029D94:
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029DD0
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0x14]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl DisplayAndSwitchAnimationControlCurrentFrame
	b _02029DEC
_02029DD0:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0x14]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl DisplayAndSwitchAnimationControlCurrentFrame
_02029DEC:
	mov ip, #0
	ldr r1, _02029EC0 ; =0x0000FFFF
	str ip, [sp]
	mov r0, #0x2000
	str r0, [sp, #4]
	add r0, sp, #0xc
	mov r2, r1
	mov r3, r1
	str ip, [sp, #8]
	bl sub_0201C028
	ldrb r0, [r4, #0x26]
	add r1, sp, #0xc
	cmp r0, #0
	bne _02029E6C
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl FillOamAttributeInfo
	ldr r1, [r4, #8]
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl DisplayAndSwitchAnimationControlCurrentFrame
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
	b _02029EB0
_02029E6C:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl FillOamAttributeInfo
	ldr r1, [r4, #8]
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl DisplayAndSwitchAnimationControlCurrentFrame
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
_02029EB0:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02029EB8: .word CURSOR_ANIMATION_CONTROL
_02029EBC: .word CURSOR_16_ANIMATION_CONTROL
_02029EC0: .word 0x0000FFFF
	arm_func_end sub_02029B0C

	arm_func_start sub_02029EC4
sub_02029EC4: ; 0x02029EC4
	bx lr
	arm_func_end sub_02029EC4
