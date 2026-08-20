	.include "asm/macros.inc"
	.include "overlay_29_022E9A44.inc"

	.text

	arm_func_start TickStatusTurnCounter
TickStatusTurnCounter: ; 0x022E9A44
	ldrb r1, [r0]
	cmp r1, #0x7f
	moveq r0, r1
	bxeq lr
	cmp r1, #0
	moveq r0, r1
	subne r1, r1, #1
	strneb r1, [r0]
	andne r0, r1, #0xff
	bx lr
	arm_func_end TickStatusTurnCounter

	arm_func_start ov29_022E9A6C
ov29_022E9A6C: ; 0x022E9A6C
	ldrh r2, [r0]
	ldr r1, _022E9A98 ; =0x00007530
	cmp r2, r1
	moveq r0, r2
	bxeq lr
	cmp r2, #0
	moveq r0, r2
	subne r1, r2, #1
	strneh r1, [r0]
	ldrneh r0, [r0]
	bx lr
	.align 2, 0
_022E9A98: .word 0x00007530
	arm_func_end ov29_022E9A6C

	arm_func_start ov29_022E9A9C
ov29_022E9A9C: ; 0x022E9A9C
#ifdef JAPAN
#define OV29_022E9A9C_OFFSET -0xA4
#else
#define OV29_022E9A9C_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sb, r1
	ldr r8, [sb, #0xb4]
	mov sl, r0
	mov r0, sb
	mov r1, #1
	ldrb r4, [r8, #0x4c]
	bl CheckVariousStatuses2__02301244
	cmp r0, #0
	beq _022E9B00
	ldr r0, _022E9CA0 ; =DIRECTIONS_XY
	mov r2, r4, lsl #2
	ldrsh r1, [r0, r2]
	ldrsh r3, [sb, #4]
	ldr r0, _022E9CA4 ; =DIRECTIONS_XY + 2
	add r1, r1, r1, lsl #1
	add r1, r3, r1
	strh r1, [sl]
	ldrsh r0, [r0, r2]
	ldrsh r1, [sb, #6]
	add r0, r0, r0, lsl #1
	add r0, r1, r0
	strh r0, [sl, #2]
	b _022E9C98
_022E9B00:
	ldrsh r2, [r8, #0x5a]
	mvn r0, #0
	cmp r2, r0
	ldreqsh r1, [r8, #0x5c]
	cmpeq r1, r0
	bne _022E9C8C
	ldr r0, _022E9CA8 ; =DUNGEON_PTR
	ldrb r6, [r8, #0x4c]
	ldr r1, [r0]
	ldr r4, _022E9CAC ; =ov29_0235179C
	add r0, r1, #0x3000
	ldrb r0, [r0, #0xe38 + OV29_022E9A9C_OFFSET]
	ldr r3, _022E9CB0 ; =ov29_023517A0
	mov r5, r6, lsl #3
	cmp r0, #0
	ldrsh r0, [r3, r5]
	ldr r2, _022E9CB4 ; =ov29_023517A2
	ldr r4, [r4, r6, lsl #3]
	str r0, [sp, #0x14]
	ldrsh r0, [r2, r5]
	str r0, [sp, #0x10]
	ldrsh r0, [sb, #4]
	str r0, [sp, #0xc]
	ldrsh r0, [sb, #6]
	str r0, [sp, #8]
	beq _022E9B80
	add r0, r1, #0x378 + OV29_022E9A9C_OFFSET
	add r0, r0, #0x12800
	str r0, [sp, #4]
	mov r0, #0x14
	str r0, [sp]
	b _022E9C44
_022E9B80:
	ldrb r0, [r8, #6]
	cmp r0, #0
	bne _022E9BA4
	add r0, r1, #0x338 + OV29_022E9A9C_OFFSET
	add r0, r0, #0x12800
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp]
	b _022E9C44
_022E9BA4:
	add r0, r1, #0x328 + OV29_022E9A9C_OFFSET
	add r0, r0, #0x12800
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp]
	b _022E9C44
_022E9BBC:
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	ldrsh r2, [r4, #2]
	mla fp, r3, r1, r0
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #8]
	mov r6, #0
	mla r5, r2, r1, r0
	b _022E9C34
_022E9BE0:
	ldr r0, [sp, #4]
	ldr r7, [r0, r6, lsl #2]
	mov r0, r7
	bl EntityIsValid__022E95F4
	cmp r0, #0
	beq _022E9C30
	ldrsh r0, [r7, #4]
	cmp r0, fp
	ldreqsh r0, [r7, #6]
	cmpeq r0, r5
	bne _022E9C30
	mov r2, #0
	mov r1, r7
	mov r0, sb
	mov r3, r2
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	streqh fp, [sl]
	streqh r5, [sl, #2]
	beq _022E9C98
_022E9C30:
	add r6, r6, #1
_022E9C34:
	ldr r0, [sp]
	cmp r6, r0
	blt _022E9BE0
	add r4, r4, #4
_022E9C44:
	ldrsh r3, [r4]
	cmp r3, #0x63
	bne _022E9BBC
	ldrb r1, [r8, #0x4c]
	ldr r0, _022E9CA0 ; =DIRECTIONS_XY
	ldrsh r2, [sb, #4]
	mov r1, r1, lsl #2
	ldrsh r1, [r0, r1]
	ldr r0, _022E9CA4 ; =DIRECTIONS_XY + 2
	add r1, r2, r1, lsl #1
	strh r1, [sl]
	ldrb r1, [r8, #0x4c]
	ldrsh r2, [sb, #6]
	mov r1, r1, lsl #2
	ldrsh r0, [r0, r1]
	add r0, r2, r0, lsl #1
	strh r0, [sl, #2]
	b _022E9C98
_022E9C8C:
	strh r2, [sl]
	ldrsh r0, [r8, #0x5c]
	strh r0, [sl, #2]
_022E9C98:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E9CA0: .word DIRECTIONS_XY
_022E9CA4: .word DIRECTIONS_XY + 2
_022E9CA8: .word DUNGEON_PTR
_022E9CAC: .word ov29_0235179C
_022E9CB0: .word ov29_023517A0
_022E9CB4: .word ov29_023517A2
	arm_func_end ov29_022E9A9C

	arm_func_start ov29_022E9CB8
ov29_022E9CB8: ; 0x022E9CB8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _022E9F04 ; =DUNGEON_FRAMES_PASSED
	ldr r0, _022E9F08 ; =0xFFFF000F
	ldrh r2, [r1, #0x1a]
	mov lr, #0
	and r2, r2, r0
	strh r2, [r1, #0x1a]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0x100
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0x200
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0xc00
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0x1000
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0x2000
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	orr r2, r2, #0x2000
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0xc000
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x16]
	and r2, r2, r0, asr #7
	strh r2, [r1, #0x16]
	ldrh r2, [r1, #0x16]
	bic r2, r2, #0x3e00
	strh r2, [r1, #0x16]
	ldrh r2, [r1, #0x16]
	bic r2, r2, #0xc000
	strh r2, [r1, #0x16]
	ldrh r2, [r1, #0x16]
	orr r2, r2, #0x4000
	strh r2, [r1, #0x16]
	ldrh r2, [r1, #0x18]
	and r0, r2, r0, asr #6
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x18]
	bic r0, r0, #0xc00
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x18]
	bic r0, r0, #0xf000
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x1a]
	bic r0, r0, #1
	strh r0, [r1, #0x1a]
	ldrh r0, [r1, #0x1a]
	bic r0, r0, #2
	strh r0, [r1, #0x1a]
	ldrh r0, [r1, #0x1a]
	bic r0, r0, #4
	strh r0, [r1, #0x1a]
_022E9DA0:
	mov r0, #0x48
	mul r5, lr, r0
	ldr r3, _022E9F0C ; =ov29_0237C888
	mov r8, #0x400
	ldr r2, _022E9F10 ; =ov29_02351628
	mov r1, #0x18
	mla r6, lr, r1, r2
	ldr r0, _022E9F14 ; =ov29_02351658
	add r4, r3, r5
	add r5, r0, r5
	mov ip, #0
	rsb r8, r8, #0
	mov r7, #0xc
_022E9DD4:
	mul r3, ip, r7
	ldrh r2, [r4, r3]
	add r1, r5, r3
	ldr r0, [r5, r3]
	bic r2, r2, #0x100
	strh r2, [r4, r3]
	ldrh r2, [r4, r3]
	ldr sl, [r1, #4]
	ldr sb, [r1, #8]
	bic r1, r2, #0x200
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	mov r0, r0, lsl #0x1e
	add r2, r4, r3
	bic r1, r1, #0xc00
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	mov sl, sl, lsl #0x1e
	and sb, sb, r8, lsr #22
	bic r1, r1, #0x1000
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	bic r1, r1, #0x2000
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	orr r1, r1, #0x2000
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	bic r1, r1, #0xc000
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	orr r0, r1, r0, lsr #16
	strh r0, [r4, r3]
	ldrh r0, [r2, #2]
	bic r0, r0, #0x3e00
	strh r0, [r2, #2]
	ldrh r0, [r2, #2]
	bic r0, r0, #0xc000
	strh r0, [r2, #2]
	ldrh r0, [r2, #2]
	orr r0, r0, sl, lsr #16
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	and r0, r0, r8
	strh r0, [r2, #4]
	ldrh r0, [r2, #4]
	orr r0, r0, sb
	strh r0, [r2, #4]
	ldrh r0, [r2, #4]
	bic r0, r0, #0xc00
	strh r0, [r2, #4]
	ldrh r0, [r2, #4]
	orr r0, r0, #0xc00
	strh r0, [r2, #4]
	ldrh r3, [r2, #4]
	mov r1, ip, lsl #2
	add r0, r6, ip, lsl #2
	bic r3, r3, #0xf000
	strh r3, [r2, #4]
	ldrh r3, [r2, #6]
	add ip, ip, #1
	ldrh r1, [r6, r1]
	bic r3, r3, #1
	strh r3, [r2, #6]
	ldrh r3, [r2, #6]
	ldrh r0, [r0, #2]
	cmp ip, #6
	bic r3, r3, #2
	strh r3, [r2, #6]
	strh r1, [r2, #8]
	strh r0, [r2, #0xa]
	blt _022E9DD4
	add lr, lr, #1
	cmp lr, #2
	blt _022E9DA0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022E9F04: .word DUNGEON_FRAMES_PASSED
_022E9F08: .word 0xFFFF000F
_022E9F0C: .word ov29_0237C888
_022E9F10: .word ov29_02351628
_022E9F14: .word ov29_02351658
	arm_func_end ov29_022E9CB8

	arm_func_start ov29_022E9F18
ov29_022E9F18: ; 0x022E9F18
	stmdb sp!, {r3, lr}
	ldr r0, _022E9F70 ; =0x000003E7
	ldr r1, _022E9F74 ; =DUNGEON_FRAMES_PASSED
	mov r2, #0
	str r0, [r1, #4]
	ldr r0, _022E9F78 ; =ov29_02353560
	str r2, [r1, #0x10]
	strb r2, [r0, #2]
	strh r2, [r1, #0x1c]
	bl ov29_022E9CB8
	ldr r2, _022E9F7C ; =DUNGEON_PTR
	mov r3, #1
	ldr r0, [r2]
	ldr r1, _022E9F74 ; =DUNGEON_FRAMES_PASSED
	add r0, r0, #0x1a000
#ifdef JAPAN
	strb r3, [r0, #0x1a8]
#else
	strb r3, [r0, #0x24c]
#endif
	ldr r0, [r2]
	mov r2, #0
	add r0, r0, #0x1a000
#ifdef JAPAN
	strb r3, [r0, #0x1a9]
#else
	strb r3, [r0, #0x24d]
#endif
	str r2, [r1, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9F70: .word 0x000003E7
_022E9F74: .word DUNGEON_FRAMES_PASSED
_022E9F78: .word ov29_02353560
_022E9F7C: .word DUNGEON_PTR
	arm_func_end ov29_022E9F18

	arm_func_start ov29_022E9F80
ov29_022E9F80: ; 0x022E9F80
	ldr r2, _022E9F98 ; =ov29_02353560
	mov r3, #0
	strb r0, [r2]
	str r1, [r2, #8]
	str r3, [r2, #0xc]
	bx lr
	.align 2, 0
_022E9F98: .word ov29_02353560
	arm_func_end ov29_022E9F80

	arm_func_start ov29_022E9F9C
ov29_022E9F9C: ; 0x022E9F9C
	ldr r0, _022E9FBC ; =ov29_02353560
	ldrb r1, [r0, #1]
	cmp r1, #0
	ldrneb r2, [r0, #5]
	movne r1, #0
	strneb r2, [r0, #6]
	strneb r1, [r0, #1]
	bx lr
	.align 2, 0
_022E9FBC: .word ov29_02353560
	arm_func_end ov29_022E9F9C
