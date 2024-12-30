	.include "asm/macros.inc"
	.include "overlay_29_022F62CC.inc"

	.text

	arm_func_start ov29_022F62CC
ov29_022F62CC: ; 0x022F62CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	mov sl, r0
	bl IsFloorOver
	cmp r0, #0
	bne _022F66F4
	bl GetLeader
	ldr r1, _022F66FC ; =DUNGEON_PTR
	mov r4, r0
	ldr r1, [r1]
	ldr r6, [r4, #0xb4]
	ldrb fp, [r1, #0x7c8]
	bl GetTileAtEntity
	ldrh r0, [r0]
	ldr r7, _022F66FC ; =DUNGEON_PTR
	tst r0, #0x20
	movne r0, #1
	moveq r0, #0
	and r5, r0, #0xff
	ldr r0, [r7]
	strb r5, [r0, #0x7c8]
	ldr r0, [r7]
	strb r5, [r0, #0x7c9]
	ldr r1, [r7]
	ldrb r0, [r1, #0x790]
	cmp r0, #0
	bne _022F66F4
	ldr r0, [r1, #0x7c4]
	cmp r0, #0
	beq _022F66F4
	ldrb r0, [r6, #0xef]
	cmp r0, #1
	bne _022F6380
	ldrb r0, [r1, #0x7c9]
	cmp r0, #0
	beq _022F6364
	mov r0, #0
	bl AnimationDelayOrSomething
_022F6364:
	ldr r0, _022F66FC ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x7c8]
	ldr r0, [r0]
	strb r2, [r0, #0x7c9]
	b _022F66F4
_022F6380:
	mov r6, #0
	mov r8, r6
_022F6388:
	ldr r0, [r7]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sb, [r0, #0xa94]
#else
	ldr sb, [r0, #0xb38]
#endif
	mov r0, sb
	bl EntityIsValid__022F62A8
	cmp r0, #0
	beq _022F63D8
	ldr r0, [sb, #0xb4]
	ldrb r0, [r0, #9]
	cmp r0, #1
	bne _022F63D8
	mov r0, sb
	bl ov29_023009CC
	cmp r0, #0
	beq _022F63D8
	ldrb r1, [r4, #0x25]
	ldrb r0, [sb, #0x25]
	cmp r1, r0
	moveq r6, #1
_022F63D8:
	add r8, r8, #1
	cmp r8, #0x10
	blt _022F6388
	bl GetKecleonIdToSpawnByFloor
	mov r1, r0
	add r0, sp, #0x18
	mov r2, #0
	bl InitPortraitDungeon
	cmp fp, #0
	cmpeq r5, #1
	bne _022F6448
	cmp r6, #0
	beq _022F66F4
	mov r0, r4
	bl ov29_022F6210
	movs r5, r0
	beq _022F6434
	add r0, r5, #4
	add r1, r4, #4
	bl GetDirectionTowardsPosition
	mov r1, r0
	mov r0, r5
	bl ov29_02304A48
_022F6434:
	ldr r1, _022F6700 ; =0x00000E53
	add r0, sp, #0x18
	mov r2, #1
	bl DisplayMessage2
	b _022F66F4
_022F6448:
	cmp r5, #1
	beq _022F66F4
	cmp fp, #1
	cmpeq r5, #0
	beq _022F6464
	cmp sl, #0
	beq _022F66F4
_022F6464:
	mov r7, #0
	str r7, [sp]
	bl ov29_022F670C
	cmp r0, #0
	beq _022F6620
	mov r0, #1
	str r0, [sp]
	mov r8, r7
	ldr sb, _022F66FC ; =DUNGEON_PTR
	b _022F6618
_022F648C:
	ldr r0, [sb]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sl, [r0, #0xa94]
#else
	ldr sl, [r0, #0xb38]
#endif
	mov r0, sl
	bl EntityIsValid__022F62A8
	cmp r0, #0
	beq _022F6614
	ldr r0, [sl, #0xb4]
	ldrb r0, [r0, #9]
	cmp r0, #1
	bne _022F6614
	mov r0, sl
	bl ov29_023009CC
	cmp r0, #0
	beq _022F6614
	ldrb r1, [r4, #0x25]
	ldrb r0, [sl, #0x25]
	cmp r1, r0
	bne _022F6614
	ldrsh r1, [r4, #4]
	ldrsh r0, [sl, #4]
	mov r7, #1
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	bgt _022F6510
	ldrsh r1, [r4, #6]
	ldrsh r0, [sl, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	ble _022F65CC
_022F6510:
	ldr r0, _022F6704 ; =ov29_02352760
	mvn r8, #0
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	str r8, [sp, #4]
	strh r1, [sp, #0x10]
	strh r0, [sp, #0x12]
	ldrh r0, [sp, #0x10]
	str r0, [sp, #8]
	ldrh r0, [sp, #0x12]
	str r0, [sp, #0xc]
	b _022F65C4
_022F6540:
	ldr sb, [sp, #4]
	b _022F65B8
_022F6548:
	ldr r0, [sp, #8]
	strh r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	strh r0, [sp, #0x16]
	ldrsh r0, [r4, #4]
	add r0, r8, r0
	strh r0, [sp, #0x14]
	ldrsh r1, [r4, #6]
	ldrsh r0, [sp, #0x14]
	add r1, sb, r1
	strh r1, [sp, #0x16]
	ldrsh r1, [sp, #0x16]
	bl GetTile
	ldrb r0, [r0, #7]
	cmp r0, #0xff
	beq _022F65B4
	mov r0, sl
	add r1, sp, #0x14
	bl ov29_022FF764
	cmp r0, #0
	bne _022F65B4
	add r3, sp, #0x14
	mov r0, r4
	mov r1, sl
	mov r2, #3
	bl TryWarp
	b _022F65CC
_022F65B4:
	add sb, sb, #1
_022F65B8:
	cmp sb, #1
	ble _022F6548
	add r8, r8, #1
_022F65C4:
	cmp r8, #1
	ble _022F6540
_022F65CC:
	mov r0, r4
	bl ov29_023009CC
	cmp r0, #0
	moveq r7, #0
	beq _022F65F8
	add r0, r4, #4
	add r1, sl, #4
	bl GetDirectionTowardsPosition
	mov r1, r0
	mov r0, r4
	bl ov29_02304A00
_022F65F8:
	add r0, sl, #4
	add r1, r4, #4
	bl GetDirectionTowardsPosition
	mov r1, r0
	mov r0, sl
	bl ov29_02304A48
	b _022F6620
_022F6614:
	add r8, r8, #1
_022F6618:
	cmp r8, #0x10
	blt _022F648C
_022F6620:
	ldr r0, [sp]
	cmp r0, #0
	beq _022F6654
	cmp r7, #0
	bne _022F6654
	ldr r0, _022F66FC ; =DUNGEON_PTR
	ldr r0, [r0]
	ldr r1, [r0, #0x7c4]
	ldr r0, [r0, #0x7bc]
	cmp r1, r0
	ble _022F66F4
	bl ov29_022F6CAC
	b _022F66F4
_022F6654:
	ldr r0, [sp]
	cmp r0, #0
	beq _022F6688
	cmp r6, #0
	bne _022F6688
	ldr r0, _022F66FC ; =DUNGEON_PTR
	ldr r0, [r0]
	ldr r1, [r0, #0x7c4]
	ldr r0, [r0, #0x7bc]
	cmp r1, r0
	ble _022F66F4
	bl ov29_022F6CAC
	b _022F66F4
_022F6688:
	mov r0, r7
	bl ov29_022F67D0
	mov r0, r7
	bl ov29_022F6A0C
	cmp r0, #0
	beq _022F66A8
	bl ov29_022F6CAC
	b _022F66F4
_022F66A8:
	cmp fp, #1
	cmpeq r5, #0
	bne _022F66F4
	cmp r6, #0
	beq _022F66F4
	mov r0, r4
	bl ov29_022F6210
	movs r5, r0
	beq _022F66E4
	add r0, r5, #4
	add r1, r4, #4
	bl GetDirectionTowardsPosition
	mov r1, r0
	mov r0, r5
	bl ov29_02304A48
_022F66E4:
	ldr r1, _022F6708 ; =0x00000E52
	add r0, sp, #0x18
	mov r2, #1
	bl DisplayMessage2
_022F66F4:
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F66FC: .word DUNGEON_PTR
#ifdef JAPAN
_022F6700: .word 0x00000B95
_022F6704: .word ov29_02352760
_022F6708: .word 0x00000B94
#else
_022F6700: .word 0x00000E53
_022F6704: .word ov29_02352760
_022F6708: .word 0x00000E52
#endif
	arm_func_end ov29_022F62CC

	arm_func_start ov29_022F670C
ov29_022F670C: ; 0x022F670C
	ldr r0, _022F6744 ; =DUNGEON_PTR
	ldr r2, [r0]
	ldr r1, [r2, #0x7c4]
	ldr r0, [r2, #0x7bc]
	sub r0, r1, r0
	cmp r0, #0
	movgt r0, #1
	bxgt lr
	ldr r0, [r2, #0x7c0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022F6744: .word DUNGEON_PTR
	arm_func_end ov29_022F670C

	arm_func_start ov29_022F6748
ov29_022F6748: ; 0x022F6748
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	bl GetKecleonIdToSpawnByFloor
	mov r1, r0
	add r0, sp, #0
	mov r2, #0
	bl InitPortraitDungeon
	mov r0, #1
	bl ov29_022F67D0
	mov r0, #1
	bl ov29_022F6A0C
	movs r4, r0
	beq _022F67B4
	bl GetLeader
	bl GetTileAtEntity
	ldrh r0, [r0]
	tst r0, #0x20
	beq _022F67AC
	cmp r4, #2
	beq _022F67C4
	ldr r1, _022F67CC ; =0x00000E51
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage2
	b _022F67C4
_022F67AC:
	bl ov29_022F6CAC
	b _022F67C4
_022F67B4:
#ifdef JAPAN
	ldr r1, _022F7DB4 ; =0x00000B92
	add r0, sp, #0
#else
	add r0, sp, #0
	mov r1, #0xe50
#endif
	mov r2, #1
	bl DisplayMessage2
_022F67C4:
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_022F67CC: .word 0x00000B93
_022F7DB4: .word 0x00000B92
#else
_022F67CC: .word 0x00000E51
#endif
	arm_func_end ov29_022F6748

	arm_func_start ov29_022F67D0
ov29_022F67D0: ; 0x022F67D0
#ifdef JAPAN
#define OV29_022F67D0_OFFSET -0xA4
#else
#define OV29_022F67D0_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	ldr r1, _022F69EC ; =DUNGEON_PTR
	mov r4, r0
	ldr r0, [r1]
	mov r5, #0
	ldr r0, [r0, #0x7c0]
	cmp r0, #0
	beq _022F69E4
	mov r0, #0x3e
	bl TeamLeaderIqSkillIsEnabled
	cmp r0, #0
	movne r5, #1
	bl GetKecleonIdToSpawnByFloor
	mov r1, r0
	add r0, sp, #0x14
	mov r2, #0
	bl InitPortraitDungeon
	ldr r0, _022F69EC ; =DUNGEON_PTR
	cmp r4, #0
	ldr r0, [r0]
	ldr r4, [r0, #0x7c0]
	beq _022F69E4
	ldr r0, _022F69F0 ; =ov29_023535A8
	cmp r5, #0
	str r4, [r0]
	beq _022F6870
	ldr r0, _022F69F4 ; =ov10_022C4800
	mov r1, r4, lsl #8
	ldr r3, [r0]
	mov r2, #0x64
	smull r0, r1, r3, r1
	mov r3, #0
	bl _ll_sdiv
	bl sub_020018A4
	mov r4, r0
	ldr r1, _022F69F8 ; =0x00000E4F
	add r0, sp, #0x14
	mov r2, #1
	bl DisplayMessage2
_022F6870:
	mov r1, r4
	mov r0, #0
	bl ov29_0234B09C
	mov r2, #0
	ldr r1, _022F69FC ; =0x00000E4D
	add r0, sp, #0x14
	mov r3, r2
	str r2, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _022F69E4
	ldr r0, _022F6A00 ; =0x00001308
	bl ov29_022EACCC
	mov r0, r4
	bl AddMoneyCarried
	ldr r1, _022F6A04 ; =ov29_02352760
	ldr r0, _022F69EC ; =DUNGEON_PTR
	ldrh r3, [r1, #4]
	ldr r0, [r0]
	ldrh r2, [r1, #6]
	add r1, r0, #0xc000
	strh r3, [sp, #4]
	strh r2, [sp, #6]
	ldr sl, [r0, #0x7bc]
	ldr sb, [r1, #0xd14 + OV29_022F67D0_OFFSET]
	b _022F69A8
_022F68D8:
	add r0, r0, #0xc000
	ldr r8, [r0, #0xd18 + OV29_022F67D0_OFFSET]
	mov r0, sb, lsl #0x10
	mov r7, r0, asr #0x10
	add r6, sp, #0xc
	add r5, sp, #8
	mov fp, #1
	ldr r4, _022F69EC ; =DUNGEON_PTR
	b _022F6990
_022F68FC:
	mov r0, sb
	mov r1, r8
	strh r7, [sp, #8]
	strh r8, [sp, #0xa]
	bl GetTile
	ldrh r1, [r0]
	tst r1, #0x20
	ldrne r0, [r0, #0x10]
	cmpne r0, #0
	beq _022F698C
	ldr r1, [r0]
	cmp r1, #3
	bne _022F698C
	bl GetItemInfo
	ldrb r1, [r0]
	tst r1, #2
	bne _022F698C
	ldrh r2, [r0]
	mov r1, fp
	strh r2, [sp, #0xc]
	ldrh r2, [r0, #2]
	strh r2, [sp, #0xe]
	ldrh r2, [r0, #4]
	mov r0, r5
	strh r2, [sp, #0x10]
	bl RemoveGroundItem
	ldrsh r0, [sp, #0x10]
	bl IsShoppableItem
	cmp r0, #0
	ldrneb r0, [sp, #0xc]
	mov r1, r6
	mov r2, #1
	orrne r0, r0, #2
	strneb r0, [sp, #0xc]
	mov r0, r5
	bl SpawnItem
_022F698C:
	add r8, r8, #1
_022F6990:
	ldr r0, [r4]
	add r1, r0, #0xc000
	ldr r1, [r1, #0xd20 + OV29_022F67D0_OFFSET]
	cmp r8, r1
	ble _022F68FC
	add sb, sb, #1
_022F69A8:
	add r1, r0, #0xc000
	ldr r1, [r1, #0xd1c + OV29_022F67D0_OFFSET]
	cmp sb, r1
	ble _022F68D8
	ldr r1, _022F69EC ; =DUNGEON_PTR
	add r0, sp, #0x14
	ldr r4, [r1]
	ldr r1, _022F6A08 ; =0x00000E4A
	ldr r2, [r4, #0x7bc]
	ldr r3, [r4, #0x7c4]
	sub r2, r2, sl
	add r3, r3, r2
	mov r2, #1
	str r3, [r4, #0x7c4]
	bl DisplayMessage2
_022F69E4:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_022F67D0_DATA_OFFSET -0x2BE
#else
#define OV29_022F67D0_DATA_OFFSET 0
#endif
_022F69EC: .word DUNGEON_PTR
_022F69F0: .word ov29_023535A8
_022F69F4: .word ov10_022C4800
_022F69F8: .word 0x00000E4F + OV29_022F67D0_DATA_OFFSET
_022F69FC: .word 0x00000E4D + OV29_022F67D0_DATA_OFFSET
_022F6A00: .word 0x00001308
_022F6A04: .word ov29_02352760
_022F6A08: .word 0x00000E4A + OV29_022F67D0_DATA_OFFSET
	arm_func_end ov29_022F67D0

	arm_func_start ov29_022F6A0C
ov29_022F6A0C: ; 0x022F6A0C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	mov r5, r0
	mov r0, #0x3e
	mov r4, #0
	bl TeamLeaderIqSkillIsEnabled
	cmp r0, #0
	movne r4, #1
	bl GetKecleonIdToSpawnByFloor
	mov r1, r0
	add r0, sp, #4
	mov r2, #0
	bl InitPortraitDungeon
	ldr r0, _022F6C8C ; =DUNGEON_PTR
	cmp r4, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x7c4]
	ldr r0, [r0, #0x7bc]
	sub r6, r1, r0
	beq _022F6A80
	ldr r0, _022F6C90 ; =ov10_022C473C
	mov r3, r6, lsl #8
	ldr r0, [r0]
	mov r2, #0x64
	smull r0, r1, r3, r0
	mov r3, #0
	bl _ll_sdiv
	bl sub_020018A4
	mov r6, r0
_022F6A80:
	cmp r6, #0
	movle r0, #0
	ble _022F6C84
	cmp r5, #0
	beq _022F6AE0
	cmp r4, #0
	beq _022F6AAC
#ifdef JAPAN
	add r0, sp, #4
	mov r1, #0xb90
#else
	ldr r1, _022F6C94 ; =0x00000E4E
	add r0, sp, #4
#endif
	mov r2, #1
	bl DisplayMessage2
_022F6AAC:
	mov r1, r6
	mov r0, #0
	bl ov29_0234B09C
	mov r2, #0
	ldr r1, _022F6C98 ; =0x00000E4C
	add r0, sp, #4
	mov r3, #1
	str r2, [sp]
	bl YesNoMenu
	cmp r0, #1
	beq _022F6AE8
	mov r0, #1
	b _022F6C84
_022F6AE0:
	mov r0, #1
	b _022F6C84
_022F6AE8:
	bl GetMoneyCarried
	cmp r0, r6
	bge _022F6B0C
	ldr r1, _022F6C9C ; =0x00000E4B
	add r0, sp, #4
	mov r2, #1
	bl DisplayMessage2
	mov r0, #2
	b _022F6C84
_022F6B0C:
	ldr r0, _022F6CA0 ; =0x00001308
	bl ov29_022EACCC
	rsb r0, r6, #0
	bl AddMoneyCarried
	mov r6, #0
	mov r4, r6
_022F6B24:
	mov r5, r4
_022F6B28:
	mov r0, r6
	mov r1, r5
	bl GetTile
	ldrh r1, [r0]
	tst r1, #0x20
	bne _022F6B78
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _022F6B78
	ldr r1, [r0]
	cmp r1, #3
	bne _022F6B78
	bl GetItemInfo
	mov r7, r0
	ldrsh r0, [r7, #4]
	bl IsShoppableItem
	cmp r0, #0
	ldrneb r0, [r7]
	bicne r0, r0, #2
	strneb r0, [r7]
_022F6B78:
	add r5, r5, #1
	cmp r5, #0x20
	blt _022F6B28
	add r6, r6, #1
	cmp r6, #0x38
	blt _022F6B24
	mov r6, #0
	ldr sb, _022F6CA4 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, r6
	mov r5, #1
	mov r8, #6
_022F6BA4:
	mul r1, r6, r8
	ldr r0, [sb]
	ldr r2, [r0, #0x384]
	ldrb r0, [r2, r1]
	add r7, r2, r1
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _022F6BE4
	ldrsh r0, [r7, #4]
	bl IsShoppableItem
	cmp r0, #0
	ldrneb r0, [r7]
	bicne r0, r0, #2
	strneb r0, [r7]
_022F6BE4:
	add r6, r6, #1
	cmp r6, #0x32
	blt _022F6BA4
	mov r7, #0
	ldr r8, _022F6C8C ; =DUNGEON_PTR
	mov r4, r7
	mov r5, #1
_022F6C00:
	ldr r0, [r8]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__022F62A8
	cmp r0, #0
	beq _022F6C54
	ldr r6, [r6, #0xb4]
	ldrb r0, [r6, #0x62]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _022F6C54
	ldrsh r0, [r6, #0x66]
	bl IsShoppableItem
	cmp r0, #0
	ldrneb r0, [r6, #0x62]
	bicne r0, r0, #2
	strneb r0, [r6, #0x62]
_022F6C54:
	add r7, r7, #1
	cmp r7, #0x14
	blt _022F6C00
	ldr r1, _022F6C8C ; =DUNGEON_PTR
	add r0, sp, #4
	ldr r4, [r1]
	ldr r1, _022F6CA8 ; =0x00000E49
	ldr r3, [r4, #0x7bc]
	mov r2, #1
	str r3, [r4, #0x7c4]
	bl DisplayMessage2
	mov r0, #0
_022F6C84:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_022F6A0C_OFFSET -0x2BE
#else
#define OV29_022F6A0C_OFFSET 0
#endif
_022F6C8C: .word DUNGEON_PTR
_022F6C90: .word ov10_022C473C
#ifndef JAPAN
_022F6C94: .word 0x00000E4E
#endif
_022F6C98: .word 0x00000E4C + OV29_022F6A0C_OFFSET
_022F6C9C: .word 0x00000E4B + OV29_022F6A0C_OFFSET
_022F6CA0: .word 0x00001308
_022F6CA4: .word BAG_ITEMS_PTR_MIRROR
_022F6CA8: .word 0x00000E49 + OV29_022F6A0C_OFFSET
	arm_func_end ov29_022F6A0C

	arm_func_start ov29_022F6CAC
ov29_022F6CAC: ; 0x022F6CAC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _022F6E0C ; =DUNGEON_PTR
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x790]
	ldr r0, [r0]
	strb r2, [r0, #0x791]
	bl GetLeader
	ldr r1, _022F6E10 ; =0x00000E54
	bl LogMessageByIdWithPopupCheckUser
	mov r6, #0
	mov r4, r6
_022F6CDC:
	mov r5, r4
_022F6CE0:
	mov r0, r6
	mov r1, r5
	bl GetTile
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _022F6D14
	ldr r1, [r0]
	cmp r1, #3
	bne _022F6D14
	bl GetItemInfo
	ldrb r1, [r0]
	bic r1, r1, #2
	strb r1, [r0]
_022F6D14:
	add r5, r5, #1
	cmp r5, #0x20
	blt _022F6CE0
	add r6, r6, #1
	cmp r6, #0x38
	blt _022F6CDC
	mov r7, #0
	ldr r1, _022F6E14 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, r7
	mov r4, #1
	mov r0, #6
_022F6D40:
	mul r5, r7, r0
	ldr r2, [r1]
	add r7, r7, #1
	ldr r6, [r2, #0x384]
	ldrb r2, [r6, r5]
	tst r2, #1
	movne r2, r4
	moveq r2, r3
	tst r2, #0xff
	ldrneb r2, [r6, r5]
	bicne r2, r2, #2
	strneb r2, [r6, r5]
	cmp r7, #0x32
	blt _022F6D40
	mov r8, #0
	ldr sb, _022F6E0C ; =DUNGEON_PTR
	mov r6, r8
	mov r4, r8
	mov r5, #1
_022F6D8C:
	ldr r0, [sb]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sl, [r0, #0xad4]
#else
	ldr sl, [r0, #0xb78]
#endif
	mov r0, sl
	bl EntityIsValid__022F62A8
	cmp r0, #0
	beq _022F6DDC
	ldr r7, [sl, #0xb4]
	mov r0, sl
	strb r6, [r7, #9]
	bl CalcSpeedStageWrapper
	ldrb r0, [r7, #0x62]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	ldrneb r0, [r7, #0x62]
	bicne r0, r0, #2
	strneb r0, [r7, #0x62]
_022F6DDC:
	add r8, r8, #1
	cmp r8, #0x14
	blt _022F6D8C
	ldr r0, _022F6E0C ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x7c4]
	ldr r1, [r0]
	str r2, [r1, #0x7bc]
	ldr r0, [r0]
	str r2, [r0, #0x7c0]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022F6E0C: .word DUNGEON_PTR
#ifdef JAPAN
_022F6E10: .word 0x00000B96
#else
_022F6E10: .word 0x00000E54
#endif
_022F6E14: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end ov29_022F6CAC

	arm_func_start ResetDamageData
ResetDamageData: ; 0x022F6E18
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	strb r1, [r0, #0xc]
	strb r1, [r0, #0xd]
	strb r1, [r0, #0xe]
	strb r1, [r0, #0xf]
	strb r1, [r0, #0x10]
	bx lr
	arm_func_end ResetDamageData

	arm_func_start ov29_022F6E40
ov29_022F6E40: ; 0x022F6E40
	stmdb sp!, {r4, lr}
	ldr r0, _022F6ED8 ; =0x0001A002
	mov r1, #0
	bl MemAlloc
	ldr r2, _022F6EDC ; =LOADED_ATTACK_SPRITE_DATA
	ldr r1, _022F6ED8 ; =0x0001A002
	str r0, [r2]
	bl MemZero
	ldr r0, _022F6EDC ; =LOADED_ATTACK_SPRITE_DATA
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1a000
	strh r1, [r0]
	bl ov29_0231B490
	mov r2, #0
	ldr r0, _022F6EE0 ; =ov29_0237C9B0
	mov r1, r2
_022F6E84:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #2
	blt _022F6E84
	ldr r0, _022F6EE4 ; =0x00000216
	bl GetSpriteFileSize
	mov r4, r0
	ldr r0, _022F6EE8 ; =0x00000217
	bl GetSpriteFileSize
	cmp r4, r0
#ifdef JAPAN
	ldmneia sp!, {r4, pc}
#else
	bne _022F6EC0
#endif
	mov r0, #0x218
	bl GetSpriteFileSize
	ldr r0, _022F6EEC ; =0x00000211
	bl GetSpriteFileSize
#ifndef JAPAN
_022F6EC0:
	ldr r0, _022F6EF0 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0xe1c]
#endif
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F6ED8: .word 0x0001A002
_022F6EDC: .word LOADED_ATTACK_SPRITE_DATA
_022F6EE0: .word ov29_0237C9B0
_022F6EE4: .word 0x00000216
_022F6EE8: .word 0x00000217
_022F6EEC: .word 0x00000211
#ifndef JAPAN
_022F6EF0: .word DUNGEON_PTR
#endif
	arm_func_end ov29_022F6E40

	arm_func_start ov29_022F6EF4
ov29_022F6EF4: ; 0x022F6EF4
	ldr r1, _022F6F08 ; =0x0000FFFF
	ldr r0, _022F6F0C ; =LOADED_ATTACK_SPRITE_FILE_INDEX
	strh r1, [r0, #2]
	strh r1, [r0]
	bx lr
	.align 2, 0
_022F6F08: .word 0x0000FFFF
_022F6F0C: .word LOADED_ATTACK_SPRITE_FILE_INDEX
	arm_func_end ov29_022F6EF4

	arm_func_start FreeLoadedAttackSpriteAndMore
FreeLoadedAttackSpriteAndMore: ; 0x022F6F10
	stmdb sp!, {r4, r5, r6, lr}
	bl ClearLoadedAttackSprite
	ldr r0, _022F6F60 ; =LOADED_ATTACK_SPRITE_DATA
	ldr r0, [r0]
	bl MemFree
	mov r6, #0
	ldr r5, _022F6F64 ; =ov29_0237C9B0
	mov r4, r6
_022F6F30:
	ldr r0, [r5, r6, lsl #2]
	cmp r0, #0
	beq _022F6F44
	bl MemFree
	str r4, [r5, r6, lsl #2]
_022F6F44:
	add r6, r6, #1
	cmp r6, #2
	blt _022F6F30
	ldr r0, _022F6F60 ; =LOADED_ATTACK_SPRITE_DATA
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F6F60: .word LOADED_ATTACK_SPRITE_DATA
_022F6F64: .word ov29_0237C9B0
	arm_func_end FreeLoadedAttackSpriteAndMore

	arm_func_start SetAndLoadCurrentAttackAnimation
SetAndLoadCurrentAttackAnimation: ; 0x022F6F68
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _022F6FFC ; =LOADED_ATTACK_SPRITE_FILE_INDEX
	mov r5, r0
	ldrh r0, [r2, #2]
	mov r4, r1
	cmp r0, r5
	ldreqh r0, [r2]
	cmpeq r0, r4
	beq _022F6FE8
	ldr r0, _022F7000 ; =LOADED_ATTACK_SPRITE_DATA
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrsh r0, [r0]
	cmp r0, #0
	beq _022F6FA8
	bl ClearLoadedAttackSprite
_022F6FA8:
	mov r1, #1
	ldr r0, _022F7004 ; =WAN_TABLE
	str r1, [sp]
	ldr r1, _022F7000 ; =LOADED_ATTACK_SPRITE_DATA
	ldr r0, [r0]
	ldr r3, [r1]
	mov r1, r5
	mov r2, r4
	bl LoadWanTableEntryFromPackUseProvidedMemory
	ldr r1, _022F7000 ; =LOADED_ATTACK_SPRITE_DATA
	ldr r2, _022F6FFC ; =LOADED_ATTACK_SPRITE_FILE_INDEX
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strh r0, [r1]
	strh r5, [r2, #2]
	strh r4, [r2]
_022F6FE8:
	ldr r0, _022F7000 ; =LOADED_ATTACK_SPRITE_DATA
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrsh r0, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F6FFC: .word LOADED_ATTACK_SPRITE_FILE_INDEX
_022F7000: .word LOADED_ATTACK_SPRITE_DATA
_022F7004: .word WAN_TABLE
	arm_func_end SetAndLoadCurrentAttackAnimation

	arm_func_start ClearLoadedAttackSprite
ClearLoadedAttackSprite: ; 0x022F7008
	stmdb sp!, {r3, lr}
	ldr r0, _022F7048 ; =LOADED_ATTACK_SPRITE_DATA
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrsh r1, [r0]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _022F704C ; =WAN_TABLE
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
	ldr r0, _022F7048 ; =LOADED_ATTACK_SPRITE_DATA
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1a000
	strh r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7048: .word LOADED_ATTACK_SPRITE_DATA
_022F704C: .word WAN_TABLE
	arm_func_end ClearLoadedAttackSprite

	arm_func_start GetLoadedAttackSpriteId
GetLoadedAttackSpriteId: ; 0x022F7050
	ldr r0, _022F7064 ; =LOADED_ATTACK_SPRITE_DATA
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrsh r0, [r0]
	bx lr
	.align 2, 0
_022F7064: .word LOADED_ATTACK_SPRITE_DATA
	arm_func_end GetLoadedAttackSpriteId

	arm_func_start DungeonGetTotalSpriteFileSize
DungeonGetTotalSpriteFileSize: ; 0x022F7068
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	bl IsCastform
	cmp r0, #0
	beq _022F70B4
	ldr r0, _022F70F4 ; =0x0000017B
	bl GetSpriteFileSize
	add r4, r4, r0
	mov r0, #0x17c
	bl GetSpriteFileSize
	add r4, r4, r0
	ldr r0, _022F70F8 ; =0x0000017D
	bl GetSpriteFileSize
	add r4, r4, r0
	ldr r0, _022F70FC ; =0x0000017E
	bl GetSpriteFileSize
	add r4, r4, r0
	b _022F70EC
_022F70B4:
	mov r0, r5
	bl IsCherrim
	cmp r0, #0
	beq _022F70E0
	mov r0, #0x1cc
	bl GetSpriteFileSize
	add r4, r4, r0
	ldr r0, _022F7100 ; =0x000001CD
	bl GetSpriteFileSize
	add r4, r4, r0
	b _022F70EC
_022F70E0:
	mov r0, r5
	bl GetSpriteFileSize
	add r4, r4, r0
_022F70EC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F70F4: .word 0x0000017B
_022F70F8: .word 0x0000017D
_022F70FC: .word 0x0000017E
_022F7100: .word 0x000001CD
	arm_func_end DungeonGetTotalSpriteFileSize

	arm_func_start ov29_022F7104
ov29_022F7104: ; 0x022F7104
	ldr r1, _022F712C ; =DUNGEON_PTR
	mov r3, #0x400
	ldr r0, [r1]
	mov r2, #0xa
	add r0, r0, #0x3000
#ifdef JAPAN
	str r3, [r0, #0xd88]
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0xd8c]
#else
	str r3, [r0, #0xe2c]
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0xe30]
#endif
	bx lr
	.align 2, 0
_022F712C: .word DUNGEON_PTR
	arm_func_end ov29_022F7104

	arm_func_start ov29_022F7130
ov29_022F7130: ; 0x022F7130
#ifdef JAPAN
#define OV29_022F7130_OFFSET -0xA4
#else
#define OV29_022F7130_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _022F72F8 ; =DUNGEON_PTR
	mov r2, #0
	ldr r0, [r0]
	mov r3, r2
#ifdef JAPAN
	add r0, r0, #0x870
	add r4, r0, #0x19000
#else
	add r0, r0, #0x114
	add r4, r0, #0x19800
#endif
	ldr r0, _022F72FC ; =0x00000483
_022F7150:
	mov r1, r2, lsl #1
	add r2, r2, #1
	strh r3, [r4, r1]
	cmp r2, r0
	blt _022F7150
	ldr r1, _022F72F8 ; =DUNGEON_PTR
	ldr r0, _022F7300 ; =0x00000229
	ldr r2, [r1]
	mov r1, #1
	add r2, r2, #0x2c000
	str r3, [r2, #0xb0c + OV29_022F7130_OFFSET]
	bl LoadMonsterSprite
	mov r6, #0
	mov r5, #1
	ldr r4, _022F72F8 ; =DUNGEON_PTR
	b _022F71AC
_022F7190:
#ifdef JAPAN
	add r0, r1, #0x124
#else
	add r0, r1, #0x174
#endif
	add r0, r0, #0x3800
	add r0, r0, r6, lsl #3
	bl GetMonsterIdFromSpawnEntry
	mov r1, r5
	bl LoadMonsterSprite
	add r6, r6, #1
_022F71AC:
	ldr r1, [r4]
	add r0, r1, #0x3000
	ldr r0, [r0, #0xe20 + OV29_022F7130_OFFSET]
	cmp r6, r0
	blt _022F7190
	bl LoadMissionMonsterSprites
	ldr r0, _022F72F8 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsh r1, [r0, #0xa8]
	cmp r1, #0
	beq _022F71E8
	ldrsh r0, [r0, #0xa8]
	mov r1, #1
	bl LoadMonsterSprite
_022F71E8:
	mov sb, #0
	mov r8, #1
	ldr fp, _022F7304 ; =0x00000217
	mov r7, sb
	mov r5, sb
	mov r6, r8
	mov r4, sb
_022F7204:
	mov r0, sb
	bl GetActiveTeamMember
	mov sl, r0
	ldrb r0, [sl]
	tst r0, #1
	movne r1, r8
	moveq r1, r7
	tst r1, #0xff
	beq _022F7278
	tst r0, #2
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _022F7278
	ldrsh r0, [sl, #0xc]
	bl IsShaymin
	cmp r0, #0
	beq _022F726C
	mov r0, r4
	bl ov29_0231B4AC
	cmp r0, #0
	beq _022F726C
	mov r0, fp
	mov r1, #0
	bl LoadMonsterSprite
	b _022F7278
_022F726C:
	ldrsh r0, [sl, #0xc]
	mov r1, #0
	bl LoadMonsterSprite
_022F7278:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
	blt _022F7204
	ldr r0, _022F72F8 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda + OV29_022F7130_OFFSET]
	cmp r0, #0x6e
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r7, #0
	mov r6, #1
	mov r5, r7
	mov r4, r6
_022F72B4:
	mov r0, r7
	bl GetExplorerMazeMonster
	ldrb r1, [r0]
	tst r1, #1
	movne r1, r6
	moveq r1, r5
	tst r1, #0xff
	beq _022F72E0
	ldrsh r0, [r0, #4]
	mov r1, r4
	bl LoadMonsterSprite
_022F72E0:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _022F72B4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F72F8: .word DUNGEON_PTR
_022F72FC: .word 0x00000483
_022F7300: .word 0x00000229
_022F7304: .word 0x00000217
	arm_func_end ov29_022F7130

	arm_func_start ov29_022F7308
ov29_022F7308: ; 0x022F7308
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	ldr r4, _022F7360 ; =DUNGEON_PTR
	mov r5, r6
_022F7318:
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xad4]
#else
	ldr r7, [r0, #0xb78]
#endif
	cmp r7, #0
	beq _022F7350
	mov r0, r7
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F7350
	ldr r0, [r7, #0xb4]
	mov r1, r5
	ldrsh r0, [r0, #4]
	bl LoadMonsterSprite
_022F7350:
	add r6, r6, #1
	cmp r6, #0x14
	blt _022F7318
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F7360: .word DUNGEON_PTR
	arm_func_end ov29_022F7308
