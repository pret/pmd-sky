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

	arm_func_start UpdateStatusIconFlags
UpdateStatusIconFlags: ; 0x022E3AB4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	bl EntityIsValid__022E37B8
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, [r4, #0xb4]
	mov r1, #0
	ldrsh r4, [r2, #2]
	mov r5, #1
	mov r0, r1
	cmp r4, #0xb9
	addne r3, r5, #0x310
	cmpne r4, r3
	bne _022E3AF8
	ldrb r3, [r2, #0xbe]
	cmp r3, #0x7f
	moveq r5, #0
_022E3AF8:
	cmp r5, #0
	beq _022E3B1C
	ldrb r5, [r2, #0xbd]
	ldr r4, _022E3D94 ; =STATUS_ICON_ARRAY_SLEEP
	add r3, r4, r5, lsl #3
	ldr r4, [r4, r5, lsl #3]
	ldr r3, [r3, #4]
	orr r1, r1, r4
	orr r0, r0, r3
_022E3B1C:
	ldrb r7, [r2, #0xbf]
	ldr r4, _022E3D98 ; =STATUS_ICON_ARRAY_BURN
	ldrb r6, [r2, #0xc4]
	ldr r3, _022E3D9C ; =STATUS_ICON_ARRAY_FREEZE
	add r5, r4, r7, lsl #3
	add ip, r3, r6, lsl #3
	ldr r4, [r4, r7, lsl #3]
	ldr lr, [r5, #4]
	ldrb sl, [r2, #0xd0]
	ldr r8, _022E3DA0 ; =STATUS_ICON_ARRAY_CRINGE
	ldrb r7, [r2, #0xd2]
	ldr r5, _022E3DA4 ; =STATUS_ICON_ARRAY_BIDE
	add fp, r8, sl, lsl #3
	add sb, r5, r7, lsl #3
	orr r0, r0, lr
	ldr lr, [ip, #4]
	ldrb ip, [r2, #0xd5]
	orr r1, r1, r4
	ldr r4, _022E3DA8 ; =STATUS_ICON_ARRAY_REFLECT
	ldr r3, [r3, r6, lsl #3]
	add r6, r4, ip, lsl #3
	orr r0, r0, lr
	ldr lr, [fp, #4]
	ldrb fp, [r2, #0xd8]
	orr r1, r1, r3
	ldr r3, _022E3DAC ; =STATUS_ICON_ARRAY_CURSE
	ldr r8, [r8, sl, lsl #3]
	add sl, r3, fp, lsl #3
	orr r0, r0, lr
	ldr lr, [sb, #4]
	ldrb sb, [r2, #0xe0]
	orr r1, r1, r8
	ldr r8, _022E3DB0 ; =STATUS_ICON_ARRAY_LEECH_SEED
	ldr r5, [r5, r7, lsl #3]
	add r7, r8, sb, lsl #3
	orr r0, r0, lr
	ldr lr, [r6, #4]
	ldrb r6, [r2, #0xec]
	orr r1, r1, r5
	ldr r5, _022E3DB4 ; =STATUS_ICON_ARRAY_SURE_SHOT
	ldr ip, [r4, ip, lsl #3]
	add r4, r5, r6, lsl #3
	orr r0, r0, lr
	ldr sl, [sl, #4]
	ldrb lr, [r2, #0xee]
	orr r1, r1, ip
	ldr ip, _022E3DB8 ; =STATUS_ICON_ARRAY_LONG_TOSS
	ldr fp, [r3, fp, lsl #3]
	add r3, ip, lr, lsl #3
	orr r0, r0, sl
	ldr sl, [r7, #4]
	ldrb r7, [r2, #0xef]
	orr fp, r1, fp
	ldr r1, _022E3DBC ; =STATUS_ICON_ARRAY_INVISIBLE
	ldr sb, [r8, sb, lsl #3]
	add r8, r1, r7, lsl #3
	orr r0, r0, sl
	ldr sl, [r4, #4]
	ldrb r4, [r2, #0xf1]
	orr fp, fp, sb
	ldr sb, _022E3DC0 ; =STATUS_ICON_ARRAY_BLINDED
	ldr r6, [r5, r6, lsl #3]
	add r5, sb, r4, lsl #3
	orr r0, r0, sl
	ldr sl, [r3, #4]
	ldrb r3, [r2, #0xf3]
	orr r6, fp, r6
	ldr fp, _022E3DC4 ; =STATUS_ICON_ARRAY_MUZZLED
	ldr ip, [ip, lr, lsl #3]
	add lr, fp, r3, lsl #3
	orr sl, r0, sl
	ldr r0, [r8, #4]
	ldr r1, [r1, r7, lsl #3]
	orr r7, r6, ip
	ldr r6, [sb, r4, lsl #3]
	orr r8, r7, r1
	ldr r4, [r5, #4]
	orr r7, sl, r0
	ldr r1, [fp, r3, lsl #3]
	orr r5, r8, r6
	ldr r0, [lr, #4]
	orr r3, r7, r4
	orr r0, r3, r0
	orr r8, r5, r1
	ldrb r7, [r2, #0xf5]
	ldr r6, _022E3DC8 ; =STATUS_ICON_ARRAY_MIRACLE_EYE
	ldrb r5, [r2, #0xf7]
	ldr r4, _022E3DCC ; =STATUS_ICON_ARRAY_MAGNET_RISE
	add r1, r6, r7, lsl #3
	add r3, r4, r5, lsl #3
	ldr r7, [r6, r7, lsl #3]
	ldr r6, [r1, #4]
	ldrb r1, [r2, #0xfd]
	ldr r4, [r4, r5, lsl #3]
	ldr r3, [r3, #4]
	orr r0, r0, r6
	orr r0, r0, r3
	cmp r1, #0
	orr r5, r8, r7
	orr r1, r5, r4
	ldrb r3, [r2, #0xfe]
	orrne r0, r0, #0
	orrne r1, r1, #0x1000000
	cmp r3, #0
	ldrb r3, [r2, #6]
	orrne r0, r0, #0
	orrne r1, r1, #0x2000000
	cmp r3, #0
	bne _022E3D00
	ldrsh r5, [r2, #0x12]
	ldrsh r4, [r2, #0x16]
	ldr r3, _022E3DD0 ; =0x000003E7
	add r5, r5, r4
	cmp r5, r3
	movgt r5, r3
	mov r3, r5, asr #1
	ldrsh r4, [r2, #0x10]
	add r3, r5, r3, lsr #30
	cmp r4, r3, asr #2
	orrlt r0, r0, #0
	orrlt r1, r1, #0x2000
_022E3D00:
	ldr r3, _022E3DD4 ; =DUNGEON_PTR
	ldr r3, [r3]
	ldrb r3, [r3, #0x78d]
	cmp r3, #0
	beq _022E3D30
	ldrb r3, [r2, #0x62]
	tst r3, #1
	movne r3, #1
	moveq r3, #0
	tst r3, #0xff
	orrne r0, r0, #0
	orrne r1, r1, #0x2000
_022E3D30:
	ldr r3, [r2, #0x34]
	cmp r3, #0x100
	ldrge r3, [r2, #0x38]
	cmpge r3, #0x100
	ldrge r3, [r2, #0x3c]
	cmpge r3, #0x100
	ldrge r3, [r2, #0x40]
	cmpge r3, #0x100
	ldrgesh r3, [r2, #0x24]
	cmpge r3, #0xa
	ldrgesh r3, [r2, #0x26]
	cmpge r3, #0xa
	ldrgesh r3, [r2, #0x28]
	cmpge r3, #0xa
	ldrgesh r3, [r2, #0x2a]
	cmpge r3, #0xa
	ldrgesh r3, [r2, #0x2c]
	cmpge r3, #0xa
	ldrgesh r3, [r2, #0x2e]
	cmpge r3, #0xa
	orrlt r1, r1, #0x8000000
	orrlt r0, r0, #0
#ifdef JAPAN
	str r1, [r2, #0x214]
	str r0, [r2, #0x218]
#else
	str r1, [r2, #0x218]
	str r0, [r2, #0x21c]
#endif
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E3D94: .word STATUS_ICON_ARRAY_SLEEP
_022E3D98: .word STATUS_ICON_ARRAY_BURN
_022E3D9C: .word STATUS_ICON_ARRAY_FREEZE
_022E3DA0: .word STATUS_ICON_ARRAY_CRINGE
_022E3DA4: .word STATUS_ICON_ARRAY_BIDE
_022E3DA8: .word STATUS_ICON_ARRAY_REFLECT
_022E3DAC: .word STATUS_ICON_ARRAY_CURSE
_022E3DB0: .word STATUS_ICON_ARRAY_LEECH_SEED
_022E3DB4: .word STATUS_ICON_ARRAY_SURE_SHOT
_022E3DB8: .word STATUS_ICON_ARRAY_LONG_TOSS
_022E3DBC: .word STATUS_ICON_ARRAY_INVISIBLE
_022E3DC0: .word STATUS_ICON_ARRAY_BLINDED
_022E3DC4: .word STATUS_ICON_ARRAY_MUZZLED
_022E3DC8: .word STATUS_ICON_ARRAY_MIRACLE_EYE
_022E3DCC: .word STATUS_ICON_ARRAY_MAGNET_RISE
_022E3DD0: .word 0x000003E7
_022E3DD4: .word DUNGEON_PTR
	arm_func_end UpdateStatusIconFlags

	arm_func_start PlayQuestionMarkEffect
PlayQuestionMarkEffect: ; 0x022E3DD8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x144
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x144
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end PlayQuestionMarkEffect

	arm_func_start PlayExclamationPointEffect__022E47D4
PlayExclamationPointEffect__022E47D4: ; 0x022E3E24
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E3E70 ; =0x00000143
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E3E70 ; =0x00000143
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E3E70: .word 0x00000143
	arm_func_end PlayExclamationPointEffect__022E47D4

	arm_func_start ov29_022E3E74
ov29_022E3E74: ; 0x022E3E74
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x25
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x25
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	ldr r1, _022E3ECC ; =0x0000030E
	mov r0, r4
	bl PlaySeByIdIfShouldDisplayEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E3ECC: .word 0x0000030E
	arm_func_end ov29_022E3E74

	arm_func_start PlayExclamationPointEffect__022E4880
PlayExclamationPointEffect__022E4880: ; 0x022E3ED0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E3F1C ; =0x00000143
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E3F1C ; =0x00000143
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E3F1C: .word 0x00000143
	arm_func_end PlayExclamationPointEffect__022E4880

	arm_func_start ov29_022E3F20
ov29_022E3F20: ; 0x022E3F20
	bx lr
	arm_func_end ov29_022E3F20

	arm_func_start ov29_022E3F24
ov29_022E3F24: ; 0x022E3F24
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E3F70 ; =0x00000141
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E3F70 ; =0x00000141
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E3F70: .word 0x00000141
	arm_func_end ov29_022E3F24

	arm_func_start ov29_022E3F74
ov29_022E3F74: ; 0x022E3F74
	bx lr
	arm_func_end ov29_022E3F74

	arm_func_start ov29_022E3F78
ov29_022E3F78: ; 0x022E3F78
	bx lr
	arm_func_end ov29_022E3F78

	arm_func_start ov29_022E3F7C
ov29_022E3F7C: ; 0x022E3F7C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #7
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #7
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E3F7C

	arm_func_start ov29_022E3FC8
ov29_022E3FC8: ; 0x022E3FC8
	bx lr
	arm_func_end ov29_022E3FC8

	arm_func_start ov29_022E3FCC
ov29_022E3FCC: ; 0x022E3FCC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #4
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #4
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E3FCC

	arm_func_start ov29_022E4014
ov29_022E4014: ; 0x022E4014
	bx lr
	arm_func_end ov29_022E4014

	arm_func_start PlayEffectAnimation0x171Full
PlayEffectAnimation0x171Full: ; 0x022E4018
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4064 ; =0x00000171
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4064 ; =0x00000171
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4064: .word 0x00000171
	arm_func_end PlayEffectAnimation0x171Full

	arm_func_start ov29_022E4068
ov29_022E4068: ; 0x022E4068
	bx lr
	arm_func_end ov29_022E4068

	arm_func_start PlayEffectAnimation0x171
PlayEffectAnimation0x171: ; 0x022E406C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E40B4 ; =0x00000171
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E40B4 ; =0x00000171
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E40B4: .word 0x00000171
	arm_func_end PlayEffectAnimation0x171

	arm_func_start ov29_022E40B8
ov29_022E40B8: ; 0x022E40B8
	bx lr
	arm_func_end ov29_022E40B8

	arm_func_start ov29_022E40BC
ov29_022E40BC: ; 0x022E40BC
	bx lr
	arm_func_end ov29_022E40BC

	arm_func_start ov29_022E40C0
ov29_022E40C0: ; 0x022E40C0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x1ac
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x1ac
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E40C0

	arm_func_start ov29_022E4108
ov29_022E4108: ; 0x022E4108
	bx lr
	arm_func_end ov29_022E4108

	arm_func_start ov29_022E410C
ov29_022E410C: ; 0x022E410C
	bx lr
	arm_func_end ov29_022E410C

	arm_func_start ov29_022E4110
ov29_022E4110: ; 0x022E4110
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #4
	bl GetEffectAnimationField0x19
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
	arm_func_end ov29_022E4110

	arm_func_start ov29_022E415C
ov29_022E415C: ; 0x022E415C
	bx lr
	arm_func_end ov29_022E415C

	arm_func_start ov29_022E4160
ov29_022E4160: ; 0x022E4160
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x1a8
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x1a8
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4160

	arm_func_start ov29_022E41AC
ov29_022E41AC: ; 0x022E41AC
	bx lr
	arm_func_end ov29_022E41AC
