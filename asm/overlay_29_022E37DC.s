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
	bl sub_0201C000
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

	arm_func_start ov29_022E3A40
ov29_022E3A40: ; 0x022E3A40
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
	arm_func_end ov29_022E3A40

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
	bl ov29_022E56A0
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

	arm_func_start ov29_022E41B0
ov29_022E41B0: ; 0x022E41B0
	stmdb sp!, {r3, lr}
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _022E41C8 ; =0x00000221
	bl ov29_022E56A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E41C8: .word 0x00000221
	arm_func_end ov29_022E41B0

	arm_func_start ov29_022E41CC
ov29_022E41CC: ; 0x022E41CC
	ldr ip, _022E41D8 ; =ov29_022E56A0
	mov r1, #0x310
	bx ip
	.align 2, 0
_022E41D8: .word ov29_022E56A0
	arm_func_end ov29_022E41CC

	arm_func_start ov29_022E41DC
ov29_022E41DC: ; 0x022E41DC
	ldr ip, _022E41EC ; =ChangeMonsterAnimation
	mov r1, #0xa
	mov r2, #8
	bx ip
	.align 2, 0
_022E41EC: .word ChangeMonsterAnimation
	arm_func_end ov29_022E41DC

	arm_func_start ov29_022E41F0
ov29_022E41F0: ; 0x022E41F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E423C ; =0x000001A7
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E423C ; =0x000001A7
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E423C: .word 0x000001A7
	arm_func_end ov29_022E41F0

	arm_func_start ov29_022E4240
ov29_022E4240: ; 0x022E4240
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E428C ; =0x000001A7
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E428C ; =0x000001A7
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E428C: .word 0x000001A7
	arm_func_end ov29_022E4240

	arm_func_start ov29_022E4290
ov29_022E4290: ; 0x022E4290
	bx lr
	arm_func_end ov29_022E4290

	arm_func_start ov29_022E4294
ov29_022E4294: ; 0x022E4294
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x4c
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x4c
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4294

	arm_func_start ov29_022E42E0
ov29_022E42E0: ; 0x022E42E0
	bx lr
	arm_func_end ov29_022E42E0

	arm_func_start ov29_022E42E4
ov29_022E42E4: ; 0x022E42E4
	bx lr
	arm_func_end ov29_022E42E4

	arm_func_start PlayEffectAnimationEntityStandard
PlayEffectAnimationEntityStandard: ; 0x022E42E8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r5
	mov r1, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end PlayEffectAnimationEntityStandard

	arm_func_start ov29_022E4338
ov29_022E4338: ; 0x022E4338
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4384 ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4384 ; =0x000001A9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4384: .word 0x000001A9
	arm_func_end ov29_022E4338

	arm_func_start ov29_022E4388
ov29_022E4388: ; 0x022E4388
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E43D4 ; =0x0000013A
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x138
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E43D4: .word 0x0000013A
	arm_func_end ov29_022E4388

	arm_func_start ov29_022E43D8
ov29_022E43D8: ; 0x022E43D8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4424 ; =0x0000013A
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x138
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4424: .word 0x0000013A
	arm_func_end ov29_022E43D8

	arm_func_start ov29_022E4428
ov29_022E4428: ; 0x022E4428
	bx lr
	arm_func_end ov29_022E4428

	arm_func_start ov29_022E442C
ov29_022E442C: ; 0x022E442C
	bx lr
	arm_func_end ov29_022E442C

	arm_func_start ov29_022E4430
ov29_022E4430: ; 0x022E4430
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E447C ; =0x00000171
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E447C ; =0x00000171
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E447C: .word 0x00000171
	arm_func_end ov29_022E4430

	arm_func_start ov29_022E4480
ov29_022E4480: ; 0x022E4480
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
	arm_func_end ov29_022E4480

	arm_func_start ov29_022E44CC
ov29_022E44CC: ; 0x022E44CC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4518 ; =0x0000018B
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4518 ; =0x0000018B
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4518: .word 0x0000018B
	arm_func_end ov29_022E44CC

	arm_func_start ov29_022E451C
ov29_022E451C: ; 0x022E451C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4568 ; =0x0000018A
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x188
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4568: .word 0x0000018A
	arm_func_end ov29_022E451C

	arm_func_start ov29_022E456C
ov29_022E456C: ; 0x022E456C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #5
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #5
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E456C

	arm_func_start ov29_022E45B8
ov29_022E45B8: ; 0x022E45B8
	ldr ip, _022E45C4 ; =ov29_022E56A0
	ldr r1, _022E45C8 ; =0x00000227
	bx ip
	.align 2, 0
_022E45C4: .word ov29_022E56A0
_022E45C8: .word 0x00000227
	arm_func_end ov29_022E45B8

	arm_func_start ov29_022E45CC
ov29_022E45CC: ; 0x022E45CC
	bx lr
	arm_func_end ov29_022E45CC

	arm_func_start ov29_022E45D0
ov29_022E45D0: ; 0x022E45D0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #0x2f
	mov r4, r1
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x2f
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	mov r0, #0x30
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r1, #2
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	sub r1, r2, #1
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	mov r0, r5
	mov r1, #0x30
	mov r2, #1
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022E45D0

	arm_func_start ov29_022E465C
ov29_022E465C: ; 0x022E465C
	bx lr
	arm_func_end ov29_022E465C

	arm_func_start ov29_022E4660
ov29_022E4660: ; 0x022E4660
	bx lr
	arm_func_end ov29_022E4660

	arm_func_start ov29_022E4664
ov29_022E4664: ; 0x022E4664
	bx lr
	arm_func_end ov29_022E4664

	arm_func_start ov29_022E4668
ov29_022E4668: ; 0x022E4668
	bx lr
	arm_func_end ov29_022E4668

	arm_func_start ov29_022E466C
ov29_022E466C: ; 0x022E466C
	bx lr
	arm_func_end ov29_022E466C

	arm_func_start ov29_022E4670
ov29_022E4670: ; 0x022E4670
	bx lr
	arm_func_end ov29_022E4670

	arm_func_start ov29_022E4674
ov29_022E4674: ; 0x022E4674
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x21
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x21
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4674

	arm_func_start ov29_022E46C0
ov29_022E46C0: ; 0x022E46C0
	ldr ip, _022E46CC ; =ov29_022E56A0
	mov r1, #0x30c
	bx ip
	.align 2, 0
_022E46CC: .word ov29_022E56A0
	arm_func_end ov29_022E46C0

	arm_func_start ov29_022E46D0
ov29_022E46D0: ; 0x022E46D0
	bx lr
	arm_func_end ov29_022E46D0

	arm_func_start ov29_022E46D4
ov29_022E46D4: ; 0x022E46D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xb4]
	mov r1, r4
#ifdef JAPAN
	ldrb r0, [r0, #0x11a]
#else
	ldrb r0, [r0, #0x11e]
#endif
	mov r2, #1
	mov r3, #0xb
	bl DisplayAnimatedNumbers
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E46D4

	arm_func_start ov29_022E4704
ov29_022E4704: ; 0x022E4704
	ldr ip, _022E4710 ; =ov29_022E56A0
	mov r1, #0x21c
	bx ip
	.align 2, 0
_022E4710: .word ov29_022E56A0
	arm_func_end ov29_022E4704

	arm_func_start ov29_022E4714
ov29_022E4714: ; 0x022E4714
	bx lr
	arm_func_end ov29_022E4714

	arm_func_start ov29_022E4718
ov29_022E4718: ; 0x022E4718
	bx lr
	arm_func_end ov29_022E4718

	arm_func_start ov29_022E471C
ov29_022E471C: ; 0x022E471C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4768 ; =0x00000131
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4768 ; =0x00000131
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4768: .word 0x00000131
	arm_func_end ov29_022E471C

	arm_func_start ov29_022E476C
ov29_022E476C: ; 0x022E476C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x30
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x30
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E476C

	arm_func_start ov29_022E47B8
ov29_022E47B8: ; 0x022E47B8
	bx lr
	arm_func_end ov29_022E47B8

	arm_func_start ov29_022E47BC
ov29_022E47BC: ; 0x022E47BC
	bx lr
	arm_func_end ov29_022E47BC

	arm_func_start ov29_022E47C0
ov29_022E47C0: ; 0x022E47C0
	bx lr
	arm_func_end ov29_022E47C0

	arm_func_start ov29_022E47C4
ov29_022E47C4: ; 0x022E47C4
	bx lr
	arm_func_end ov29_022E47C4

	arm_func_start ov29_022E47C8
ov29_022E47C8: ; 0x022E47C8
	bx lr
	arm_func_end ov29_022E47C8

	arm_func_start ov29_022E47CC
ov29_022E47CC: ; 0x022E47CC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r1
	mov r1, #0xe
	mov r4, r0
	bl MonsterIsType
	cmp r0, #0
	beq _022E4828
	mov r0, r5
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, r5
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E4860
_022E4828:
	mov r0, #0xe
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xe
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E4860:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022E47CC

	arm_func_start ov29_022E4868
ov29_022E4868: ; 0x022E4868
	bx lr
	arm_func_end ov29_022E4868

	arm_func_start ov29_022E486C
ov29_022E486C: ; 0x022E486C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x41
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x41
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E486C

	arm_func_start ov29_022E48B8
ov29_022E48B8: ; 0x022E48B8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4910 ; =0x0000011E
	bl GetEffectAnimationField0x19
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
	mov r0, r4
	mov r1, #0x20c
	bl ov29_022E56A0
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4910: .word 0x0000011E
	arm_func_end ov29_022E48B8

	arm_func_start ov29_022E4914
ov29_022E4914: ; 0x022E4914
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4960 ; =0x000001AE
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x1ac
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4960: .word 0x000001AE
	arm_func_end ov29_022E4914

	arm_func_start ShowPpRestoreEffect
ShowPpRestoreEffect: ; 0x022E4964
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E49B0 ; =0x000001B1
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E49B0 ; =0x000001B1
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E49B0: .word 0x000001B1
	arm_func_end ShowPpRestoreEffect

	arm_func_start ov29_022E49B4
ov29_022E49B4: ; 0x022E49B4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4A00 ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4A00 ; =0x000001A9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4A00: .word 0x000001A9
	arm_func_end ov29_022E49B4

	arm_func_start ov29_022E4A04
ov29_022E4A04: ; 0x022E4A04
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4A50 ; =0x00000192
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4A50: .word 0x00000192
	arm_func_end ov29_022E4A04

	arm_func_start ov29_022E4A54
ov29_022E4A54: ; 0x022E4A54
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4AA0 ; =0x0000018E
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x18c
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4AA0: .word 0x0000018E
	arm_func_end ov29_022E4A54

	arm_func_start ov29_022E4AA4
ov29_022E4AA4: ; 0x022E4AA4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x190
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4AA4

	arm_func_start ov29_022E4AF0
ov29_022E4AF0: ; 0x022E4AF0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x15
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x15
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4AF0

	arm_func_start ov29_022E4B3C
ov29_022E4B3C: ; 0x022E4B3C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4B88 ; =0x00000171
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4B88 ; =0x00000171
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4B88: .word 0x00000171
	arm_func_end ov29_022E4B3C

	arm_func_start ov29_022E4B8C
ov29_022E4B8C: ; 0x022E4B8C
	ldr ip, _022E4B98 ; =ov29_022E56A0
	ldr r1, _022E4B9C ; =0x0000030E
	bx ip
	.align 2, 0
_022E4B98: .word ov29_022E56A0
_022E4B9C: .word 0x0000030E
	arm_func_end ov29_022E4B8C

	arm_func_start ov29_022E4BA0
ov29_022E4BA0: ; 0x022E4BA0
	ldr ip, _022E4BAC ; =ov29_022E56A0
	ldr r1, _022E4BB0 ; =0x0000030E
	bx ip
	.align 2, 0
_022E4BAC: .word ov29_022E56A0
_022E4BB0: .word 0x0000030E
	arm_func_end ov29_022E4BA0

	arm_func_start ov29_022E4BB4
ov29_022E4BB4: ; 0x022E4BB4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x15
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x15
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4BB4

	arm_func_start ov29_022E4C00
ov29_022E4C00: ; 0x022E4C00
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0xf
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xf
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4C00

	arm_func_start ov29_022E4C4C
ov29_022E4C4C: ; 0x022E4C4C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r1, #2
	mov ip, #0
	stmia sp, {r1, ip}
	sub r1, ip, #1
	str r1, [sp, #8]
	mov r1, #0x15
	mov r2, #1
	mov r3, #3
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E4C4C

	arm_func_start ov29_022E4C84
ov29_022E4C84: ; 0x022E4C84
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4CD0 ; =0x000001F7
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4CD0 ; =0x000001F7
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4CD0: .word 0x000001F7
	arm_func_end ov29_022E4C84

	arm_func_start ov29_022E4CD4
ov29_022E4CD4: ; 0x022E4CD4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4D20 ; =0x000001F9
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4D20 ; =0x000001F9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4D20: .word 0x000001F9
	arm_func_end ov29_022E4CD4

	arm_func_start ov29_022E4D24
ov29_022E4D24: ; 0x022E4D24
	bx lr
	arm_func_end ov29_022E4D24

	arm_func_start ov29_022E4D28
ov29_022E4D28: ; 0x022E4D28
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E4D80
	mov r0, #0x194
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x194
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E4DB8
_022E4D80:
	ldr r0, _022E4DC8 ; =0x00000193
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4DC8 ; =0x00000193
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E4DB8:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E4DC8: .word 0x00000193
	arm_func_end ov29_022E4D28

	arm_func_start ov29_022E4DCC
ov29_022E4DCC: ; 0x022E4DCC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E4E24
	ldr r0, _022E4E6C ; =0x0000018F
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4E6C ; =0x0000018F
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E4E5C
_022E4E24:
	ldr r0, _022E4E70 ; =0x00000191
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4E70 ; =0x00000191
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E4E5C:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E4E6C: .word 0x0000018F
_022E4E70: .word 0x00000191
	arm_func_end ov29_022E4DCC

	arm_func_start ov29_022E4E74
ov29_022E4E74: ; 0x022E4E74
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E4ECC
	ldr r0, _022E4F14 ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4F14 ; =0x000001A9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E4F04
_022E4ECC:
	ldr r0, _022E4F18 ; =0x00000192
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E4F04:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E4F14: .word 0x000001A9
_022E4F18: .word 0x00000192
	arm_func_end ov29_022E4E74

	arm_func_start ov29_022E4F1C
ov29_022E4F1C: ; 0x022E4F1C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E4F74
	ldr r0, _022E4FBC ; =0x0000018E
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x18c
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E4FAC
_022E4F74:
	mov r0, #0x190
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E4FAC:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E4FBC: .word 0x0000018E
	arm_func_end ov29_022E4F1C

	arm_func_start ov29_022E4FC0
ov29_022E4FC0: ; 0x022E4FC0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E5018
	ldr r0, _022E5060 ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5060 ; =0x000001A9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E5050
_022E5018:
	ldr r0, _022E5064 ; =0x00000192
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E5050:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E5060: .word 0x000001A9
_022E5064: .word 0x00000192
	arm_func_end ov29_022E4FC0

	arm_func_start ov29_022E5068
ov29_022E5068: ; 0x022E5068
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E50C0
	mov r0, #0x194
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x194
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E50F8
_022E50C0:
	ldr r0, _022E5108 ; =0x00000193
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5108 ; =0x00000193
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E50F8:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E5108: .word 0x00000193
	arm_func_end ov29_022E5068

	arm_func_start ov29_022E510C
ov29_022E510C: ; 0x022E510C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E5164
	ldr r0, _022E51AC ; =0x0000018E
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x18c
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E519C
_022E5164:
	mov r0, #0x190
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E519C:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E51AC: .word 0x0000018E
	arm_func_end ov29_022E510C

	arm_func_start ov29_022E51B0
ov29_022E51B0: ; 0x022E51B0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E5208
	ldr r0, _022E5250 ; =0x0000018F
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5250 ; =0x0000018F
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E5240
_022E5208:
	ldr r0, _022E5254 ; =0x00000191
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5254 ; =0x00000191
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E5240:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E5250: .word 0x0000018F
_022E5254: .word 0x00000191
	arm_func_end ov29_022E51B0

	arm_func_start ov29_022E5258
ov29_022E5258: ; 0x022E5258
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E52B0
	mov r0, #0x18c
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x18c
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E52E8
_022E52B0:
	mov r0, #0xd
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xd
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E52E8:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov29_022E5258

	arm_func_start ov29_022E52F8
ov29_022E52F8: ; 0x022E52F8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E5350
	ldr r0, _022E5398 ; =0x0000018D
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5398 ; =0x0000018D
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E5388
_022E5350:
	mov r0, #0xe
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xe
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E5388:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E5398: .word 0x0000018D
	arm_func_end ov29_022E52F8

	arm_func_start PlayExclamationPointEffect__022E5D4C
PlayExclamationPointEffect__022E5D4C: ; 0x022E539C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E53E8 ; =0x00000143
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E53E8 ; =0x00000143
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E53E8: .word 0x00000143
	arm_func_end PlayExclamationPointEffect__022E5D4C

	arm_func_start ov29_022E53EC
ov29_022E53EC: ; 0x022E53EC
	bx lr
	arm_func_end ov29_022E53EC

	arm_func_start ov29_022E53F0
ov29_022E53F0: ; 0x022E53F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x19
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x19
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E53F0

	arm_func_start ov29_022E543C
ov29_022E543C: ; 0x022E543C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r1, #2
	mov ip, #0
	stmia sp, {r1, ip}
	sub r1, ip, #1
	str r1, [sp, #8]
	mov r1, #0x15
	mov r2, #1
	mov r3, #3
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E543C

	arm_func_start ov29_022E5474
ov29_022E5474: ; 0x022E5474
	bx lr
	arm_func_end ov29_022E5474

	arm_func_start ov29_022E5478
ov29_022E5478: ; 0x022E5478
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r2, _022E5508 ; =DUNGEON_PTR
	mov r4, r0
	ldr r2, [r2]
	ldr r0, [r1, #8]
	ldrb r1, [r2, #0x1c5]
	cmp r1, #0
	beq _022E54A0
	bl ov29_0230D618
_022E54A0:
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022E54BC
_022E54AC: ; jump table
	b _022E54BC ; case 0
	b _022E54C4 ; case 1
	b _022E54CC ; case 2
	b _022E54D4 ; case 3
_022E54BC:
	mov r1, #8
	b _022E54D8
_022E54C4:
	mov r1, #9
	b _022E54D8
_022E54CC:
	mov r1, #0xa
	b _022E54D8
_022E54D4:
	mov r1, #0xb
_022E54D8:
	mov ip, #0
	mov r2, #1
	str ip, [sp]
	str r2, [sp, #4]
	sub r0, r2, #2
	str r0, [sp, #8]
	mov r0, r4
	mov r3, #3
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5508: .word DUNGEON_PTR
	arm_func_end ov29_022E5478

	arm_func_start ov29_022E550C
ov29_022E550C: ; 0x022E550C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E5558 ; =0x0000013E
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x13c
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5558: .word 0x0000013E
	arm_func_end ov29_022E550C

	arm_func_start ov29_022E555C
ov29_022E555C: ; 0x022E555C
	bx lr
	arm_func_end ov29_022E555C

	arm_func_start ov29_022E5560
ov29_022E5560: ; 0x022E5560
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r1
	cmp r2, #1
	bne _022E55B0
	mov r0, #0xf8
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xf8
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E55E8
_022E55B0:
	mov r0, #0xf9
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xf9
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E55E8:
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E5560

	arm_func_start ov29_022E55F0
ov29_022E55F0: ; 0x022E55F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r0, #0x2a
	mov r4, r1
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x2a
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E55F0

	arm_func_start ov29_022E563C
ov29_022E563C: ; 0x022E563C
	ldr ip, _022E564C ; =PlayEffectAnimationPixelPos
	mov r1, #0x90
	mov r2, #1
	bx ip
	.align 2, 0
_022E564C: .word PlayEffectAnimationPixelPos
	arm_func_end ov29_022E563C

	arm_func_start ov29_022E5650
ov29_022E5650: ; 0x022E5650
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r0, _022E569C ; =0x00000167
	mov r4, r1
	bl GetEffectAnimationField0x19
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

	arm_func_start ov29_022E56A0
ov29_022E56A0: ; 0x022E56A0
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	bne _022E56BC
	mov r0, r4
	bl ov29_022EACCC
	ldmia sp!, {r4, pc}
_022E56BC:
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl ov29_022EACCC
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E56A0

	arm_func_start ov29_022E56D4
ov29_022E56D4: ; 0x022E56D4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl ov29_022E2CA0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl ov29_022EACCC
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E56D4

	arm_func_start ov29_022E56F4
ov29_022E56F4: ; 0x022E56F4
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	bne _022E5710
	mov r0, r4
	bl ov29_022EACE4
	ldmia sp!, {r4, pc}
_022E5710:
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl ov29_022EACCC
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E56F4

	arm_func_start ov29_022E5728
ov29_022E5728: ; 0x022E5728
	stmdb sp!, {r3, lr}
	cmp r1, #0
	bne _022E5740
	ldr r0, _022E5760 ; =0x0000130E
	bl ov29_022EACCC
	ldmia sp!, {r3, pc}
_022E5740:
	cmp r1, #1
	bne _022E5754
	ldr r0, _022E5764 ; =0x0000130D
	bl ov29_022EACCC
	ldmia sp!, {r3, pc}
_022E5754:
	ldr r0, _022E5768 ; =0x0000130C
	bl ov29_022EACCC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E5760: .word 0x0000130E
_022E5764: .word 0x0000130D
_022E5768: .word 0x0000130C
	arm_func_end ov29_022E5728

	arm_func_start ov29_022E576C
ov29_022E576C: ; 0x022E576C
	stmdb sp!, {r3, lr}
	ldr r0, [r1, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _022E578C
	ldr r0, _022E5798 ; =0x00001306
	bl ov29_022EACCC
	ldmia sp!, {r3, pc}
_022E578C:
	ldr r0, _022E579C ; =0x00001307
	bl ov29_022EACCC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E5798: .word 0x00001306
_022E579C: .word 0x00001307
	arm_func_end ov29_022E576C

	arm_func_start ov29_022E57A0
ov29_022E57A0: ; 0x022E57A0
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _022E57C0
	ldr r0, _022E57CC ; =0x00001306
	bl ov29_022EACCC
	ldmia sp!, {r3, pc}
_022E57C0:
	ldr r0, _022E57D0 ; =0x00001307
	bl ov29_022EACCC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E57CC: .word 0x00001306
_022E57D0: .word 0x00001307
	arm_func_end ov29_022E57A0

	arm_func_start ov29_022E57D4
ov29_022E57D4: ; 0x022E57D4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E585C ; =0x0000025A
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl ov29_022E56A0
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
	bl sub_0201D034
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
	bl sub_0201D034
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
	bl sub_0201C000
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

	arm_func_start ov29_022E5D68
ov29_022E5D68: ; 0x022E5D68
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
	bl ov29_022EACCC
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5DB0: .word DUNGEON_PTR
_022E5DB4: .word 0x0000130A
_022E5DB8: .word 0x00001309
	arm_func_end ov29_022E5D68

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
	bl ov29_022EACCC
	b _022E5E3C
_022E5DFC:
	ldr r0, _022E5E7C ; =ov29_0235119C
	mov r1, r4, lsl #1
	ldrh r0, [r0, r1]
	bl ov29_022EACE4
	b _022E5E3C
_022E5E10:
	cmp r4, #3
	bne _022E5E2C
	ldr r0, _022E5E80 ; =ov29_02351194
	mov r1, r4, lsl #1
	ldrh r0, [r0, r1]
	bl ov29_022EACCC
	b _022E5E3C
_022E5E2C:
	ldr r0, _022E5E7C ; =ov29_0235119C
	mov r1, r4, lsl #1
	ldrh r0, [r0, r1]
	bl ov29_022EACE4
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
	bl GetEffectAnimationField0x19
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
	bl ov29_022E56A0
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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

	arm_func_start ov29_022E62A8
ov29_022E62A8: ; 0x022E62A8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x29
	bl GetEffectAnimationField0x19
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
	arm_func_end ov29_022E62A8

	arm_func_start ov29_022E62F0
ov29_022E62F0: ; 0x022E62F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x48
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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
	arm_func_end ov29_022E65A8

	arm_func_start ov29_022E65F4
ov29_022E65F4: ; 0x022E65F4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6640 ; =0x0000011E
	bl GetEffectAnimationField0x19
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
	bl GetEffectAnimationField0x19
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

	arm_func_start ov29_022E6694
ov29_022E6694: ; 0x022E6694
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
	arm_func_end ov29_022E6694

	arm_func_start ov29_022E66C4
ov29_022E66C4: ; 0x022E66C4
	ldr ip, _022E66D4 ; =PlayEffectAnimationPos
	mov r1, #0x36
	mov r2, #1
	bx ip
	.align 2, 0
_022E66D4: .word PlayEffectAnimationPos
	arm_func_end ov29_022E66C4

	arm_func_start ov29_022E66D8
ov29_022E66D8: ; 0x022E66D8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x15
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x15
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E66D8

	arm_func_start ov29_022E6724
ov29_022E6724: ; 0x022E6724
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x1b4
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x1b4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E6724

	arm_func_start ov29_022E6770
ov29_022E6770: ; 0x022E6770
	ldr ip, _022E6780 ; =PlayEffectAnimationPos
	mov r1, #0x37
	mov r2, #1
	bx ip
	.align 2, 0
_022E6780: .word PlayEffectAnimationPos
	arm_func_end ov29_022E6770

	arm_func_start ov29_022E6784
ov29_022E6784: ; 0x022E6784
	ldr ip, _022E6794 ; =PlayEffectAnimationPos
	mov r1, #0x29
	mov r2, #1
	bx ip
	.align 2, 0
_022E6794: .word PlayEffectAnimationPos
	arm_func_end ov29_022E6784

	arm_func_start ov29_022E6798
ov29_022E6798: ; 0x022E6798
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x18
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x18
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E6798

	arm_func_start ov29_022E67E4
ov29_022E67E4: ; 0x022E67E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r4, r2
	mov r5, #0x200
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	beq _022E68AC
	mov r0, r7
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r6
	mov r1, r7
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	mov r0, r4
	mov r1, #0x42
	bl ov29_022EA370
	mov r4, #0x42
	ldr sb, _022E68B4 ; =DUNGEON_PTR
	ldr r7, _022E68B8 ; =0x0001A226
	mvn r8, #7
	b _022E6894
_022E6860:
	mov r0, r4
	bl AdvanceFrame
	ldr r0, [r6, #0x1c]
	add r2, r0, r5
	str r2, [r6, #0x1c]
	ldr r0, [sb]
	ldr r1, [r6, #0x10]
	ldrsh r0, [r0, r7]
	sub r1, r1, r2
	add r5, r5, #0x100
	rsb r0, r0, r1, asr #8
	cmp r0, r8
	blt _022E68A0
_022E6894:
	ldr r0, [r6, #0x1c]
	cmp r0, #0xc800
	blt _022E6860
_022E68A0:
	mov r0, #0
	strb r0, [r6, #0x20]
	bl AnimationDelayOrSomething
_022E68AC:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022E68B4: .word DUNGEON_PTR
#ifdef JAPAN
_022E68B8: .word 0x0001A182
#else
_022E68B8: .word 0x0001A226
#endif
	arm_func_end ov29_022E67E4

	arm_func_start ov29_022E68BC
ov29_022E68BC: ; 0x022E68BC
	ldr ip, _022E68D0 ; =ov29_022E67E4
	mov r1, r0
	ldr r0, _022E68D4 ; =0x0000013E
	mov r2, #5
	bx ip
	.align 2, 0
_022E68D0: .word ov29_022E67E4
_022E68D4: .word 0x0000013E
	arm_func_end ov29_022E68BC

	arm_func_start ov29_022E68D8
ov29_022E68D8: ; 0x022E68D8
	ldr ip, _022E68EC ; =ov29_022E67E4
	mov r1, r0
	mov r0, #0x1bc
	mov r2, #0xe
	bx ip
	.align 2, 0
_022E68EC: .word ov29_022E67E4
	arm_func_end ov29_022E68D8

	arm_func_start ov29_022E68F0
ov29_022E68F0: ; 0x022E68F0
	ldr ip, _022E6904 ; =ov29_022E67E4
	mov r1, r0
	ldr r0, _022E6908 ; =0x0000013E
	mov r2, #5
	bx ip
	.align 2, 0
_022E6904: .word ov29_022E67E4
_022E6908: .word 0x0000013E
	arm_func_end ov29_022E68F0

	arm_func_start ov29_022E690C
ov29_022E690C: ; 0x022E690C
	ldr ip, _022E6920 ; =ov29_022E67E4
	mov r1, r0
	ldr r0, _022E6924 ; =0x0000013E
	mov r2, #5
	bx ip
	.align 2, 0
_022E6920: .word ov29_022E67E4
_022E6924: .word 0x0000013E
	arm_func_end ov29_022E690C

	arm_func_start ov29_022E6928
ov29_022E6928: ; 0x022E6928
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x1c
	ldr r3, _022E69F8 ; =ov29_023511B0
	mov r4, r1
	add r2, sp, #0x10
	mov r5, r0
	mov r1, #6
_022E6944:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E6944
	ldr r0, _022E69FC ; =0x0000027A
	bl GetEffectAnimationField0x19
	mov r3, #2
	mov r1, r4, lsr #0x1f
	mov ip, r0
	rsb r0, r1, r4, lsl #29
	add r0, r1, r0, ror #29
	mov r0, r0, lsl #0x10
	str r3, [sp]
	mov r2, #0
	add r1, r3, #0x278
	str r2, [sp, #4]
	mov r0, r0, asr #0x10
	str r0, [sp, #8]
	add r4, sp, #0x10
	mov r0, r5
	and r3, ip, #0xff
	str r4, [sp, #0xc]
	bl PlayEffectAnimationEntity
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	mov r6, #0
	mov r4, #0x42
	b _022E69D8
_022E69B4:
	mov r0, r5
	bl AnimationHasMoreFrames
	cmp r0, #0
	beq _022E69E0
	mov r0, r4
	bl AdvanceFrame
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_022E69D8:
	cmp r6, #0x64
	blt _022E69B4
_022E69E0:
	cmp r5, #0
	blt _022E69F0
	mov r0, r5
	bl ov10_022BDE50
_022E69F0:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022E69F8: .word ov29_023511B0
_022E69FC: .word 0x0000027A
	arm_func_end ov29_022E6928

	arm_func_start ov29_022E6A00
ov29_022E6A00: ; 0x022E6A00
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x38
	mov r8, r0
	mov r7, r1
	mov r4, r2
	mov r5, #0
	bl GetLeader
	mov r6, r0
	mov r0, #0xcc
	mov r1, #7
	bl MemAlloc
	ldr r1, _022E6BF8 ; =ov29_0235354C
	add r2, r7, #1
	str r0, [r1, #4]
	str r8, [r0]
	ldr r0, [r1, #4]
	mov r2, r2, lsl #2
	str r2, [r0, #8]
	ldr r0, [r1, #4]
	ldr r3, _022E6BFC ; =ov29_023511A4
	str r4, [r0, #4]
	add r2, sp, #0
	mov r4, r5
	mov r1, #6
_022E6A60:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E6A60
	b _022E6BDC
_022E6A74:
	add r0, sp, #0xc
	bl ov10_022BF274
	ldr r0, _022E6BF8 ; =ov29_0235354C
	ldr r2, _022E6C00 ; =ov29_02351464
	ldr r7, [r0, #4]
	mov r0, #0x18
	ldr r3, [r7]
	mov r1, #0
	mla r0, r3, r0, r2
	mov r2, r5, lsl #3
	ldrsh r0, [r2, r0]
	str r4, [sp, #0x10]
	str r1, [sp, #0x14]
	str r0, [sp, #0xc]
	ldr r1, [r6, #0xc]
	mov r0, #2
	mov r1, r1, asr #8
	strh r1, [sp, #0x18]
	ldr r1, [r6, #0x10]
	mov r1, r1, asr #8
	strh r1, [sp, #0x1a]
	bl RandIntSafe
	ldr r3, [r7]
	ldr r2, _022E6C00 ; =ov29_02351464
	mov r1, #0x18
	mla r1, r3, r1, r2
	add r1, r1, r5, lsl #3
	ldr r2, [r1, #4]
	add r1, r7, r4, lsl #2
	add r2, r0, r2, lsl #1
	mov r0, #0xff
	str r2, [r1, #0x4c]
	bl RandIntSafe
	ldr r1, _022E6BF8 ; =ov29_0235354C
	mov r2, r4, lsl #1
	ldr r1, [r1, #4]
	add r3, r0, #0x9f
	add r1, r1, r4, lsl #2
	add r0, r2, #8
	strh r3, [r1, #0x8c]
	bl RandIntSafe
	mov r2, r4, lsr #0x1f
	rsb r1, r2, r4, lsl #30
	add r2, r2, r1, ror #30
	mov r1, #0x28
	mul r7, r2, r1
	rsb r2, r7, #0x18
	ldr r3, _022E6BF8 ; =ov29_0235354C
	add r2, r2, r0
	ldr r1, [r3, #4]
	mov r7, #4
	add r0, r1, r4, lsl #2
	strh r2, [r0, #0x8e]
	ldr r1, [r3, #4]
	ldr r0, _022E6C04 ; =0x0000FFFF
	add r2, r1, r4, lsl #2
	ldrsh r1, [r2, #0x8c]
	add r3, sp, #0
	strh r1, [sp, #0x1c]
	ldrsh ip, [r2, #0x8e]
	add r2, sp, #0x28
	mov r1, #6
	strh ip, [sp, #0x1e]
	strb r7, [sp, #0x20]
	str r0, [sp, #0x24]
_022E6B78:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E6B78
	add r0, sp, #0xc
	mov r1, #0
	bl ov10_022BF2B4
	ldr r1, _022E6BF8 ; =ov29_0235354C
	add r5, r5, #1
	ldr r2, [r1, #4]
	cmp r5, #3
	add r2, r2, r4, lsl #2
	str r0, [r2, #0xc]
	bge _022E6BD4
	ldr r0, [r1, #4]
	ldr r1, _022E6C00 ; =ov29_02351464
	ldr r2, [r0]
	mov r0, #0x18
	mla r0, r2, r0, r1
	mov r1, r5, lsl #3
	ldrsh r0, [r1, r0]
	cmp r0, #0
	bne _022E6BD8
_022E6BD4:
	mov r5, #0
_022E6BD8:
	add r4, r4, #1
_022E6BDC:
	ldr r0, _022E6BF8 ; =ov29_0235354C
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	cmp r4, r0
	blt _022E6A74
	add sp, sp, #0x38
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E6BF8: .word ov29_0235354C
_022E6BFC: .word ov29_023511A4
_022E6C00: .word ov29_02351464
_022E6C04: .word 0x0000FFFF
	arm_func_end ov29_022E6A00

	arm_func_start ov29_022E6C08
ov29_022E6C08: ; 0x022E6C08
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	ldr r0, _022E6CDC ; =ov29_0235354C
	mov sl, #0
	ldr r1, [r0, #4]
	mov sb, #0
	ldr r0, [r1, #4]
	mov r6, #1
	cmp r0, #0
	subne r0, r0, #1
	strne r0, [r1, #4]
	movne sb, #1
	mvn r7, #0x9e
	mov r8, #0x9f
	mov r5, sl
	ldr r4, _022E6CDC ; =ov29_0235354C
	b _022E6CC0
_022E6C4C:
	ldr r0, [r4, #4]
	add r2, r0, sl, lsl #2
	ldrsh r1, [r2, #0x8c]
	ldr r0, [r2, #0x4c]
	sub r0, r1, r0
	strh r0, [r2, #0x8c]
	ldr r2, [r4, #4]
	add r1, r2, sl, lsl #2
	ldrsh r0, [r1, #0x8c]
	cmp r0, r7
	bgt _022E6C8C
	ldr r0, [r2, #4]
	cmp r0, #0
	strgth r8, [r1, #0x8c]
	strleh r7, [r1, #0x8c]
	b _022E6C90
_022E6C8C:
	mov sb, r6
_022E6C90:
	ldr r2, [r4, #4]
	mov r1, r5
	str r5, [sp]
	add r0, r2, sl, lsl #2
	ldr r0, [r0, #0xc]
	add r2, r2, #0x8c
	mov r0, r0, lsl #0x10
	mov r3, r5
	mov r0, r0, asr #0x10
	add r2, r2, sl, lsl #2
	bl ov10_022BF45C
	add sl, sl, #1
_022E6CC0:
	ldr r0, [r4, #4]
	ldr r0, [r0, #8]
	cmp sl, r0
	blt _022E6C4C
	mov r0, sb
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022E6CDC: .word ov29_0235354C
	arm_func_end ov29_022E6C08

	arm_func_start ov29_022E6CE0
ov29_022E6CE0: ; 0x022E6CE0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, _022E6D64 ; =ov29_0235354C
	ldr r0, [r5, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r4, #0
	b _022E6D34
_022E6CFC:
	add r0, r1, r4, lsl #2
	ldr r0, [r0, #0xc]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl AnimationHasMoreFrames
	cmp r0, #0
	beq _022E6D30
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0xc]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BDE50
_022E6D30:
	add r4, r4, #1
_022E6D34:
	ldr r1, [r5, #4]
	ldr r0, [r1, #8]
	cmp r4, r0
	blt _022E6CFC
	bl ov10_022BDC68
	ldr r0, _022E6D64 ; =ov29_0235354C
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022E6D64 ; =ov29_0235354C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E6D64: .word ov29_0235354C
	arm_func_end ov29_022E6CE0

	arm_func_start ov29_022E6D68
ov29_022E6D68: ; 0x022E6D68
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _022E6DCC ; =DUNGEON_PTR
	mov r4, #0
	ldr r3, [r3]
	add r3, r3, #0x218
	add lr, r3, #0x400
	mvn r3, #0
	b _022E6DC0
_022E6D88:
	ldr ip, [lr, r4, lsl #4]
	add r5, lr, r4, lsl #4
	cmp ip, r3
	bne _022E6DBC
	str r0, [r5]
	str r1, [r5, #0xc]
	str r2, [r5, #4]
	ldr r0, [r5]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BEFD8
	strb r0, [r5, #8]
	ldmia sp!, {r3, r4, r5, pc}
_022E6DBC:
	add r4, r4, #1
_022E6DC0:
	cmp r4, #3
	blt _022E6D88
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E6DCC: .word DUNGEON_PTR
	arm_func_end ov29_022E6D68

	arm_func_start ov29_022E6DD0
ov29_022E6DD0: ; 0x022E6DD0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, #0
	ldr r4, _022E6E3C ; =DUNGEON_PTR
	mov r7, sb
	mov r8, #1
	mvn r6, #0
	mov r5, sb
_022E6DEC:
	ldr r0, [r4]
	add r0, r0, #0x218
	add r0, r0, #0x400
	ldr r1, [r0, sb, lsl #4]
	add sl, r0, sb, lsl #4
	cmp r1, #0
	movge r0, r8
	movlt r0, r7
	tst r0, #0xff
	beq _022E6E2C
	mov r0, r1, lsl #0x10
	mov r0, r0, asr #0x10
	bl AnimationHasMoreFrames
	cmp r0, #0
	streq r6, [sl]
	streq r5, [sl, #0xc]
_022E6E2C:
	add sb, sb, #1
	cmp sb, #3
	blt _022E6DEC
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022E6E3C: .word DUNGEON_PTR
	arm_func_end ov29_022E6DD0

	arm_func_start ov29_022E6E40
ov29_022E6E40: ; 0x022E6E40
	mov ip, #0
	ldr r1, _022E6E7C ; =DUNGEON_PTR
	mvn r3, #0
	mov r2, ip
_022E6E50:
	ldr r0, [r1]
	add r0, r0, #0x218
	add r0, r0, #0x400
	str r3, [r0, ip, lsl #4]
	add r0, r0, ip, lsl #4
	str r2, [r0, #4]
	add ip, ip, #1
	str r2, [r0, #0xc]
	cmp ip, #3
	blt _022E6E50
	bx lr
	.align 2, 0
_022E6E7C: .word DUNGEON_PTR
	arm_func_end ov29_022E6E40

	arm_func_start ov29_022E6E80
ov29_022E6E80: ; 0x022E6E80
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	ldr r2, _022E6F8C ; =ov29_0235118C
	mov sl, r0
	ldrh r5, [r2, #4]
	ldrh r4, [r2, #6]
	ldrh r3, [r2]
	ldrh r0, [r2, #2]
	strh r5, [sp, #0x10]
	strh r4, [sp, #0x12]
	strh r0, [sp, #0xe]
	strh r3, [sp, #0xc]
	mvn r0, #0
	ldrh r6, [sp, #0x10]
	ldrh r5, [sp, #0x12]
	ldrh r4, [sp, #0xc]
	ldrh fp, [sp, #0xe]
	str r1, [sp, #4]
	mov r7, #0
	str r0, [sp, #8]
_022E6ED0:
	ldr r0, _022E6F90 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x218
	add r0, r0, #0x400
	add r8, r0, r7, lsl #4
	ldr r0, [r0, r7, lsl #4]
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	tst r0, #0xff
	beq _022E6F78
	ldr r0, [r8, #0xc]
	cmp r0, sl
	bne _022E6F78
	strh r6, [sp, #0x18]
	strh r5, [sp, #0x1a]
	ldr r0, [sl, #0xc]
	mov r0, r0, asr #8
	strh r0, [sp, #0x18]
	ldr r0, [sl, #0x10]
	mov r0, r0, asr #8
	strh r0, [sp, #0x1a]
	strh r4, [sp, #0x14]
	strh fp, [sp, #0x16]
	ldrsb r1, [r8, #8]
	ldr r0, [sp, #8]
	ldr sb, [sl, #0xb4]
	cmp r1, r0
	beq _022E6F54
	and r2, r1, #0xff
	add r0, sp, #0x14
	add r1, sl, #0x2c
	bl sub_0201CF90
_022E6F54:
	ldrb r0, [sb, #0x4c]
	ldr r3, [sp, #4]
	add r1, sp, #0x18
	str r0, [sp]
	ldr r0, [r8]
	add r2, sp, #0x14
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BFB6C
_022E6F78:
	add r7, r7, #1
	cmp r7, #3
	blt _022E6ED0
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E6F8C: .word ov29_0235118C
_022E6F90: .word DUNGEON_PTR
	arm_func_end ov29_022E6E80

	arm_func_start ov29_022E6F94
ov29_022E6F94: ; 0x022E6F94
	ldr r1, _022E6FB8 ; =DUNGEON_PTR
	mov r2, #0xff
	ldr r0, [r1]
	add r0, r0, #0x28000
#ifdef JAPAN
	strb r2, [r0, #0x60c]
	ldr r0, [r1]
	add r0, r0, #0x28000
	strb r2, [r0, #0x60d]
#else
	strb r2, [r0, #0x6b0]
	ldr r0, [r1]
	add r0, r0, #0x28000
	strb r2, [r0, #0x6b1]
#endif
	bx lr
	.align 2, 0
_022E6FB8: .word DUNGEON_PTR
	arm_func_end ov29_022E6F94

	arm_func_start LoadMappaFileAttributes
LoadMappaFileAttributes: ; 0x022E6FBC
#ifdef JAPAN
#define LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET -0xA4
#else
#define LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x50
	ldr r3, _022E79E4 ; =DUNGEON_PTR
	ldr r4, _022E79E8 ; =ov29_02351584
	ldr r6, [r3]
	ldr r7, [r4, #0xc]
	ldr r8, [r4, #8]
	add r3, r6, #0x4a
	str r1, [sp]
	add r4, r6, #0x348
	mov r5, r0
	add r1, r4, #0x400
	add r0, r3, #0x700
	mov r4, r2
	str r8, [sp, #0x48]
	str r7, [sp, #0x4c]
	bl DungeonFloorToGroupFloor
	ldr r1, _022E79E4 ; =DUNGEON_PTR
	ldr r3, [r1]
	ldrb r2, [r3, #0x74a]
	add r0, r3, #0x28000
	strb r2, [r0, #0x6b0 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET]
	ldrb r2, [r3, #0x74b]
	strb r2, [r0, #0x6b1 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET]
	ldr r0, [r1]
	ldrb r0, [r0, #0x748]
	bl GetNbPrecedingFloors
	ldr r1, _022E79E4 ; =DUNGEON_PTR
	mov r6, #0
	ldr r2, [r1]
	strh r0, [r2, #0x20]
	ldr r0, [r1]
	strh r6, [r0, #0x1e]
	ldr r3, [r1]
	ldrsh r2, [r3, #0x20]
	ldrsh r0, [r3, #0x1e]
	add r0, r2, r0
	strh r0, [r3, #0x22]
	ldr r0, [r1]
	str r6, [sp, #0x28]
	ldr r0, [r0, #0x7cc]
	mov r2, #0xf
	cmp r0, #1
	bne _022E707C
	ldr r1, _022E79EC ; =ov29_02351594
	add r0, sp, #0x48
	bl LoadFileFromRom
	b _022E709C
_022E707C:
	cmp r0, #2
	add r0, sp, #0x48
	bne _022E7094
	ldr r1, _022E79F0 ; =ov29_023515B0
	bl LoadFileFromRom
	b _022E709C
_022E7094:
	ldr r1, _022E79F4 ; =ov29_023515CC
	bl LoadFileFromRom
_022E709C:
	mov r0, #0x65
	bl AdvanceFrame
	ldr r1, [sp, #0x48]
	add r0, sp, #0x28
	bl HandleSir0Translation
	mov r0, #0x65
	ldr sb, [sp, #0x28]
	bl AdvanceFrame
	ldr r0, _022E79E4 ; =DUNGEON_PTR
	ldr r6, [sb]
	ldr r7, [r0]
	mov r1, #0x12
	add r0, r7, #0x28000
	ldrb r3, [r0, #0x6b0 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET]
	ldrb r2, [r0, #0x6b1 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET]
	ldrb r0, [r7, #0x748]
	ldr r3, [r6, r3, lsl #2]
	mla r6, r2, r1, r3
	bl GetNbFloorsPlusOne
	ldr r2, _022E79E4 ; =DUNGEON_PTR
	ldr r1, [r2]
	add r1, r1, #0x2c000
	strb r0, [r1, #0xaf4 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET]
	ldr r0, [r2]
	ldrb r0, [r0, #0x748]
	cmp r0, #0xae
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	beq _022E7138
	bl CheckActiveChallengeRequest
	cmp r0, #0
	bne _022E7138
	ldr r0, _022E79E4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x2c000
	ldrb r1, [r0, #0xaf4 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET]
	sub r1, r1, #1
	strb r1, [r0, #0xaf4 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET]
_022E7138:
	ldr r0, _022E79E4 ; =DUNGEON_PTR
	ldrsh r2, [r6]
	ldr r3, [sb, #4]
	ldr r1, [r0]
	add r7, r3, r2, lsl #5
	ldr r0, _022E79F8 ; =0x000286B2
	mov r2, #0x10
	add r3, r1, r0
_022E7158:
	ldrh r0, [r7], #2
	subs r2, r2, #1
	strh r0, [r3], #2
	bne _022E7158
#ifdef JAPAN
	ldr r0, _022E79FC ; =0x000286CE
	ldr r2, _022E7A00 ; =0x0002CB08
	ldrsh r3, [r1, r0]
	mov r0, #0
	strh r3, [r1, r2]
	ldr r2, _022E79E4 ; =DUNGEON_PTR
_022E7184:
	ldrsh r3, [r6, #4]
	ldr r7, [sb, #0x10]
	ldr r1, [r2]
	ldr r7, [r7, r3, lsl #2]
	mov r3, r0, lsl #1
	ldrh r3, [r7, r3]
	add r1, r1, r0, lsl #1
	add r1, r1, #0x2c800
	add r0, r0, #1
	strh r3, [r1, #0x8e]
#else
	ldr r2, _022E79FC ; =0x000286CE
	ldr r3, _022E7A00 ; =0x0002CB08
	ldrsh r7, [r1, r2]
	mov r0, #0
	strh r7, [r1, r3]
	rsb r1, r2, #0x55000
	ldr r2, _022E79E4 ; =DUNGEON_PTR
_022E7184:
	ldrsh r7, [r6, #4]
	ldr r8, [sb, #0x10]
	ldr r3, [r2]
	ldr r8, [r8, r7, lsl #2]
	mov r7, r0, lsl #1
	ldrh r7, [r8, r7]
	add r3, r3, r0, lsl #1
	add r0, r0, #1
	strh r7, [r3, r1]
#endif
	cmp r0, #0x19
	blt _022E7184
	cmp r4, #0
	beq _022E71C0
	mov r0, r5
	blx r4
_022E71C0:
	cmp r5, #0
	bne _022E7674
	ldr r0, _022E79E8 ; =ov29_02351584
	mov r4, #0
	ldrh r2, [r0]
	ldrh r1, [r0, #2]
	mov r0, r4
	mov r8, r4
	str r4, [sp, #0xc]
	str r4, [sp, #4]
	strh r2, [sp, #0x44]
	strh r1, [sp, #0x46]
	mov fp, #1
	bl DungeonRngSetSecondary
	bl IsDestinationFloorWithMonster
	str r0, [sp, #0x10]
	ldr r3, _022E7A04 ; =0x0000FFFF
	ldr r1, _022E79E4 ; =DUNGEON_PTR
	ldr r0, _022E7A08 ; =0x0002C9EA
	mov r5, r4
_022E7210:
	ldr r2, [r1]
	add r2, r2, r5, lsl #1
	strh r3, [r2, r0]
	add r5, r5, #1
	cmp r5, #0x10
	blt _022E7210
	bl IsItemForSpecialSpawnInBag
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #4]
	ldr r0, _022E79E4 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsDojoDungeon
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #4]
	ldr r0, _022E7A0C ; =0x00000906
	mov r1, #0xf
	bl MemAlloc
	str r0, [sp, #0x18]
	bl GetNbRecruited
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r7, r0
	ldr r0, _022E7A10 ; =0x00000229
	mov sl, #0
	sub r0, r0, #0xaa
	str r0, [sp, #0x20]
	ldr r0, _022E7A10 ; =0x00000229
	rsb r0, r0, #0x600
	str r0, [sp, #0x24]
_022E7294:
	mov r0, #0
	str r0, [sp, #8]
	ldrsh r0, [r6, #2]
	ldr r1, [sb, #0xc]
	ldr r0, [r1, r0, lsl #2]
	add r0, r0, sl, lsl #3
	bl GetMonsterIdFromSpawnEntry
	movs r5, r0
	beq _022E73B0
	ldr r1, _022E7A10 ; =0x00000229
	cmp r5, r1
	streqh sl, [sp, #0x44]
	beq _022E7398
	ldr r1, [sp, #0x20]
	cmp r5, r1
	ldrne r1, [sp, #0x24]
	cmpne r5, r1
	streqh sl, [sp, #0x46]
	beq _022E7398
	bl CanMonsterSpawn
	cmp r0, #0
	addeq sl, sl, #1
	beq _022E7294
	ldr r0, _022E79E4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x28000
	ldrb r0, [r0, #0x6c4 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET]
	bl IsBossFight
	cmp r0, #0
	bne _022E7398
	mov r0, r5
	bl CheckSpawnThreshold
	cmp r0, #0
	beq _022E7398
	mov r0, r5
	bl NeedsItemToSpawn
	cmp r0, #0
	beq _022E7390
	ldr r0, _022E79E4 ; =DUNGEON_PTR
	mov r1, r5
	ldr r0, [r0]
	add r0, r0, #0x7d0
	bl IsInSpawnList
	cmp r0, #0
	ldreq r0, [sp, #0x10]
	cmpeq r0, #0
	ldreq r0, [sp, #0x18]
	moveq r1, r5, lsl #1
	ldreqsh r0, [r0, r1]
	cmpeq r0, #0
	bne _022E7398
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _022E7398
	ldrsh r0, [r6, #2]
	ldr r1, [sb, #0xc]
	mov r8, r5
	ldr r0, [r1, r0, lsl #2]
	add r0, r0, sl, lsl #3
	bl GetMonsterLevelFromSpawnEntry
	and r0, r0, #0xff
	str r0, [sp, #0xc]
	b _022E7398
_022E7390:
	mov r0, #1
	str r0, [sp, #8]
_022E7398:
	ldr r0, [sp, #8]
	cmp r0, #0
	strne sl, [r7, r4, lsl #2]
	addne r4, r4, #1
	add sl, sl, #1
	b _022E7294
_022E73B0:
	bl FloorNumberIsEven
	cmp r0, #0
	ldreq r0, _022E79E4 ; =DUNGEON_PTR
	ldreq r0, [r0]
	addeq r0, r0, #0x700
	streqh r8, [r0, #0xa8]
	beq _022E73E4
	mov r0, r8
	bl GetSecondFormIfValid
	ldr r1, _022E79E4 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x700
	strh r0, [r1, #0xa8]
_022E73E4:
	ldr r1, _022E79E4 ; =DUNGEON_PTR
	mov r0, #0x10
	ldr r2, [r1]
	ldr r1, [sp, #0xc]
	strb r1, [r2, #0x7aa]
	bl DungeonRandInt
	add r0, r0, #1
	str r0, [sp, #0x14]
	sub r0, r4, #1
	mov sl, #0
	str r0, [sp, #0x1c]
	b _022E7448
_022E7414:
	mov r5, #0
	b _022E7438
_022E741C:
	mov r0, r4
	bl DungeonRandInt
	ldr r2, [r7, r5, lsl #2]
	ldr r1, [r7, r0, lsl #2]
	str r1, [r7, r5, lsl #2]
	str r2, [r7, r0, lsl #2]
	add r5, r5, #1
_022E7438:
	ldr r0, [sp, #0x1c]
	cmp r5, r0
	blt _022E741C
	add sl, sl, #1
_022E7448:
	ldr r0, [sp, #0x14]
	cmp sl, r0
	blt _022E7414
	ldr r0, [sp]
	cmp r0, #0
	movne r4, #0
	bne _022E746C
	cmp r4, #0xe
	movge r4, #0xe
_022E746C:
	ldr r0, _022E7A10 ; =0x00000229
	bl GetSpriteFileSize
	add r5, r0, #0
	ldr r0, _022E7A14 ; =0x0000017F
	bl GetSpriteFileSize
	ldr r1, [sp, #0x10]
	add r5, r5, r0
	cmp r1, #0
	beq _022E749C
	bl ov29_02349378
	add r5, r5, r0
	b _022E74B0
_022E749C:
	cmp r8, #0
	beq _022E74B0
	mov r0, r8
	bl GetSpriteFileSize
	add r5, r5, r0
_022E74B0:
	mov r8, #0
	b _022E7528
_022E74B8:
	ldr r0, _022E79E4 ; =DUNGEON_PTR
	ldr r2, [r7, r8, lsl #2]
	ldr r0, [r0]
	add r1, r0, r8, lsl #1
	ldr r0, _022E7A08 ; =0x0002C9EA
	strh r2, [r1, r0]
	ldrsh r1, [r6, #2]
	ldr r2, [sb, #0xc]
	ldr r0, [r7, r8, lsl #2]
	ldr r1, [r2, r1, lsl #2]
	add r2, sp, #0x3c
	add r3, r1, r0, lsl #3
	mov r1, #4
_022E74EC:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E74EC
	add r0, sp, #0x3c
	bl GetMonsterIdFromSpawnEntry
	mov sl, r0
	add r0, sp, #0x3c
	bl GetMonsterLevelFromSpawnEntry
	cmp fp, r0
	movlt fp, r0
	mov r0, sl
	bl DungeonGetTotalSpriteFileSize
	add r5, r5, r0
	add r8, r8, #1
_022E7528:
	cmp r8, r4
	blt _022E74B8
	ldr r0, _022E79E4 ; =DUNGEON_PTR
	ldr r1, _022E7A18 ; =0x0002C9E6
	ldr r0, [r0]
	cmp r5, #0x58000
	strh fp, [r0, r1]
	bls _022E75C4
	sub sl, r4, #1
	mov r8, #0
	add fp, r1, #4
	b _022E75B8
_022E7558:
	ldrsh r1, [r6, #2]
	ldr r2, [sb, #0xc]
	ldr r0, [r7, sl, lsl #2]
	ldr r1, [r2, r1, lsl #2]
	add r2, sp, #0x34
	add r3, r1, r0, lsl #3
	mov r1, #4
_022E7574:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E7574
	add r0, sp, #0x34
	bl GetMonsterIdFromSpawnEntry
	bl DungeonGetTotalSpriteFileSize
	sub r5, r5, r0
	ldr r1, _022E79E4 ; =DUNGEON_PTR
	ldr r0, _022E7A04 ; =0x0000FFFF
	ldr r1, [r1]
	cmp r5, #0x58000
	add r1, r1, sl, lsl #1
	strh r0, [r1, fp]
	add r8, r8, #1
	blo _022E75C0
	sub sl, sl, #1
_022E75B8:
	cmp sl, #0
	bge _022E7558
_022E75C0:
	sub r4, r4, r8
_022E75C4:
	ldrh r2, [sp, #0x44]
	ldr r0, _022E7A04 ; =0x0000FFFF
	cmp r2, r0
	beq _022E75EC
	ldr r1, _022E79E4 ; =DUNGEON_PTR
	ldr r0, _022E7A08 ; =0x0002C9EA
	ldr r1, [r1]
	add r1, r1, r4, lsl #1
	strh r2, [r1, r0]
	add r4, r4, #1
_022E75EC:
	ldrh r2, [sp, #0x46]
	ldr r0, _022E7A04 ; =0x0000FFFF
	ldr r3, _022E79E4 ; =DUNGEON_PTR
	cmp r2, r0
	ldrne r1, _022E79E4 ; =DUNGEON_PTR
	ldrne r0, _022E7A08 ; =0x0002C9EA
	ldrne r1, [r1]
	addne r1, r1, r4, lsl #1
	strneh r2, [r1, r0]
	ldr r2, _022E7A08 ; =0x0002C9EA
	mov r1, #0
_022E7618:
	mov r0, r1
	b _022E764C
_022E7620:
	ldr r4, [r3]
	add r5, r4, r0, lsl #1
	add r4, r4, r1, lsl #1
	ldrh r8, [r5, r2]
	ldrh r5, [r4, r2]
	cmp r5, r8
	strhih r8, [r4, r2]
	ldrhi r4, [r3]
	addhi r4, r4, r0, lsl #1
	strhih r5, [r4, r2]
	add r0, r0, #1
_022E764C:
	cmp r0, #0x10
	blt _022E7620
	add r1, r1, #1
	cmp r1, #0xf
	blt _022E7618
	ldr r0, [sp, #0x18]
	bl MemFree
	mov r0, r7
	bl MemFree
	bl DungeonRngSetPrimary
_022E7674:
	mov r4, #0
	bl FloorNumberIsEven
	cmp r0, #0
	ldr r0, _022E79E4 ; =DUNGEON_PTR
	mov r5, #0
	ldr r0, [r0]
	movne r4, #1
	ldrb r0, [r0, #0x748]
	mov r8, r5
	cmp r0, #0x3d
	moveq r4, #1
	bl IsDestinationFloorWithFixedRoom
	cmp r0, #0
	beq _022E76D0
	mov r0, #0xb
	bl IsCurrentMissionType
	cmp r0, #0
	bne _022E76CC
	mov r0, #0xa
	bl IsCurrentMissionType
	cmp r0, #0
	beq _022E76D0
_022E76CC:
	mov r5, #1
_022E76D0:
	mov sl, #0
	b _022E77CC
_022E76D8:
	ldr r1, _022E79E4 ; =DUNGEON_PTR
	ldr r0, _022E7A08 ; =0x0002C9EA
	ldr r2, [r1]
	ldr r1, _022E7A04 ; =0x0000FFFF
	add r2, r2, sl, lsl #1
	ldrh r3, [r2, r0]
	cmp r3, r1
	beq _022E77D4
	ldrsh r0, [r6, #2]
	ldr r1, [sb, #0xc]
	add r2, sp, #0x2c
	ldr r0, [r1, r0, lsl #2]
	mov r1, #4
	add r3, r0, r3, lsl #3
_022E7710:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E7710
	add r0, sp, #0x2c
	bl GetMonsterIdFromSpawnEntry
	cmp r5, #0
	ldrne r2, _022E7A10 ; =0x00000229
	cmpne r0, r2
	subne r1, r2, #0xaa
	cmpne r0, r1
	rsbne r1, r2, #0x600
	cmpne r0, r1
	bne _022E77C8
	ldr r1, _022E79E4 ; =DUNGEON_PTR
	add r7, sp, #0x2c
	ldr r1, [r1]
	mov r2, #4
	add r1, r1, r8, lsl #3
#ifdef JAPAN
	add r1, r1, #0x8c0
	add r3, r1, #0x2c000
#else
	add r1, r1, #0x164
	add r3, r1, #0x2c800
#endif
_022E7764:
	ldrh r1, [r7], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022E7764
	cmp r4, #0
	ldrne r1, _022E7A10 ; =0x00000229
	cmpne r0, r1
	beq _022E77C4
	cmp r0, #0x258
	bge _022E77C4
	add r7, r0, #0x258
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetMonsterGenderVeneer
	cmp r0, #2
	bne _022E77C4
	ldr r1, _022E79E4 ; =DUNGEON_PTR
	mov r0, r7, lsl #0x10
	ldr r2, [r1]
	mov r1, r0, asr #0x10
#ifdef JAPAN
	add r0, r2, #0x8c0
	add r0, r0, #0x2c000
#else
	add r0, r2, #0x164
	add r0, r0, #0x2c800
#endif
	add r0, r0, r8, lsl #3
	bl SetMonsterId
_022E77C4:
	add r8, r8, #1
_022E77C8:
	add sl, sl, #1
_022E77CC:
	cmp sl, #0x10
	blt _022E76D8
_022E77D4:
	bl IsFullFloorFixedRoom
	cmp r0, #0
	beq _022E782C
	ldr r0, _022E79E4 ; =DUNGEON_PTR
	ldr r3, _022E7A18 ; =0x0002C9E6
	ldr r4, [r0]
	rsb r1, r8, #0x10
	add r2, r4, #0x4000
#ifdef JAPAN
	add r0, r4, #0x8c0
	add r0, r0, #0x2c000
#else
	add r0, r4, #0x164
	add r0, r0, #0x2c800
#endif
	ldrb r2, [r2, #0xda + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET]
	ldrsh r3, [r4, r3]
	add r0, r0, r8, lsl #3
	bl LoadFixedRoom
	ldr r2, _022E79E4 ; =DUNGEON_PTR
	ldr r1, [r2]
	add r1, r1, #0x12000
	str r0, [r1, #0xb20 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET]
	ldr r0, [r2]
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb20 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET]
	add r8, r8, r0
_022E782C:
	ldr r4, _022E79E4 ; =DUNGEON_PTR
	ldr r0, _022E7A1C ; =0x0002C9E4
	ldr r1, [r4]
	mov r5, #0
	strh r8, [r1, r0]
	b _022E7860
_022E7844:
	ldr r0, [r4]
	mov r1, r5
#ifdef JAPAN
	add r0, r0, #0x8c0
	add r0, r0, #0x2c000
#else
	add r0, r0, #0x164
	add r0, r0, #0x2c800
#endif
	add r0, r0, r8, lsl #3
	bl SetMonsterId
	add r8, r8, #1
_022E7860:
	cmp r8, #0x10
	blt _022E7844
	mov r0, #0xb10
	mov r1, #0
	bl MemAlloc
	ldr r2, _022E79E4 ; =DUNGEON_PTR
	ldr r1, _022E7A20 ; =0x0002C9E8
	ldr r2, [r2]
	mov r4, #0
	strh r4, [r2, r1]
_022E7888:
	add r1, r6, r4, lsl #1
	ldrsh r2, [r1, #6]
	ldr r5, [sb, #8]
	mov r1, #0
	ldr r2, [r5, r2, lsl #2]
	ldr r5, _022E7A24 ; =0xFFFF8AD0
	mov r3, r1
	mov sl, r1
	rsb r7, r5, #0
	b _022E7908
_022E78B0:
	mov r8, r1, lsl #1
	ldrh fp, [r2, r8]
	cmp fp, r5, lsr #16
	moveq r8, r3, lsl #1
	streqh fp, [r0, r8]
	addeq r3, r3, #1
	beq _022E7904
	cmp fp, r7
	blo _022E78F8
	add fp, fp, r5
	b _022E78EC
_022E78DC:
	mov r8, r3, lsl #1
	strh sl, [r0, r8]
	add r3, r3, #1
	sub fp, fp, #1
_022E78EC:
	cmp fp, #0
	bne _022E78DC
	b _022E7904
_022E78F8:
	mov r8, r3, lsl #1
	strh fp, [r0, r8]
	add r3, r3, #1
_022E7904:
	add r1, r1, #1
_022E7908:
	cmp r3, #0x17c
	blt _022E78B0
	mov r1, #0xb10
	mul r1, r4, r1
	mov r2, #0
	ldr r7, _022E79E4 ; =DUNGEON_PTR
	ldr r5, _022E7A28 ; =0x000286D2
	mov r3, r2
_022E7928:
	mov sl, r2, lsl #1
	ldr r8, [r7]
	ldrh sl, [r0, sl]
	add r8, r1, r8
	add r8, r8, r2, lsl #1
	add r3, r3, #1
	strh sl, [r8, r5]
	cmp r3, #0x10
	add r2, r2, #1
	blt _022E7928
	ldr r7, _022E79E4 ; =DUNGEON_PTR
	ldr r5, _022E7A2C ; =0x000286F2
	mov r3, #0
_022E795C:
	mov sl, r2, lsl #1
	ldr r8, [r7]
	ldrh sl, [r0, sl]
	add r8, r1, r8
	add r8, r8, r3, lsl #1
	add r3, r3, #1
	strh sl, [r8, r5]
	cmp r3, #0x16c
	add r2, r2, #1
	blt _022E795C
	add r4, r4, #1
	cmp r4, #6
	blt _022E7888
	mov r8, #0
	ldr r2, _022E7A2C ; =0x000286F2
	ldr r4, _022E79E4 ; =DUNGEON_PTR
	ldr r1, _022E7A20 ; =0x0002C9E8
	ldr r3, _022E7A04 ; =0x0000FFFF
	mov r6, r8
_022E79A8:
	ldr r5, [r4]
	add r7, r5, r8, lsl #1
	ldrh r5, [r7, r2]
	cmp r5, r3
	streqh r6, [r7, r2]
	ldreq r5, [r4]
	streqh r8, [r5, r1]
	add r8, r8, #1
	cmp r8, #0x16c
	blt _022E79A8
	bl MemFree
	add r0, sp, #0x48
	bl UnloadFile
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E79E4: .word DUNGEON_PTR
_022E79E8: .word ov29_02351584
_022E79EC: .word ov29_02351594
_022E79F0: .word ov29_023515B0
_022E79F4: .word ov29_023515CC
_022E79F8: .word 0x000286B2 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET
_022E79FC: .word 0x000286CE + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET
_022E7A00: .word 0x0002CB08 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET
_022E7A04: .word 0x0000FFFF
_022E7A08: .word 0x0002C9EA + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET
_022E7A0C: .word 0x00000906
_022E7A10: .word 0x00000229
_022E7A14: .word 0x0000017F
_022E7A18: .word 0x0002C9E6 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET
_022E7A1C: .word 0x0002C9E4 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET
_022E7A20: .word 0x0002C9E8 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET
_022E7A24: .word 0xFFFF8AD0
_022E7A28: .word 0x000286D2 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET
_022E7A2C: .word 0x000286F2 + LOAD_MAPPA_FILE_ATTRIBUTES_OFFSET
	arm_func_end LoadMappaFileAttributes

	arm_func_start ov29_022E7A30
ov29_022E7A30: ; 0x022E7A30
	stmdb sp!, {r3, lr}
	ldr r0, _022E7A80 ; =0x00002710
	bl DungeonRandInt
	ldr r1, _022E7A84 ; =DUNGEON_PTR
#ifdef JAPAN
	mov r2, #0
	ldr r3, [r1]
	b _022E90E0
_022E7A50:
	add r1, r3, r2, lsl #1
	add r1, r1, #0x2c800
	ldrh r1, [r1, #0x8e]
	cmp r1, #0
	beq _022E90DC
	cmp r1, r0
	andge r0, r2, #0xff
	ldmgeia sp!, {r3, pc}
_022E90DC:
	add r2, r2, #1
_022E90E0:
	cmp r2, #0x19
#else
	mov r3, #0
	ldr ip, [r1]
	ldr r1, _022E7A88 ; =0x0002C932
	b _022E7A70
_022E7A50:
	add r2, ip, r3, lsl #1
	ldrh r2, [r2, r1]
	cmp r2, #0
	beq _022E7A6C
	cmp r2, r0
	andge r0, r3, #0xff
	ldmgeia sp!, {r3, pc}
_022E7A6C:
	add r3, r3, #1
_022E7A70:
	cmp r3, #0x19
#endif
	blt _022E7A50
	mov r0, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7A80: .word 0x00002710
_022E7A84: .word DUNGEON_PTR
#ifndef JAPAN
_022E7A88: .word 0x0002C932
#endif
	arm_func_end ov29_022E7A30

	arm_func_start ov29_022E7A8C
ov29_022E7A8C: ; 0x022E7A8C
	stmdb sp!, {r4, lr}
	mov r4, #0
	b _022E7AB0
_022E7A98:
	bl ov29_022E7A30
	cmp r0, #0
	cmpne r0, #0x17
	cmpne r0, #0x11
	bne _022E7AB8
	add r4, r4, #1
_022E7AB0:
	cmp r4, #0x1e
	blt _022E7A98
_022E7AB8:
	cmp r4, #0x1e
	moveq r0, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E7A8C

	arm_func_start GetItemIdToSpawn
GetItemIdToSpawn: ; 0x022E7AC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	ldr r0, _022E7BA8 ; =0x00002710
	bl DungeonRandInt
	mov r1, #0xb10
	mul r5, r4, r1
	ldr r2, _022E7BAC ; =DUNGEON_PTR
	mov r4, #0x10
	ldr r1, [r2]
	mov r3, #0
	add r6, r1, r5
	ldr r1, _022E7BB0 ; =0x000286D2
	b _022E7B18
_022E7AF8:
	add r2, r6, r3, lsl #1
	ldrsh r2, [r2, r1]
	cmp r2, #0
	beq _022E7B14
	cmp r2, r0
	andge r4, r3, #0xff
	bge _022E7B20
_022E7B14:
	add r3, r3, #1
_022E7B18:
	cmp r3, #0x10
	blt _022E7AF8
_022E7B20:
	cmp r4, #0x10
	moveq r0, #0xb7
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _022E7BA8 ; =0x00002710
	bl DungeonRandInt
	mov r6, r0
	mov r7, #0
	ldr sb, _022E7BAC ; =DUNGEON_PTR
	ldr r8, _022E7BB4 ; =0x000286F2
	b _022E7B98
_022E7B48:
	ldr r0, [sb]
	add r0, r5, r0
	add r0, r0, r7, lsl #1
	ldrsh r0, [r0, r8]
	cmp r0, #0
	beq _022E7B94
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemCategoryVeneer
	cmp r4, r0
	bne _022E7B94
	ldr r0, [sb]
	add r0, r5, r0
	add r0, r0, r7, lsl #1
	ldrsh r0, [r0, r8]
	cmp r0, r6
	movge r0, r7, lsl #0x10
	movge r0, r0, asr #0x10
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022E7B94:
	add r7, r7, #1
_022E7B98:
	cmp r7, #0x16c
	blt _022E7B48
	mov r0, #0xb7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022E7BA8: .word 0x00002710
_022E7BAC: .word DUNGEON_PTR
#ifdef JAPAN
_022E7BB0: .word 0x0002862E
_022E7BB4: .word 0x0002864E
#else
_022E7BB0: .word 0x000286D2
_022E7BB4: .word 0x000286F2
#endif
	arm_func_end GetItemIdToSpawn

	arm_func_start ov29_022E7BB8
ov29_022E7BB8: ; 0x022E7BB8
	stmdb sp!, {r3, lr}
	mov r0, #4
	bl GetItemIdToSpawn
	cmp r0, #0xb7
	moveq r0, #0x46
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E7BB8

	arm_func_start ov29_022E7BD0
ov29_022E7BD0: ; 0x022E7BD0
	stmdb sp!, {r3, lr}
	mov r0, #5
	bl GetItemIdToSpawn
	cmp r0, #0xb7
	moveq r0, #0x46
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E7BD0

	arm_func_start CopySpawnEntriesMaster
CopySpawnEntriesMaster: ; 0x022E7BE8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
	ldr r7, _022E7C5C ; =DUNGEON_PTR
	b _022E7C4C
_022E7C00:
	ldr r0, [r7]
#ifdef JAPAN
	add r0, r0, #0x8c0
	add r0, r0, #0x2c000
#else
	add r0, r0, #0x164
	add r0, r0, #0x2c800
#endif
	add r0, r0, r4, lsl #3
	bl GetMonsterIdFromSpawnEntry
	cmp r0, #0
	beq _022E7C54
	ldr r0, [r7]
	add r2, r6, r5, lsl #3
	add r0, r0, r4, lsl #3
#ifdef JAPAN
	add r0, r0, #0x8c0
	add r3, r0, #0x2c000
#else
	add r0, r0, #0x164
	add r3, r0, #0x2c800
#endif
	mov r1, #4
_022E7C34:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E7C34
	add r5, r5, #1
	add r4, r4, #1
_022E7C4C:
	cmp r4, #0x10
	blt _022E7C00
_022E7C54:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E7C5C: .word DUNGEON_PTR
	arm_func_end CopySpawnEntriesMaster

	arm_func_start MonsterSpawnListPartialCopy
MonsterSpawnListPartialCopy: ; 0x022E7C60
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
	b _022E7CE4
_022E7C74:
	ldr r0, _022E7CF4 ; =DUNGEON_PTR
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x8c0
	add r0, r0, #0x2c000
#else
	add r0, r0, #0x164
	add r0, r0, #0x2c800
#endif
	add r0, r0, r4, lsl #3
	bl GetMonsterIdFromSpawnEntry
	cmp r0, #0
	beq _022E7CEC
	bl GetSpriteSize
	cmp r0, #6
	bhi _022E7CE0
#ifdef JAPAN
	ldr r0, _022E7CF4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r1, r0, r4, lsl #3
	add r0, r1, #0x2c800
	ldrsh r0, [r0, #0xc2]
	cmp r0, #0
	beq _022E7CE0
	add r0, r1, #0x8c0
	add r3, r0, #0x2c000
#else
	ldr r1, _022E7CF4 ; =DUNGEON_PTR
	ldr r0, _022E7CF8 ; =0x0002C966
	ldr r1, [r1]
	add r1, r1, r4, lsl #3
	ldrsh r0, [r1, r0]
	cmp r0, #0
	beq _022E7CE0
	add r0, r1, #0x164
	add r3, r0, #0x2c800
#endif
	add r2, r6, r5, lsl #3
	mov r1, #4
_022E7CCC:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E7CCC
	add r5, r5, #1
_022E7CE0:
	add r4, r4, #1
_022E7CE4:
	cmp r4, #0x10
	blt _022E7C74
_022E7CEC:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E7CF4: .word DUNGEON_PTR
#ifndef JAPAN
_022E7CF8: .word 0x0002C966
#endif
	arm_func_end MonsterSpawnListPartialCopy

	arm_func_start ov29_022E7CFC
ov29_022E7CFC: ; 0x022E7CFC
#ifdef JAPAN
#define OV29_022E7CFC_OFFSET -0xA4
#else
#define OV29_022E7CFC_OFFSET 0
#endif
	stmdb sp!, {r3, lr}
	ldr r1, _022E7D48 ; =DUNGEON_PTR
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldrb r2, [r0, #0xe28 + OV29_022E7CFC_OFFSET]
	cmp r2, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	strb r2, [r0, #0xe28 + OV29_022E7CFC_OFFSET]
	ldr r0, [r1]
	mov r1, #0
#ifdef JAPAN
	add r0, r0, #0x124
#else
	add r0, r0, #0x174
#endif
	add r0, r0, #0x3800
	bl CopySpawnEntriesMaster
	ldr r1, _022E7D48 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x3000
	str r0, [r1, #0xe20 + OV29_022E7CFC_OFFSET]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7D48: .word DUNGEON_PTR
	arm_func_end ov29_022E7CFC

	arm_func_start IsOnMonsterSpawnList
IsOnMonsterSpawnList: ; 0x022E7D4C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #0
	ldr r4, _022E7D9C ; =DUNGEON_PTR
	b _022E7D8C
_022E7D60:
	ldr r0, [r4]
#ifdef JAPAN
	add r0, r0, #0x8c0
	add r0, r0, #0x2c000
#else
	add r0, r0, #0x164
	add r0, r0, #0x2c800
#endif
	add r0, r0, r5, lsl #3
	bl GetMonsterIdFromSpawnEntry
	cmp r0, #0
	beq _022E7D94
	cmp r0, r6
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	add r5, r5, #1
_022E7D8C:
	cmp r5, #0x10
	blt _022E7D60
_022E7D94:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E7D9C: .word DUNGEON_PTR
	arm_func_end IsOnMonsterSpawnList

	arm_func_start GetMonsterIdToSpawn
GetMonsterIdToSpawn: ; 0x022E7DA0
#ifdef JAPAN
#define GET_MONSTER_ID_TO_SPAWN_OFFSET -0x50
#else
#define GET_MONSTER_ID_TO_SPAWN_OFFSET 0
#endif
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _022E7E50 ; =0x00002710
	bl DungeonRandInt
	ldr r1, _022E7E54 ; =DUNGEON_PTR
	mov ip, #0
	ldr r1, [r1]
	add r2, r1, #0x3000
#ifdef JAPAN
	ldr lr, [r2, #0xd7c]
#else
	ldr lr, [r2, #0xe20]
#endif
	add r3, r1, r4, lsl #1
	b _022E7E00
_022E7DCC:
	add r2, r3, ip, lsl #3
	add r2, r2, #0x3900
	ldrsh r2, [r2, #0x76 + GET_MONSTER_ID_TO_SPAWN_OFFSET]
	cmp r2, #0
	beq _022E7DFC
	cmp r2, r0
	blt _022E7DFC
	add r0, r1, #0x174 + GET_MONSTER_ID_TO_SPAWN_OFFSET
	add r0, r0, #0x3800
	add r0, r0, ip, lsl #3
	bl GetMonsterIdFromSpawnEntry
	ldmia sp!, {r4, pc}
_022E7DFC:
	add ip, ip, #1
_022E7E00:
	cmp ip, lr
	blt _022E7DCC
	mov r3, #0
	add r2, r1, r4, lsl #1
	b _022E7E40
_022E7E14:
	add r0, r2, r3, lsl #3
	add r0, r0, #0x3900
	ldrsh r0, [r0, #0x76 + GET_MONSTER_ID_TO_SPAWN_OFFSET]
	cmp r0, #0
	beq _022E7E3C
	add r0, r1, #0x174 + GET_MONSTER_ID_TO_SPAWN_OFFSET
	add r0, r0, #0x3800
	add r0, r0, r3, lsl #3
	bl GetMonsterIdFromSpawnEntry
	ldmia sp!, {r4, pc}
_022E7E3C:
	add r3, r3, #1
_022E7E40:
	cmp r3, lr
	blt _022E7E14
	bl GetKecleonIdToSpawnByFloor
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E7E50: .word 0x00002710
_022E7E54: .word DUNGEON_PTR
	arm_func_end GetMonsterIdToSpawn

	arm_func_start GetMonsterLevelToSpawn
GetMonsterLevelToSpawn: ; 0x022E7E58
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, #0
	ldr r6, _022E7EC0 ; =DUNGEON_PTR
	b _022E7EA4
_022E7E6C:
#ifdef JAPAN
	add r0, r1, #0x124
#else
	add r0, r1, #0x174
#endif
	add r0, r0, #0x3800
	add r0, r0, r4, lsl #3
	bl GetMonsterIdFromSpawnEntry
	cmp r5, r0
	bne _022E7EA0
	ldr r0, _022E7EC0 ; =DUNGEON_PTR
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x124
#else
	add r0, r0, #0x174
#endif
	add r0, r0, #0x3800
	add r0, r0, r4, lsl #3
	bl GetMonsterLevelFromSpawnEntry
	ldmia sp!, {r4, r5, r6, pc}
_022E7EA0:
	add r4, r4, #1
_022E7EA4:
	ldr r1, [r6]
	add r0, r1, #0x3000
#ifdef JAPAN
	ldr r0, [r0, #0xd7c]
#else
	ldr r0, [r0, #0xe20]
#endif
	cmp r4, r0
	blt _022E7E6C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E7EC0: .word DUNGEON_PTR
	arm_func_end GetMonsterLevelToSpawn

	arm_func_start AllocTopScreenStatus
AllocTopScreenStatus: ; 0x022E7EC4
	stmdb sp!, {r3, lr}
	mov r0, #0x230
	mov r1, #0
	bl MemAlloc
	ldr r2, _022E7F40 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #0x230
	str r0, [r2]
	bl MemZero
	ldr r0, _022E7F40 ; =TOP_SCREEN_STATUS_PTR
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1]
	ldr r1, [r0]
	strb r2, [r1, #0x29]
	ldr r1, [r0]
	strb r2, [r1, #0x2c]
	ldr r1, [r0]
	strb r2, [r1, #0x2b]
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	strb r2, [r0, #0x228]
	bl ov29_022E8708
	ldr r0, _022E7F40 ; =TOP_SCREEN_STATUS_PTR
	mov r3, #2
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #0x229]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7F40: .word TOP_SCREEN_STATUS_PTR
	arm_func_end AllocTopScreenStatus

	arm_func_start FreeTopScreenStatus
FreeTopScreenStatus: ; 0x022E7F44
	stmdb sp!, {r3, lr}
	ldr r0, _022E7F78 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl FreeTopScreen
	ldr r0, _022E7F78 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E7F78 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7F78: .word TOP_SCREEN_STATUS_PTR
	arm_func_end FreeTopScreenStatus

	arm_func_start ov29_022E7F7C
ov29_022E7F7C: ; 0x022E7F7C
	ldr r0, _022E7F90 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0]
	bx lr
	.align 2, 0
_022E7F90: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E7F7C

	arm_func_start ov29_022E7F94
ov29_022E7F94: ; 0x022E7F94
	stmdb sp!, {r3, lr}
	ldr r0, _022E8014 ; =TOP_SCREEN_STATUS_PTR
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	strb r3, [r2, #0x228]
	ldr r0, [r0]
	strb r1, [r0]
	bl ov29_02339138
	mov r0, #1
	mov r1, r0
	bl ov29_02339D7C
	bl UpdateMinimap
	mov r0, #0
	bl SetMinimapDataE447
	ldr r1, _022E8014 ; =TOP_SCREEN_STATUS_PTR
	mov r0, #1
	ldr r1, [r1]
	strb r0, [r1]
	bl SetMinimapDataE448
	bl ov29_022E8104
	bl GetPlayerGender
	cmp r0, #2
	ldr r0, _022E8014 ; =TOP_SCREEN_STATUS_PTR
	moveq r1, #1
	ldr r0, [r0]
	movne r1, #0
	and r1, r1, #0xff
	add r0, r0, #0xb8
	bl ov29_022DC738
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8014: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E7F94

	arm_func_start ov29_022E8018
ov29_022E8018: ; 0x022E8018
	stmdb sp!, {r3, lr}
	ldr r0, _022E8050 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x228]
	cmp r0, #0
	beq _022E8048
	bl ov29_022DC76C
	bl ov29_022DC778
	ldr r0, _022E8050 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x228]
_022E8048:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8050: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8018

	arm_func_start ov29_022E8054
ov29_022E8054: ; 0x022E8054
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	strb r1, [r0, #0x10]
	bl sub_0204AEA0
	cmp r0, #3
	ldrne r0, _022E80CC ; =TOP_SCREEN_STATUS_PTR
	movne r1, #0
	ldrne r0, [r0]
	strneb r1, [r0]
	ldmneia sp!, {r3, pc}
	ldr r0, _022E80CC ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov29_02339138
	mov r0, #0
	mov r1, #1
	bl ov29_0233A0E8
	mov r0, #1
	mov r1, #0
	bl ov29_02339D7C
	ldr r0, _022E80CC ; =TOP_SCREEN_STATUS_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E80CC: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8054

	arm_func_start ov29_022E80D0
ov29_022E80D0: ; 0x022E80D0
	stmdb sp!, {r3, lr}
	bl ov29_022DC77C
	ldr r1, _022E8100 ; =TOP_SCREEN_STATUS_PTR
	mov r0, #0
	ldr r1, [r1]
	strb r0, [r1]
	bl SetMinimapDataE448
	mov r0, #1
	bl ov29_0233A1BC
	bl ov29_02339138
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8100: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E80D0

	arm_func_start ov29_022E8104
ov29_022E8104: ; 0x022E8104
	stmdb sp!, {r3, lr}
	ldr r0, _022E812C ; =TOP_SCREEN_STATUS_PTR
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x228]
	ldr r0, [r0]
	add r0, r0, #0xb8
	bl ov10_022C1E50
	bl ov29_022E8CE8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E812C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8104

	arm_func_start InitializeTeamStats
InitializeTeamStats: ; 0x022E8130
	stmdb sp!, {r3, lr}
	ldr r0, _022E818C ; =TOP_SCREEN_STATUS_PTR
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x228]
	ldr r0, [r0]
	strb r2, [r0, #0x229]
	bl ov29_022E8104
	ldr r0, _022E818C ; =TOP_SCREEN_STATUS_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x24]
	bl GetPlayerGender
	cmp r0, #2
	ldr r0, _022E818C ; =TOP_SCREEN_STATUS_PTR
	moveq r1, #1
	ldr r0, [r0]
	movne r1, #0
	and r1, r1, #0xff
	add r0, r0, #0xb8
	bl ov29_022DC694
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E818C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end InitializeTeamStats

	arm_func_start UpdateTeamStatsWrapper
UpdateTeamStatsWrapper: ; 0x022E8190
	stmdb sp!, {r3, lr}
	ldr r0, _022E81C4 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x228]
	cmp r0, #0
	beq _022E81BC
	bl ov29_022DC6D0
	ldr r0, _022E81C4 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x228]
_022E81BC:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E81C4: .word TOP_SCREEN_STATUS_PTR
	arm_func_end UpdateTeamStatsWrapper

	arm_func_start ov29_022E81C8
ov29_022E81C8: ; 0x022E81C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_022DC6DC
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E81C8

	arm_func_start FreeTeamStatsWrapper
FreeTeamStatsWrapper: ; 0x022E81E8
	stmdb sp!, {r3, lr}
	bl ov29_022DC728
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end FreeTeamStatsWrapper

	arm_func_start ov29_022E81F8
ov29_022E81F8: ; 0x022E81F8
	stmdb sp!, {r3, lr}
	bl sub_0204AF58
	cmp r0, #0
	bne _022E8210
	bl ov29_022E8104
	ldmia sp!, {r3, pc}
_022E8210:
	bl sub_0204AEA0
	cmp r0, #1
	bne _022E8238
	ldr r0, _022E8240 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldrsh r0, [r0, #8]
	cmp r0, #1
	beq _022E8238
	mov r0, #1
	bl ov29_022E8CA8
_022E8238:
	bl ov29_022E8CE8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8240: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E81F8

	arm_func_start ov29_022E8244
ov29_022E8244: ; 0x022E8244
	stmdb sp!, {r3, lr}
	bl sub_0204AEA0
	cmp r0, #4
	ldreq r0, _022E826C ; =TOP_SCREEN_STATUS_PTR
	ldreq r0, [r0]
	ldreqsh r0, [r0, #8]
	cmpeq r0, #4
	ldmneia sp!, {r3, pc}
	bl ov29_022E9008
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E826C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8244

	arm_func_start ov29_022E8270
ov29_022E8270: ; 0x022E8270
#ifdef JAPAN
#define OV29_022E8270_OFFSET -0xA4
#else
#define OV29_022E8270_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	ldr r3, _022E83FC ; =TOP_SCREEN_STATUS_PTR
	mov sl, r0
	ldr r3, [r3]
	mov sb, r1
	mov fp, r2
	cmp r3, #0
	beq _022E83F4
	ldr r8, [sl, #0xb4]
	bl GetIdleAnimationId
	ldr r1, _022E8400 ; =DUNGEON_PTR
	mov r4, r0
	ldr r1, [r1]
	mov r5, #0
	add r1, r1, #0x1a000
	ldr r0, [r1, #0x22c + OV29_022E8270_OFFSET]
	mov r6, r5
	cmp r0, sl
	ldrsh r0, [sl, #0xa8]
	mov r7, r5
	str r0, [sp, #0x18]
	moveq r0, r5
	ldrneb r0, [r1, #0x245 + OV29_022E8270_OFFSET]
	cmp r0, #0
	bne _022E82E4
	ldrb r0, [r8, #0xd8]
	cmp r0, #2
	bne _022E82F0
_022E82E4:
	ldr r0, _022E8404 ; =0x00000229
	bl DungeonGetSpriteIndex
	str r0, [sp, #0x18]
_022E82F0:
	ldrb r0, [r8, #0xc4]
	cmp r0, #1
	cmpne r0, #6
	beq _022E8364
	ldr r0, _022E8400 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x78b]
	cmp r0, #0
	beq _022E832C
	bl ov29_0234B4E0
	cmp r0, #0
	addeq r0, r5, #2
	moveq r0, r0, lsl #0x10
	moveq r5, r0, asr #0x10
	beq _022E8354
_022E832C:
	ldrb r0, [sl, #0xaf]
	cmp r0, #0
	cmpne r0, #7
	bne _022E8354
	ldr r0, [sl, #0xb4]
#ifdef JAPAN
	ldr r0, [r0, #0x10c]
#else
	ldr r0, [r0, #0x110]
#endif
	cmp r0, #1
	addgt r0, r5, #1
	movgt r0, r0, lsl #0x10
	movgt r5, r0, asr #0x10
_022E8354:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	b _022E8368
_022E8364:
	mov r5, #0
_022E8368:
#ifdef JAPAN
	ldrb r0, [r8, #0x10a]
#else
	ldrb r0, [r8, #0x10b]
#endif
	cmp r0, #2
	beq _022E83A4
	ldrb r1, [r8, #0xc4]
	cmp r1, #6
	ldrneb r0, [r8, #0xbf]
	cmpne r0, #4
	cmpne r1, #2
	bne _022E83A4
	ldr r0, _022E8408 ; =ov29_0237C850
	ldr r0, [r0]
	and r0, r0, #2
	add r0, r6, r0
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_022E83A4:
	ldrb r0, [r8, #0xef]
	cmp r0, #1
	ldreq r0, _022E8400 ; =DUNGEON_PTR
	ldreq r0, [r0]
	addeq r0, r0, #0x1a000
	ldreqb r0, [r0, #0x244 + OV29_022E8270_OFFSET]
	cmpeq r0, #0
	moveq r7, #1
	cmp r4, #0xff
	beq _022E83F4
	mov r0, #1
	stmia sp, {r0, sb, fp}
	str r5, [sp, #0xc]
	str r6, [sp, #0x10]
	str r7, [sp, #0x14]
	ldrsh r1, [r8, #4]
	ldr r3, [r8, #0xb0]
	ldr r0, [sp, #0x18]
	mov r2, r4
	bl ov29_022DC6E8
_022E83F4:
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E83FC: .word TOP_SCREEN_STATUS_PTR
_022E8400: .word DUNGEON_PTR
_022E8404: .word 0x00000229
_022E8408: .word ov29_0237C850
	arm_func_end ov29_022E8270

	arm_func_start ov29_022E840C
ov29_022E840C: ; 0x022E840C
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r0, _022E8478 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0
	movne r0, #0
	bne _022E8470
	add r0, sp, #0
	bl ov10_022C22A0
	ldr r0, _022E8478 ; =TOP_SCREEN_STATUS_PTR
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x80
	mov r3, #1
	bl ov10_022C1E80
	bl sub_02048400
	cmp r0, #0
	beq _022E8460
	bl sub_02048384
_022E8460:
	ldr r1, _022E8478 ; =TOP_SCREEN_STATUS_PTR
	mov r0, #1
	ldr r1, [r1]
	strb r0, [r1, #0x29]
_022E8470:
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_022E8478: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E840C

	arm_func_start ov29_022E847C
ov29_022E847C: ; 0x022E847C
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	strb r1, [r0, #0x10]
	bl sub_020483B8
	ldr r0, _022E84AC ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E84AC: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E847C

	arm_func_start ov29_022E84B0
ov29_022E84B0: ; 0x022E84B0
	stmdb sp!, {r3, lr}
	ldr r0, _022E84FC ; =TOP_SCREEN_STATUS_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x29]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r1, #0x80
	bl ov10_022C2278
	bl sub_02048400
	cmp r0, #0
	beq _022E84E4
	bl sub_020483D8
_022E84E4:
	ldr r0, _022E84FC ; =TOP_SCREEN_STATUS_PTR
	mov r2, #0
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1, #0x29]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E84FC: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E84B0

	arm_func_start ov29_022E8500
ov29_022E8500: ; 0x022E8500
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	add r0, sp, #0
	bl ov10_022C22A0
	ldr r0, _022E8548 ; =TOP_SCREEN_STATUS_PTR
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x80
	mov r3, #1
	bl ov10_022C1E80
	ldr r0, _022E8548 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	bl ov29_022E8E94
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_022E8548: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8500

	arm_func_start ov29_022E854C
ov29_022E854C: ; 0x022E854C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x10
	bl ov29_022E8F78
	ldr r0, _022E8584 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	mov r0, #0
	strb r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E8584: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E854C

	arm_func_start ov29_022E8588
ov29_022E8588: ; 0x022E8588
	stmdb sp!, {r3, lr}
	ldr r0, _022E85A4 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C2278
	bl ov29_022E8F28
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E85A4: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8588

	arm_func_start ov29_022E85A8
ov29_022E85A8: ; 0x022E85A8
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	add r0, sp, #0
	bl ov10_022C22A0
	ldr r0, _022E85F0 ; =TOP_SCREEN_STATUS_PTR
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x80
	mov r3, #1
	bl ov10_022C1E80
	ldr r0, _022E85F0 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	bl ov29_022E8FCC
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_022E85F0: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E85A8

	arm_func_start ov29_022E85F4
ov29_022E85F4: ; 0x022E85F4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x10
	bl ov29_022E9014
	ldr r0, _022E862C ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	mov r0, #0
	strb r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E862C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E85F4

	arm_func_start ov29_022E8630
ov29_022E8630: ; 0x022E8630
	stmdb sp!, {r3, lr}
	ldr r0, _022E864C ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C2278
	bl ov29_022E8FF8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E864C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8630

	arm_func_start ov29_022E8650
ov29_022E8650: ; 0x022E8650
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	add r0, sp, #0
	bl ov10_022C22A0
	ldr r0, _022E8698 ; =TOP_SCREEN_STATUS_PTR
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x80
	mov r3, #1
	bl ov10_022C1E80
	ldr r0, _022E8698 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	mov r0, #1
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_022E8698: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8650

	arm_func_start ov29_022E869C
ov29_022E869C: ; 0x022E869C
	mov r0, #1
	bx lr
	arm_func_end ov29_022E869C

	arm_func_start ov29_022E86A4
ov29_022E86A4: ; 0x022E86A4
	bx lr
	arm_func_end ov29_022E86A4

	arm_func_start ov29_022E86A8
ov29_022E86A8: ; 0x022E86A8
	stmdb sp!, {r3, lr}
	ldr r0, _022E86C4 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C2278
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E86C4: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E86A8

	arm_func_start AssignTopScreenHandlers
AssignTopScreenHandlers: ; 0x022E86C8
	str r1, [r0]
	ldr r1, [sp]
	stmib r0, {r2, r3}
	str r1, [r0, #0xc]
	mov r1, #1
	strb r1, [r0, #0x10]
	bx lr
	arm_func_end AssignTopScreenHandlers

	arm_func_start ov29_022E86E4
ov29_022E86E4: ; 0x022E86E4
	stmdb sp!, {r3, lr}
	ldr r0, _022E8704 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8704: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E86E4

	arm_func_start ov29_022E8708
ov29_022E8708: ; 0x022E8708
	stmdb sp!, {r3, lr}
	bl sub_0204AEA0
	cmp r0, #3
	bne _022E8724
	mov r0, #3
	bl ov29_022E8CA8
	ldmia sp!, {r3, pc}
_022E8724:
	cmp r0, #2
	bne _022E8738
	mov r0, #0
	bl ov29_022E8CA8
	ldmia sp!, {r3, pc}
_022E8738:
	cmp r0, #0
	bne _022E874C
	mov r0, #2
	bl ov29_022E8CA8
	ldmia sp!, {r3, pc}
_022E874C:
	cmp r0, #4
	bne _022E8760
	mov r0, #4
	bl ov29_022E8CA8
	ldmia sp!, {r3, pc}
_022E8760:
	bl ov29_022E81F8
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E8708

	arm_func_start ov29_022E8768
ov29_022E8768: ; 0x022E8768
	ldr ip, _022E8774 ; =ov29_022E8CA8
	mov r0, #5
	bx ip
	.align 2, 0
_022E8774: .word ov29_022E8CA8
	arm_func_end ov29_022E8768

	arm_func_start ov29_022E8778
ov29_022E8778: ; 0x022E8778
	stmdb sp!, {r3, lr}
	ldr r0, _022E87B0 ; =TOP_SCREEN_STATUS_PTR
	mov r3, #3
	ldr r2, [r0]
	sub r1, r3, #4
	str r3, [r2, #0xc]
	ldr r0, [r0]
	strh r1, [r0, #0x10]
	bl ov29_022E8104
	ldr r0, _022E87B0 ; =TOP_SCREEN_STATUS_PTR
	ldr r1, [r0]
	ldrsh r0, [r1, #0x10]
	strh r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E87B0: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8778

	arm_func_start ov29_022E87B4
ov29_022E87B4: ; 0x022E87B4
	ldr r1, _022E87D8 ; =TOP_SCREEN_STATUS_PTR
	ldr r2, [r1]
	ldrsh r1, [r2, #8]
	cmp r1, r0
	ldreq r0, [r2, #4]
	cmpeq r0, #5
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_022E87D8: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E87B4

	arm_func_start ov29_022E87DC
ov29_022E87DC: ; 0x022E87DC
	stmdb sp!, {r3, lr}
	bl sub_0204AEA0
	ldr r1, _022E87F8 ; =ov29_023515E8
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	bl ov29_022E87B4
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E87F8: .word ov29_023515E8
	arm_func_end ov29_022E87DC

	arm_func_start ov29_022E87FC
ov29_022E87FC: ; 0x022E87FC
	ldr r1, _022E880C ; =TOP_SCREEN_STATUS_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x2b]
	bx lr
	.align 2, 0
_022E880C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E87FC

	arm_func_start ov29_022E8810
ov29_022E8810: ; 0x022E8810
	ldr r0, _022E8830 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E8830: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8810

	arm_func_start ov29_022E8834
ov29_022E8834: ; 0x022E8834
	ldr r1, _022E8844 ; =TOP_SCREEN_STATUS_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x2c]
	bx lr
	.align 2, 0
_022E8844: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8834

	arm_func_start ov29_022E8848
ov29_022E8848: ; 0x022E8848
	ldr r0, _022E8868 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E8868: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8848

	arm_func_start HandleTopScreenFades
HandleTopScreenFades: ; 0x022E886C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	ldr r5, [r0]
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [r5, #4]
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_022E8890: ; jump table
	ldmia sp!, {r3, r4, r5, pc} ; case 0
	b _022E88AC ; case 1
	b _022E88C0 ; case 2
	b _022E8A80 ; case 3
	b _022E8AC8 ; case 4
	b _022E8B00 ; case 5
	b _022E8B5C ; case 6
_022E88AC:
	ldrb r0, [r5, #0x2b]
	cmp r0, #0
	moveq r0, #2
	streq r0, [r5, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E88C0:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _022E88EC
	mov r0, #1
	bl ov29_0234C70C
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
_022E88EC:
	bl FreeTopScreen
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	ldr r4, [r0]
	ldrsh r0, [r4, #0x10]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _022E89DC
_022E8908: ; jump table
	b _022E8920 ; case 0
	b _022E8940 ; case 1
	b _022E8960 ; case 2
	b _022E8980 ; case 3
	b _022E89A0 ; case 4
	b _022E89C0 ; case 5
_022E8920:
	ldr ip, _022E8BA4 ; =ov29_022E84B0
	ldr r1, _022E8BA8 ; =ov29_022E840C
	ldr r3, _022E8BAC ; =ov29_022E847C
	add r0, r4, #0x14
	mov r2, #0
	str ip, [sp]
	bl AssignTopScreenHandlers
	b _022E89DC
_022E8940:
	ldr ip, _022E8BB0 ; =FreeTeamStatsWrapper
	ldr r1, _022E8BB4 ; =InitializeTeamStats
	ldr r2, _022E8BB8 ; =UpdateTeamStatsWrapper
	ldr r3, _022E8BBC ; =ov29_022E81C8
	add r0, r4, #0x14
	str ip, [sp]
	bl AssignTopScreenHandlers
	b _022E89DC
_022E8960:
	ldr ip, _022E8BC0 ; =ov29_022E8588
	ldr r1, _022E8BC4 ; =ov29_022E8500
	ldr r3, _022E8BC8 ; =ov29_022E854C
	add r0, r4, #0x14
	mov r2, #0
	str ip, [sp]
	bl AssignTopScreenHandlers
	b _022E89DC
_022E8980:
	ldr ip, _022E8BCC ; =ov29_022E80D0
	ldr r1, _022E8BD0 ; =ov29_022E7F94
	ldr r2, _022E8BD4 ; =ov29_022E8018
	ldr r3, _022E8BD8 ; =ov29_022E8054
	add r0, r4, #0x14
	str ip, [sp]
	bl AssignTopScreenHandlers
	b _022E89DC
_022E89A0:
	ldr ip, _022E8BDC ; =ov29_022E8630
	ldr r1, _022E8BE0 ; =ov29_022E85A8
	ldr r3, _022E8BE4 ; =ov29_022E85F4
	add r0, r4, #0x14
	mov r2, #0
	str ip, [sp]
	bl AssignTopScreenHandlers
	b _022E89DC
_022E89C0:
	ldr ip, _022E8BE8 ; =ov29_022E86A8
	ldr r1, _022E8BEC ; =ov29_022E8650
	ldr r2, _022E8BF0 ; =ov29_022E869C
	ldr r3, _022E8BF4 ; =ov29_022E86A4
	add r0, r4, #0x14
	str ip, [sp]
	bl AssignTopScreenHandlers
_022E89DC:
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	ldrsh r1, [r4, #0x10]
	ldr r0, [r0]
	strh r1, [r0, #8]
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _022E8A20
	ldr r0, _022E8BF8 ; =ov29_0235352C
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	bl sub_0200B3D4
	ldr r0, _022E8BF8 ; =ov29_0235352C
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	bl sub_0200B330
	ldr r0, [r4, #0x14]
	blx r0
_022E8A20:
	mov r1, #0
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	str r1, [r5, #0xc]
	ldr r2, [r0]
	ldrb r1, [r2, #0x2c]
	cmp r1, #0
	movne r0, #3
	strne r0, [r2, #4]
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #5
	str r1, [r2, #4]
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	mov r2, r0
	mov r1, #0x4000
	bl StartFadeDungeonWrapper
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E8A80:
	ldrb r1, [r5, #0x2c]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #5
	str r1, [r5, #4]
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	mov r2, r0
	mov r1, #0x4000
	bl StartFadeDungeonWrapper
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E8AC8:
	bl ov29_022E86E4
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	bl ov29_0234C70C
	cmp r0, #0
	ldreq r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	moveq r1, #5
	ldreq r0, [r0]
	streq r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E8B00:
	bl ov29_022E86E4
	ldr r0, [r5, #0xc]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	strb r1, [r2, #2]
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	cmp r0, #0
	moveq r0, #6
	streq r0, [r1, #4]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	mov r1, #0x4000
	mov r2, #1
	bl StartFadeDungeonWrapper
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E8B5C:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _022E8B78
	mov r0, #1
	bl ov29_0234C70C
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_022E8B78:
	bl FreeTopScreen
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x2b]
	cmp r0, #0
	movne r0, #1
	strne r0, [r1, #4]
	moveq r0, #2
	streq r0, [r1, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E8BA0: .word TOP_SCREEN_STATUS_PTR
_022E8BA4: .word ov29_022E84B0
_022E8BA8: .word ov29_022E840C
_022E8BAC: .word ov29_022E847C
_022E8BB0: .word FreeTeamStatsWrapper
_022E8BB4: .word InitializeTeamStats
_022E8BB8: .word UpdateTeamStatsWrapper
_022E8BBC: .word ov29_022E81C8
_022E8BC0: .word ov29_022E8588
_022E8BC4: .word ov29_022E8500
_022E8BC8: .word ov29_022E854C
_022E8BCC: .word ov29_022E80D0
_022E8BD0: .word ov29_022E7F94
_022E8BD4: .word ov29_022E8018
_022E8BD8: .word ov29_022E8054
_022E8BDC: .word ov29_022E8630
_022E8BE0: .word ov29_022E85A8
_022E8BE4: .word ov29_022E85F4
_022E8BE8: .word ov29_022E86A8
_022E8BEC: .word ov29_022E8650
_022E8BF0: .word ov29_022E869C
_022E8BF4: .word ov29_022E86A4
_022E8BF8: .word ov29_0235352C
	arm_func_end HandleTopScreenFades

	arm_func_start ov29_022E8BFC
ov29_022E8BFC: ; 0x022E8BFC
	ldr r1, _022E8C0C ; =TOP_SCREEN_STATUS_PTR
	ldr r1, [r1]
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_022E8C0C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8BFC

	arm_func_start ov29_022E8C10
ov29_022E8C10: ; 0x022E8C10
	stmdb sp!, {r3, lr}
	ldr r0, _022E8C48 ; =TOP_SCREEN_STATUS_PTR
	ldr r2, [r0]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldrb r0, [r2, #0x2a]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r1, [r2, #0x1c]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	add r0, r2, #0x14
	blx r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8C48: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8C10

	arm_func_start FreeTopScreen
FreeTopScreen: ; 0x022E8C4C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _022E8CA4 ; =TOP_SCREEN_STATUS_PTR
	ldr r4, [r0]
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _022E8C98
	mov r0, #0
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x20]
	blx r0
	movs r5, r0
	beq _022E8C9C
	mov r1, #0
	mov r2, r1
	mov r3, r1
	add r0, r4, #0x14
	str r1, [sp]
	bl AssignTopScreenHandlers
	b _022E8C9C
_022E8C98:
	mov r5, #1
_022E8C9C:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E8CA4: .word TOP_SCREEN_STATUS_PTR
	arm_func_end FreeTopScreen

	arm_func_start ov29_022E8CA8
ov29_022E8CA8: ; 0x022E8CA8
	ldr r1, _022E8CE4 ; =TOP_SCREEN_STATUS_PTR
	ldr r3, [r1]
	ldrsh r2, [r3, #8]
	cmp r2, r0
	ldrne r2, [r3, #0xc]
	cmpne r2, #1
	bxeq lr
	mov r2, #1
	str r2, [r3, #0xc]
	ldr r3, [r1]
	mov r2, #0
	strh r0, [r3, #0x10]
	ldr r0, [r1]
	strb r2, [r0, #0x28]
	bx lr
	.align 2, 0
_022E8CE4: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8CA8

	arm_func_start ov29_022E8CE8
ov29_022E8CE8: ; 0x022E8CE8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x54
	mov sb, #0
	ldr fp, _022E8E54 ; =0x000003E7
	mov r8, sb
_022E8CFC:
	ldr r0, _022E8E58 ; =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, r8, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	cmp r0, #0
	moveq r0, #0
	beq _022E8D30
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_022E8D30:
	cmp r0, #0
	beq _022E8DE4
	add r0, r1, r8, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xa84]
#else
	ldr r6, [r0, #0xb28]
#endif
	ldr r0, _022E8E5C ; =TOP_SCREEN_STATUS_PTR
	ldr r7, [r6, #0xb4]
	ldr r0, [r0]
	add r5, r0, #0xb8
	mov r0, #0x5c
	smulbb r4, sb, r0
#ifdef JAPAN
	ldrb r0, [r7, #0x161]
#else
	ldrb r0, [r7, #0x165]
#endif
	cmp r0, #0
	bne _022E8DE4
	add r0, sp, #0x14
	mov r1, r7
	mov r2, #0
	bl ov29_0230027C
	ldrsh r1, [r7, #0x12]
	ldrsh r0, [r7, #0x16]
	add sl, r1, r0
	cmp sl, fp
	mov r0, r6
	movgt sl, fp
	bl GetIdleAnimationId
	ldrb r3, [r7, #0xa]
	mov r1, sl, lsl #0x10
	mov r1, r1, asr #0x10
	str r3, [sp]
	ldrsh r3, [r7, #0x10]
	add r2, sp, #0x14
	str r3, [sp, #4]
	str r1, [sp, #8]
	ldrsh r1, [r6, #0xa8]
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r1, [r7, #0xb0]
	ldrsh r3, [r7, #4]
	mov r1, r1, lsl #0x10
	add r0, r5, r4
	mov r1, r1, asr #0x10
	bl ov10_022C1DE0
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_022E8DE4:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022E8CFC
	mov r0, #0x5c
	smulbb r4, sb, r0
	mov r3, #0
	ldr r1, _022E8E5C ; =TOP_SCREEN_STATUS_PTR
	b _022E8E24
_022E8E0C:
	ldr r2, [r1]
	add r0, sb, #1
	add r2, r4, r2
	mov r0, r0, lsl #0x10
	strb r3, [r2, #0xb8]
	mov sb, r0, asr #0x10
_022E8E24:
	cmp sb, #4
	blt _022E8E0C
	ldr r0, _022E8E5C ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0xb8
	bl ov29_022DC684
	ldr r0, _022E8E5C ; =TOP_SCREEN_STATUS_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x228]
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E8E54: .word 0x000003E7
_022E8E58: .word DUNGEON_PTR
_022E8E5C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8CE8

	arm_func_start ov29_022E8E60
ov29_022E8E60: ; 0x022E8E60
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _022E8E90 ; =0x00003FCB
	bl StringFromId
	mov r1, #0
	mov r3, r0
	mov r0, r4
	mov r2, r1
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
#if defined(EUROPE)
_022E8E90: .word 0x00003FCD
#elif defined(JAPAN)
_022E8E90: .word 0x000049CE
#else
_022E8E90: .word 0x00003FCB
#endif
	arm_func_end ov29_022E8E60

	arm_func_start ov29_022E8E94
ov29_022E8E94: ; 0x022E8E94
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _022E8F1C ; =ov29_02353558
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #0
	bne _022E8F14
	mov r0, #0x54
	mov r1, #8
	bl MemAlloc
	ldr r2, _022E8F1C ; =ov29_02353558
	mov r1, #0x54
	str r0, [r2]
	bl MemZero
	ldr r0, _022E8F20 ; =ov29_023515F4
	add ip, sp, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r1, _022E8F24 ; =ov29_022E8E60
	mov r0, ip
	bl CreateTextBox
	ldr r1, _022E8F1C ; =ov29_02353558
	ldr r2, [r1]
	strb r0, [r2]
	ldr r0, [r1]
	add r0, r0, #4
	bl InitPreprocessorArgs
	ldr r0, _022E8F1C ; =ov29_02353558
	mov r2, #0x10000
	ldr r1, [r0]
	mov r0, #1
	str r2, [r1, #0x50]
_022E8F14:
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8F1C: .word ov29_02353558
_022E8F20: .word ov29_023515F4
_022E8F24: .word ov29_022E8E60
	arm_func_end ov29_022E8E94

	arm_func_start ov29_022E8F28
ov29_022E8F28: ; 0x022E8F28
	stmdb sp!, {r3, lr}
	ldr r0, _022E8F74 ; =ov29_02353558
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseTextBox2
	ldr r0, _022E8F74 ; =ov29_02353558
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1]
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E8F74 ; =ov29_02353558
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8F74: .word ov29_02353558
	arm_func_end ov29_022E8F28

	arm_func_start ov29_022E8F78
ov29_022E8F78: ; 0x022E8F78
	stmdb sp!, {r4, lr}
	ldrb r1, [r0]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	mov r1, #0
	strb r1, [r0]
	ldr r1, _022E8FC4 ; =ov29_02353558
	ldr r0, _022E8FC8 ; =0x00003FCB
	ldr r1, [r1]
	ldrsb r4, [r1]
	bl StringFromId
	mov r1, #0
	mov r3, r0
	mov r0, r4
	mov r2, r1
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E8FC4: .word ov29_02353558
#if defined(EUROPE)
_022E8FC8: .word 0x00003FCD
#elif defined(JAPAN)
_022E8FC8: .word 0x000049CE
#else
_022E8FC8: .word 0x00003FCB
#endif
	arm_func_end ov29_022E8F78

	arm_func_start ov29_022E8FCC
ov29_022E8FCC: ; 0x022E8FCC
	stmdb sp!, {r3, lr}
	ldr r0, _022E8FF4 ; =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0x700
	ldrsb r0, [r0, #0x98]
	ldrb r1, [r1, #0x748]
	bl ov29_0234F25C
	bl ov29_0234F278
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8FF4: .word DUNGEON_PTR
	arm_func_end ov29_022E8FCC

	arm_func_start ov29_022E8FF8
ov29_022E8FF8: ; 0x022E8FF8
	stmdb sp!, {r3, lr}
	bl ov29_0234F2B8
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E8FF8

	arm_func_start ov29_022E9008
ov29_022E9008: ; 0x022E9008
	ldr ip, _022E9010 ; =ov29_0234F290
	bx ip
	.align 2, 0
_022E9010: .word ov29_0234F290
	arm_func_end ov29_022E9008

	arm_func_start ov29_022E9014
ov29_022E9014: ; 0x022E9014
	ldrb r0, [r0]
	cmp r0, #0
	bx lr
	arm_func_end ov29_022E9014
