	.include "asm/macros.inc"
	.include "overlay_29_022E5650.inc"

	.text

	arm_func_start ov29_022E5650
ov29_022E5650: ; 0x022E5650
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r0, _022E569C ; =0x00000167
	mov r4, r1
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E569C ; =0x00000167
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E569C: .word 0x00000167
	arm_func_end ov29_022E5650

	arm_func_start PlaySeByIdIfShouldDisplayEntity
PlaySeByIdIfShouldDisplayEntity: ; 0x022E56A0
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	bne _022E56BC
	mov r0, r4
	bl PlaySeByIdIfNotSilence
	ldmia sp!, {r4, pc}
_022E56BC:
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl PlaySeByIdIfNotSilence
	ldmia sp!, {r4, pc}
	arm_func_end PlaySeByIdIfShouldDisplayEntity

	arm_func_start ov29_022E56D4
ov29_022E56D4: ; 0x022E56D4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl ov29_022E2CA0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl PlaySeByIdIfNotSilence
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E56D4

	arm_func_start ov29_022E56F4
ov29_022E56F4: ; 0x022E56F4
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	bne _022E5710
	mov r0, r4
	bl PlayMeByIdIfNot998
	ldmia sp!, {r4, pc}
_022E5710:
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl PlaySeByIdIfNotSilence
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E56F4

	arm_func_start ov29_022E5728
ov29_022E5728: ; 0x022E5728
	stmdb sp!, {r3, lr}
	cmp r1, #0
	bne _022E5740
	ldr r0, _022E5760 ; =0x0000130E
	bl PlaySeByIdIfNotSilence
	ldmia sp!, {r3, pc}
_022E5740:
	cmp r1, #1
	bne _022E5754
	ldr r0, _022E5764 ; =0x0000130D
	bl PlaySeByIdIfNotSilence
	ldmia sp!, {r3, pc}
_022E5754:
	ldr r0, _022E5768 ; =0x0000130C
	bl PlaySeByIdIfNotSilence
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E5760: .word 0x0000130E
_022E5764: .word 0x0000130D
_022E5768: .word 0x0000130C
	arm_func_end ov29_022E5728

	arm_func_start PlayMissSfx__022E611C
PlayMissSfx__022E611C: ; 0x022E576C
	stmdb sp!, {r3, lr}
	ldr r0, [r1, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _022E578C
	ldr r0, _022E5798 ; =0x00001306
	bl PlaySeByIdIfNotSilence
	ldmia sp!, {r3, pc}
_022E578C:
	ldr r0, _022E579C ; =0x00001307
	bl PlaySeByIdIfNotSilence
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E5798: .word 0x00001306
_022E579C: .word 0x00001307
	arm_func_end PlayMissSfx__022E611C

	arm_func_start PlayMissSfx__022E6150
PlayMissSfx__022E6150: ; 0x022E57A0
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _022E57C0
	ldr r0, _022E57CC ; =0x00001306
	bl PlaySeByIdIfNotSilence
	ldmia sp!, {r3, pc}
_022E57C0:
	ldr r0, _022E57D0 ; =0x00001307
	bl PlaySeByIdIfNotSilence
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E57CC: .word 0x00001306
_022E57D0: .word 0x00001307
	arm_func_end PlayMissSfx__022E6150

	arm_func_start ov29_022E57D4
ov29_022E57D4: ; 0x022E57D4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E585C ; =0x0000025A
	bl GetEffectAnimationWanOffset
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x258
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	ldr r0, _022E5860 ; =0x0000025B
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r1, #2
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	sub r1, r2, #1
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r1, _022E5860 ; =0x0000025B
	mov r0, r4
	mov r2, #1
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E585C: .word 0x0000025A
_022E5860: .word 0x0000025B
	arm_func_end ov29_022E57D4

	arm_func_start ov29_022E5864
ov29_022E5864: ; 0x022E5864
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x16
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x16
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E5864

	arm_func_start ov29_022E58B0
ov29_022E58B0: ; 0x022E58B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r2
	mov sl, r0
	mov r5, r1
	cmp r4, #0x11
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, r5
	bl ov29_022E2CA0
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrsh r0, [r5]
	mov r2, #0x18
	add r1, sp, #0
	smulbb r0, r0, r2
	add r0, r0, #0xc
	mov r0, r0, lsl #8
	mov r0, r0, asr #8
	strh r0, [sp]
	ldrsh r3, [r5, #2]
	mov r0, r4
	smulbb r2, r3, r2
	add r2, r2, #0x10
	mov r2, r2, lsl #8
	mov r2, r2, asr #8
	strh r2, [sp, #2]
	bl ov10_022BEC08
	cmp r4, #4
	mov r6, r0
	cmpne r4, #0x18
	bne _022E5944
	mov r0, #0
	mov r1, #0x308
	bl PlaySeByIdIfShouldDisplayEntity
	mov r0, #0x28
	mov r1, #0x33
	bl ov29_022EA370
	b _022E59C4
_022E5944:
	cmp r4, #8
	bne _022E59B8
	ldr sb, [sl, #0xb4]
	mov r7, #0
	mov r0, r6, lsl #0x10
	ldrb r8, [sb, #0x4c]
	mov r4, r0, asr #0x10
	mov r5, r7
	mov fp, #2
	b _022E59A4
_022E596C:
	sub r0, r8, #1
	and r8, r0, #7
	mov r0, sl
	mov r1, r5
	mov r2, r8
	bl ChangeMonsterAnimation
	mov r0, fp
	mov r1, #0x33
	bl ov29_022EA370
	mov r0, r4
	bl AnimationHasMoreFrames
	cmp r0, #0
	beq _022E59AC
	add r7, r7, #2
_022E59A4:
	cmp r7, #0x3e8
	blt _022E596C
_022E59AC:
	and r0, r8, #7
	strb r0, [sb, #0x4c]
	b _022E59C4
_022E59B8:
	mov r0, #0x28
	mov r1, #0x33
	bl ov29_022EA370
_022E59C4:
	mov r0, r6, lsl #0x10
	mov r7, #0
	mov r4, r0, asr #0x10
	mov r5, #0x42
	b _022E59F4
_022E59D8:
	mov r0, r5
	bl AdvanceFrame
	mov r0, r4
	bl AnimationHasMoreFrames
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r7, r7, #1
_022E59F4:
	cmp r7, #0x3e8
	blt _022E59D8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_022E58B0

	arm_func_start ov29_022E5A00
ov29_022E5A00: ; 0x022E5A00
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	mov r5, r0
	mov r4, r1
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	beq _022E5AD4
	ldrb r0, [r4]
	ldr r1, [r5, #0xc]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r4, #0
	ldreqsh r4, [r4, #4]
	mov r1, r1, asr #8
	ldr r0, _022E5ADC ; =DUNGEON_PTR
	strh r1, [sp, #4]
	ldr r2, [r5, #0x10]
	ldr r1, [r0]
	mov r0, r2, asr #8
	strh r0, [sp, #6]
	ldr r0, _022E5AE0 ; =0x0001A226
	ldrsh r3, [sp, #6]
	ldrsh r1, [r1, r0]
	add r0, sp, #8
	add r2, r5, #0x2c
	sub r1, r3, r1
	add r1, r1, r1, lsr #31
	mov r3, r1, asr #1
	mov r1, #4
	add r5, r3, #1
	bl FillPixelOffsetArrayFromSprite
	add r1, sp, #4
	add r2, sp, #8
	mov r0, r4
	mov r3, #0
	str r5, [sp]
	bl ov10_022BEC94
	mov r0, r0, lsl #0x10
	mov r6, #0
	mov r4, r0, asr #0x10
	mov r5, #0x42
	b _022E5ACC
_022E5AB0:
	mov r0, r5
	bl AdvanceFrame
	mov r0, r4
	bl AnimationHasMoreFrames
	cmp r0, #0
	beq _022E5AD4
	add r6, r6, #1
_022E5ACC:
	cmp r6, #0x3e8
	blt _022E5AB0
_022E5AD4:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E5ADC: .word DUNGEON_PTR
#ifdef JAPAN
_022E5AE0: .word 0x0001A182
#else
_022E5AE0: .word 0x0001A226
#endif
	arm_func_end ov29_022E5A00

	arm_func_start ov29_022E5AE4
ov29_022E5AE4: ; 0x022E5AE4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	mov r5, r0
	mov r4, r1
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	beq _022E5BC8
	ldrb r0, [r4]
	ldr r1, [r5, #0xc]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r4, #0
	ldreqsh r4, [r4, #4]
	mov r1, r1, asr #8
	ldr r0, _022E5BD0 ; =DUNGEON_PTR
	strh r1, [sp, #4]
	ldr r2, [r5, #0x10]
	ldr r1, [r0]
	mov r0, r2, asr #8
	strh r0, [sp, #6]
	ldr r0, _022E5BD4 ; =0x0001A226
	ldrsh r3, [sp, #6]
	ldrsh r1, [r1, r0]
	add r0, sp, #8
	add r2, r5, #0x2c
	sub r1, r3, r1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	add r1, r1, #1
	mov r3, r1, lsl #0x10
	mov r1, #4
	mov r5, r3, asr #0x10
	bl FillPixelOffsetArrayFromSprite
	add r1, sp, #4
	add r2, sp, #8
	mov r0, r4
	mov r3, #1
	str r5, [sp]
	bl ov10_022BEC94
	mov r0, r0, lsl #0x10
	mov r6, #0
	mov r4, r0, asr #0x10
	mov r5, #0x42
	b _022E5BC0
_022E5B9C:
	mov r0, r5
	bl AdvanceFrame
	mov r0, r4
	bl AnimationHasMoreFrames
	cmp r0, #0
	beq _022E5BC8
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_022E5BC0:
	cmp r6, #0x3e8
	blt _022E5B9C
_022E5BC8:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E5BD0: .word DUNGEON_PTR
#ifdef JAPAN
_022E5BD4: .word 0x0001A182
#else
_022E5BD4: .word 0x0001A226
#endif
	arm_func_end ov29_022E5AE4

	arm_func_start ov29_022E5BD8
ov29_022E5BD8: ; 0x022E5BD8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	mov r5, r0
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _022E5D4C
	ldr r1, [r5, #0xb4]
	ldr r0, [r5, #0xc]
	ldrb r4, [r1, #0x4c]
	mov r1, r0, asr #8
	ldr r0, _022E5D58 ; =DUNGEON_PTR
	strh r1, [sp, #0x10]
	ldr r2, [r5, #0x10]
	ldr r1, [r0]
	mov r0, r2, asr #8
	strh r0, [sp, #0x12]
	ldr r0, _022E5D5C ; =0x0001A226
	ldrsh r2, [sp, #0x12]
	ldrsh r1, [r1, r0]
	add r0, sp, #0x14
	sub r1, r2, r1
	add r1, r1, r1, lsr #31
	mov sl, r1, asr #1
	bl ov10_022BF274
	mov r5, #0
	ldrsh r3, [sp, #0x10]
	ldrsh r2, [sp, #0x12]
	ldr r6, _022E5D60 ; =0x00000165
	sub r1, r5, #1
	add r0, sp, #0x30
	str r6, [sp, #0x14]
	str r5, [sp, #0x18]
	str r4, [sp, #0x1c]
	strh r3, [sp, #0x20]
	strh r2, [sp, #0x22]
	strh r5, [sp, #0x24]
	strh r5, [sp, #0x26]
	strb r1, [sp, #0x28]
	str sl, [sp, #0x2c]
	bl InitOamAdjustmentInfo
	add r0, sp, #0x14
	mov r1, r5
	bl ov10_022BF2B4
	ldr r2, _022E5D64 ; =DIRECTIONS_XY
	mov sb, r5
	add r1, r2, r4, lsl #2
	mov r3, r4, lsl #2
	ldrh r2, [r2, r3]
	ldrh r1, [r1, #2]
	mov r0, r0, lsl #0x10
	strh r2, [sp, #0xc]
	strh r1, [sp, #0xe]
	ldrsh r8, [sp, #0xc]
	ldrsh r7, [sp, #0xe]
	ldr r4, _022E5D58 ; =DUNGEON_PTR
	ldr fp, _022E5D5C ; =0x0001A226
	mov r5, r0, asr #0x10
	mov r6, sb
_022E5CC0:
	mov r0, r5
	add r1, sp, #0x10
	mov r2, r6
	mov r3, sl
	str r6, [sp]
	bl ov10_022BF45C
	mov r0, #0x42
	bl AdvanceFrame
	ldrsh r0, [sp, #0x12]
	ldrsh r1, [sp, #0x10]
	add sb, sb, #1
	add r0, r0, r7, lsl #2
	add r1, r1, r8, lsl #2
	strh r0, [sp, #0x12]
	strh r1, [sp, #0x10]
	ldr r0, [r4]
	ldrsh r1, [sp, #0x12]
	ldrsh r0, [r0, fp]
	cmp sb, #6
	sub r0, r1, r0
	add r0, r0, r0, lsr #31
	mov sl, r0, asr #1
	blt _022E5CC0
	bl ov10_022BDC68
	ldrsh r2, [sp, #0x10]
	ldrsh r1, [sp, #0x12]
	add r0, sp, #4
	mov r4, r2, lsl #8
	mov r3, r1, lsl #8
	mov r1, #0x1a0
	mov r2, #1
	str r4, [sp, #4]
	str r3, [sp, #8]
	bl PlayEffectAnimationPixelPos
	b _022E5D50
_022E5D4C:
	mvn r0, #0
_022E5D50:
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E5D58: .word DUNGEON_PTR
#ifdef JAPAN
_022E5D5C: .word 0x0001A182
#else
_022E5D5C: .word 0x0001A226
#endif
_022E5D60: .word 0x00000165
_022E5D64: .word DIRECTIONS_XY
	arm_func_end ov29_022E5BD8

	arm_func_start PlayStairsSfx
PlayStairsSfx: ; 0x022E5D68
	stmdb sp!, {r4, lr}
	mov r4, #0x3f00
	bl GetFloorType
	cmp r0, #0
	beq _022E5D88
	cmp r0, #1
	cmpne r0, #2
	beq _022E5DA4
_022E5D88:
	ldr r0, _022E5DB0 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl DungeonGoesUp
	cmp r0, #0
	ldrne r4, _022E5DB4 ; =0x0000130A
	ldreq r4, _022E5DB8 ; =0x00001309
_022E5DA4:
	mov r0, r4
	bl PlaySeByIdIfNotSilence
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5DB0: .word DUNGEON_PTR
_022E5DB4: .word 0x0000130A
_022E5DB8: .word 0x00001309
	arm_func_end PlayStairsSfx

	arm_func_start ov29_022E5DBC
ov29_022E5DBC: ; 0x022E5DBC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	cmp r4, #3
	bne _022E5DD8
	mov r0, #0
	bl ChangeDungeonMusic
_022E5DD8:
	cmp r5, #4
	beq _022E5E10
	cmp r4, #3
	bne _022E5DFC
	ldr r0, _022E5E7C ; =ov29_0235119C
	mov r1, r4, lsl #1
	ldrh r0, [r0, r1]
	bl PlaySeByIdIfNotSilence
	b _022E5E3C
_022E5DFC:
	ldr r0, _022E5E7C ; =ov29_0235119C
	mov r1, r4, lsl #1
	ldrh r0, [r0, r1]
	bl PlayMeByIdIfNot998
	b _022E5E3C
_022E5E10:
	cmp r4, #3
	bne _022E5E2C
	ldr r0, _022E5E80 ; =ov29_02351194
	mov r1, r4, lsl #1
	ldrh r0, [r0, r1]
	bl PlaySeByIdIfNotSilence
	b _022E5E3C
_022E5E2C:
	ldr r0, _022E5E7C ; =ov29_0235119C
	mov r1, r4, lsl #1
	ldrh r0, [r0, r1]
	bl PlayMeByIdIfNot998
_022E5E3C:
	mov r0, r5
	mov r1, r4
	mov r2, #0x80
	bl ov29_022E6A00
	mov r4, #0x46
	b _022E5E5C
_022E5E54:
	mov r0, r4
	bl AdvanceFrame
_022E5E5C:
	bl ov29_022E6C08
	cmp r0, #0
	bne _022E5E54
	bl ov29_022E6CE0
	bl ov29_02339148
	mov r0, #1
	bl ov29_0234B1A4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E5E7C: .word ov29_0235119C
_022E5E80: .word ov29_02351194
	arm_func_end ov29_022E5DBC

	arm_func_start ov29_022E5E84
ov29_022E5E84: ; 0x022E5E84
	stmdb sp!, {r4, r5, r6, lr}
	mov r1, #8
	mov r2, r1
	mov r6, r0
	bl ChangeMonsterAnimation
	mov r5, #0
	mov r4, #0x51
	b _022E5EC4
_022E5EA4:
	mov r0, r4
	bl AdvanceFrame
	ldr r0, [r6, #0x58]
	tst r0, #3
	ldreqb r0, [r6, #0xaf]
	cmpeq r0, #8
	ldmneia sp!, {r4, r5, r6, pc}
	add r5, r5, #1
_022E5EC4:
	cmp r5, #0x64
	blt _022E5EA4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_022E5E84

	arm_func_start ShouldDisplayEntityAdvanced
ShouldDisplayEntityAdvanced: ; 0x022E5ED0
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x20]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _022E5F1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
#ifdef JAPAN
	ldrb r2, [r1, #0x19a]
	cmp r2, #0
	beq _022E5F14
	ldr r1, [r1, #0x188]
#else
	ldrb r2, [r1, #0x23e]
	cmp r2, #0
	beq _022E5F14
	ldr r1, [r1, #0x22c]
#endif
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_022E5F14:
	bl ShouldDisplayEntityWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E5F1C: .word DUNGEON_PTR
	arm_func_end ShouldDisplayEntityAdvanced

	arm_func_start ov29_022E5F20
ov29_022E5F20: ; 0x022E5F20
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r0, _022E5FDC ; =0x00000199
	mov r8, #0
	ldr fp, _022E5FE0 ; =DUNGEON_PTR
	rsb r4, r0, #0x198
	mov r7, r8
	mov r6, #2
	mov r5, r8
_022E5F44:
	ldr r0, [fp]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sb, [r0, #0xad4]
#else
	ldr sb, [r0, #0xb78]
#endif
	mov r0, sb
	bl EntityIsValid__022E37B8
	cmp r0, #0
	ldrne sl, [sb, #0xb4]
	ldrneb r0, [sl, #0xfc]
	cmpne r0, #0
	beq _022E5FC8
	ldr r0, _022E5FDC ; =0x00000199
	strb r7, [sl, #0xfc]
	bl GetEffectAnimationWanOffset
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	and r3, r0, #0xff
	ldr r1, _022E5FDC ; =0x00000199
	str r5, [sp, #0xc]
	mov r0, sb
	mov r2, r5
	bl PlayEffectAnimationEntity
	ldrb r0, [sl, #6]
	cmp r0, #0
	bne _022E5FC8
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _022E5FE4 ; =0x00000B92
	mov r0, sb
	bl LogMessageByIdWithPopup
_022E5FC8:
	add r8, r8, #1
	cmp r8, #0x14
	blt _022E5F44
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E5FDC: .word 0x00000199
_022E5FE0: .word DUNGEON_PTR
#ifdef JAPAN
_022E5FE4: .word 0x000008A4
#else
_022E5FE4: .word 0x00000B92
#endif
	arm_func_end ov29_022E5F20

	arm_func_start ov29_022E5FE8
ov29_022E5FE8: ; 0x022E5FE8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r2, _022E60D4 ; =DUNGEON_PTR
	mov r6, r0
	ldr r0, [r2]
	mov r5, r1
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldr r4, [r0, #0x188]
#else
	ldr r4, [r0, #0x22c]
#endif
	cmp r4, #0
	bne _022E6018
	bl GetLeader
	mov r4, r0
_022E6018:
	ldr r0, _022E60D8 ; =ov29_023511DC
	mov r1, r6, lsl #1
	ldrh r1, [r0, r1]
	cmp r1, #0x3f00
	beq _022E6034
	mov r0, r4
	bl PlaySeByIdIfShouldDisplayEntity
_022E6034:
	ldr r0, _022E60DC ; =ov29_0235122C
	ldr r7, [r0, r6, lsl #2]
	cmp r7, #0
	blt _022E60CC
	cmp r5, #0
	beq _022E6090
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	bne _022E6090
	mov r0, r7
	bl GetEffectAnimationWanOffset
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, r7
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E60CC
_022E6090:
	ldr r0, _022E60E0 ; =ov29_0235124C
	ldr r5, [r0, r6, lsl #2]
	mov r0, r5
	bl GetEffectAnimationWanOffset
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, r5
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E60CC:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E60D4: .word DUNGEON_PTR
_022E60D8: .word ov29_023511DC
_022E60DC: .word ov29_0235122C
_022E60E0: .word ov29_0235124C
	arm_func_end ov29_022E5FE8

	arm_func_start ov29_022E60E4
ov29_022E60E4: ; 0x022E60E4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x29
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x29
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E60E4

	arm_func_start PlayEffectAnimation0x1A9__022E6130
PlayEffectAnimation0x1A9__022E6130: ; 0x022E6130
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6178 ; =0x000001A9
	bl GetEffectAnimationWanOffset
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E6178 ; =0x000001A9
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6178: .word 0x000001A9
	arm_func_end PlayEffectAnimation0x1A9__022E6130

	arm_func_start PlayEffectAnimation0x1A9__022E617C
PlayEffectAnimation0x1A9__022E617C: ; 0x022E617C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E61C4 ; =0x000001A9
	bl GetEffectAnimationWanOffset
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E61C4 ; =0x000001A9
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E61C4: .word 0x000001A9
	arm_func_end PlayEffectAnimation0x1A9__022E617C

	arm_func_start PlayEffectAnimation0x1A9__022E61C8
PlayEffectAnimation0x1A9__022E61C8: ; 0x022E61C8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6210 ; =0x000001A9
	bl GetEffectAnimationWanOffset
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E6210 ; =0x000001A9
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6210: .word 0x000001A9
	arm_func_end PlayEffectAnimation0x1A9__022E61C8

	arm_func_start PlayEffectAnimation0x1A9__022E6214
PlayEffectAnimation0x1A9__022E6214: ; 0x022E6214
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E625C ; =0x000001A9
	bl GetEffectAnimationWanOffset
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E625C ; =0x000001A9
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E625C: .word 0x000001A9
	arm_func_end PlayEffectAnimation0x1A9__022E6214

	arm_func_start ov29_022E6260
ov29_022E6260: ; 0x022E6260
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x1a8
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x1a8
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E6260

	arm_func_start PlayEffectAnimation0x29
PlayEffectAnimation0x29: ; 0x022E62A8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x29
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x29
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end PlayEffectAnimation0x29

	arm_func_start ov29_022E62F0
ov29_022E62F0: ; 0x022E62F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x48
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x48
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E62F0

	arm_func_start ov29_022E6338
ov29_022E6338: ; 0x022E6338
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6384 ; =0x000001A6
	bl GetEffectAnimationWanOffset
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x1a4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6384: .word 0x000001A6
	arm_func_end ov29_022E6338

	arm_func_start ov29_022E6388
ov29_022E6388: ; 0x022E6388
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E63D4 ; =0x00000297
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E63D4 ; =0x00000297
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E63D4: .word 0x00000297
	arm_func_end ov29_022E6388

	arm_func_start PlayEffectAnimation0x18E
PlayEffectAnimation0x18E: ; 0x022E63D8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6420 ; =0x0000018E
	bl GetEffectAnimationWanOffset
	mov r3, r0
	mov r2, #0
	mov r1, #2
	stmia sp, {r1, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	add r1, r1, #0x18c
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6420: .word 0x0000018E
	arm_func_end PlayEffectAnimation0x18E

	arm_func_start ov29_022E6424
ov29_022E6424: ; 0x022E6424
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x1b0
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x1b0
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	mov r0, #0xa
	mov r1, #0x42
	bl ov29_022EA370
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E6424

	arm_func_start ov29_022E647C
ov29_022E647C: ; 0x022E647C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x1a8
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x1a8
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E647C

	arm_func_start PlayEffectAnimation0x1A9__022E64C4
PlayEffectAnimation0x1A9__022E64C4: ; 0x022E64C4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E650C ; =0x000001A9
	bl GetEffectAnimationWanOffset
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E650C ; =0x000001A9
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E650C: .word 0x000001A9
	arm_func_end PlayEffectAnimation0x1A9__022E64C4

	arm_func_start PlayEffectAnimation0x1A9__022E6510
PlayEffectAnimation0x1A9__022E6510: ; 0x022E6510
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6558 ; =0x000001A9
	bl GetEffectAnimationWanOffset
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E6558 ; =0x000001A9
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6558: .word 0x000001A9
	arm_func_end PlayEffectAnimation0x1A9__022E6510

	arm_func_start ov29_022E655C
ov29_022E655C: ; 0x022E655C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E65A4 ; =0x000001AB
	bl GetEffectAnimationWanOffset
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E65A4 ; =0x000001AB
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E65A4: .word 0x000001AB
	arm_func_end ov29_022E655C

	arm_func_start ov29_022E65A8
ov29_022E65A8: ; 0x022E65A8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #4
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E65A8

	arm_func_start ov29_022E65F4
ov29_022E65F4: ; 0x022E65F4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6640 ; =0x0000011E
	bl GetEffectAnimationWanOffset
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x11c
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6640: .word 0x0000011E
	arm_func_end ov29_022E65F4

	arm_func_start ov29_022E6644
ov29_022E6644: ; 0x022E6644
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6690 ; =0x0000011D
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E6690 ; =0x0000011D
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6690: .word 0x0000011D
	arm_func_end ov29_022E6644

	arm_func_start PlayKeyDoorUnlockEffect
PlayKeyDoorUnlockEffect: ; 0x022E6694
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldr r1, _022E66C0 ; =0x0000019E
	mov r2, #1
	bl PlayEffectAnimationPos
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0
	mov r1, #9
	bl ov29_022E56F4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E66C0: .word 0x0000019E
	arm_func_end PlayKeyDoorUnlockEffect
