	.include "asm/macros.inc"
	.include "overlay_29_022E335C.inc"

	.text

	arm_func_start ov29_022E335C
ov29_022E335C: ; 0x022E335C
#ifdef JAPAN
#define OV29_022E335C_OFFSET -0xA4
#else
#define OV29_022E335C_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _022E3428 ; =DUNGEON_PTR
	mov r5, #0
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrb r1, [r0, #0x24d + OV29_022E335C_OFFSET]
	ldr r4, [r0, #0x22c + OV29_022E335C_OFFSET]
	cmp r1, #0
	bne _022E33A0
	bl ov10_022BFD20
	cmp r0, #0
	bne _022E33A0
	cmp r4, #0
	beq _022E33A0
	ldr r0, [r4]
	cmp r0, #1
	moveq r5, #1
_022E33A0:
	cmp r5, #0
	bne _022E33B0
	bl ov29_022E2C6C
	ldmia sp!, {r3, r4, r5, pc}
_022E33B0:
	ldr r0, _022E3428 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x21c + OV29_022E335C_OFFSET
	add r4, r0, #0x1a000
	ldr r0, [r4, #0x10]
	ldr r5, [r0, #0xb4]
	bl DisplayUi
	ldr r1, _022E3428 ; =DUNGEON_PTR
	ldr r0, _022E342C ; =0x000003E7
	ldr r1, [r1]
	ldrb r2, [r1, #0x749]
	ldrsh r1, [r1, #0x1e]
	add r1, r2, r1
	strh r1, [r4, #0x3c]
	ldrsh r2, [r5, #0x12]
	ldrsh r1, [r5, #0x16]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [r4, #0x42]
	ldrsh r0, [r5, #0x10]
	strh r0, [r4, #0x40]
	ldrb r0, [r5, #0xa]
	strh r0, [r4, #0x3e]
	ldrsh r1, [r4, #0x42]
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	strh r0, [r4, #0x44]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E3428: .word DUNGEON_PTR
_022E342C: .word 0x000003E7
	arm_func_end ov29_022E335C

	arm_func_start RevealWholeFloor
RevealWholeFloor: ; 0x022E3430
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _022E34A8 ; =DUNGEON_PTR
	mov r7, #0
	ldr r1, [r1]
	mov r4, r0
	mov r2, #1
	add r0, r1, #0x1a000
#ifdef JAPAN
	strb r2, [r0, #0x19b]
#else
	strb r2, [r0, #0x23f]
#endif
	mov r5, r7
_022E3454:
	mov r6, r5
_022E3458:
	mov r0, r6
	mov r1, r7
	bl GetTileSafe
	ldrh r1, [r0, #2]
	add r6, r6, #1
	cmp r6, #0x38
	orr r1, r1, #1
	strh r1, [r0, #2]
	blt _022E3458
	add r7, r7, #1
	cmp r7, #0x20
	blt _022E3454
	mov r0, #0
	bl UpdateCamera
	bl UpdateTrapsVisibility
	bl UpdateMinimap
	ldr r1, _022E34AC ; =0x00000B77
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E34A8: .word DUNGEON_PTR
#ifdef JAPAN
_022E34AC: .word 0x00000888
#else
_022E34AC: .word 0x00000B77
#endif
	arm_func_end RevealWholeFloor

	arm_func_start ov29_022E34B0
ov29_022E34B0: ; 0x022E34B0
	ldr r1, _022E34C4 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
#ifdef JAPAN
	strb r0, [r1, #0x1a8]
#else
	strb r0, [r1, #0x24c]
#endif
	bx lr
	.align 2, 0
_022E34C4: .word DUNGEON_PTR
	arm_func_end ov29_022E34B0

	arm_func_start ov29_022E34C8
ov29_022E34C8: ; 0x022E34C8
#ifdef JAPAN
#define OV29_022E34C8_OFFSET -0xA4
#else
#define OV29_022E34C8_OFFSET 0
#endif
	ldr r0, _022E352C ; =DUNGEON_PTR
	ldr r3, [r0]
	add r0, r3, #0x1a000
	ldr r2, [r0, #0x234 + OV29_022E34C8_OFFSET]
	cmp r2, #0
	bxeq lr
	ldr r1, _022E3530 ; =ov29_0235110C
	cmp r2, #0x1f
	movge r2, #0x1f
	ldr r2, [r1, r2, lsl #2]
	add r0, r3, #0x1a000
	ldr r1, _022E352C ; =DUNGEON_PTR
	str r2, [r0, #0x230 + OV29_022E34C8_OFFSET]
	ldr r0, [r1]
	add r0, r0, #0x1a000
	ldr r2, [r0, #0x234 + OV29_022E34C8_OFFSET]
	sub r2, r2, #1
	str r2, [r0, #0x234 + OV29_022E34C8_OFFSET]
	ldr r0, [r1]
	add r0, r0, #0x1a000
	ldr r1, [r0, #0x234 + OV29_022E34C8_OFFSET]
	cmp r1, #0
	ldreq r1, [r0, #0x238 + OV29_022E34C8_OFFSET]
	streq r1, [r0, #0x234 + OV29_022E34C8_OFFSET]
	bx lr
	.align 2, 0
_022E352C: .word DUNGEON_PTR
_022E3530: .word ov29_0235110C
	arm_func_end ov29_022E34C8

	arm_func_start ov29_022E3534
ov29_022E3534: ; 0x022E3534
	ldrb r1, [r0, #0x34]
	cmp r1, #0
	bne _022E3558
	ldrb r1, [r0, #0x23]
	cmp r1, #0
	ldreqb r0, [r0, #0x24]
	cmpeq r0, #0
	movne r0, #1
	bxne lr
_022E3558:
	mov r0, #0
	bx lr
	arm_func_end ov29_022E3534

	arm_func_start ov29_022E3560
ov29_022E3560: ; 0x022E3560
	ldr r1, _022E356C ; =ov29_0235354C
	strb r0, [r1]
	bx lr
	.align 2, 0
_022E356C: .word ov29_0235354C
	arm_func_end ov29_022E3560

	arm_func_start ov29_022E3570
ov29_022E3570: ; 0x022E3570
	ldr r0, _022E357C ; =ov29_0235354C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_022E357C: .word ov29_0235354C
	arm_func_end ov29_022E3570

	arm_func_start ov29_022E3580
ov29_022E3580: ; 0x022E3580
	ldr ip, _022E358C ; =ov10_022BF8E8
	mov r0, #0
	bx ip
	.align 2, 0
_022E358C: .word ov10_022BF8E8
	arm_func_end ov29_022E3580

	arm_func_start ov29_022E3590
ov29_022E3590: ; 0x022E3590
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r6
	mov r1, r5
	mov r2, r4
	and r3, r3, #0xff
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_022E3590

	arm_func_start PlayEffectAnimationEntity
PlayEffectAnimationEntity: ; 0x022E35E4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x30
	mov r8, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	bl EntityIsValid__022E37B8
	cmp r0, #0
	mvneq r0, #0
	beq _022E37A8
	mov r0, r8
	ldr r6, [r8, #0xb4]
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	mvneq r0, #0
	beq _022E37A8
	ldrb r0, [sp, #0x4c]
	cmp r0, #0
#ifdef JAPAN
	ldreqb r0, [r6, #0x10a]
#else
	ldreqb r0, [r6, #0x10b]
#endif
	cmpeq r0, #2
	mvneq r0, #0
	beq _022E37A8
	ldr r0, [sp, #0x48]
	cmp r0, #0
	beq _022E365C
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bl AnimationDelayOrSomething
_022E365C:
	add r0, sp, #0
	mov r2, r7
	add r1, r8, #0x2c
	bl sub_0201CF90
	ldrsh r7, [sp]
	cmp r7, #0x63
	ldrnesh r2, [sp, #2]
	cmpne r2, #0x63
	ldreq r1, [r8, #0x10]
#ifdef JAPAN
	ldreq r0, [r6, #0x184]
#else
	ldreq r0, [r6, #0x188]
#endif
	ldreq r7, [r8, #0xc]
	subeq r8, r1, r0
	beq _022E36A8
	ldr r1, [r8, #0x10]
	ldr r3, [r8, #0xc]
#ifdef JAPAN
	ldr r0, [r6, #0x184]
#else
	ldr r0, [r6, #0x188]
#endif
	add r2, r1, r2, lsl #8
	add r7, r3, r7, lsl #8
	sub r8, r2, r0
_022E36A8:
	ldr r0, _022E37B0 ; =DUNGEON_PTR
	ldr r2, _022E37B4 ; =0x0001A226
	ldr r3, [r0]
	add r0, sp, #4
	ldrsh r2, [r3, r2]
	rsb r6, r2, r1, asr #8
	bl ov10_022BF274
	ldrsh r0, [sp, #0x50]
	mov r1, #0
	str r5, [sp, #4]
	str r1, [sp, #8]
	cmp r0, #0
	blt _022E36E4
	cmp r0, #8
	ble _022E36F0
_022E36E4:
	mvn r0, #0
	str r0, [sp, #0xc]
	b _022E36F4
_022E36F0:
	str r0, [sp, #0xc]
_022E36F4:
	add r0, r6, r6, lsr #31
	mov r0, r0, asr #1
	mov r1, #0
	ldr r3, [sp, #0x54]
	mov r6, r7, asr #8
	mov r5, r8, asr #8
	add r0, r0, #1
	mvn r2, #0
	strh r6, [sp, #0x10]
	strh r5, [sp, #0x12]
	strb r2, [sp, #0x18]
	strh r1, [sp, #0x14]
	strh r1, [sp, #0x16]
	str r0, [sp, #0x1c]
	cmp r3, #0
	bne _022E3740
	add r0, sp, #0x20
	bl sub_0201C000
	b _022E3758
_022E3740:
	add r2, sp, #0x20
	mov r1, #6
_022E3748:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E3748
_022E3758:
	add r0, sp, #4
	mov r1, #0
	bl ov10_022BF2B4
	cmp r4, #0
	beq _022E37A8
	mov r0, r0, lsl #0x10
	mov r6, #0
	mov r5, r0, asr #0x10
	mov r4, #0x42
	b _022E379C
_022E3780:
	mov r0, r5
	bl AnimationHasMoreFrames
	cmp r0, #0
	beq _022E37A4
	mov r0, r4
	bl AdvanceFrame
	add r6, r6, #1
_022E379C:
	cmp r6, #0x64
	blt _022E3780
_022E37A4:
	mvn r0, #0
_022E37A8:
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E37B0: .word DUNGEON_PTR
#ifdef JAPAN
_022E37B4: .word 0x0001A182
#else
_022E37B4: .word 0x0001A226
#endif
	arm_func_end PlayEffectAnimationEntity
