	.include "asm/macros.inc"
	.include "overlay_29_022FE4BC.inc"

	.text

	arm_func_start ExecuteMonsterAction
ExecuteMonsterAction: ; 0x022FE4BC
#ifdef JAPAN
#define EXECUTE_MONSTER_ACTION_OFFSET -4
#else
#define EXECUTE_MONSTER_ACTION_OFFSET 0
#endif
#ifdef EUROPE
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r6, r0
	ldr r1, [r6, #0xb4]
	mov r0, #1
	ldrb r7, [r1, #6]
	bl AnimationDelayOrSomething
	bl ov29_022FBD08
	mov r0, #1
	bl ov29_0234B024
	ldr r5, [r6, #0xb4]
	mov r1, #0
	strb r1, [r5, #0x109]
	ldr r0, _022FED70 ; =0x02354138
	strb r1, [r5, #0xfc]
	ldr r1, [r0]
	ldr r0, _022FED74 ; =0x022C5894
	str r6, [r1, #0xc4]
	ldrh r2, [r5, #0x4a]
	ldrb r0, [r0, r2, lsl #1]
	cmp r0, #0
	beq _022FEF64
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _022FEF54
	ldr r1, _022FED78 ; =0x022C5895
	mov r0, r6
	ldrb r1, [r1, r2, lsl #1]
	bl ov29_022F3890
	b _022FEF64
_022FEF54:
	ldr r1, _022FED78 ; =0x022C5895
	mov r0, r6
	ldrb r1, [r1, r2, lsl #1]
	bl ov29_023085DC
_022FEF64:
	mov r0, r6
	mov r1, #0
	bl MonsterCannotAttack
	cmp r0, #0
	beq _022FEF94
	mov r0, r6
	mov r1, #1
	bl IsChargingAnyTwoTurnMove
	cmp r0, #0
	beq _022FEF94
	mov r0, r6
	bl ov29_02318D58
_022FEF94:
	mov r8, #0
	add r3, r5, #0x124
	mov r1, r8
	mov r2, #1
_022FEFA4:
	ldrb r0, [r3, r8, lsl #3]
	add r4, r3, r8, lsl #3
	add r8, r8, #1
	tst r0, #1
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	ldrneh r0, [r4, #2]
	bicne r0, r0, #4
	strneh r0, [r4, #2]
	cmp r8, #4
	blt _022FEFA4
	bl ov29_022E81F8
	mov r0, r6
	mov r1, #0
	bl ov29_022EB944
	cmp r0, #0
	bne _022FF064
	mov r0, r6
	bl DisplayActions
	cmp r0, #0
	beq _022FF034
	bl IsFloorOver
	cmp r0, #0
	movne r4, #0
	bne _022FF798
	mov r0, r6
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r4, #0
	beq _022FF798
	ldr r0, _022FED7C ; =0x0237D5C0
	ldrb r0, [r0, #1]
	cmp r0, #0
	movne r4, #1
	bne _022FF798
_022FF034:
	ldrb r0, [r5, #7]
	cmp r0, #0
	bne _022FF048
	mov r0, #0xa
	bl ov29_0234BA54
_022FF048:
	ldrb r0, [r5, #0x23c]
	cmp r0, #0
	bne _022FF05C
	mov r0, r6
	bl ov29_022F9840
_022FF05C:
	mov r0, #0xa
	bl AdvanceFrame
_022FF064:
	mov r0, #0
	strb r0, [r5, #0x23c]
	ldrh r0, [r5, #0x4a]
	mov r4, #0
	ldr r1, _022FED80 ; =0x0237D66C
	cmp r0, #1
	cmpne r0, #0
	cmpne r0, #4
	cmpne r0, #2
	movne r0, #1
	strneb r0, [r5, #0x152]
	strb r4, [r5, #0x154]
	ldr r0, _022FED84 ; =0x0237D668
	strb r4, [r1]
	strb r4, [r0]
	mov r1, #1
	strb r1, [r5, #0x103]
	ldrh r0, [r5, #0x4a]
	cmp r0, #0x42
	addls pc, pc, r0, lsl #2
	b _022FF5D8
_022FF0B8: ; jump table
	b _022FF5D8 ; case 0
	b _022FF5D8 ; case 1
	b _022FF1C4 ; case 2
	b _022FF5D8 ; case 3
	b _022FF5D8 ; case 4
	b _022FF5D8 ; case 5
	b _022FF5D8 ; case 6
	b _022FF5D8 ; case 7
	b _022FF4D0 ; case 8
	b _022FF45C ; case 9
	b _022FF4DC ; case 10
	b _022FF4F4 ; case 11
	b _022FF5D8 ; case 12
	b _022FF434 ; case 13
	b _022FF434 ; case 14
	b _022FF5D8 ; case 15
	b _022FF44C ; case 16
	b _022FF5D8 ; case 17
	b _022FF434 ; case 18
	b _022FF538 ; case 19
	b _022FF544 ; case 20
	b _022FF3C8 ; case 21
	b _022FF5D8 ; case 22
	b _022FF550 ; case 23
	b _022FF5D8 ; case 24
	b _022FF5D8 ; case 25
	b _022FF5D8 ; case 26
	b _022FF5D8 ; case 27
	b _022FF5D8 ; case 28
	b _022FF5D8 ; case 29
	b _022FF5D8 ; case 30
	b _022FF5D8 ; case 31
	b _022FF5D8 ; case 32
	b _022FF5D8 ; case 33
	b _022FF5D8 ; case 34
	b _022FF594 ; case 35
	b _022FF5A0 ; case 36
	b _022FF570 ; case 37
	b _022FF3D4 ; case 38
	b _022FF4F4 ; case 39
	b _022FF5D8 ; case 40
	b _022FF5D8 ; case 41
	b _022FF5D8 ; case 42
	b _022FF5D8 ; case 43
	b _022FF454 ; case 44
	b _022FF5D8 ; case 45
	b _022FF5D8 ; case 46
	b _022FF5D8 ; case 47
	b _022FF5D8 ; case 48
	b _022FF440 ; case 49
	b _022FF560 ; case 50
	b _022FF5D8 ; case 51
	b _022FF5D8 ; case 52
	b _022FF5D8 ; case 53
	b _022FF468 ; case 54
	b _022FF474 ; case 55
	b _022FF48C ; case 56
	b _022FF5AC ; case 57
	b _022FF4E8 ; case 58
	b _022FF4B0 ; case 59
	b _022FF498 ; case 60
	b _022FF4A4 ; case 61
	b _022FF480 ; case 62
	b _022FF588 ; case 63
	b _022FF5D8 ; case 64
	b _022FF4F4 ; case 65
	b _022FF5CC ; case 66
_022FF1C4:
	ldrb r0, [r5, #0xc4]
	cmp r0, #2
	cmpne r0, #7
	beq _022FF1E4
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #2
	bhi _022FF244
_022FF1E4:
	mov r0, #0
	strh r0, [r5, #0x4a]
	mov r0, #1
	strb r0, [r5, #0x151]
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _022FF5E0
	ldr r0, _022FED70 ; =0x02354138
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsh r0, [r0, #0xd8]
	cmp r0, #0
	blt _022FF220
	mov r0, #0x56
	bl AdvanceFrame
_022FF220:
	ldr r1, _022FED70 ; =0x02354138
	mvn r2, #0
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xd8]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xda]
	b _022FF5E0
_022FF244:
	ldrb r1, [r5, #0x4c]
	ldrh r3, [r5]
	ldr r2, _022FED88 ; =0x02352328
	mov sl, r1, lsl #2
	ldr r0, _022FED8C ; =0x0235232A
	ldrsh ip, [r6, #4]
	ldrsh sb, [r2, sl]
	ldrsh r8, [r6, #6]
	ldrsh r2, [r0, sl]
	add r0, ip, sb
	mov r0, r0, lsl #0x10
	add r2, r8, r2
	mov r2, r2, lsl #0x10
	mov r8, r4
	tst r3, #0x8000
	mov sb, r0, asr #0x10
	mov sl, r2, asr #0x10
	bne _022FF29C
	mov r0, r6
	bl CanMonsterMoveInDirection
	cmp r0, #0
	moveq r8, #1
_022FF29C:
	cmp r8, #0
	beq _022FF304
	mov r0, #0
	strh r0, [r5, #0x4a]
	mov r0, #1
	strb r0, [r5, #0x151]
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _022FF5E0
	ldr r0, _022FED70 ; =0x02354138
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsh r0, [r0, #0xd8]
	cmp r0, #0
	blt _022FF2E0
	mov r0, #0x56
	bl AdvanceFrame
_022FF2E0:
	ldr r1, _022FED70 ; =0x02354138
	mvn r2, #0
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xd8]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xda]
	b _022FF5E0
_022FF304:
	ldrsh r2, [r6, #4]
	mov r0, r6
	mov r1, sb
	strh r2, [sp]
	ldrsh r4, [r6, #6]
	mov r2, sl
	mov r3, #0
	strh r4, [sp, #2]
	bl MoveMonsterToPos
	ldrb r1, [r5, #0x4c]
	add r2, sp, #0
	mov r0, r6
	bl ov29_02304D20
	mov r0, r6
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r5, #0xef]
	cmpne r0, #3
	beq _022FF388
	mov r0, r6
	mov r1, #0x6f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _022FF378
	mov r0, r6
	mov r1, #0x10
	bl HasHeldItem
_022FF378:
	cmp r0, #0
	bne _022FF388
	add r0, r6, #4
	bl ov29_02337CCC
_022FF388:
	ldrb r0, [r5, #7]
	mov r4, #1
	cmp r0, #0
	beq _022FF5E0
	ldrb r0, [r5, #0xd0]
	cmp r0, #2
	bne _022FF5E0
	ldr r1, _022FED70 ; =0x02354138
	sub r2, r4, #2
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xd8]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xda]
	b _022FF5E0
_022FF3C8:
	mov r0, r6
	bl ov29_0231A8A0
	b _022FF5E0
_022FF3D4:
	bl ov29_022E5D68
	ldr r0, _022FED70 ; =0x02354138
	mov r2, #1
	ldr r0, [r0]
	ldr r1, _022FED7C ; =0x0237D5C0
	strb r2, [r0, #6]
	ldrb r2, [r5, #0x4c]
	add r0, r6, #4
	strb r2, [r1]
	bl PositionIsOnHiddenStairs
	cmp r0, #0
	beq _022FF5E0
	bl GetHiddenStairsField
	cmp r0, #1
	bne _022FF41C
	mov r0, #1
	bl SetHiddenFloorField
	b _022FF5E0
_022FF41C:
	bl GetHiddenStairsField
	cmp r0, #2
	bne _022FF5E0
	mov r0, #2
	bl SetHiddenFloorField
	b _022FF5E0
_022FF434:
	mov r0, r6
	bl UseSingleUseItemWrapper
	b _022FF5E0
_022FF440:
	mov r0, r6
	bl ov29_0231A9F8
	b _022FF5E0
_022FF44C:
	strh r1, [r5, #0x4a]
	b _022FF5E0
_022FF454:
	strh r1, [r5, #0x4a]
	b _022FF5E0
_022FF45C:
	mov r0, r6
	bl ov29_022F4350
	b _022FF5E0
_022FF468:
	mov r0, r6
	bl ov29_022F45CC
	b _022FF5E0
_022FF474:
	mov r0, r6
	bl ov29_022F48D8
	b _022FF5E0
_022FF480:
	mov r0, r6
	bl ov29_022F49E0
	b _022FF5E0
_022FF48C:
	mov r0, r6
	bl ov29_022F4BDC
	b _022FF5E0
_022FF498:
	mov r0, r6
	bl ov29_022F4370
	b _022FF5E0
_022FF4A4:
	mov r0, r6
	bl ov29_022F44F0
	b _022FF5E0
_022FF4B0:
	ldr r0, _022FED70 ; =0x02354138
	ldrb r1, [r5, #0x4e]
	ldr r2, [r0]
	add r0, r2, r1, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28]
	str r0, [r2, #0xc8]
	b _022FF5E0
_022FF4D0:
	mov r0, r6
	bl ov29_022F4BF8
	b _022FF5E0
_022FF4DC:
	mov r0, r6
	bl ov29_022F4DAC
	b _022FF5E0
_022FF4E8:
	mov r0, r6
	bl ov29_022F505C
	b _022FF5E0
_022FF4F4:
	mov r0, r5
	bl MonsterCanThrowItems
	cmp r0, #0
	beq _022FF518
	mov r0, r6
	bl ov29_022F996C
	mov r0, r6
	bl UseThrowableItem
	b _022FF5E0
_022FF518:
	mov r0, r4
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, r6
	mov r1, #0xdf0
	bl LogMessageByIdWithPopupCheckUser
	b _022FF5E0
_022FF538:
	mov r0, r6
	bl ov29_022F59C4
	b _022FF5E0
_022FF544:
	mov r0, r6
	bl ov29_022F5F18
	b _022FF5E0
_022FF550:
	mov r0, r6
	mov r1, #0x160
	bl ov29_022F6058
	b _022FF5E0
_022FF560:
	mov r0, r6
	rsb r1, r1, #0x164
	bl ov29_022F6058
	b _022FF5E0
_022FF570:
	mov r0, r6
	mov r2, r4
	mov r3, r4
	add r1, r6, #4
	bl TryTriggerTrap
	b _022FF5E0
_022FF588:
	mov r0, r6
	bl ov29_0230F158
	b _022FF5E0
_022FF594:
	mov r0, r6
	bl ov29_0230F140
	b _022FF5E0
_022FF5A0:
	mov r0, r6
	bl ov29_0230F14C
	b _022FF5E0
_022FF5AC:
	mov r0, r4
	mov r1, r6
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	ldr r1, _022FED90 ; =0x00000DF1
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	b _022FF5E0
_022FF5CC:
	mov r0, r6
	bl ov29_022F52B0
	b _022FF5E0
_022FF5D8:
	mov r0, #1
	strh r0, [r5, #0x4a]
_022FF5E0:
	mov r0, r6
	bl TrySpawnTrapperTrap
	mov r0, r6
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r4, #0
	beq _022FF798
	ldr r2, [r6, #0xb4]
	ldrb r0, [r2, #0x154]
	cmp r0, #0
	bne _022FF61C
	mov r1, #0
	mov r0, r6
	strb r1, [r2, #0x154]
	bl ov29_02318D58
_022FF61C:
	mov r0, #0
	bl ov29_022E3A58
	mov r0, r6
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r4, #0
	beq _022FF798
	bl ov29_022EF9BC
	ldrb r0, [r5, #0x155]
	cmp r0, #0
	beq _022FF6B4
	mov r2, #0
	mov lr, #1
	mov r3, r2
	strb r2, [r5, #0x155]
	add r0, r5, #0x124
	mov ip, r2
	mov sb, r2
	mov r8, lr
_022FF668:
	ldrb sl, [r0, r3, lsl #3]
	add r1, r0, r3, lsl #3
	tst sl, #1
	movne sl, lr
	moveq sl, ip
	tst sl, #0xff
	beq _022FF694
	ldrb sl, [r1]
	tst sl, #0x10
	movne r2, r8
	strneb sb, [r1, #6]
_022FF694:
	add r3, r3, #1
	cmp r3, #4
	blt _022FF668
	cmp r2, #0
	beq _022FF6B4
	ldr r1, _022FED94 ; =0x00000DF2
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
_022FF6B4:
	bl TryActivateFlashFireOnAllMonsters
	bl ov29_022EC85C
	cmp r0, #0
	bne _022FF6E0
	bl ov29_022FEFC8
	bl ov29_022FEDBC
	mov r0, r6
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r4, #0
	beq _022FF798
_022FF6E0:
	mov r0, r6
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r4, #0
	beq _022FF798
	bl ov29_022EC85C
	cmp r0, #0
	bne _022FF704
	bl ov29_02346888
_022FF704:
	mov r0, #0
	bl ov29_022E3A58
	mov r0, r6
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r4, #0
	beq _022FF798
	ldrb r0, [r5, #0x14e]
	cmp r0, #0
	cmpeq r4, #0
	bne _022FF794
	mov r0, r6
	add r1, r6, #4
	bl CannotStandOnTile
	cmp r0, #0
	beq _022FF784
	ldr r0, [r5, #0x110]
	cmp r0, #1
	ble _022FF77C
	mov r0, #0
	bl DisplayActions
	mov r0, r6
	bl EntityIsValid__022FED98
	cmp r0, #0
	beq _022FF774
	bl IsFloorOver
	cmp r0, #0
	beq _022FF77C
_022FF774:
	mov r4, #0
	b _022FF798
_022FF77C:
	mov r0, r6
	bl EnsureCanStandCurrentTile
_022FF784:
	mov r0, r6
	bl ov29_0230FC24
	mov r0, r6
	bl EnemyEvolution
_022FF794:
	mov r4, #0
_022FF798:
	mov r0, r6
	bl EntityIsValid__022FED98
	cmp r0, #0
	bne _022FF7B4
	cmp r7, #0
	beq _022FF7B4
	bl ov29_022EF9BC
_022FF7B4:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #1
	bl AnimationDelayOrSomething
#ifndef JAPAN
	bl ov29_022FBD08
#endif
	mov r0, #1
	bl ov29_0234B024
	ldr r6, [sb, #0xb4]
	mov r1, #0
#ifdef JAPAN
	strb r1, [r6, #0x108]
#else
	strb r1, [r6, #0x109]
#endif
	ldr r0, _022FED70 ; =DUNGEON_PTR
	strb r1, [r6, #0xfc]
	ldr r1, [r0]
	ldr r0, _022FED74 ; =ov10_022C4F3C
	str sb, [r1, #0xc4]
	ldrh r2, [r6, #0x4a]
	ldrb r0, [r0, r2, lsl #1]
	cmp r0, #0
	beq _022FE538
	ldrb r0, [r6, #7]
	cmp r0, #0
	beq _022FE528
	ldr r1, _022FED78 ; =ov10_022C4F3D
	mov r0, sb
	ldrb r1, [r1, r2, lsl #1]
	bl ov29_022F3890
	b _022FE538
_022FE528:
	ldr r1, _022FED78 ; =ov10_022C4F3D
	mov r0, sb
	ldrb r1, [r1, r2, lsl #1]
	bl ov29_023085DC
_022FE538:
	mov r0, sb
	mov r1, #0
	bl MonsterCannotAttack
	cmp r0, #0
	beq _022FE568
	mov r0, sb
	mov r1, #1
	bl IsChargingAnyTwoTurnMove
	cmp r0, #0
	beq _022FE568
	mov r0, sb
	bl ov29_02318D58
_022FE568:
	mov r4, #0
	add r3, r6, #0x124 + EXECUTE_MONSTER_ACTION_OFFSET
	mov r1, r4
	mov r2, #1
_022FE578:
	ldrb r0, [r3, r4, lsl #3]
	add r5, r3, r4, lsl #3
	add r4, r4, #1
	tst r0, #1
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	ldrneh r0, [r5, #2]
	bicne r0, r0, #4
	strneh r0, [r5, #2]
	cmp r4, #4
	blt _022FE578
	bl ov29_022E81F8
	mov r0, sb
	mov r1, #0
	bl ov29_022EB944
	cmp r0, #0
	bne _022FE638
	mov r0, sb
	bl DisplayActions
	cmp r0, #0
	beq _022FE608
	bl IsFloorOver
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, sb
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _022FED7C ; =ov29_0237C9C0
	ldrb r0, [r0, #1]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FE608:
	ldrb r0, [r6, #7]
	cmp r0, #0
	bne _022FE61C
	mov r0, #0xa
	bl ov29_0234BA54
_022FE61C:
	ldrb r0, [r6, #0x23c + EXECUTE_MONSTER_ACTION_OFFSET]
	cmp r0, #0
	bne _022FE630
	mov r0, sb
	bl ov29_022F9840
_022FE630:
	mov r0, #0xa
	bl AdvanceFrame
_022FE638:
	mov r0, #0
	strb r0, [r6, #0x23c + EXECUTE_MONSTER_ACTION_OFFSET]
	ldrh r0, [r6, #0x4a]
	mov r4, #0
	ldr r1, _022FED80 ; =ov29_0237CA6C
	cmp r0, #1
	cmpne r0, #0
	cmpne r0, #4
	cmpne r0, #2
	movne r0, #1
	strneb r0, [r6, #0x152 + EXECUTE_MONSTER_ACTION_OFFSET]
	strb r4, [r6, #0x154 + EXECUTE_MONSTER_ACTION_OFFSET]
	ldr r0, _022FED84 ; =ov29_0237CA68
	strb r4, [r1]
	strb r4, [r0]
#ifndef JAPAN
	mov r1, #1
	strb r1, [r6, #0x103]
#endif
	ldrh r0, [r6, #0x4a]
	cmp r0, #0x42
	addls pc, pc, r0, lsl #2
	b _022FEBAC
_022FE68C: ; jump table
	b _022FEBAC ; case 0
	b _022FEBAC ; case 1
	b _022FE798 ; case 2
	b _022FEBAC ; case 3
	b _022FEBAC ; case 4
	b _022FEBAC ; case 5
	b _022FEBAC ; case 6
	b _022FEBAC ; case 7
	b _022FEAA4 ; case 8
	b _022FEA30 ; case 9
	b _022FEAB0 ; case 10
	b _022FEAC8 ; case 11
	b _022FEBAC ; case 12
	b _022FEA08 ; case 13
	b _022FEA08 ; case 14
	b _022FEBAC ; case 15
	b _022FEA20 ; case 16
	b _022FEBAC ; case 17
	b _022FEA08 ; case 18
	b _022FEB0C ; case 19
	b _022FEB18 ; case 20
	b _022FE99C ; case 21
	b _022FEBAC ; case 22
	b _022FEB24 ; case 23
	b _022FEBAC ; case 24
	b _022FEBAC ; case 25
	b _022FEBAC ; case 26
	b _022FEBAC ; case 27
	b _022FEBAC ; case 28
	b _022FEBAC ; case 29
	b _022FEBAC ; case 30
	b _022FEBAC ; case 31
	b _022FEBAC ; case 32
	b _022FEBAC ; case 33
	b _022FEBAC ; case 34
	b _022FEB68 ; case 35
	b _022FEB74 ; case 36
	b _022FEB44 ; case 37
	b _022FE9A8 ; case 38
	b _022FEAC8 ; case 39
	b _022FEBAC ; case 40
	b _022FEBAC ; case 41
	b _022FEBAC ; case 42
	b _022FEBAC ; case 43
	b _022FEA28 ; case 44
	b _022FEBAC ; case 45
	b _022FEBAC ; case 46
	b _022FEBAC ; case 47
	b _022FEBAC ; case 48
	b _022FEA14 ; case 49
	b _022FEB34 ; case 50
	b _022FEBAC ; case 51
	b _022FEBAC ; case 52
	b _022FEBAC ; case 53
	b _022FEA3C ; case 54
	b _022FEA48 ; case 55
	b _022FEA60 ; case 56
	b _022FEB80 ; case 57
	b _022FEABC ; case 58
	b _022FEA84 ; case 59
	b _022FEA6C ; case 60
	b _022FEA78 ; case 61
	b _022FEA54 ; case 62
	b _022FEB5C ; case 63
	b _022FEBAC ; case 64
	b _022FEAC8 ; case 65
	b _022FEBA0 ; case 66
_022FE798:
	ldrb r0, [r6, #0xc4]
	cmp r0, #2
	cmpne r0, #7
	beq _022FE7B8
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #2
	bhi _022FE818
_022FE7B8:
	mov r0, #0
	strh r0, [r6, #0x4a]
	mov r0, #1
	strb r0, [r6, #0x151 + EXECUTE_MONSTER_ACTION_OFFSET]
	ldrb r0, [r6, #7]
	cmp r0, #0
	beq _022FEBB4
	ldr r0, _022FED70 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsh r0, [r0, #0xd8]
	cmp r0, #0
	blt _022FE7F4
	mov r0, #0x56
	bl AdvanceFrame
_022FE7F4:
	ldr r1, _022FED70 ; =DUNGEON_PTR
	mvn r2, #0
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xd8]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xda]
	b _022FEBB4
_022FE818:
	ldrb r1, [r6, #0x4c]
	ldrh r3, [r6]
	ldr r2, _022FED88 ; =DIRECTIONS_XY
	mov r8, r1, lsl #2
	ldr r0, _022FED8C ; =DIRECTIONS_XY + 2
	ldrsh ip, [sb, #4]
	ldrsh r7, [r2, r8]
	ldrsh r5, [sb, #6]
	ldrsh r2, [r0, r8]
	add r0, ip, r7
	mov r0, r0, lsl #0x10
	add r2, r5, r2
	mov r2, r2, lsl #0x10
	mov r5, r4
	tst r3, #0x8000
	mov r7, r0, asr #0x10
	mov r8, r2, asr #0x10
	bne _022FE870
	mov r0, sb
	bl CanMonsterMoveInDirection
	cmp r0, #0
	moveq r5, #1
_022FE870:
	cmp r5, #0
	beq _022FE8D8
	mov r0, #0
	strh r0, [r6, #0x4a]
	mov r0, #1
	strb r0, [r6, #0x151 + EXECUTE_MONSTER_ACTION_OFFSET]
	ldrb r0, [r6, #7]
	cmp r0, #0
	beq _022FEBB4
	ldr r0, _022FED70 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsh r0, [r0, #0xd8]
	cmp r0, #0
	blt _022FE8B4
	mov r0, #0x56
	bl AdvanceFrame
_022FE8B4:
	ldr r1, _022FED70 ; =DUNGEON_PTR
	mvn r2, #0
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xd8]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xda]
	b _022FEBB4
_022FE8D8:
	ldrsh r2, [sb, #4]
	mov r0, sb
	mov r1, r7
	strh r2, [sp]
	ldrsh r4, [sb, #6]
	mov r2, r8
	mov r3, #0
	strh r4, [sp, #2]
	bl MoveMonsterToPos
	ldrb r1, [r6, #0x4c]
	add r2, sp, #0
	mov r0, sb
	bl ov29_02304D20
	mov r0, sb
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r6, #0xef]
	cmpne r0, #3
	beq _022FE95C
	mov r0, sb
	mov r1, #0x6f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _022FE94C
	mov r0, sb
	mov r1, #0x10
	bl HasHeldItem
_022FE94C:
	cmp r0, #0
	bne _022FE95C
	add r0, sb, #4
	bl ov29_02337CCC
_022FE95C:
	ldrb r0, [r6, #7]
	mov r4, #1
	cmp r0, #0
	beq _022FEBB4
	ldrb r0, [r6, #0xd0]
	cmp r0, #2
	bne _022FEBB4
	ldr r1, _022FED70 ; =DUNGEON_PTR
	sub r2, r4, #2
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xd8]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xda]
	b _022FEBB4
_022FE99C:
	mov r0, sb
	bl ov29_0231A8A0
	b _022FEBB4
_022FE9A8:
	bl ov29_022E5D68
	ldr r0, _022FED70 ; =DUNGEON_PTR
	mov r2, #1
	ldr r0, [r0]
	ldr r1, _022FED7C ; =ov29_0237C9C0
	strb r2, [r0, #6]
	ldrb r2, [r6, #0x4c]
	add r0, sb, #4
	strb r2, [r1]
	bl PositionIsOnHiddenStairs
	cmp r0, #0
	beq _022FEBB4
	bl GetHiddenStairsField
	cmp r0, #1
	bne _022FE9F0
	mov r0, #1
	bl SetHiddenFloorField
	b _022FEBB4
_022FE9F0:
	bl GetHiddenStairsField
	cmp r0, #2
	bne _022FEBB4
	mov r0, #2
	bl SetHiddenFloorField
	b _022FEBB4
_022FEA08:
	mov r0, sb
	bl UseSingleUseItemWrapper
	b _022FEBB4
_022FEA14:
	mov r0, sb
	bl ov29_0231A9F8
	b _022FEBB4
_022FEA20:
#ifdef JAPAN
	mov r0, #1
	strh r0, [r6, #0x4a]
#else
	strh r1, [r6, #0x4a]
#endif
	b _022FEBB4
_022FEA28:
#ifdef JAPAN
	mov r0, #1
	strh r0, [r6, #0x4a]
#else
	strh r1, [r6, #0x4a]
#endif
	b _022FEBB4
_022FEA30:
	mov r0, sb
	bl ov29_022F4350
	b _022FEBB4
_022FEA3C:
	mov r0, sb
	bl ov29_022F45CC
	b _022FEBB4
_022FEA48:
	mov r0, sb
	bl ov29_022F48D8
	b _022FEBB4
_022FEA54:
	mov r0, sb
	bl ov29_022F49E0
	b _022FEBB4
_022FEA60:
	mov r0, sb
	bl ov29_022F4BDC
	b _022FEBB4
_022FEA6C:
	mov r0, sb
#ifdef JAPAN
	mov r1, #1
#endif
	bl ov29_022F4370
	b _022FEBB4
_022FEA78:
	mov r0, sb
#ifdef JAPAN
	mov r1, #1
#endif
	bl ov29_022F44F0
	b _022FEBB4
_022FEA84:
	ldr r0, _022FED70 ; =DUNGEON_PTR
	ldrb r1, [r6, #0x4e]
	ldr r2, [r0]
	add r0, r2, r1, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	str r0, [r2, #0xc8]
	b _022FEBB4
_022FEAA4:
	mov r0, sb
	bl ov29_022F4BF8
	b _022FEBB4
_022FEAB0:
	mov r0, sb
	bl ov29_022F4DAC
	b _022FEBB4
_022FEABC:
	mov r0, sb
	bl ov29_022F505C
	b _022FEBB4
_022FEAC8:
	mov r0, r6
	bl MonsterCanThrowItems
	cmp r0, #0
	beq _022FEAEC
	mov r0, sb
	bl ov29_022F996C
	mov r0, sb
	bl UseThrowableItem
	b _022FEBB4
_022FEAEC:
	mov r0, r4
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, sb
#ifdef JAPAN
	mov r1, #0xb30
#else
	mov r1, #0xdf0
#endif
	bl LogMessageByIdWithPopupCheckUser
	b _022FEBB4
_022FEB0C:
	mov r0, sb
	bl ov29_022F59C4
	b _022FEBB4
_022FEB18:
	mov r0, sb
	bl ov29_022F5F18
	b _022FEBB4
_022FEB24:
	mov r0, sb
	mov r1, #0x160
	bl ov29_022F6058
	b _022FEBB4
_022FEB34:
#ifdef JAPAN
	ldr r1, _0230017C ; =0x00000163
	mov r0, sb
#else
	mov r0, sb
	rsb r1, r1, #0x164
#endif
	bl ov29_022F6058
	b _022FEBB4
_022FEB44:
	mov r0, sb
	mov r2, r4
	mov r3, r4
	add r1, sb, #4
	bl TryTriggerTrap
	b _022FEBB4
_022FEB5C:
	mov r0, sb
	bl ov29_0230F158
	b _022FEBB4
_022FEB68:
	mov r0, sb
	bl ov29_0230F140
	b _022FEBB4
_022FEB74:
	mov r0, sb
	bl ov29_0230F14C
	b _022FEBB4
_022FEB80:
	mov r0, r4
	mov r1, sb
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	ldr r1, _022FED90 ; =0x00000DF1
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
	b _022FEBB4
_022FEBA0:
	mov r0, sb
	bl ov29_022F52B0
	b _022FEBB4
_022FEBAC:
	mov r0, #1
	strh r0, [r6, #0x4a]
_022FEBB4:
	mov r0, sb
	bl TrySpawnTrapperTrap
	mov r0, sb
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r2, [sb, #0xb4]
	ldrb r0, [r2, #0x154 + EXECUTE_MONSTER_ACTION_OFFSET]
	cmp r0, #0
	bne _022FEBF0
	mov r1, #0
	mov r0, sb
	strb r1, [r2, #0x154 + EXECUTE_MONSTER_ACTION_OFFSET]
	bl ov29_02318D58
_022FEBF0:
	mov r0, #0
	bl ov29_022E3A58
	mov r0, sb
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl ov29_022EF9BC
	ldrb r0, [r6, #0x155 + EXECUTE_MONSTER_ACTION_OFFSET]
	cmp r0, #0
	beq _022FEC88
	mov ip, #0
	mov r5, #1
	mov r8, ip
	strb ip, [r6, #0x155 + EXECUTE_MONSTER_ACTION_OFFSET]
	add r7, r6, #0x124 + EXECUTE_MONSTER_ACTION_OFFSET
	mov r3, ip
	mov r1, ip
	mov r0, r5
_022FEC3C:
	ldrb r2, [r7, r8, lsl #3]
	add lr, r7, r8, lsl #3
	tst r2, #1
	movne r2, r5
	moveq r2, r3
	tst r2, #0xff
	beq _022FEC68
	ldrb r2, [lr]
	tst r2, #0x10
	movne ip, r0
	strneb r1, [lr, #6]
_022FEC68:
	add r8, r8, #1
	cmp r8, #4
	blt _022FEC3C
	cmp ip, #0
	beq _022FEC88
	ldr r1, _022FED94 ; =0x00000DF2
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
_022FEC88:
	bl TryActivateFlashFireOnAllMonsters
	bl ov29_022EC85C
	cmp r0, #0
	bne _022FECB4
	bl ov29_022FEFC8
	bl ov29_022FEDBC
	mov r0, sb
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FECB4:
	mov r0, sb
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl ov29_022EC85C
	cmp r0, #0
	bne _022FECD8
	bl ov29_02346888
_022FECD8:
	mov r0, #0
	bl ov29_022E3A58
	mov r0, sb
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r0, [r6, #0x14e + EXECUTE_MONSTER_ACTION_OFFSET]
	cmp r0, #0
	cmpeq r4, #0
	bne _022FED68
	mov r0, sb
	add r1, sb, #4
	bl CannotStandOnTile
	cmp r0, #0
	beq _022FED58
	ldr r0, [r6, #0x110 + EXECUTE_MONSTER_ACTION_OFFSET]
	cmp r0, #1
	ble _022FED50
	mov r0, #0
	bl DisplayActions
	mov r0, sb
	bl EntityIsValid__022FED98
	cmp r0, #0
	beq _022FED48
	bl IsFloorOver
	cmp r0, #0
	beq _022FED50
_022FED48:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FED50:
	mov r0, sb
	bl EnsureCanStandCurrentTile
_022FED58:
	mov r0, sb
	bl ov29_0230FC24
	mov r0, sb
	bl EnemyEvolution
_022FED68:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
#endif
	.align 2, 0
_022FED70: .word DUNGEON_PTR
_022FED74: .word ov10_022C4F3C
_022FED78: .word ov10_022C4F3D
_022FED7C: .word ov29_0237C9C0
_022FED80: .word ov29_0237CA6C
_022FED84: .word ov29_0237CA68
_022FED88: .word DIRECTIONS_XY
_022FED8C: .word DIRECTIONS_XY + 2
#ifdef JAPAN
_0230017C: .word 0x00000163
_022FED90: .word 0x00000B31
_022FED94: .word 0x00000B32
#else
_022FED90: .word 0x00000DF1
_022FED94: .word 0x00000DF2
#endif
	arm_func_end ExecuteMonsterAction
