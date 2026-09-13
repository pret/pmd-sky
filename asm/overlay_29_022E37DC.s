	.include "asm/macros.inc"
	.include "overlay_29_022E37DC.inc"

	.text

	arm_func_start PlayEffectAnimationPos
PlayEffectAnimationPos: ; 0x022E37DC
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldrsh ip, [r0]
	mov r3, #0x18
	smulbb ip, ip, r3
	add ip, ip, #0xc
	mov ip, ip, lsl #8
	str ip, [sp]
	ldrsh ip, [r0, #2]
	add r0, sp, #0
	smulbb r3, ip, r3
	add r3, r3, #0x10
	mov r3, r3, lsl #8
	str r3, [sp, #4]
	bl PlayEffectAnimationPixelPos
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end PlayEffectAnimationPos

	arm_func_start PlayEffectAnimationPixelPos
PlayEffectAnimationPixelPos: ; 0x022E3820
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x2c
	mov r5, r0
	add r0, sp, #0
	mov r6, r1
	mov r4, r2
	bl ov10_022BF274
	mov ip, #0
	sub r3, ip, #1
	str r6, [sp]
	str ip, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r5]
	ldr r1, _022E38DC ; =0x0000FFFF
	mov r0, r0, asr #8
	strh r0, [sp, #0xc]
	ldr r2, [r5, #4]
	add r0, sp, #0x1c
	mov r2, r2, asr #8
	strh r2, [sp, #0xe]
	strb r3, [sp, #0x14]
	strh ip, [sp, #0x10]
	strh ip, [sp, #0x12]
	str r1, [sp, #0x18]
	bl InitOamAdjustmentInfo
	add r0, sp, #0
	mov r1, #0
	bl ov10_022BF2B4
	cmp r4, #0
	beq _022E38D4
	mov r0, r0, lsl #0x10
	mov r6, #0
	mov r5, r0, asr #0x10
	mov r4, #0x42
	b _022E38C8
_022E38AC:
	mov r0, r5
	bl AnimationHasMoreFrames
	cmp r0, #0
	beq _022E38D0
	mov r0, r4
	bl AdvanceFrame
	add r6, r6, #1
_022E38C8:
	cmp r6, #0x64
	blt _022E38AC
_022E38D0:
	mvn r0, #0
_022E38D4:
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022E38DC: .word 0x0000FFFF
	arm_func_end PlayEffectAnimationPixelPos

	arm_func_start AnimationDelayOrSomething
AnimationDelayOrSomething: ; 0x022E38E0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _022E3A38 ; =DUNGEON_PTR
	mov r7, #0
	ldr r2, [r1]
	mov r1, r7
	add r2, r2, #0x1a000
	mov r8, r0
#ifdef JAPAN
	str r7, [r2, #0x194]
#else
	str r7, [r2, #0x238]
#endif
	bl ov10_022BF9CC
	cmp r0, #0
	bne _022E3920
	mov r0, r8
	mov r1, #1
	bl ov10_022BF9CC
	cmp r0, #0
	beq _022E3980
_022E3920:
	mov r7, #0
	mov r5, #1
	mov r6, r7
	mov r4, #0x4a
	b _022E3968
_022E3934:
	mov r0, r8
	mov r1, r6
	bl ov10_022BF9CC
	cmp r0, #0
	bne _022E395C
	mov r0, r8
	mov r1, r5
	bl ov10_022BF9CC
	cmp r0, #0
	beq _022E3970
_022E395C:
	mov r0, r4
	bl AdvanceFrame
	add r7, r7, #1
_022E3968:
	cmp r7, #0x3e8
	blt _022E3934
_022E3970:
	mov r0, #0x4a
	bl AdvanceFrame
	mov r0, #0x4a
	bl AdvanceFrame
_022E3980:
	cmp r7, #0x3e8
	beq _022E3990
	cmp r8, #0
	beq _022E3994
_022E3990:
	bl ov10_022BDC68
_022E3994:
	mov r0, #1
	bl ov29_022DE5F0
	cmp r0, #0x100
	bge _022E3A0C
	mov r0, #1
	bl ov29_022DE5F0
	mov r6, r0
	mov r7, #0
	mov r5, #0x4a
	mov r4, #1
	b _022E39F8
_022E39C0:
	mov r0, r5
	bl AdvanceFrame
	cmp r6, #0x100
	movge r6, #0x100
	bge _022E3A00
	add r0, r6, #4
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	mov r0, r6
	mov r1, r4
	bl ov29_022DE5D8
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_022E39F8:
	cmp r7, #0x3e8
	blt _022E39C0
_022E3A00:
	mov r0, r6
	mov r1, #1
	bl ov29_022DE5D8
_022E3A0C:
	ldr r0, _022E3A3C ; =ov29_0235354C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E3A30
	mov r0, #0x10
	bl ov29_022ED0F4
	ldr r0, _022E3A3C ; =ov29_0235354C
	mov r1, #0
	strb r1, [r0]
_022E3A30:
	bl ov29_022E6E40
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E3A38: .word DUNGEON_PTR
_022E3A3C: .word ov29_0235354C
	arm_func_end AnimationDelayOrSomething

	arm_func_start CopyStatusIconFlags
CopyStatusIconFlags: ; 0x022E3A40
	ldr r1, [r1, #0xb4]
#ifdef JAPAN
	ldr r2, [r1, #0x214]
	ldr r1, [r1, #0x218]
#else
	ldr r2, [r1, #0x218]
	ldr r1, [r1, #0x21c]
#endif
	str r2, [r0]
	str r1, [r0, #4]
	bx lr
	arm_func_end CopyStatusIconFlags

	arm_func_start ov29_022E3A58
ov29_022E3A58: ; 0x022E3A58
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, _022E3AB0 ; =DUNGEON_PTR
	mov r5, r0
	mov r4, #0
	mov r7, #1
_022E3A6C:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xad4]
#else
	ldr r8, [r0, #0xb78]
#endif
	mov r0, r8
	bl EntityIsValid__022E37B8
	cmp r0, #0
	beq _022E3AA0
	ldr r0, [r8, #0xb4]
	cmp r5, #0
#ifdef JAPAN
	strneb r7, [r0, #0x152]
#else
	strneb r7, [r0, #0x156]
#endif
	mov r0, r8
	bl UpdateStatusIconFlags
_022E3AA0:
	add r4, r4, #1
	cmp r4, #0x14
	blt _022E3A6C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E3AB0: .word DUNGEON_PTR
	arm_func_end ov29_022E3A58
