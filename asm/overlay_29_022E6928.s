	.include "asm/macros.inc"
	.include "overlay_29_022E6928.inc"

	.text

	arm_func_start PlayStairSensorArrowEffect
PlayStairSensorArrowEffect: ; 0x022E6928
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
	bl GetEffectAnimationWanOffset
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
	arm_func_end PlayStairSensorArrowEffect

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
	bl GetPixelOffsetFromSprite
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
