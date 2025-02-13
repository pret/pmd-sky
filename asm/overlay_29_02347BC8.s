	.include "asm/macros.inc"
	.include "overlay_29_02347BC8.inc"

	.text

	arm_func_start ov29_02347BC8
ov29_02347BC8: ; 0x02347BC8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	ldr r4, _0234800C ; =DUNGEON_PTR
	mov sl, r0
	ldr r4, [r4]
	mov r6, #3
	add r0, r4, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x1a1]
#else
	ldrb r0, [r0, #0x245]
#endif
	mov r5, #0
	mov sb, r3
	str r0, [sp, #0x30]
	str r6, [r4, #0xcc]
	mov r0, #1
	strb r5, [r4, #0xf0]
	strb r0, [r4, #0xec]
	strb r5, [r4, #0xee]
	mov r0, r1
	str r0, [r4, #0x180]
	mov r6, r2
	str r5, [r4, #0xe8]
	ldrh r2, [r6]
	str r1, [sp, #8]
	mov r1, #0x18
	strh r2, [r4, #0xd0]
	ldrh r2, [r6, #2]
	add r0, r4, #0xcc
	strh r2, [r4, #0xd2]
	ldrsh r3, [r6]
	ldrsh r2, [r6, #2]
	smulbb r3, r3, r1
	smulbb r1, r2, r1
	add r2, r1, #4
	add r3, r3, #4
	mov r1, r3, lsl #8
	mov r2, r2, lsl #8
	bl SetEntityPixelPosXY
	mov r0, r5
	str r0, [sp, #0x2c]
	strh r0, [r4, #0xf2]
	ldr r0, [sl]
	mov r5, #1
	cmp r0, #1
	bne _02347C8C
	mov r0, sl
	mov r1, #0x31
	bl ItemIsActive__02347B50
	cmp r0, #0
	movne r0, r5
	strne r0, [sp, #0x2c]
_02347C8C:
	mov r0, r6
	mov r7, #0
	bl ov29_022E2CA0
	cmp r0, #0
	movne r7, #1
	mov r0, sb
	bl ov29_022E2CA0
	cmp r0, #0
	movne r7, #1
	mov r0, #1
	bl ov29_0234B4CC
	cmp r7, #0
	beq _02347E58
	ldrsh r0, [sb]
	ldrsh r1, [r4, #0xd0]
	str r0, [sp, #0x10]
	ldrsh r0, [sb, #2]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	sub r0, r1, r0
	bl abs
	mov r7, r0
	ldrsh r1, [r4, #0xd2]
	ldr r0, [sp, #0xc]
	sub r0, r1, r0
	bl abs
	add r1, r7, r0
	mov r0, #0xc
	mul fp, r1, r0
	add r0, fp, #0xc
	str r0, [sp, #0x24]
	cmp r0, #0x40
	movge r0, #0x40
	strge r0, [sp, #0x24]
	mov r1, fp
	mov r0, #0x80000
	mov r8, #0
	bl _s32_div_f
	str r0, [sp, #0x18]
	ldrsh r0, [r6, #2]
	mov r1, #0x1800
	ldrsh r2, [r6]
	smulbb r7, r0, r1
	ldr r0, [sp, #0x10]
	smulbb r6, r2, r1
	mul r1, r0, r1
	sub r0, r1, r6
	mov r1, fp
	bl _s32_div_f
	str r0, [sp, #0x20]
	ldr r0, [sp, #0xc]
	mov r1, #0x1800
	mul r1, r0, r1
	sub r0, r1, r7
	mov r1, fp
	bl _s32_div_f
	str r0, [sp, #0x1c]
	mov r0, r8
	str r0, [sp, #0x28]
	sub r0, fp, #3
	str r0, [sp, #0x38]
	b _02347E48
_02347D84:
	mov r0, #0
	str r0, [sp, #0x14]
	mov r0, r8, asr #8
	bl sub_020018D0
	ldr r1, [sp, #0x24]
	add r2, r7, #0x400
	mul r0, r1, r0
	str r0, [r4, #0xe8]
	mov r0, r7, asr #8
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x18]
	add r1, r6, #0x400
	add r8, r8, r0
	add r0, r4, #0xcc
	mov fp, r6, asr #8
	bl SetEntityPixelPosXY
	bl IsWaterTileset
	cmp r0, #0
	ldr r1, [sp, #0x34]
	movne r2, #3
	moveq r2, #0
	add r0, fp, #8
	add r1, r1, #0x10
	bl ov29_022E9488
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x14]
	mov r0, #1
	str r0, [sp]
	ldr r1, [sp, #0x30]
	add r0, r4, #0xcc
	mov r2, #0
	mov r3, #0xff
	bl ov29_023457C8
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x14]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _02347E2C
	mov r0, #0x17
	bl AdvanceFrame
_02347E2C:
	ldr r0, [sp, #0x20]
	add r6, r6, r0
	ldr r0, [sp, #0x1c]
	add r7, r7, r0
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x28]
_02347E48:
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x38]
	cmp r1, r0
	blt _02347D84
_02347E58:
	ldrh r1, [sb]
	mov r0, #0
	strh r1, [r4, #0xd0]
	ldrh r1, [sb, #2]
	strh r1, [r4, #0xd2]
	bl ov29_0234B4CC
	ldrsh r0, [sb]
	ldrsh r1, [sb, #2]
	bl GetTile
	mov r6, r0
	ldr r0, [r6, #0xc]
	cmp r0, #0
	beq _02347FD0
	ldr r1, [r0]
	mov r7, #1
	cmp r1, #1
	mov r8, #0
	bne _02347EE8
	mov r1, #0x2d
	bl ItemIsActive__02347B50
	cmp r0, #0
	bne _02347EC4
	ldr r0, [r6, #0xc]
	mov r1, #0x54
	bl ExclusiveItemEffectIsActive__02347B80
	cmp r0, #0
	beq _02347EC8
_02347EC4:
	mov r8, #1
_02347EC8:
	ldr r1, _02348010 ; =0x00000195
	add r0, sp, #0x3c
	bl InitMove
	ldr r0, [r6, #0xc]
	add r1, sp, #0x3c
	bl TwoTurnMoveForcedMiss
	cmp r0, #0
	movne r7, #0
_02347EE8:
	cmp r7, #0
	beq _02347FD0
	cmp r8, #0
	ldr r5, [r6, #0xc]
	movne r6, #0
	bne _02347F10
	mov r0, sl
	mov r1, r5
	bl DoesProjectileHitTarget
	mov r6, r0
_02347F10:
	ldr r1, [sp, #8]
	mov r0, #0
	bl ov29_02344B70
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r6, #0
	beq _02347FA0
	mov r0, r5
	mov r1, #8
	bl ov29_02304A84
#ifdef JAPAN
	mov r0, sl
	mov r1, r5
	mov r2, #0x920
#else
	ldr r2, _02348014 ; =0x00000BE1
	mov r0, sl
	mov r1, r5
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sl
	mov r1, r5
	bl ov29_02307BDC
	mov r2, r0
	ldr r0, [sp, #0x2c]
	mov r3, sl
	cmp r0, #0
	ldreq r0, [sp, #0x68]
	ldreqb r0, [r0]
	cmpeq r0, #0
	movne r0, #1
	moveq r0, #0
	str r5, [sp]
	ldr r5, [sp, #8]
	and r1, r0, #0xff
	mov r0, #1
	str r5, [sp, #4]
	bl ApplyItemEffect
	mov r5, #0
	b _02347FD0
_02347FA0:
	cmp r8, #0
	beq _02347FBC
	ldr r2, _02348018 ; =0x00000BE4
	mov r0, sl
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02347FCC
_02347FBC:
	ldr r2, _0234801C ; =0x00000BE3
	mov r0, sl
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02347FCC:
	mov r5, #1
_02347FD0:
	cmp r5, #0
	beq _02348004
	cmp r5, #1
	beq _02347FE8
	cmp r5, #2
	b _02348004
_02347FE8:
	mov r3, #0
	str r3, [sp]
	ldr r2, [sp, #8]
	mov r0, sl
	add r1, r4, #0xcc
	str r3, [sp, #4]
	bl SpawnDroppedItem
_02348004:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234800C: .word DUNGEON_PTR
_02348010: .word 0x00000195
#ifdef JAPAN
_02348018: .word 0x00000923
_0234801C: .word 0x00000922
#else
_02348014: .word 0x00000BE1
_02348018: .word 0x00000BE4
_0234801C: .word 0x00000BE3
#endif
	arm_func_end ov29_02347BC8

	arm_func_start DoesProjectileHitTarget
DoesProjectileHitTarget: ; 0x02348020
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	ldr r1, [r4, #0xb4]
	mov r5, r0
	ldrb r0, [r1, #9]
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrb r0, [r1, #0xbc]
	cmp r0, #7
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _023480F8 ; =THROWN_ITEM_HIT_CHANCE
	ldrsh r1, [r1]
	cmp r0, r1
	movlt r1, #1
	movge r1, #0
	ldr r0, [r5]
	and r6, r1, #0xff
	cmp r0, #1
	bne _023480A8
	mov r0, r5
	mov r1, #0x2f
	bl ItemIsActive__02347B50
	cmp r0, #0
	movne r6, #0
	bne _023480A8
	mov r0, r5
	mov r1, #0x31
	bl ItemIsActive__02347B50
	cmp r0, #0
	movne r6, #1
_023480A8:
	ldr r0, [r4]
	cmp r0, #1
	bne _023480F0
	mov r0, r4
	bl ov29_022FB9BC
	cmp r0, #0
	bne _023480EC
	mov r0, r4
	mov r1, #0x2c
	bl ItemIsActive__02347B50
	cmp r0, #0
	bne _023480EC
	mov r0, r4
	mov r1, #0x53
	bl ExclusiveItemEffectIsActive__02347B80
	cmp r0, #0
	beq _023480F0
_023480EC:
	mov r6, #0
_023480F0:
	mov r0, r6
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023480F8: .word THROWN_ITEM_HIT_CHANCE
	arm_func_end DoesProjectileHitTarget

	arm_func_start ov29_023480FC
ov29_023480FC: ; 0x023480FC
	bx lr
	arm_func_end ov29_023480FC

	arm_func_start ov29_02348100
ov29_02348100: ; 0x02348100
#ifdef JAPAN
#define OV29_02348100_OFFSET -4
#else
#define OV29_02348100_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r4, r0
	moveq r0, #0
	beq _02348124
	ldr r0, [r4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_02348124:
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r7, [r4, #0xb4]
	ldrb r0, [r7, #6]
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrsh r1, [r7, #4]
	ldrb r2, [r7, #0x5e]
	ldrb r3, [r7, #0x5f]
	add r0, r7, #0x224 + OV29_02348100_OFFSET
	bl sub_02011220
	mov r0, r4
	mov r1, #0x4c
	bl ExclusiveItemEffectIsActive__023482B0
	cmp r0, #0
	ldrne r0, _023482AC ; =_020A1878
	ldrnesh r1, [r7, #0x16]
	ldrnesh r0, [r0]
	addne r0, r1, r0
	strneh r0, [r7, #0x16]
	mov r0, r4
	mov r1, #0x4d
	bl ExclusiveItemEffectIsActive__023482B0
	cmp r0, #0
	ldrne r0, _023482AC ; =_020A1878
	ldrnesh r1, [r7, #0x16]
	ldrnesh r0, [r0]
	addne r0, r1, r0, lsl #1
	strneh r0, [r7, #0x16]
	mov r0, r4
	mov r1, #0x4e
	bl ExclusiveItemEffectIsActive__023482B0
	cmp r0, #0
	beq _023481C4
	ldr r0, _023482AC ; =_020A1878
	ldrsh r1, [r7, #0x16]
	ldrsh r0, [r0]
	add r0, r0, r0, lsl #1
	add r0, r1, r0
	strh r0, [r7, #0x16]
_023481C4:
	mov r5, #0
	mov r0, r4
	mov r1, #0x4a
	mov r6, r5
	bl ExclusiveItemEffectIsActive__023482B0
	cmp r0, #0
	mov r0, r4
	mov r1, #0x4b
	movne r5, #1
	bl ExclusiveItemEffectIsActive__023482B0
	cmp r0, #0
	movne r6, #1
	mov r8, #0
	add r4, r7, #0x124 + OV29_02348100_OFFSET
_023481FC:
	add r0, r7, r8, lsl #3
	cmp r5, #0
	addne r0, r0, #0x100
	ldrneh r1, [r0, #0x26 + OV29_02348100_OFFSET]
	orrne r1, r1, #0x200
	strneh r1, [r0, #0x26 + OV29_02348100_OFFSET]
	bne _02348248
	add r1, r0, #0x100
	ldrh r2, [r1, #0x26 + OV29_02348100_OFFSET]
	add r0, r4, r8, lsl #3
	bic r2, r2, #0x200
	strh r2, [r1, #0x26 + OV29_02348100_OFFSET]
	bl GetMaxPp
	add r2, r7, r8, lsl #3
	mov r0, r0, lsl #0x10
	ldrb r1, [r2, #0x12a + OV29_02348100_OFFSET]
	mov r3, r0, asr #0x10
	cmp r1, r0, asr #16
	strgtb r3, [r2, #0x12a + OV29_02348100_OFFSET]
_02348248:
	add r0, r7, r8, lsl #3
	cmp r6, #0
	addne r0, r0, #0x100
	ldrneh r1, [r0, #0x26 + OV29_02348100_OFFSET]
	orrne r1, r1, #0x400
	strneh r1, [r0, #0x26 + OV29_02348100_OFFSET]
	bne _02348294
	add r1, r0, #0x100
	ldrh r2, [r1, #0x26 + OV29_02348100_OFFSET]
	add r0, r4, r8, lsl #3
	bic r2, r2, #0x400
	strh r2, [r1, #0x26 + OV29_02348100_OFFSET]
	bl GetMaxPp
	add r2, r7, r8, lsl #3
	mov r0, r0, lsl #0x10
	ldrb r1, [r2, #0x12a + OV29_02348100_OFFSET]
	mov r3, r0, asr #0x10
	cmp r1, r0, asr #16
	strgtb r3, [r2, #0x12a + OV29_02348100_OFFSET]
_02348294:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _023481FC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023482AC: .word _020A1878
	arm_func_end ov29_02348100

	arm_func_start ExclusiveItemEffectIsActive__023482B0
ExclusiveItemEffectIsActive__023482B0: ; 0x023482B0
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
#ifdef JAPAN
	add r0, r2, #0x224
#else
	add r0, r2, #0x228
#endif
	bl ExclusiveItemEffectFlagTest
	ldmia sp!, {r3, pc}
	arm_func_end ExclusiveItemEffectIsActive__023482B0

	arm_func_start DisplayFloorCard
DisplayFloorCard: ; 0x023482D4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02348308 ; =DUNGEON_PTR
	mov r5, r0
	ldr r4, [r1]
	bl GetCurrentHiddenStairsType
	mov r3, r0
	ldrb ip, [r4, #0x749]
	ldrsh r1, [r4, #0x1e]
	ldrb r0, [r4, #0x748]
	mov r2, r5
	add r1, ip, r1
	bl HandleFloorCard
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02348308: .word DUNGEON_PTR
	arm_func_end DisplayFloorCard

	arm_func_start HandleFloorCard
HandleFloorCard: ; 0x0234830C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov r7, r0
	mov r6, r1
	mov r0, #4
	mov r1, #0
	mov r5, r2
	mov r4, r3
	bl MemAlloc
	ldr r2, _02348498 ; =ov29_023537C4
	mov r1, #4
	str r0, [r2]
	bl MemZero
	mov r0, #1
	mov r1, #0
	bl ov29_022E0DD8
	mov r0, #3
	mov r1, #0
	bl ov29_022E0DD8
	mov r0, #4
	mov r1, #0
	bl ov29_022E0DD8
	bl ov29_022E0DFC
	mov r0, #1
	mov r1, #0x1000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl sub_02051EB8
	mov sb, r0
	mov r0, #0
	mov r1, r0
	bl sub_02051DFC
	mov r8, r0
	mov r0, #0
	mov r1, r0
	mov r2, r0
	bl GetBgRegionArea
	mov r1, r8
	mov r2, sb
	mov r3, #0
	str r3, [sp]
	mov ip, #0xe
	str ip, [sp, #4]
	str r3, [sp, #8]
	bl sub_02015328
	bl sub_02015588
	cmp r4, #1
	bne _023483D8
	bl sub_02017A00
	b _023483F8
_023483D8:
	cmp r4, #2
	bne _023483E8
	bl sub_02017A20
	b _023483F8
_023483E8:
	mov r1, r6, lsl #0x10
	mov r0, r7
	mov r1, r1, asr #0x10
	bl sub_020178A8
_023483F8:
	mov r0, #0
	bl ov29_0234C738
	mov r6, #2
	ldr r4, _0234849C ; =ov29_0237C694
	b _02348424
_0234840C:
	mov r0, r6
	bl AdvanceFrame
	ldrh r0, [r4, #2]
	tst r0, #1
	bne _0234842C
	sub r5, r5, #1
_02348424:
	cmp r5, #0
	bgt _0234840C
_0234842C:
	mov r0, #2
	mov r1, #0x1000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl ov29_0234C738
	mov r0, #1
	mov r1, #0
	bl ov29_022E0DE4
	mov r0, #3
	mov r1, #0
	bl ov29_022E0DE4
	mov r0, #4
	mov r1, #0
	bl ov29_022E0DE4
	bl ov29_022E0E44
	bl sub_0201551C
	ldr r0, _02348498 ; =ov29_023537C4
	ldr r0, [r0]
	cmp r0, #0
	beq _02348490
	bl MemFree
	ldr r0, _02348498 ; =ov29_023537C4
	mov r1, #0
	str r1, [r0]
_02348490:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02348498: .word ov29_023537C4
_0234849C: .word ov29_0237C694
	arm_func_end HandleFloorCard

	arm_func_start FillMissionDestinationInfo
FillMissionDestinationInfo: ; 0x023484A0
#ifdef JAPAN
#define OV29_023484A0_OFFSET -0xA4
#else
#define OV29_023484A0_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _02348804 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x348
	add r7, r0, #0x400
	add r0, r7, #0x18
	bl ov29_023496EC
	ldr r0, _02348804 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, #0
	mov fp, #0x6f
	mov sl, #0xa5
	mov r5, #3
	mov r6, #1
	ldr r4, _02348804 ; =DUNGEON_PTR
	b _02348798
_023484FC:
#ifdef JAPAN
	mov r0, r8
	bl GetAcceptedMission
	mov sb, r0
	ldrb r0, [sb]
	cmp r0, #5
	ldreqb r1, [r7]
	ldreqb r0, [sb, #4]
	cmpeq r1, r0
	ldreqb r1, [r7, #1]
	ldreqb r0, [sb, #5]
	cmpeq r1, r0
	movne r0, #0
	bne _02348784
#else
	mov r0, r7
	mov r1, r8
	bl GetMissionIfActiveOnFloor
	movs sb, r0
	moveq r0, #0
	beq _02348784
#endif
	strb r6, [r7, #0x18]
	ldrb r0, [sb, #1]
	strb r0, [r7, #0x19]
	ldrb r0, [sb, #2]
	strb r0, [r7, #0x1a]
	ldrsh r0, [sb, #0xe]
	strh r0, [r7, #0x22]
	ldr r0, [r4]
	strb r6, [r0]
	ldrb r0, [r7, #0x19]
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _0234877C
_02348548: ; jump table
	b _02348584 ; case 0
	b _02348590 ; case 1
	b _0234859C ; case 2
	b _023485AC ; case 3
	b _02348608 ; case 4
	b _02348618 ; case 5
	b _02348628 ; case 6
	b _02348648 ; case 7
	b _0234865C ; case 8
	b _02348668 ; case 9
	b _0234869C ; case 10
	b _02348718 ; case 11
	b _0234876C ; case 12
	b _0234877C ; case 13
	b _0234877C ; case 14
_02348584:
	ldrsh r0, [sb, #0x10]
	strh r0, [r7, #0x24]
	b _0234877C
_02348590:
	ldrsh r0, [sb, #0x10]
	strh r0, [r7, #0x24]
	b _0234877C
_0234859C:
	ldrsh r0, [sb, #0x10]
	strh r0, [r7, #0x24]
	strb r6, [r7, #0x30]
	b _0234877C
_023485AC:
	ldrb r0, [sb, #2]
	cmp r0, #0
	ldreq r0, [r4]
	streqb r5, [r0]
	beq _0234877C
	cmp r0, #1
	ldreqsh r0, [sb, #0x14]
	streqh r0, [r7, #0x20]
	streqb sl, [r7, #0x2e]
	beq _0234877C
	cmp r0, #2
	bne _0234877C
	mov r0, #4
	bl DungeonRandInt
	mov r1, r0, lsl #1
	ldr r0, _02348808 ; =ov10_022C48E4
	strb fp, [r7, #0x2e]
	ldrsh r0, [r0, r1]
	strh r0, [r7, #0x1c]
	ldr r1, [r4]
	mov r0, #2
	strb r0, [r1]
	b _0234877C
_02348608:
	ldrsh r0, [sb, #0x14]
	strh r0, [r7, #0x1c]
	strb r6, [r7, #0x2f]
	b _0234877C
_02348618:
	ldr r1, [r4]
	mov r0, #3
	strb r0, [r1]
	b _0234877C
_02348628:
	ldrb r0, [sb, #2]
	cmp r0, #4
	moveq r0, #0
	streqh r0, [r7, #0x1c]
	ldrnesh r0, [sb, #0x14]
	strneh r0, [r7, #0x1c]
	strneb r6, [r7, #0x2f]
	b _0234877C
_02348648:
	ldrsh r0, [sb, #0x14]
	strh r0, [r7, #0x1e]
	ldrsh r0, [sb, #0x10]
	strh r0, [r7, #0x24]
	b _0234877C
_0234865C:
	ldrsh r0, [sb, #0x10]
	strh r0, [r7, #0x24]
	b _0234877C
_02348668:
	ldrb r0, [sb, #2]
	cmp r0, #1
	beq _02348680
	cmp r0, #2
	moveq r0, #0x64
	streqb r0, [r7, #0x34]
_02348680:
	add r0, r7, #0x18
	add r1, sb, #0x10
	mov r2, #1
	bl ov29_023497C8
	ldrsh r0, [sb, #0x14]
	strh r0, [r7, #0x1c]
	b _0234877C
_0234869C:
	ldrb r0, [sb, #2]
	cmp r0, #4
	bne _023486BC
	add r1, sb, #0x10
	add r0, r7, #0x18
	mov r2, r6
	bl ov29_023497C8
	b _0234877C
_023486BC:
	cmp r0, #5
	bne _023486E0
	add r1, sb, #0x10
	add r0, r7, #0x18
	mov r2, r6
	bl ov29_023497C8
	mov r0, #0x64
	strb r0, [r7, #0x34]
	b _0234877C
_023486E0:
	cmp r0, #6
	bne _02348704
	add r0, r7, #0x18
	add r1, sb, #0x10
	mov r2, #2
	bl ov29_023497C8
	ldrb r0, [sb, #0xc]
	strb r0, [r7, #0x2e]
	b _0234877C
_02348704:
	add r1, sb, #0x10
	add r0, r7, #0x18
	mov r2, r6
	bl ov29_023497C8
	b _0234877C
_02348718:
	ldrb r0, [sb, #0xc]
	strb r0, [r7, #0x2e]
	ldrb r0, [r7, #0x1a]
	cmp r0, #0
	bne _02348744
	ldrsh r1, [sb, #0xe]
	add r0, r7, #0x18
	add r2, sb, #0x10
	mov r3, #3
	bl ov29_02349818
	b _0234877C
_02348744:
	add r0, r0, #0xff
	and r0, r0, #0xff
	cmp r0, #4
	bhi _0234877C
	ldrsh r1, [sb, #0xe]
	add r0, r7, #0x18
	mov r2, #0
	mov r3, #3
	bl ov29_02349818
	b _0234877C
_0234876C:
	ldrb r0, [sb, #0xc]
	strb r0, [r7, #0x2e]
	ldrsh r0, [sb, #0x14]
	strh r0, [r7, #0x20]
_0234877C:
	strb r8, [r7, #0x1b]
	mov r0, #1
_02348784:
	cmp r0, #0
	bne _023487A0
	add r0, r8, #1
	mov r0, r0, lsl #0x18
	mov r8, r0, asr #0x18
_02348798:
	cmp r8, #8
	blt _023484FC
_023487A0:
	ldr r0, _02348804 ; =DUNGEON_PTR
	ldr r4, [r0]
	ldrb r0, [r4, #0x760]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsDestinationFloorWithFixedRoom
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsGoldenChamber
	cmp r0, #0
	beq _023487D4
	bl TrySpawnGoldenChamber
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_023487D4:
	ldr r1, _02348804 ; =DUNGEON_PTR
	ldrb r2, [r4, #0x776]
	ldr r0, [r1]
	add r0, r0, #0x4000
	strb r2, [r0, #0xda + OV29_023484A0_OFFSET]
	ldr r0, [r1]
	add r0, r0, #0x4000
	ldrb r1, [r0, #0xda + OV29_023484A0_OFFSET]
	cmp r1, #0x95
	moveq r1, #0xc6
	streqh r1, [r0, #0xd4 + OV29_023484A0_OFFSET]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02348804: .word DUNGEON_PTR
_02348808: .word ov10_022C48E4
	arm_func_end FillMissionDestinationInfo

#ifndef JAPAN
	arm_func_start ov29_0234880C
ov29_0234880C: ; 0x0234880C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	b _02348840
_0234881C:
	mov r0, r5
	mov r1, r4
	bl GetMissionIfActiveOnFloor
	cmp r0, #0
	movne r0, r4
	ldmneia sp!, {r3, r4, r5, pc}
	add r0, r4, #1
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
_02348840:
	cmp r4, #8
	blt _0234881C
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0234880C

	arm_func_start ov29_02348850
ov29_02348850: ; 0x02348850
	stmdb sp!, {r3, lr}
	ldr r0, _02348884 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x760]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r1, #0x348
	add r0, r0, #0x400
	bl ov29_0234880C
	ldr r1, _02348884 ; =DUNGEON_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x763]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02348884: .word DUNGEON_PTR
	arm_func_end ov29_02348850
#endif

	arm_func_start ov29_02348888
ov29_02348888: ; 0x02348888
	ldr ip, _02348890 ; =ov29_02349AD4
	bx ip
	.align 2, 0
_02348890: .word ov29_02349AD4
	arm_func_end ov29_02348888

	arm_func_start ov29_02348894
ov29_02348894: ; 0x02348894
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	mov r4, #8
_023488A0:
	mov r0, r5, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldrb r1, [r0]
	add r5, r5, #1
	cmp r1, #7
	streqb r4, [r0]
	cmp r5, #8
	blt _023488A0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02348894

	arm_func_start ov29_023488C8
ov29_023488C8: ; 0x023488C8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, #0
	mov r5, #5
_023488D4:
	mov r0, r4, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldrb r1, [r0]
	cmp r1, #7
	ldreqb r1, [r0, #1]
	cmpeq r1, #0xb
	bne _02348908
	ldrb r1, [r0, #2]
	add r1, r1, #0xff
	and r1, r1, #0xff
	cmp r1, #4
	strlsb r5, [r0]
_02348908:
	add r4, r4, #1
	cmp r4, #8
	blt _023488D4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_023488C8

	arm_func_start ov29_02348918
ov29_02348918: ; 0x02348918
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02348990 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r5, r0, #0x348
	bl GetForcedLossReason
	cmp r0, #4
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r4, #0
	mov r6, #7
_0234893C:
	mov r0, r4, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldrb r1, [r0]
	cmp r1, #5
	ldreqb r2, [r5, #0x400]
	ldreqb r1, [r0, #4]
	cmpeq r2, r1
	ldreqb r1, [r0, #1]
	cmpeq r1, #3
	ldreqb r1, [r0, #2]
	cmpeq r1, #3
	streqb r6, [r0]
	ldreqb r1, [r0, #0x16]
	cmpeq r1, #5
	bne _02348980
	bl GenerateMissionEggMonster
_02348980:
	add r4, r4, #1
	cmp r4, #8
	blt _0234893C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02348990: .word DUNGEON_PTR
	arm_func_end ov29_02348918

	arm_func_start ov29_02348994
ov29_02348994: ; 0x02348994
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02348A14 ; =DUNGEON_PTR
	mov r4, #0
	ldr r0, [r0]
	add r6, r0, #0x348
_023489A8:
	mov r0, r4, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r5, r0
	ldrb r0, [r5]
	cmp r0, #5
	ldreqb r1, [r6, #0x400]
	ldreqb r0, [r5, #4]
	cmpeq r1, r0
	bne _02348A04
	ldrb r0, [r5, #1]
	cmp r0, #6
	cmpne r0, #4
	bne _02348A04
	ldrsh r0, [r5, #0x14]
	bl IsItemInBag
	cmp r0, #0
	beq _02348A04
	ldrb r0, [r5, #0x16]
	cmp r0, #5
	bne _02348A04
	mov r0, r5
	bl GenerateMissionEggMonster
_02348A04:
	add r4, r4, #1
	cmp r4, #8
	blt _023489A8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02348A14: .word DUNGEON_PTR
	arm_func_end ov29_02348994

	arm_func_start ov29_02348A18
ov29_02348A18: ; 0x02348A18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, #0
	mov r5, #1
	ldr r6, _02348AB8 ; =0x00000E24
	mov sl, r0
	mov r4, r7
	mov fp, r5
	mov sb, r7
	mov r8, r5
_02348A3C:
	mov r0, sb
	mov r1, sl
	mov r2, sb
	mov r3, r8
	str sb, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _02348A90
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r5
	str r7, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _02348A3C
	mov r0, #2
	mov r1, #1
	bl ov29_022E09E8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02348A90:
	mov r0, r4
	mov r2, fp
	mov r3, fp
	add r1, r6, #1
	str r4, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _02348A3C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_02348AB8: .word 0x00000B65
#else
_02348AB8: .word 0x00000E24
#endif
	arm_func_end ov29_02348A18

	arm_func_start ov29_02348ABC
ov29_02348ABC: ; 0x02348ABC
	stmdb sp!, {r3, lr}
	bl GetItemToRetrieve
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl GetItemToRetrieve
	mov r1, r0
	mov r0, #1
	bl ov29_02344B9C
	ldr r1, _02348B20 ; =DUNGEON_PTR
	ldr r0, _02348B24 ; =0x00000E22
	ldr r1, [r1]
	mov r2, #0
	strb r2, [r1, #0x777]
	bl ov29_02348A18
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl GetItemToRetrieve
	mov r1, r0
	mov r0, #0
	bl ov29_02349AD4
	ldr r0, _02348B20 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x77a]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02348B20: .word DUNGEON_PTR
#ifdef JAPAN
_02348B24: .word 0x00000B63
#else
_02348B24: .word 0x00000E22
#endif
	arm_func_end ov29_02348ABC

	arm_func_start ov29_02348B28
ov29_02348B28: ; 0x02348B28
	stmdb sp!, {r4, lr}
	ldr r1, _02348B94 ; =DUNGEON_PTR
	mov r4, r0
	ldr r1, [r1]
	mov r0, #0
	add r1, r1, #0x700
	ldrsh r1, [r1, #0x6a]
	bl ov29_0234B06C
	mov r1, r4
	mov r0, #1
	bl ov29_02344B44
	ldr r1, _02348B98 ; =0x00000E17
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	bl GetLeader
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r0, _02348B9C ; =0x00000E44
	bl ov29_02348A18
	mov r1, #1
	ldr r0, _02348B94 ; =DUNGEON_PTR
	ldr r0, [r0]
	strb r1, [r0, #0x77a]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02348B94: .word DUNGEON_PTR
#ifdef JAPAN
_02348B98: .word 0x00000B58
_02348B9C: .word 0x00000B85
#else
_02348B98: .word 0x00000E17
_02348B9C: .word 0x00000E44
#endif
	arm_func_end ov29_02348B28

	arm_func_start ov29_02348BA0
ov29_02348BA0: ; 0x02348BA0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl ov29_02349A70
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl ov29_023009CC
	cmp r0, #0
	beq _02348BD8
	mov r0, r5
	mov r1, r4
	bl CanSeeTarget
	cmp r0, #0
	bne _02348BE0
_02348BD8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02348BE0:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02348BA0

	arm_func_start ov29_02348BE8
ov29_02348BE8: ; 0x02348BE8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	bl ov29_02349A70
	movs r4, r0
	beq _02348C50
	ldr r1, [r4, #0xb4]
	add r0, sp, #0
	ldrsh r1, [r1, #4]
	mov r2, #0
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02348C58 ; =0x00000E3B
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, _02348C5C ; =0x00000E3C
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, _02348C60 ; =0x00000E3D
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage2
_02348C50:
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_02348BE8_OFFSET -0x2BF
#else
#define OV29_02348BE8_OFFSET 0
#endif
_02348C58: .word 0x00000E3B + OV29_02348BE8_OFFSET
_02348C5C: .word 0x00000E3C + OV29_02348BE8_OFFSET
_02348C60: .word 0x00000E3D + OV29_02348BE8_OFFSET
	arm_func_end ov29_02348BE8

	arm_func_start ov29_02348C64
ov29_02348C64: ; 0x02348C64
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x40
	ldr r1, _02348CFC ; =DUNGEON_PTR
	mov r5, r0
	ldr r0, [r1]
	mov r4, #0
	add r6, r0, #0x348
	b _02348CEC
_02348C84:
	mov r0, r4, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldrb r1, [r0]
	cmp r1, #5
	ldreqb r2, [r6, #0x400]
	ldreqb r1, [r0, #4]
	cmpeq r2, r1
	ldreqb r1, [r0, #1]
	cmpeq r1, #2
	bne _02348CE8
	ldrsh r1, [r0, #0x10]
	add r0, sp, #0
	mov r2, #0x4e
	bl GetName
	mov r0, r5
	bl sub_02024FB8
	add r1, sp, #0
	bl strcpy
	mov r0, r5
	bl sub_02024FB8
	mov r1, r0
	mov r0, r5
	bl ov29_0234B0B4
	b _02348CF4
_02348CE8:
	add r4, r4, #1
_02348CEC:
	cmp r4, #8
	blt _02348C84
_02348CF4:
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02348CFC: .word DUNGEON_PTR
	arm_func_end ov29_02348C64

	arm_func_start ov29_02348D00
ov29_02348D00: ; 0x02348D00
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r0, [r4, #4]
	cmp r0, #0
	beq _02348D34
	bl GetSpecialTargetItem
	ldrsh r1, [r4, #4]
	cmp r1, r0
	bne _02348D34
	ldrb r0, [r4]
	tst r0, #0x80
	movne r0, #1
	ldmneia sp!, {r4, pc}
_02348D34:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02348D00

	arm_func_start ov29_02348D3C
ov29_02348D3C: ; 0x02348D3C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #9
	mov r4, #0
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02348D78
	bl GetItemToRetrieve
	ldrsh r1, [r5, #4]
	cmp r1, r0
	bne _02348DCC
	ldrb r0, [r5]
	tst r0, #0x80
	movne r4, #1
	b _02348DCC
_02348D78:
	mov r0, #0xc
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02348DA8
	bl GetSpecialTargetItem
	ldrh r1, [r5, #2]
	cmp r1, r0
	bne _02348DCC
	ldrb r0, [r5]
	tst r0, #0x80
	movne r4, #3
	b _02348DCC
_02348DA8:
	ldr r0, _02348DD4 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x777]
	cmp r0, #0
	beq _02348DCC
	bl GetItemToRetrieve
	ldrsh r1, [r5, #4]
	cmp r1, r0
	moveq r4, #2
_02348DCC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02348DD4: .word DUNGEON_PTR
	arm_func_end ov29_02348D3C

	arm_func_start ov29_02348DD8
ov29_02348DD8: ; 0x02348DD8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl GetSpecialTargetItem
	cmp r0, #0
	beq _02348E04
	mov r0, r6
	bl EntityIsValid__0234987C
	cmp r0, #0
	bne _02348E0C
_02348E04:
	mov r0, #0
	b _02348E64
_02348E0C:
	ldr r0, [r6, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	movne r0, #0
	bne _02348E64
	ldrsh r0, [r5, #4]
	cmp r0, #0
	beq _02348E60
	bl GetSpecialTargetItem
	ldrsh r1, [r5, #4]
	cmp r1, r0
	bne _02348E60
	ldrb r0, [r5]
	tst r0, #0x80
	beq _02348E60
	mov r0, r6
	bl ov29_02348BA0
	cmp r0, #0
	moveq r0, #1
	movne r0, #2
	b _02348E64
_02348E60:
	mov r0, #0
_02348E64:
	cmp r0, #1
	bne _02348EAC
	cmp r4, #0
	beq _02348E9C
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r5
	mov r0, #0
	bl ov29_02344B44
	ldr r1, _02348EC8 ; =0x00000BD2
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
_02348E9C:
	mov r0, r6
	bl ov29_0234A244
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_02348EAC:
	cmp r0, #2
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl ov29_0234AA98
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02348EC8: .word 0x00000911
#else
_02348EC8: .word 0x00000BD2
#endif
	arm_func_end ov29_02348DD8

	arm_func_start ov29_02348ECC
ov29_02348ECC: ; 0x02348ECC
	stmdb sp!, {r3, lr}
	cmp r1, #1
	mov r2, #0
	bne _02348EF4
	ldrb r1, [r0]
	tst r1, #2
	bne _02348F18
	bl ov29_02348B28
	mov r2, #1
	b _02348F18
_02348EF4:
	cmp r1, #2
	bne _02348F08
	bl ov29_02348ABC
	mov r2, #1
	b _02348F18
_02348F08:
	cmp r1, #3
	bne _02348F18
	bl ov29_0234AC8C
	mov r2, #1
_02348F18:
	mov r0, r2
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02348ECC

	arm_func_start ov29_02348F20
ov29_02348F20: ; 0x02348F20
	stmdb sp!, {r3, lr}
	bl MissionTargetEnemyIsDefeated
	cmp r0, #0
	ldrne r0, _02348FD4 ; =DUNGEON_PTR
	ldrne r0, [r0]
	ldrneb r0, [r0, #1]
	cmpne r0, #0
	beq _02348FCC
	mov r0, #0xa
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02348F68
	ldr r0, _02348FD4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x6e]
	bl ov29_0234A790
	b _02348FB4
_02348F68:
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02348F90
	ldr r0, _02348FD4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x6e]
	bl ov29_0234A8BC
	b _02348FB4
_02348F90:
	mov r0, #0xb
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02348FB4
	ldr r0, _02348FD4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x6e]
	bl ov29_0234ABB0
_02348FB4:
	ldr r0, _02348FD4 ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1, #1]
	ldmia sp!, {r3, pc}
_02348FCC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02348FD4: .word DUNGEON_PTR
	arm_func_end ov29_02348F20

	arm_func_start ov29_02348FD8
ov29_02348FD8: ; 0x02348FD8
	stmdb sp!, {r4, lr}
	mov r4, #0
	bl IsDestinationFloorWithItem
	cmp r0, #0
	beq _02349014
	ldr r0, _02349088 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x77a]
	cmp r0, #0
	bne _02349014
	bl GetItemToRetrieve
	bl IsItemInBag
	cmp r0, #0
	movne r4, #1
	b _02349058
_02349014:
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02349050
	ldr r0, _02349088 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x77a]
	cmp r0, #0
	bne _02349050
	bl GetItemToRetrieve
	mov r1, #0x40
	bl IsItemWithFlagsInBag
	cmp r0, #0
	movne r4, #1
	b _02349058
_02349050:
	mov r0, #0
	ldmia sp!, {r4, pc}
_02349058:
	cmp r4, #0
	beq _02349080
	bl GetItemToRetrieve
	mov r1, r0
	mov r0, #0
	bl ov29_02349AD4
	ldr r0, _02349088 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x77a]
_02349080:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02349088: .word DUNGEON_PTR
	arm_func_end ov29_02348FD8

	arm_func_start ov29_0234908C
ov29_0234908C: ; 0x0234908C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	bl IsDestinationFloorWithItem
	cmp r0, #0
	beq _023490CC
	ldr r0, _02349148 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x77a]
	cmp r0, #0
	bne _023490CC
	bl GetItemToRetrieve
	ldrsh r1, [r5, #4]
	cmp r1, r0
	moveq r4, #1
	b _02349118
_023490CC:
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02349110
	ldr r0, _02349148 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x77a]
	cmp r0, #0
	bne _02349110
	bl GetItemToRetrieve
	ldrsh r1, [r5, #4]
	cmp r1, r0
	bne _02349118
	ldrb r0, [r5]
	tst r0, #0x40
	movne r4, #1
	b _02349118
_02349110:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02349118:
	cmp r4, #0
	beq _02349140
	bl GetItemToRetrieve
	mov r1, r0
	mov r0, #0
	bl ov29_02349AD4
	ldr r0, _02349148 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x77a]
_02349140:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02349148: .word DUNGEON_PTR
	arm_func_end ov29_0234908C

	arm_func_start CheckActiveChallengeRequest
CheckActiveChallengeRequest: ; 0x0234914C
	stmdb sp!, {r3, lr}
	ldr r0, _02349184 ; =DUNGEON_PTR
	mov r1, #5
	ldr r0, [r0]
	strb r1, [sp]
	ldrb r2, [r0, #0x748]
	add r1, sp, #0
	mov r0, #0xb
	bl CheckAcceptedMissionByTypeAndDungeon
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02349184: .word DUNGEON_PTR
	arm_func_end CheckActiveChallengeRequest

	arm_func_start ov29_02349188
ov29_02349188: ; 0x02349188
	ldr r0, _0234919C ; =DUNGEON_PTR
	ldr ip, _023491A0 ; =ov29_023496EC
	ldr r0, [r0]
	add r0, r0, #0x760
	bx ip
	.align 2, 0
_0234919C: .word DUNGEON_PTR
_023491A0: .word ov29_023496EC
	arm_func_end ov29_02349188

	arm_func_start GetMissionDestination
GetMissionDestination: ; 0x023491A4
	ldr r0, _023491B4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x760
	bx lr
	.align 2, 0
_023491B4: .word DUNGEON_PTR
	arm_func_end GetMissionDestination

	arm_func_start ov29_023491B8
ov29_023491B8: ; 0x023491B8
	ldr ip, _023491C0 ; =ov29_02349A70
	bx ip
	.align 2, 0
_023491C0: .word ov29_02349A70
	arm_func_end ov29_023491B8

	arm_func_start IsOutlawOrChallengeRequestFloor
IsOutlawOrChallengeRequestFloor: ; 0x023491C4
	stmdb sp!, {r3, lr}
	mov r0, #0xb
	bl IsCurrentMissionType
	cmp r0, #0
	bne _023491F8
	mov r0, #0xa
	bl IsCurrentMissionType
	cmp r0, #0
	bne _023491F8
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02349200
_023491F8:
	mov r0, #1
	ldmia sp!, {r3, pc}
_02349200:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsOutlawOrChallengeRequestFloor

	arm_func_start IsDestinationFloor
IsDestinationFloor: ; 0x02349208
	ldr r0, _02349218 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x760]
	bx lr
	.align 2, 0
_02349218: .word DUNGEON_PTR
	arm_func_end IsDestinationFloor

	arm_func_start IsCurrentMissionType
IsCurrentMissionType: ; 0x0234921C
	ldr r1, _0234924C ; =DUNGEON_PTR
	ldr r2, [r1]
	ldrb r1, [r2, #0x760]
	cmp r1, #0
	beq _0234923C
	ldrb r1, [r2, #0x761]
	cmp r1, r0
	beq _02349244
_0234923C:
	mov r0, #0
	bx lr
_02349244:
	mov r0, #1
	bx lr
	.align 2, 0
_0234924C: .word DUNGEON_PTR
	arm_func_end IsCurrentMissionType

	arm_func_start IsCurrentMissionTypeExact
IsCurrentMissionTypeExact: ; 0x02349250
	ldr r2, _02349288 ; =DUNGEON_PTR
	ldr r3, [r2]
	ldrb r2, [r3, #0x760]
	cmp r2, #0
	beq _02349278
	ldrb r2, [r3, #0x761]
	cmp r2, r0
	ldreqb r0, [r3, #0x762]
	cmpeq r0, r1
	beq _02349280
_02349278:
	mov r0, #0
	bx lr
_02349280:
	mov r0, #1
	bx lr
	.align 2, 0
_02349288: .word DUNGEON_PTR
	arm_func_end IsCurrentMissionTypeExact

	arm_func_start IsOutlawMonsterHouseFloor
IsOutlawMonsterHouseFloor: ; 0x0234928C
	stmdb sp!, {r3, lr}
	mov r0, #0xa
	mov r1, #7
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsOutlawMonsterHouseFloor

	arm_func_start IsGoldenChamber
IsGoldenChamber: ; 0x023492B0
	stmdb sp!, {r3, lr}
	mov r0, #3
	mov r1, #2
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsGoldenChamber

	arm_func_start IsLegendaryChallengeFloor
IsLegendaryChallengeFloor: ; 0x023492D4
	stmdb sp!, {r3, lr}
	mov r0, #0xb
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02349308
	ldr r0, _02349310 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x762]
	add r0, r0, #0xff
	and r0, r0, #0xff
	cmp r0, #4
	movls r0, #1
	ldmlsia sp!, {r3, pc}
_02349308:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02349310: .word DUNGEON_PTR
	arm_func_end IsLegendaryChallengeFloor

	arm_func_start IsJirachiChallengeFloor
IsJirachiChallengeFloor: ; 0x02349314
	stmdb sp!, {r3, lr}
	mov r0, #0xb
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02349340
	ldr r0, _02349348 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x762]
	cmp r0, #5
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_02349340:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02349348: .word DUNGEON_PTR
	arm_func_end IsJirachiChallengeFloor

	arm_func_start IsDestinationFloorWithMonster
IsDestinationFloorWithMonster: ; 0x0234934C
	stmdb sp!, {r3, lr}
	ldr r0, _02349374 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x760
	bl FloorHasMissionMonster
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02349374: .word DUNGEON_PTR
	arm_func_end IsDestinationFloorWithMonster

	arm_func_start ov29_02349378
ov29_02349378: ; 0x02349378
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _023493F4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r6, r0, #0x760
	mov r0, r6
	bl FloorHasMissionMonster
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsh r0, [r6, #0xc]
	mov r4, #0
	mov r5, r4
	cmp r0, #0
	beq _023493E0
	bl GetSpriteFileSize
	add r4, r4, r0
	b _023493E0
_023493BC:
	add r0, r6, r5, lsl #1
	ldrsh r0, [r0, #0xe]
	cmp r0, #0
	beq _023493D4
	bl GetSpriteFileSize
	add r4, r4, r0
_023493D4:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_023493E0:
	ldrsh r0, [r6, #0x14]
	cmp r5, r0
	blt _023493BC
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023493F4: .word DUNGEON_PTR
	arm_func_end ov29_02349378

	arm_func_start LoadMissionMonsterSprites
LoadMissionMonsterSprites: ; 0x023493F8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _0234946C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r6, r0, #0x760
	mov r0, r6
	bl FloorHasMissionMonster
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsh r0, [r6, #0xc]
	cmp r0, #0
	beq _0234942C
	mov r1, #1
	bl LoadMonsterSprite
_0234942C:
	mov r5, #0
	mov r4, #1
	b _0234945C
_02349438:
	add r0, r6, r5, lsl #1
	ldrsh r0, [r0, #0xe]
	cmp r0, #0
	beq _02349450
	mov r1, r4
	bl LoadMonsterSprite
_02349450:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_0234945C:
	ldrsh r0, [r6, #0x14]
	cmp r5, r0
	blt _02349438
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0234946C: .word DUNGEON_PTR
	arm_func_end LoadMissionMonsterSprites

	arm_func_start MissionTargetEnemyIsDefeated
MissionTargetEnemyIsDefeated: ; 0x02349470
	ldr r0, _0234948C ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x760]
	cmp r0, #0
	ldrneb r0, [r1, #0x77b]
	moveq r0, #0
	bx lr
	.align 2, 0
_0234948C: .word DUNGEON_PTR
	arm_func_end MissionTargetEnemyIsDefeated

	arm_func_start SetMissionTargetEnemyDefeated
SetMissionTargetEnemyDefeated: ; 0x02349490
	ldr r1, _023494A0 ; =DUNGEON_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x77b]
	bx lr
	.align 2, 0
_023494A0: .word DUNGEON_PTR
	arm_func_end SetMissionTargetEnemyDefeated

	arm_func_start IsDestinationFloorWithFixedRoom
IsDestinationFloorWithFixedRoom: ; 0x023494A4
	ldr r0, _023494C8 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x760]
	cmp r0, #0
	ldrneb r0, [r1, #0x776]
	cmpne r0, #0
	moveq r0, #0
	movne r0, #1
	bx lr
	.align 2, 0
_023494C8: .word DUNGEON_PTR
	arm_func_end IsDestinationFloorWithFixedRoom

	arm_func_start GetItemToRetrieve
GetItemToRetrieve: ; 0x023494CC
	ldr r0, _023494EC ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x760]
	add r1, r1, #0x760
	cmp r0, #0
	ldrnesh r0, [r1, #4]
	moveq r0, #0
	bx lr
	.align 2, 0
_023494EC: .word DUNGEON_PTR
	arm_func_end GetItemToRetrieve

	arm_func_start GetItemToDeliver
GetItemToDeliver: ; 0x023494F0
	stmdb sp!, {r4, lr}
	ldr r1, _02349518 ; =DUNGEON_PTR
	mov r0, #7
	ldr r1, [r1]
	add r4, r1, #0x760
	bl IsCurrentMissionType
	cmp r0, #0
	ldrnesh r0, [r4, #6]
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02349518: .word DUNGEON_PTR
	arm_func_end GetItemToDeliver

	arm_func_start GetSpecialTargetItem
GetSpecialTargetItem: ; 0x0234951C
	stmdb sp!, {r4, lr}
	ldr r1, _02349560 ; =DUNGEON_PTR
	mov r0, #3
	ldr r2, [r1]
	mov r1, #1
	add r4, r2, #0x760
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	bne _02349550
	mov r0, #0xc
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02349558
_02349550:
	ldrsh r0, [r4, #8]
	ldmia sp!, {r4, pc}
_02349558:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02349560: .word DUNGEON_PTR
	arm_func_end GetSpecialTargetItem

	arm_func_start IsDestinationFloorWithItem
IsDestinationFloorWithItem: ; 0x02349564
	stmdb sp!, {r4, lr}
	ldr r0, _023495C0 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x760]
	add r4, r1, #0x760
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	bne _023495B0
	mov r0, #7
	bl IsCurrentMissionType
	cmp r0, #0
	bne _023495B0
	ldrsh r0, [r4, #4]
	cmp r0, #0
	bne _023495B8
_023495B0:
	mov r0, #0
	ldmia sp!, {r4, pc}
_023495B8:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_023495C0: .word DUNGEON_PTR
	arm_func_end IsDestinationFloorWithItem

	arm_func_start IsDestinationFloorWithHiddenOutlaw
IsDestinationFloorWithHiddenOutlaw: ; 0x023495C4
	stmdb sp!, {r3, lr}
	mov r0, #9
	mov r1, #1
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsDestinationFloorWithHiddenOutlaw

	arm_func_start IsDestinationFloorWithFleeingOutlaw
IsDestinationFloorWithFleeingOutlaw: ; 0x023495E8
	stmdb sp!, {r3, lr}
	mov r0, #0xa
	mov r1, #5
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	bne _02349618
	mov r0, #9
	mov r1, #2
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_02349618:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end IsDestinationFloorWithFleeingOutlaw

	arm_func_start GetMissionTargetEnemy
GetMissionTargetEnemy: ; 0x02349620
	ldr r0, _02349634 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x6e]
	bx lr
	.align 2, 0
_02349634: .word DUNGEON_PTR
	arm_func_end GetMissionTargetEnemy

	arm_func_start GetMissionEnemyMinionGroup
GetMissionEnemyMinionGroup: ; 0x02349638
	ldr r1, _02349654 ; =DUNGEON_PTR
	add r0, r0, #1
	ldr r1, [r1]
	add r0, r1, r0, lsl #1
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x6e]
	bx lr
	.align 2, 0
_02349654: .word DUNGEON_PTR
	arm_func_end GetMissionEnemyMinionGroup

	arm_func_start ov29_02349658
ov29_02349658: ; 0x02349658
	ldr r0, _02349684 ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1]
	ldr r1, [r0]
	strb r2, [r1, #1]
	ldr r1, [r0]
	strb r2, [r1, #2]
	ldr r0, [r0]
	strb r2, [r0, #3]
	bx lr
	.align 2, 0
_02349684: .word DUNGEON_PTR
	arm_func_end ov29_02349658

	arm_func_start ov29_02349688
ov29_02349688: ; 0x02349688
	ldr r1, _02349698 ; =DUNGEON_PTR
	ldr r1, [r1]
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_02349698: .word DUNGEON_PTR
	arm_func_end ov29_02349688

	arm_func_start ov29_0234969C
ov29_0234969C: ; 0x0234969C
	ldr r1, _023496AC ; =DUNGEON_PTR
	ldr r1, [r1]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_023496AC: .word DUNGEON_PTR
	arm_func_end ov29_0234969C

	arm_func_start ov29_023496B0
ov29_023496B0: ; 0x023496B0
	ldr r0, _023496C0 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	bx lr
	.align 2, 0
_023496C0: .word DUNGEON_PTR
	arm_func_end ov29_023496B0

	arm_func_start SetTargetMonsterNotFoundFlag
SetTargetMonsterNotFoundFlag: ; 0x023496C4
	ldr r1, _023496D4 ; =DUNGEON_PTR
	ldr r1, [r1]
	strb r0, [r1, #3]
	bx lr
	.align 2, 0
_023496D4: .word DUNGEON_PTR
	arm_func_end SetTargetMonsterNotFoundFlag

	arm_func_start GetTargetMonsterNotFoundFlag
GetTargetMonsterNotFoundFlag: ; 0x023496D8
	ldr r0, _023496E8 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	bx lr
	.align 2, 0
_023496E8: .word DUNGEON_PTR
	arm_func_end GetTargetMonsterNotFoundFlag

	arm_func_start ov29_023496EC
ov29_023496EC: ; 0x023496EC
	mov ip, #0
	strb ip, [r0]
	strb ip, [r0, #0x18]
	strb ip, [r0, #0x17]
	strb ip, [r0, #0x1a]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	strb ip, [r0, #0x16]
	strh ip, [r0, #0xa]
	strb ip, [r0, #0x1b]
	strb ip, [r0, #0x1c]
	strh ip, [r0, #0xc]
	mov r3, ip
_02349724:
	add r1, ip, #1
	mov r1, r1, lsl #0x10
	add r2, r0, ip, lsl #1
	mov ip, r1, asr #0x10
	strh r3, [r2, #0xe]
	cmp ip, #3
	blt _02349724
	strh r3, [r0, #0x14]
	bx lr
	arm_func_end ov29_023496EC

	arm_func_start FloorHasMissionMonster
FloorHasMissionMonster: ; 0x02349748
	ldrb r1, [r0]
	cmp r1, #0
	moveq r0, #0
	bxeq lr
	ldrb r0, [r0, #1]
	cmp r0, #7
	cmpne r0, #0
	cmpne r0, #2
	cmpne r0, #1
	beq _02349780
	add r0, r0, #0xf8
	and r0, r0, #0xff
	cmp r0, #3
	bhi _02349788
_02349780:
	mov r0, #1
	bx lr
_02349788:
	mov r0, #0
	bx lr
	arm_func_end FloorHasMissionMonster

#ifndef JAPAN
	arm_func_start GetMissionIfActiveOnFloor
GetMissionIfActiveOnFloor: ; 0x02349790
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl GetAcceptedMission
	ldrb r1, [r0]
	cmp r1, #5
	ldreqb r2, [r4]
	ldreqb r1, [r0, #4]
	cmpeq r2, r1
	ldreqb r2, [r4, #1]
	ldreqb r1, [r0, #5]
	cmpeq r2, r1
	movne r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end GetMissionIfActiveOnFloor
#endif

	arm_func_start ov29_023497C8
ov29_023497C8: ; 0x023497C8
	stmdb sp!, {r4, lr}
	mov ip, #0
	mov r4, ip
	b _02349804
_023497D8:
	mov r3, r4, lsl #1
	ldrsh lr, [r1, r3]
	cmp lr, #0
	addne r3, ip, #1
	addne ip, r0, ip, lsl #1
	movne r3, r3, lsl #0x10
	strneh lr, [ip, #0xe]
	movne ip, r3, asr #0x10
	add r3, r4, #1
	mov r3, r3, lsl #0x10
	mov r4, r3, asr #0x10
_02349804:
	cmp r4, #2
	cmplt ip, r2
	blt _023497D8
	strh ip, [r0, #0x14]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_023497C8

	arm_func_start ov29_02349818
ov29_02349818: ; 0x02349818
	stmdb sp!, {r4, lr}
	mov r4, #0
	add ip, r4, #1
	mov ip, ip, lsl #0x10
	strh r1, [r0, #0xe]
	cmp r2, #0
	mov ip, ip, asr #0x10
	beq _02349874
	b _02349868
_0234983C:
	mov r1, r4, lsl #1
	ldrsh lr, [r2, r1]
	cmp lr, #0
	addne r1, ip, #1
	addne ip, r0, ip, lsl #1
	movne r1, r1, lsl #0x10
	strneh lr, [ip, #0xe]
	movne ip, r1, asr #0x10
	add r1, r4, #1
	mov r1, r1, lsl #0x10
	mov r4, r1, asr #0x10
_02349868:
	cmp r4, #2
	cmplt ip, r3
	blt _0234983C
_02349874:
	strh ip, [r0, #0x14]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02349818
