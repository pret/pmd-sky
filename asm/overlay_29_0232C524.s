	.include "asm/macros.inc"
	.include "overlay_29_0232C524.inc"

	.text

	arm_func_start DoMoveRebound
DoMoveRebound: ; 0x0232C524
	stmdb sp!, {r3, lr}
	mov r2, #0xa
	bl ov29_02318D98
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveRebound

	arm_func_start DoMoveSwitchPositions
DoMoveSwitchPositions: ; 0x0232C538
	stmdb sp!, {r3, lr}
	ldr r3, [r0, #0xb4]
#ifdef JAPAN
	ldrb r2, [r3, #0x107]
	cmp r2, #1
	movlo r2, #1
	strlob r2, [r3, #0x107]
#else
	ldrb r2, [r3, #0x108]
	cmp r2, #1
	movlo r2, #1
	strlob r2, [r3, #0x108]
#endif
	mov r2, #1
	bl TrySwitchPlace
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveSwitchPositions

	arm_func_start DoMoveStayAway
DoMoveStayAway: ; 0x0232C560
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryWarp
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveStayAway

	arm_func_start DoMoveCleanse
DoMoveCleanse: ; 0x0232C578
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldr r1, [sb, #0xb4]
	mov sl, r0
	ldrb r0, [r1, #6]
	mov r6, #0
	cmp r0, #0
	bne _0232C66C
	mov fp, #1
	ldr r4, _0232C6A8 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, r6
	mov r8, r6
	mov r5, fp
	mov r3, #6
_0232C5B0:
	mul r0, r2, r3
	ldr r1, [r4]
	ldr r1, [r1, #0x384]
	ldrb r7, [r1, r0]
	tst r7, #1
	movne r7, fp
	moveq r7, r8
	tst r7, #0xff
	beq _0232C5E8
	ldrb r7, [r1, r0]
	tst r7, #8
	bicne r7, r7, #8
	movne r6, r5
	strneb r7, [r1, r0]
_0232C5E8:
	add r2, r2, #1
	cmp r2, #0x32
	blt _0232C5B0
	mov r8, #0
	ldr r4, _0232C6AC ; =DUNGEON_PTR
	mov fp, r8
	mov r5, #1
_0232C604:
	ldr r0, [r4]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xa84]
#else
	ldr r7, [r0, #0xb28]
#endif
	mov r0, r7
	bl EntityIsValidMoveEffects__0232C500
	cmp r0, #0
	beq _0232C660
	ldr r1, [r7, #0xb4]
	ldrb r0, [r1, #0x62]
	tst r0, #1
	movne r2, r5
	moveq r2, fp
	tst r2, #0xff
	beq _0232C660
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrneb r0, [r1, #0x62]
	movne r6, #1
	bicne r0, r0, #8
	strneb r0, [r1, #0x62]
_0232C660:
	add r8, r8, #1
	cmp r8, #4
	blt _0232C604
_0232C66C:
	cmp r6, #0
	beq _0232C688
	ldr r2, _0232C6B0 ; =0x00000EFF
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232C698
_0232C688:
#ifdef JAPAN
	ldr r2, _0232DAF8 ; =0x00000C42
	mov r0, sl
	mov r1, sb
#else
	mov r0, sl
	mov r1, sb
	mov r2, #0xf00
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0232C698:
	bl ov29_022E8104
	bl ov29_022E81F8
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0232C6A8: .word BAG_ITEMS_PTR_MIRROR
_0232C6AC: .word DUNGEON_PTR
#ifdef JAPAN
_0232C6B0: .word 0x00000C41
_0232DAF8: .word 0x00000C42
#else
_0232C6B0: .word 0x00000EFF
#endif
	arm_func_end DoMoveCleanse

	arm_func_start DoMoveSiesta
DoMoveSiesta: ; 0x0232C6B4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	ldr r1, _0232C6EC ; =SLEEP_TURN_RANGE
	mov r0, r4
	mov r2, #1
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r5
	mov r1, r4
	mov r3, #1
	bl TryInflictSleepStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232C6EC: .word SLEEP_TURN_RANGE
	arm_func_end DoMoveSiesta

	arm_func_start DoMoveTwoEdge
DoMoveTwoEdge: ; 0x0232C6F0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x20
	mov r4, #0
	mov sb, r1
	strb r4, [sp, #0x1d]
	strb r4, [sp, #0x1c]
	mov sl, r0
	ldr r1, [sb, #0xb4]
	mov r8, r2
	ldrsh r0, [r1, #0x10]
	mov r7, r3
	ldr r6, [sl, #0xb4]
	subs r5, r0, #1
	ldrh r0, [r8, #4]
	movmi r5, r4
	bl GetMoveCategory
	mov r4, r0
	mov r0, r8
	mov r1, r7
	bl GetDamageSourceWrapper
	mov r2, r5
	add r5, sp, #0x1d
	mov r3, #0
	str r5, [sp]
	stmib sp, {r3, r4}
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r1, sb
	str r3, [sp, #0x18]
	mov r0, sl
	bl CalcDamageFixedWrapper
	ldrsh r0, [r6, #0x10]
	add r0, r0, r0, lsr #31
	movs r5, r0, asr #1
	ldrh r0, [r8, #4]
	movmi r5, #0
	bl GetMoveCategory
	mov r4, r0
	mov r0, r8
	mov r1, r7
	bl GetDamageSourceWrapper
	add r1, sp, #0x1c
	mov r3, #0
	stmia sp, {r1, r3, r4}
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r0, sl
	mov r1, sl
	mov r2, r5
	str r3, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1d]
	cmp r0, #0
	moveq r1, #1
	movne r1, #0
	ldrb r0, [sp, #0x1c]
	strb r1, [sp, #0x1d]
	cmp r0, #0
	moveq r1, #1
	movne r1, #0
	ldrb r0, [sp, #0x1d]
	strb r1, [sp, #0x1c]
	cmp r0, #0
	bne _0232C800
	tst r1, #0xff
	beq _0232C808
_0232C800:
	mov r0, #1
	b _0232C80C
_0232C808:
	mov r0, #0
_0232C80C:
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end DoMoveTwoEdge

	arm_func_start DoMoveNoMove
DoMoveNoMove: ; 0x0232C818
	stmdb sp!, {r3, lr}
	mov r2, #0
	bl TryInflictMuzzledStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveNoMove

	arm_func_start DoMoveScan
DoMoveScan: ; 0x0232C82C
	stmdb sp!, {r3, lr}
	bl RevealItems
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveScan

	arm_func_start DoMovePowerEars
DoMovePowerEars: ; 0x0232C83C
	stmdb sp!, {r3, lr}
	bl RevealEnemies
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMovePowerEars

	arm_func_start DoMoveTransfer
DoMoveTransfer: ; 0x0232C84C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r0
	mov r8, r1
	mov fp, #0
	bl FixedRoomIsSubstituteRoom
	cmp r0, #0
	beq _0232C890
	mov r0, fp
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0232CA0C ; =0x00000F02
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, fp
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0232C890:
	ldr r7, [r8, #0xb4]
	ldrb r0, [r7, #6]
	cmp r0, #0
	beq _0232C9E4
	ldrsh r4, [r7, #2]
	mov r0, fp
	mov r1, r8
	mov r2, r0
	mov r5, r4
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r7, #0xbc]
	cmp r0, #6
	bls _0232C8DC
	ldr r2, _0232CA0C ; =0x00000F02
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, fp
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0232C8DC:
	mov r6, fp
	b _0232C970
_0232C8E4:
	mov r0, #0
	bl GetMonsterIdToSpawn
	mov r1, #0
	mov r4, r0
	bl MewSpawnCheck
	cmp r0, #0
	beq _0232C96C
	mov r0, r7
	bl ov29_022FBDE0
	cmp r0, #0
	bne _0232C96C
	ldrb r0, [r7, #6]
	cmp r0, #0
	cmpne r5, r4
	beq _0232C96C
	mov r0, r4
	bl GetBodySize
	mov sl, r0
	mov r0, r5
	bl GetBodySize
	cmp sl, r0
	bne _0232C96C
	ldrb r1, [r8, #0xaa]
	mov r0, r4
	bl ov29_022E1AAC
	str r0, [sp]
	mov r0, r8
	bl ov29_022E1AD4
	mov sl, r0
	bl ov29_022E1EF8
	add r1, sl, r0
	ldr r0, [sp]
	cmp r1, r0
	bge _0232C978
_0232C96C:
	add r6, r6, #1
_0232C970:
	cmp r6, #0x1e
	blt _0232C8E4
_0232C978:
	cmp r6, #0x1e
	ldrnesh r0, [r7, #2]
	cmpne r0, r4
	bne _0232C99C
	ldr r2, _0232CA0C ; =0x00000F02
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232CA04
_0232C99C:
	mov r0, #1
	bl sub_02024FB8
	mov r5, r0
	mov r1, r4
	mov r2, #0x4e
	bl GetNameWithGender
	mov r1, r5
	mov r0, #1
	bl ov29_0234B0B4
	ldr r2, _0232CA10 ; =0x00000F01
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	mov r1, r4
	bl ov29_022FD7A0
	mov fp, #1
	b _0232CA04
_0232C9E4:
	mov r0, fp
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0232CA0C ; =0x00000F02
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
_0232CA04:
	mov r0, fp
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_0232CA0C: .word 0x00000C44
_0232CA10: .word 0x00000C43
#else
_0232CA0C: .word 0x00000F02
_0232CA10: .word 0x00000F01
#endif
	arm_func_end DoMoveTransfer

	arm_func_start DoMoveSlowDown
DoMoveSlowDown: ; 0x0232CA14
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, r2
	bl LowerSpeed
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveSlowDown

	arm_func_start DoMoveSearchlight
DoMoveSearchlight: ; 0x0232CA2C
	stmdb sp!, {r3, lr}
	bl RevealWholeFloor
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveSearchlight

	arm_func_start DoMovePetrify
DoMovePetrify: ; 0x0232CA3C
	stmdb sp!, {r3, lr}
	bl TryInflictPetrifiedStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMovePetrify

	arm_func_start DoMovePounce
DoMovePounce: ; 0x0232CA4C
	stmdb sp!, {r3, lr}
	mov r2, #8
	bl TryPounce
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMovePounce

	arm_func_start DoMoveTrawl
DoMoveTrawl: ; 0x0232CA60
	stmdb sp!, {r3, lr}
	bl ov29_0231F6E4
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveTrawl

	arm_func_start DoMoveEscape
DoMoveEscape: ; 0x0232CA70
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0
	mov r4, r1
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r0, _0232CAFC ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	beq _0232CAB4
	ldr r2, _0232CB00 ; =0x00000F04
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232CAF4
_0232CAB4:
	mov r0, r5
	bl ov29_022FBDF0
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	beq _0232CAE8
	ldr r2, _0232CB04 ; =0x00000F03
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0xa
	bl ov29_0234BA54
_0232CAE8:
	mov r0, #1
	mov r1, r0
	bl ov29_022E09E8
_0232CAF4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232CAFC: .word DUNGEON_PTR
#ifdef JAPAN
_0232CB00: .word 0x00000C46
_0232CB04: .word 0x00000C45
#else
_0232CB00: .word 0x00000F04
_0232CB04: .word 0x00000F03
#endif
	arm_func_end DoMoveEscape

	arm_func_start DoMoveDrought
DoMoveDrought: ; 0x0232CB08
	stmdb sp!, {r3, lr}
	bl TryDrought
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveDrought

	arm_func_start DoMoveTrapBuster
DoMoveTrapBuster: ; 0x0232CB18
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r7, #0
	bl GetTileAtEntity
	mov r4, r0
	bl IsFullFloorFixedRoom
	cmp r0, #0
	beq _0232CB58
	ldr r1, _0232CCB0 ; =0x00000F07
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r7
	b _0232CCA8
_0232CB58:
	ldrb r0, [r4, #7]
	cmp r0, #0xff
	beq _0232CB74
	mov r0, sb
	bl HasDropeyeStatus
	cmp r0, #0
	beq _0232CB94
_0232CB74:
	bl GetVisibilityRange
	ldrsh r2, [sb, #4]
	ldrsh r1, [sb, #6]
	sub r8, r2, r0
	sub fp, r1, r0
	add r4, r2, r0
	add r5, r1, r0
	b _0232CBD0
_0232CB94:
	ldr r0, _0232CCB4 ; =DUNGEON_PTR
	ldrb r2, [r4, #7]
	ldr r0, [r0]
	mov r1, #0x1c
#ifdef JAPAN
	add r0, r0, #0x244
#else
	add r0, r0, #0x2e8
#endif
	add r0, r0, #0xec00
	mla r0, r2, r1, r0
	ldrsh r3, [r0, #2]
	ldrsh r2, [r0, #4]
	ldrsh r1, [r0, #6]
	ldrsh r0, [r0, #8]
	sub r8, r3, #1
	sub fp, r2, #1
	add r4, r1, #1
	add r5, r0, #1
_0232CBD0:
	ldr r0, _0232CCB8 ; =ov29_02352B38
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	strh r1, [sp, #4]
	strh r0, [sp, #6]
	b _0232CC68
_0232CBE8:
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	mov r6, fp
	str r0, [sp]
	b _0232CC5C
_0232CBFC:
	mov r0, r8
	mov r1, r6
	bl GetTileSafe
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0232CC58
	ldr r1, [r0]
	cmp r1, #2
	bne _0232CC58
	bl GetTrapInfo
	ldrb r1, [r0, #2]
	tst r1, #1
	bne _0232CC58
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _0232CC58
	ldr r2, [sp]
	add r0, sp, #8
	mov r1, #0
	strh r2, [sp, #8]
	strh r6, [sp, #0xa]
	bl TryRemoveTrap
	mov r7, #1
_0232CC58:
	add r6, r6, #1
_0232CC5C:
	cmp r6, r5
	ble _0232CBFC
	add r8, r8, #1
_0232CC68:
	cmp r8, r4
	ble _0232CBE8
	cmp r7, #0
	beq _0232CC94
	ldr r2, _0232CCBC ; =0x00000F05
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	bl UpdateMinimap
	bl UpdateTrapsVisibility
	b _0232CCA4
_0232CC94:
	ldr r2, _0232CCC0 ; =0x00000F06
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0232CCA4:
	mov r0, r7
_0232CCA8:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define DO_MOVE_TRAP_BUSTER_OFFSET -0x2Be
#else
#define DO_MOVE_TRAP_BUSTER_OFFSET 0
#endif
_0232CCB0: .word 0x00000F07 + DO_MOVE_TRAP_BUSTER_OFFSET
_0232CCB4: .word DUNGEON_PTR
_0232CCB8: .word ov29_02352B38
_0232CCBC: .word 0x00000F05 + DO_MOVE_TRAP_BUSTER_OFFSET
_0232CCC0: .word 0x00000F06 + DO_MOVE_TRAP_BUSTER_OFFSET
	arm_func_end DoMoveTrapBuster

	arm_func_start DoMoveWildCall
DoMoveWildCall: ; 0x0232CCC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r0, [sl, #0xb4]
	mov sb, r1
	ldrb r0, [r0, #6]
	mov r6, #0
	mov r4, #0
	cmp r0, #0
	ldrne r0, _0232CD88 ; =DUNGEON_PTR
	movne r5, #0x10
	ldrne r0, [r0]
	moveq r5, #4
#ifdef JAPAN
	addne r0, r0, #0x294
#else
	addne r0, r0, #0x338
#endif
	ldreq r0, _0232CD88 ; =DUNGEON_PTR
	mov fp, #1
	ldreq r0, [r0]
#ifdef JAPAN
	addeq r0, r0, #0x284
#else
	addeq r0, r0, #0x328
#endif
	add r7, r0, #0x12800
	b _0232CD60
_0232CD10:
	ldr r8, [r7, r4, lsl #2]
	mov r0, r8
	bl EntityIsValidMoveEffects__0232C500
	cmp r0, #0
	cmpne sl, r8
	beq _0232CD5C
	mov r0, sl
	mov r1, r8
	mov r2, fp
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #0
	bne _0232CD5C
	mov r0, sl
	mov r1, r8
	mov r2, #2
	add r3, sl, #4
	bl TryWarp
	mov r6, #1
_0232CD5C:
	add r4, r4, #1
_0232CD60:
	cmp r4, r5
	blt _0232CD10
	cmp r6, #0
	bne _0232CD80
	ldr r2, _0232CD8C ; =0x00000F08
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0232CD80:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0232CD88: .word DUNGEON_PTR
#ifdef JAPAN
_0232CD8C: .word 0x00000C4A
#else
_0232CD8C: .word 0x00000F08
#endif
	arm_func_end DoMoveWildCall

	arm_func_start DoMoveInvisify
DoMoveInvisify: ; 0x0232CD90
	stmdb sp!, {r3, lr}
	mov r1, r0
	bl TryInflictInvisibleStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveInvisify

	arm_func_start DoMoveOneShot
DoMoveOneShot: ; 0x0232CDA4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x20
	mov r5, #0
	strb r5, [sp, #0x1c]
	mov r7, r2
	mov r4, r0
	mov r0, r7
	mov r8, r1
	mov r5, r3
	bl GetMoveType
	mov r6, r0
	ldrh r0, [r7, #4]
	bl GetMoveCategory
	mov r1, r5
	mov r5, r0
	mov r0, r7
	bl GetDamageSourceWrapper
	add r3, sp, #0x1c
	stmia sp, {r3, r6}
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r2, _0232CE3C ; =0x0000270F
	mov r1, r8
	mov r0, r4
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0232CE3C: .word 0x0000270F
	arm_func_end DoMoveOneShot

	arm_func_start DoMoveHpGauge
DoMoveHpGauge: ; 0x0232CE40
	stmdb sp!, {r3, lr}
	bl TryActivateIdentifyCondition
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveHpGauge

	arm_func_start DoMoveVacuumCut
DoMoveVacuumCut: ; 0x0232CE50
	stmdb sp!, {r3, lr}
	ldr ip, _0232CE78 ; =ov10_022C456C
	str r3, [sp]
	ldrsh r3, [ip]
	bl ov29_02332F18
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232CE78: .word ov10_022C456C
	arm_func_end DoMoveVacuumCut

	arm_func_start DoMoveReviver
DoMoveReviver: ; 0x0232CE7C
	stmdb sp!, {r3, lr}
	ldr r2, _0232CE90 ; =0x00000F09
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_0232CE90: .word 0x00000C4B
#else
_0232CE90: .word 0x00000F09
#endif
	arm_func_end DoMoveReviver

	arm_func_start DoMoveShocker
DoMoveShocker: ; 0x0232CE94
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryInflictCoweringStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveShocker

	arm_func_start DoMoveEcho
DoMoveEcho: ; 0x0232CEAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov r5, #0
	strb r5, [sp, #0x1c]
	mov r4, r1
	ldr r1, [r4, #0xb4]
	mov r5, r0
	ldrsh r0, [r1, #4]
	mov sb, r2
	mov r6, r3
	bl GetSize
	mov r8, r0
	mov r0, sb
	bl GetMoveType
	mov r7, r0
	ldrh r0, [sb, #4]
	bl GetMoveCategory
	mov r1, r6
	mov r6, r0
	mov r0, sb
	bl GetDamageSourceWrapper
	add r3, sp, #0x1c
	stmia sp, {r3, r7}
	str r6, [sp, #8]
	mov r1, r4
	str r0, [sp, #0xc]
	mov r4, #0
	str r4, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	mov r2, r8
	mov r0, r5
	str r4, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, r4
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DoMoveEcho

	arm_func_start DoMoveFamish
DoMoveFamish: ; 0x0232CF54
	stmdb sp!, {r3, lr}
	ldr r2, _0232CF70 ; =ov10_022C45BC
	mov r3, #0
	ldrsh r2, [r2]
	bl TryDecreaseBelly
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232CF70: .word ov10_022C45BC
	arm_func_end DoMoveFamish

	arm_func_start DoMoveOneRoom
DoMoveOneRoom: ; 0x0232CF74
	stmdb sp!, {r3, lr}
	bl ov29_0231EA40
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveOneRoom

	arm_func_start DoMoveFillIn
DoMoveFillIn: ; 0x0232CF84
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r1
	mov r7, r0
	ldr r5, [r6, #0xb4]
	mov r4, #0
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	beq _0232CFB8
	ldr r1, _0232D0E0 ; =0x00000F0B
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0232CFB8:
	ldrb r1, [r5, #0x4c]
	ldr r0, _0232D0E4 ; =DIRECTIONS_XY
	ldrsh r3, [r6, #4]
	mov r1, r1, lsl #2
	ldrsh r2, [r0, r1]
	ldr r1, _0232D0E8 ; =DIRECTIONS_XY + 2
	add r0, sp, #0
	add r2, r3, r2
	strh r2, [sp]
	ldrb r2, [r5, #0x4c]
	ldrsh r3, [r6, #6]
	mov r2, r2, lsl #2
	ldrsh r1, [r1, r2]
	add r1, r3, r1
	strh r1, [sp, #2]
	bl ov29_022E6770
	ldrsh r0, [sp]
	ldrsh r1, [sp, #2]
	bl GetTileSafe
	ldrh r1, [r0]
	and r1, r1, #3
	cmp r1, #2
	bne _0232D06C
	ldrh r1, [r0]
	mvn r4, #0
	mov r5, r4
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
_0232D034:
	mov r8, r5
_0232D038:
	ldrsh r0, [sp]
	ldrsh r1, [sp, #2]
	add r0, r0, r8
	add r1, r1, r4
	bl ov29_02336694
	add r8, r8, #1
	cmp r8, #1
	ble _0232D038
	add r4, r4, #1
	cmp r4, #1
	ble _0232D034
	mov r4, #1
	bl DetermineAllMonsterShadow
_0232D06C:
	mov r8, #0
	mov r5, r8
_0232D074:
	mov sb, r5
_0232D078:
	mov r0, sb
	mov r1, r8
	bl DetermineTileWalkableNeighbors
	add sb, sb, #1
	cmp sb, #0x38
	blt _0232D078
	add r8, r8, #1
	cmp r8, #0x20
	blt _0232D074
	cmp r4, #0
	beq _0232D0C0
	add r0, sp, #0
	bl ov29_022E6784
	ldr r2, _0232D0EC ; =0x00000F0A
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232D0D0
_0232D0C0:
	ldr r2, _0232D0E0 ; =0x00000F0B
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_0232D0D0:
	bl UpdateMinimap
	bl UpdateTrapsVisibility
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_0232D0E0: .word 0x00000C4D
_0232D0E4: .word DIRECTIONS_XY
_0232D0E8: .word DIRECTIONS_XY + 2
_0232D0EC: .word 0x00000C4C
#else
_0232D0E0: .word 0x00000F0B
_0232D0E4: .word DIRECTIONS_XY
_0232D0E8: .word DIRECTIONS_XY + 2
_0232D0EC: .word 0x00000F0A
#endif
	arm_func_end DoMoveFillIn

	arm_func_start DoMoveTrapper
DoMoveTrapper: ; 0x0232D0F0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl AreLateGameTrapsEnabledWrapper
	cmp r0, #0
	bne _0232D11C
#ifdef JAPAN
	mov r0, r5
	mov r1, #0xbc0
#else
	ldr r1, _0232D144 ; =0x00000E7E
	mov r0, r5
#endif
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0232D11C:
	ldr r0, [r4, #0xb4]
	mov r1, #0x19
	ldrb r0, [r0, #6]
	cmp r0, #0
	movne r2, #2
	moveq r2, #1
	add r0, r4, #4
	bl PrepareTrapperTrap
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifndef JAPAN
_0232D144: .word 0x00000E7E
#endif
	arm_func_end DoMoveTrapper

	arm_func_start DoMoveItemize
DoMoveItemize: ; 0x0232D148
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r4, r1
	ldrh r2, [r4, #4]
	mov r5, r0
	strh r2, [sp, #6]
	ldrh r2, [r4, #6]
	strh r2, [sp, #8]
	ldr r2, [r4, #0xb4]
	ldrb r2, [r2, #0xbc]
	cmp r2, #6
	bls _0232D188
	ldr r2, _0232D1D4 ; =0x00000F0C
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _0232D1CC
_0232D188:
	mov r0, #0
	strb r0, [r4, #0x20]
	bl GetItemIdToSpawn
	mov r1, r0
	add r0, sp, #0
	mov r2, #0
	bl GenerateStandardItem
	add r1, sp, #6
	add r2, sp, #0
	mov r0, r5
	mov r3, #0
	bl SpawnDroppedItemWrapper
	ldr r1, _0232D1D8 ; =0x00000257
	mov r0, r4
	mov r2, r5
	bl HandleFaint
	mov r0, #1
_0232D1CC:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0232D1D4: .word 0x00000C4E
#else
_0232D1D4: .word 0x00000F0C
#endif
_0232D1D8: .word 0x00000257
	arm_func_end DoMoveItemize

	arm_func_start DoMoveHurl
DoMoveHurl: ; 0x0232D1DC
	stmdb sp!, {r3, lr}
	bl ov29_0231EDFC
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveHurl

	arm_func_start DoMoveMobile
DoMoveMobile: ; 0x0232D1EC
	stmdb sp!, {r3, lr}
	bl TryInflictMobileStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveMobile

	arm_func_start DoMoveSeeStairs
DoMoveSeeStairs: ; 0x0232D1FC
	stmdb sp!, {r3, lr}
	bl RevealStairs
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveSeeStairs

	arm_func_start DoMoveLongToss
DoMoveLongToss: ; 0x0232D20C
	stmdb sp!, {r3, lr}
	bl TryInflictLongTossStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveLongToss

	arm_func_start DoMovePierce
DoMovePierce: ; 0x0232D21C
	stmdb sp!, {r3, lr}
	bl TryInflictPierceStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMovePierce

	arm_func_start DoMoveHammerArm
DoMoveHammerArm: ; 0x0232D22C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r4, r0
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	beq _0232D268
	mov r2, #1
	mov r0, r4
	mov r1, r4
	mov r3, r2
	bl LowerSpeed
	mov r0, #1
_0232D268:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end DoMoveHammerArm

	arm_func_start DoMoveAquaRing
DoMoveAquaRing: ; 0x0232D270
	stmdb sp!, {r3, lr}
	bl TryInflictAquaRingStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveAquaRing

	arm_func_start DoMoveGastroAcid
DoMoveGastroAcid: ; 0x0232D280
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryInflictGastroAcidStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveGastroAcid

	arm_func_start DoMoveHealingWish
DoMoveHealingWish: ; 0x0232D298
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, r4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, _0232D2E4 ; =HEALING_WISH_HP_RESTORATION
	mov ip, #1
	ldrsh r2, [r2]
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r2, #1
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl EndNegativeStatusConditionWrapper
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232D2E4: .word HEALING_WISH_HP_RESTORATION
	arm_func_end DoMoveHealingWish

	arm_func_start DoMoveCloseCombat
DoMoveCloseCombat: ; 0x0232D2E8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r4, r0
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	beq _0232D358
	ldr r0, _0232D360 ; =ATK_STAT_IDX
	mov r3, #1
	ldr r2, [r0]
	mov r0, r4
	mov r1, r4
	str r3, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl LowerDefensiveStat
	ldr r0, _0232D364 ; =SPATK_STAT_IDX
	mov r3, #1
	ldr r2, [r0]
	mov r0, r4
	mov r1, r4
	str r3, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl LowerDefensiveStat
	mov r0, #1
_0232D358:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232D360: .word ATK_STAT_IDX
_0232D364: .word SPATK_STAT_IDX
	arm_func_end DoMoveCloseCombat

	arm_func_start DoMoveLuckyChant
DoMoveLuckyChant: ; 0x0232D368
	stmdb sp!, {r3, lr}
	bl TryInflictLuckyChantStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveLuckyChant

	arm_func_start DoMoveGuardSwap
DoMoveGuardSwap: ; 0x0232D378
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #0
	bl ov29_0230D874
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl ov29_0230D8E8
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r5
	mov r1, r4
	ldr r2, _0232D3D4 ; =0x00000F2E
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0232D3D4: .word 0x00002495
#else
_0232D3D4: .word 0x00000F2E
#endif
	arm_func_end DoMoveGuardSwap

	arm_func_start DoMoveHealOrder
DoMoveHealOrder: ; 0x0232D3D8
	stmdb sp!, {r3, lr}
	ldr r2, _0232D3FC ; =HEAL_ORDER_HP_RESTORATION
	mov ip, #1
	ldrsh r2, [r2]
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232D3FC: .word HEAL_ORDER_HP_RESTORATION
	arm_func_end DoMoveHealOrder

	arm_func_start DoMoveHealBlock
DoMoveHealBlock: ; 0x0232D400
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryInflictHealBlockStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveHealBlock

	arm_func_start DoMoveThunderFang
DoMoveThunderFang: ; 0x0232D418
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, r1
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0232D4A4 ; =THUNDER_FANG_PARALYZE_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232D46C
	mov r2, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl TryInflictParalysisStatus
_0232D46C:
	ldr r1, _0232D4A8 ; =THUNDER_FANG_CRINGE_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232D49C
	mov r2, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl TryInflictCringeStatus
_0232D49C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232D4A4: .word THUNDER_FANG_PARALYZE_CHANCE
_0232D4A8: .word THUNDER_FANG_CRINGE_CHANCE
	arm_func_end DoMoveThunderFang

	arm_func_start DoMoveDefog
DoMoveDefog: ; 0x0232D4AC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	ldr r4, [r5, #0xb4]
	bl MistIsActive
	cmp r0, #0
	bne _0232D4E0
	ldrb r0, [r4, #0xd5]
	add r0, r0, #0xff
	and r0, r0, #0xff
	cmp r0, #2
	bhi _0232D4FC
_0232D4E0:
	ldr r2, _0232D550 ; =0x00000ED2
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	mov r1, r5
	bl EndReflectClassStatus
_0232D4FC:
	ldr r1, _0232D554 ; =SPATK_STAT_IDX
	mov r0, r6
	ldr r2, [r1]
	mov r1, r5
	mov r3, #0
	bl LowerHitChanceStat
	mov r0, r6
	bl GetApparentWeather
	cmp r0, #6
	bne _0232D548
	ldr r1, _0232D558 ; =WEATHER_MOVE_TURN_COUNT
	ldr r0, _0232D55C ; =DUNGEON_PTR
	ldrsh r3, [r1]
	ldr r1, [r0]
	mov r0, #1
#ifdef JAPAN
	add r2, r1, #0xcc00
	mov r1, #0
	strh r3, [r2, #0x96]
#else
	add r2, r1, #0xcd00
	mov r1, #0
	strh r3, [r2, #0x3a]
#endif
	bl TryActivateWeather
_0232D548:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_0232D550: .word 0x00000C14
#else
_0232D550: .word 0x00000ED2
#endif
_0232D554: .word SPATK_STAT_IDX
_0232D558: .word WEATHER_MOVE_TURN_COUNT
_0232D55C: .word DUNGEON_PTR
	arm_func_end DoMoveDefog

	arm_func_start DoMoveTrumpCard
DoMoveTrumpCard: ; 0x0232D560
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r6, r2
	ldrb r4, [r6, #6]
	mov r8, r0
	mov r0, r6
	mov r7, r1
	mov r5, r3
	bl GetMaxPp
	movs r1, r0
	mov r0, #0x64
	mul r0, r4, r0
	moveq r1, #1
	bl _s32_div_f
	cmp r0, #0x19
	bgt _0232D5BC
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x140
	str r5, [sp]
	bl DealDamage
	b _0232D614
_0232D5BC:
	cmp r0, #0x32
	bgt _0232D5E0
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x100
	str r5, [sp]
	bl DealDamage
	b _0232D614
_0232D5E0:
	cmp r0, #0x4b
	mov r0, r8
	mov r1, r7
	bgt _0232D604
	mov r2, r6
	mov r3, #0xc0
	str r5, [sp]
	bl DealDamage
	b _0232D614
_0232D604:
	mov r2, r6
	mov r3, #0x80
	str r5, [sp]
	bl DealDamage
_0232D614:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end DoMoveTrumpCard

	arm_func_start DoMoveIceFang
DoMoveIceFang: ; 0x0232D620
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, r1
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0232D6A8 ; =ICE_FANG_FREEZE_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232D670
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl TryInflictFrozenStatus
_0232D670:
	ldr r1, _0232D6AC ; =ICE_FANG_CRINGE_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232D6A0
	mov r2, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl TryInflictCringeStatus
_0232D6A0:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232D6A8: .word ICE_FANG_FREEZE_CHANCE
_0232D6AC: .word ICE_FANG_CRINGE_CHANCE
	arm_func_end DoMoveIceFang

	arm_func_start DoMovePsychoShift
DoMovePsychoShift: ; 0x0232D6B0
	stmdb sp!, {r3, lr}
	cmp r0, r1
	beq _0232D6C8
	mov r2, #0
	mov r3, r2
	bl TransferNegativeStatusCondition
_0232D6C8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMovePsychoShift

	arm_func_start DoMoveEmbargo
DoMoveEmbargo: ; 0x0232D6D0
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryInflictEmbargoStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveEmbargo

	arm_func_start DoMoveBrine
DoMoveBrine: ; 0x0232D6E8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, [r1, #0xb4]
	ldr ip, _0232D734 ; =0x000003E7
	ldrsh r4, [r5, #0x12]
	ldrsh lr, [r5, #0x16]
	add r4, r4, lr
	cmp r4, ip
	movgt r4, ip
	ldrsh ip, [r5, #0x10]
	cmp r4, ip, lsl #1
	movge r4, #2
	movlt r4, #1
	str r3, [sp]
	mov r3, r4, lsl #8
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232D734: .word 0x000003E7
	arm_func_end DoMoveBrine

	arm_func_start DoMoveNaturalGift
DoMoveNaturalGift: ; 0x0232D738
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	ldr r0, [r7, #0xb4]
	mov r6, r1
	ldrsh r0, [r0, #0x66]
	mov r5, r2
	mov r4, r3
	cmp r0, #0
	beq _0232D7C8
	add r2, sp, #0xc
	mov r3, r5
	mov r1, #4
_0232D76C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0232D76C
	mov r0, r7
	bl GetEntityNaturalGiftInfo
	cmp r0, #0
	beq _0232D7C8
	str r4, [sp]
	ldrb r3, [r0, #2]
	add r2, sp, #0xc
	mov r1, r6
	str r3, [sp, #4]
	ldrsh r4, [r0, #4]
	mov r0, r7
	mov r3, #0x100
	str r4, [sp, #8]
	bl DealDamageWithTypeAndPowerBoost
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	b _0232D7F0
_0232D7C8:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, #0x100
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_0232D7F0:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end DoMoveNaturalGift

	arm_func_start DoMoveGyroBall
DoMoveGyroBall: ; 0x0232D7F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr ip, [r8, #0xb4]
	mov r7, r1
#ifdef JAPAN
	ldr ip, [ip, #0x10c]
#else
	ldr ip, [ip, #0x110]
#endif
	mov r6, r2
	cmp ip, #0
	mov r5, r3
	movne r4, #1
	bne _0232D830
	ldr r2, _0232D85C ; =0x00000F0D
	mov r4, #2
	bl LogMessageByIdWithPopupCheckUserTarget
_0232D830:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, r4, lsl #8
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_0232D85C: .word 0x00000C4F
#else
_0232D85C: .word 0x00000F0D
#endif
	arm_func_end DoMoveGyroBall

	arm_func_start DoMoveShadowForce
DoMoveShadowForce: ; 0x0232D860
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r6, r1
	mov r1, r5
	mov r7, r0
	mov r4, r3
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _0232D8CC
	ldr r1, _0232D8F4 ; =SHADOW_FORCE_DAMAGE_MULTIPLIER
	mov r0, r7
	ldr r3, [r1]
	mov r1, r6
	mov r2, r5
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r4, #1
	moveq r4, #0
	mov r0, r7
	bl ov29_02318D58
	tst r4, #0xff
	beq _0232D8EC
	mov r0, r7
	mov r1, r6
	bl EndProtectStatus
	b _0232D8EC
_0232D8CC:
	ldr r0, _0232D8F8 ; =0x00000CD7
	bl StringFromId
	str r0, [sp]
	mov r0, r7
	mov r1, r6
	mov r3, r5
	mov r2, #0xd
	bl ov29_02318BBC
_0232D8EC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232D8F4: .word SHADOW_FORCE_DAMAGE_MULTIPLIER
#ifdef JAPAN
_0232D8F8: .word 0x00000A17
#else
_0232D8F8: .word 0x00000CD7
#endif
	arm_func_end DoMoveShadowForce

	arm_func_start DoMoveGravity
DoMoveGravity: ; 0x0232D8FC
	stmdb sp!, {r3, lr}
	bl TryActivateGravity
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveGravity

	arm_func_start DoMoveStealthRock
DoMoveStealthRock: ; 0x0232D90C
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, [r6, #0xb4]
	mov r5, r1
	ldrb r0, [r0, #6]
	mov r4, #0
	mov r1, #0x14
	cmp r0, #0
	movne r2, #2
	moveq r2, #1
	add r0, r6, #4
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, [r7, #0xb4]
	mov r6, r1
	ldrb r0, [r0, #6]
	mov r4, #0
	cmp r0, #0
	movne r5, #2
	moveq r5, #1
	bl AreLateGameTrapsEnabledWrapper
	cmp r0, #0
	beq _0232D95C
	mov r2, r5
	add r0, r7, #4
	mov r1, #0x14
#endif
	mov r3, #0
	bl TrySpawnTrap
	cmp r0, #0
	movne r4, #1
	bne _0232D96C
_0232D95C:
	ldr r2, _0232D978 ; =0x00000EEF
#ifdef JAPAN
	mov r0, r6
	mov r1, r5
#else
	mov r0, r7
	mov r1, r6
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0232D96C:
	bl UpdateTrapsVisibility
	mov r0, r4
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232D978: .word 0x00000C31
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232D978: .word 0x00000EEF
#endif
	arm_func_end DoMoveStealthRock

	arm_func_start DoMoveChargeBeam
DoMoveChargeBeam: ; 0x0232D97C
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, r1
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0232D9DC ; =CHARGE_BEAM_BOOST_SPECIAL_ATTACK_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232D9D4
	ldr r1, _0232D9E0 ; =SPATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r5
	mov r3, #1
	bl BoostOffensiveStat
_0232D9D4:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232D9DC: .word CHARGE_BEAM_BOOST_SPECIAL_ATTACK_CHANCE
_0232D9E0: .word SPATK_STAT_IDX
	arm_func_end DoMoveChargeBeam

	arm_func_start DoMoveDamageEatItem
DoMoveDamageEatItem: ; 0x0232D9E4
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, r1
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
#ifdef EUROPE
	mov r0, r5
	bl ov29_022E34A8_EU
#else
#ifndef JAPAN
	ldr r0, _0232DACC ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0232DAC4
#endif
	cmp r5, #0
	moveq r0, #0
	beq _0232DA3C
	ldr r0, [r5]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_0232DA3C:
#endif
	cmp r0, #0
	beq _0232DAC4
	cmp r5, r4
	beq _0232DA8C
	cmp r5, #0
	moveq r0, #0
	beq _0232DA6C
	ldr r0, [r5]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
_0232DA6C:
	cmp r0, #0
	beq _0232DA8C
	mov r0, r5
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _0232DA98
_0232DA8C:
	mov r0, r4
	mov r1, #0x2c
	bl AbilityIsActiveVeneer
_0232DA98:
	cmp r0, #0
	bne _0232DAC4
	ldr r1, [r5, #0xb4]
	ldrb r0, [r1, #0xd8]
	cmp r0, #6
	ldrneb r0, [r1, #0xf3]
	cmpne r0, #1
	beq _0232DAC4
	mov r0, r5
	mov r1, r4
	bl TryEatItem
_0232DAC4:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#if defined(NORTH_AMERICA)
_0232DACC: .word DUNGEON_PTR
#endif
	arm_func_end DoMoveDamageEatItem

	arm_func_start DoMoveAcupressure
DoMoveAcupressure: ; 0x0232DAD0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r4, r1
	ldr ip, [r4, #0xb4]
	ldr r1, _0232DC44 ; =ov29_02352B3C
	mov r5, r0
	add lr, sp, #0
	ldmia r1, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	ldrsh r1, [ip, #0x24]
	mov r0, #0
	cmp r1, #0x14
	strlt r0, [sp]
	ldrsh r1, [ip, #0x26]
	addlt r0, r0, #1
	cmp r1, #0x14
	addlt r1, sp, #0
	movlt r2, #1
	strlt r2, [r1, r0, lsl #2]
	ldrsh r1, [ip, #0x28]
	addlt r0, r0, #1
	cmp r1, #0x14
	addlt r1, sp, #0
	movlt r2, #2
	strlt r2, [r1, r0, lsl #2]
	ldrsh r1, [ip, #0x2a]
	addlt r0, r0, #1
	cmp r1, #0x14
	addlt r1, sp, #0
	movlt r2, #3
	strlt r2, [r1, r0, lsl #2]
	addlt r0, r0, #1
	cmp r0, #0
	bne _0232DB7C
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
#ifdef JAPAN
	mov r0, r5
	mov r1, r4
	mov r2, #0xc50
#else
	ldr r2, _0232DC48 ; =0x00000F0E
	mov r0, r5
	mov r1, r4
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232DC38
_0232DB7C:
	bl DungeonRandInt
	add r1, sp, #0
	ldr r0, [r1, r0, lsl #2]
	cmp r0, #0
	bne _0232DBAC
	ldr r1, _0232DC4C ; =ATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #2
	bl BoostOffensiveStat
	b _0232DC38
_0232DBAC:
	cmp r0, #2
	bne _0232DBD0
	ldr r1, _0232DC4C ; =ATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #2
	bl BoostDefensiveStat
	b _0232DC38
_0232DBD0:
	cmp r0, #1
	bne _0232DBF4
	ldr r1, _0232DC50 ; =SPATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #2
	bl BoostOffensiveStat
	b _0232DC38
_0232DBF4:
	cmp r0, #3
	bne _0232DC18
	ldr r1, _0232DC50 ; =SPATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #2
	bl BoostDefensiveStat
	b _0232DC38
_0232DC18:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
#ifdef JAPAN
	mov r0, r5
	mov r1, r4
	mov r2, #0xc50
#else
	ldr r2, _0232DC48 ; =0x00000F0E
	mov r0, r5
	mov r1, r4
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0232DC38:
	mov r0, #1
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232DC44: .word ov29_02352B3C
#ifndef JAPAN
_0232DC48: .word 0x00000F0E
#endif
_0232DC4C: .word ATK_STAT_IDX
_0232DC50: .word SPATK_STAT_IDX
	arm_func_end DoMoveAcupressure

	arm_func_start DoMoveMagnetRise
DoMoveMagnetRise: ; 0x0232DC54
	stmdb sp!, {r3, lr}
	bl TryInflictMagnetRiseStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveMagnetRise

	arm_func_start DoMoveToxicSpikes
DoMoveToxicSpikes: ; 0x0232DC64
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, [r6, #0xb4]
	mov r5, r1
	ldrb r0, [r0, #6]
	mov r4, #0
	mov r1, #0x15
	cmp r0, #0
	movne r2, #2
	moveq r2, #1
	add r0, r6, #4
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, [r7, #0xb4]
	mov r6, r1
	ldrb r0, [r0, #6]
	mov r4, #0
	cmp r0, #0
	movne r5, #2
	moveq r5, #1
	bl AreLateGameTrapsEnabledWrapper
	cmp r0, #0
	beq _0232DCB4
	mov r2, r5
	add r0, r7, #4
	mov r1, #0x15
#endif
	mov r3, #1
	bl TrySpawnTrap
	cmp r0, #0
	movne r4, #1
	bne _0232DCC4
_0232DCB4:
	ldr r2, _0232DCD0 ; =0x00000EEF
#ifdef JAPAN
	mov r0, r6
	mov r1, r5
#else
	mov r0, r7
	mov r1, r6
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0232DCC4:
	bl UpdateTrapsVisibility
	mov r0, r4
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232DCD0: .word 0x00000C31
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232DCD0: .word 0x00000EEF
#endif
	arm_func_end DoMoveToxicSpikes

	arm_func_start DoMoveLastResort
DoMoveLastResort: ; 0x0232DCD4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl CountMovesOutOfPp
	cmp r0, #0
	ble _0232DD10
	ldrb r1, [r6, #6]
	cmp r1, #0
	subeq r0, r0, #1
	moveq r0, r0, lsl #0x10
	moveq r0, r0, asr #0x10
_0232DD10:
	cmp r0, #0
	ble _0232DD44
	ldr r1, _0232DD70 ; =LAST_RESORT_DAMAGE_MULT_TABLE
	sub r0, r0, #1
	ldr r3, [r1, r0, lsl #2]
	mov r0, r8
	mov r1, r7
	mov r2, r6
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
#ifdef JAPAN
	moveq r4, #1
#else
	movgt r4, #1
#endif
	b _0232DD64
_0232DD44:
	mov r1, r7
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0232DD74 ; =0x00000EBC
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_0232DD64:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0232DD70: .word LAST_RESORT_DAMAGE_MULT_TABLE
#ifdef JAPAN
_0232DD74: .word 0x00000BFE
#else
_0232DD74: .word 0x00000EBC
#endif
	arm_func_end DoMoveLastResort

	arm_func_start DoMoveTrickRoom
DoMoveTrickRoom: ; 0x0232DD78
	stmdb sp!, {r3, lr}
	bl BoostOrLowerSpeed
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveTrickRoom

	arm_func_start DoMoveDamage__0232DD88
DoMoveDamage__0232DD88: ; 0x0232DD88
	stmdb sp!, {r3, lr}
	str r3, [sp]
	mov r3, #0x100
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveDamage__0232DD88

	arm_func_start DoMoveWorrySeed
DoMoveWorrySeed: ; 0x0232DDAC
	stmdb sp!, {r4, r5, r6, lr}
#ifndef JAPAN
	mov r4, #1
	mov r3, r4
#endif
	mov r2, #0x2a
	mov r6, r0
	mov r5, r1
#ifdef JAPAN
	mov r4, #1
#endif
	bl DefenderAbilityIsActiveMoveEffects__0232DE20
	cmp r0, #0
	beq _0232DE00
	mov r4, #0
	mov r0, r4
	mov r1, r5
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	mov r0, #1
	mov r1, #0x2a
	bl ov29_0234B084
	ldr r2, _0232DE1C ; =0x00000F13
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_0232DE00:
	cmp r4, #0
	beq _0232DE14
	mov r0, r6
	mov r1, r5
	bl TryInflictSleeplessStatus
_0232DE14:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_0232DE1C: .word 0x00000C55
#else
_0232DE1C: .word 0x00000F13
#endif
	arm_func_end DoMoveWorrySeed

	arm_func_start DefenderAbilityIsActiveMoveEffects__0232DE20
DefenderAbilityIsActiveMoveEffects__0232DE20: ; 0x0232DE20
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	cmp r0, r5
	beq _0232DE74
	cmp r0, #0
	moveq r1, #0
	beq _0232DE54
	ldr r1, [r0]
	cmp r1, #1
	moveq r1, #1
	movne r1, #0
	and r1, r1, #0xff
_0232DE54:
	cmp r1, #0
#ifndef JAPAN
	cmpne r3, #0
#endif
	beq _0232DE74
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_0232DE74:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActiveVeneer
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DefenderAbilityIsActiveMoveEffects__0232DE20

	arm_func_start DoMoveDamageHpDependent
DoMoveDamageHpDependent: ; 0x0232DE84
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr ip, [r1, #0xb4]
	ldr r6, _0232DF30 ; =0x000003E7
	ldrsh r5, [ip, #0x12]
	ldrsh r4, [ip, #0x16]
	ldrsh ip, [ip, #0x10]
	add lr, r5, r4
	cmp lr, r6
	movle r6, lr
	mov r4, r6, asr #1
	add r4, r6, r4, lsr #30
	cmp ip, r4, asr #2
	movle r5, #0
	ble _0232DF08
	ldr r4, _0232DF30 ; =0x000003E7
	cmp lr, r4
	movle r4, lr
	mov r5, r4, lsl #1
	mov r4, r5, asr #1
	add r4, r5, r4, lsr #30
	cmp ip, r4, asr #2
	movle r5, #1
	ble _0232DF08
	ldr r4, _0232DF30 ; =0x000003E7
	cmp lr, r4
	movgt lr, r4
	add r4, lr, lr, lsl #1
	mov lr, r4, asr #1
	add lr, r4, lr, lsr #30
	cmp ip, lr, asr #2
	movle r5, #2
	movgt r5, #3
_0232DF08:
	ldr r4, _0232DF34 ; =WRING_OUT_DAMAGE_MULT_TABLE
	str r3, [sp]
	ldr r3, [r4, r5, lsl #2]
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232DF30: .word 0x000003E7
_0232DF34: .word WRING_OUT_DAMAGE_MULT_TABLE
	arm_func_end DoMoveDamageHpDependent

	arm_func_start DoMoveHeartSwap
DoMoveHeartSwap: ; 0x0232DF38
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #0
	bl ov29_0230D95C
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl ov29_0230D9D0
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl ov29_0230D874
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl ov29_0230D8E8
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl ov29_0230DA44
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, #1
	mov r1, r4
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r5
	mov r1, r4
	ldr r2, _0232DFC4 ; =0x00000F2F
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0232DFC4: .word 0x00002496
#else
_0232DFC4: .word 0x00000F2F
#endif
	arm_func_end DoMoveHeartSwap

	arm_func_start DoMoveRoost
DoMoveRoost: ; 0x0232DFC8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r0
	mov r6, r1
	ldr r4, [r5, #0xb4]
	bl GetApparentWeather
	mov r3, #1
	str r3, [sp]
	ldr r1, _0232E07C ; =ROOST_HP_RESTORATION_TABLE
	mov r0, r0, lsl #1
	ldrsh r2, [r1, r0]
	mov r0, r5
	mov r1, r6
	mov r3, #0
	bl TryIncreaseHp
	ldrb r0, [r4, #0x5e]
	mov ip, #0
	mov r1, ip
	strb r0, [r4, #0xaa]
	ldrb r0, [r4, #0x5f]
	strb r0, [r4, #0xab]
	mov r0, #1
_0232E020:
	add r3, r4, ip
	ldrb r2, [r3, #0x5e]
	add ip, ip, #1
	cmp r2, #0xa
	streqb r1, [r3, #0x5e]
	streqb r0, [r4, #0xa9]
	cmp ip, #2
	blt _0232E020
	ldrb r0, [r4, #0xa9]
	cmp r0, #0
	mov r0, #0
	streqb r0, [r4, #0xaa]
	streqb r0, [r4, #0xab]
	beq _0232E070
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0232E080 ; =0x00000CC9
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
_0232E070:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232E07C: .word ROOST_HP_RESTORATION_TABLE
#ifdef JAPAN
_0232E080: .word 0x00000A09
#else
_0232E080: .word 0x00000CC9
#endif
	arm_func_end DoMoveRoost

	arm_func_start DoMovePowerSwap
DoMovePowerSwap: ; 0x0232E084
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #0
	bl ov29_0230D95C
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl ov29_0230D9D0
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r5
	mov r1, r4
	ldr r2, _0232E0E0 ; =0x00000F2B
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0232E0E0: .word 0x00002492
#else
_0232E0E0: .word 0x00000F2B
#endif
	arm_func_end DoMovePowerSwap

	arm_func_start DoMovePowerTrick
DoMovePowerTrick: ; 0x0232E0E4
	stmdb sp!, {r3, lr}
	mov r2, #1
	bl ov29_0230DAB8
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMovePowerTrick

	arm_func_start DoMoveFeint
DoMoveFeint: ; 0x0232E0F8
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, r1
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl EndProtectStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DoMoveFeint

	arm_func_start DoMoveFlareBlitz
DoMoveFlareBlitz: ; 0x0232E130
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	mov r5, r0
	mov r7, r1
	mov r4, r2
	mov r6, r3
	bl EndFrozenStatus
	mov r0, r5
	mov r1, r7
	mov r2, r4
	mov r3, #0x100
	str r6, [sp]
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	beq _0232E240
	mov r0, r5
	bl EntityIsValidMoveEffects__0232E250
	cmp r0, #0
	beq _0232E1B4
	ldr r1, _0232E248 ; =FLARE_BLITZ_BURN_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r7
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232E1B4
	mov r2, #0
	mov r0, r5
	mov r1, r7
	mov r3, r2
	str r2, [sp]
	bl TryInflictBurnStatus
_0232E1B4:
	mov r0, r5
	bl EntityIsValidMoveEffects__0232E250
	cmp r0, #0
	beq _0232E23C
	mov r0, r5
	mov r1, #7
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0232E23C
	ldr r1, [r5, #0xb4]
	ldr r0, _0232E24C ; =0x000003E7
	ldrsh r2, [r1, #0x12]
	ldrsh r1, [r1, #0x16]
	ldrh r3, [r4, #4]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	movs r1, r0, asr #3
	mov r2, #0
	str r3, [sp]
	mov r0, #0x23c
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x14
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	moveq r1, #1
	mov r0, r5
	mov r3, r2
	str r2, [sp, #0x14]
	bl CalcRecoilDamageFixed
_0232E23C:
	mov r0, #1
_0232E240:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232E248: .word FLARE_BLITZ_BURN_CHANCE
_0232E24C: .word 0x000003E7
	arm_func_end DoMoveFlareBlitz
