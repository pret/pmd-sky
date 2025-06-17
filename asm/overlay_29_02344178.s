	.include "asm/macros.inc"
	.include "overlay_29_02344178.inc"

	.text

	arm_func_start IsRoomIlluminated
IsRoomIlluminated: ; 0x02344178
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _0234418C ; =ov10_022C6C74
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_0234418C: .word ov10_022C6C74
	arm_func_end IsRoomIlluminated

	arm_func_start GetMatchingMonsterId
GetMatchingMonsterId: ; 0x02344190
	stmdb sp!, {r4, lr}
	cmp r0, #0
	ldrne r2, _023442A4 ; =0x00000483
	mov r4, #0
	cmpne r0, r2
	beq _0234429C
	add r1, r2, #1
	cmp r0, r1
	bne _023441C0
	bl GetMissionTargetEnemy
	mov r4, r0
	b _0234429C
_023441C0:
	add r1, r2, #2
	cmp r0, r1
	bne _023441DC
	mov r0, r4
	bl GetMissionEnemyMinionGroup
	mov r4, r0
	b _0234429C
_023441DC:
	add r1, r2, #3
	cmp r0, r1
	bne _023441F4
	bl GetMissionTargetEnemy
	mov r4, r0
	b _0234429C
_023441F4:
	add r1, r2, #4
	cmp r0, r1
	bne _02344210
	mov r0, r4
	bl GetMissionEnemyMinionGroup
	mov r4, r0
	b _0234429C
_02344210:
	add r1, r2, #5
	cmp r0, r1
	bne _0234422C
	mov r0, #1
	bl GetMissionEnemyMinionGroup
	mov r4, r0
	b _0234429C
_0234422C:
	sub r1, r2, #0x274
	cmp r0, r1
	bne _02344254
	mov r0, r4
	mov r1, #0x5d
	bl LoadScriptVariableValue
	tst r0, #0xff
	ldrne r4, _023442A8 ; =0x00000467
	ldreq r4, _023442AC ; =0x0000020F
	b _0234429C
_02344254:
	rsb r1, r2, #0x690
	cmp r0, r1
	bne _02344298
	ldr r0, _023442B0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r1, [r0, #0x98]
	cmp r1, #0
	bne _02344288
	ldrsh r0, [r0, #0x4c]
	bl GetDungeonMode
	cmp r0, #1
	moveq r4, #1
_02344288:
	cmp r4, #0
	movne r4, #0x228
	ldreq r4, _023442B4 ; =0x0000020D
	b _0234429C
_02344298:
	mov r4, r0
_0234429C:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_023442A4: .word 0x00000483
_023442A8: .word 0x00000467
_023442AC: .word 0x0000020F
_023442B0: .word DUNGEON_PTR
_023442B4: .word 0x0000020D
	arm_func_end GetMatchingMonsterId

	arm_func_start ov29_023442B8
ov29_023442B8: ; 0x023442B8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r2, r4
	mov r0, #0
	b _023442DC
_023442CC:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	add r2, r2, #2
	mov r0, r0, asr #0x10
_023442DC:
	ldrsh r1, [r2]
	cmp r1, #0
	bne _023442CC
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	mov r0, r5, lsl #1
	ldrsh r0, [r4, r0]
	cmp r0, #0
	moveq r0, #0x49
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _023443B0 ; =0x00000579
	cmp r0, r1
	ldmltia sp!, {r3, r4, r5, pc}
	add r1, r1, #3
	cmp r0, r1
	ldmgtia sp!, {r3, r4, r5, pc}
	bl sub_02056880
	bl GetActiveTeamMember
	mov r1, r5, lsl #1
	ldrsh r3, [r4, r1]
	ldr r2, _023443B0 ; =0x00000579
	mov r4, r0
	cmp r3, r2
	mov r1, #0
	bne _02344354
	ldrsh r0, [r4, #0xc]
	bl GetExclusiveItem
	mov r1, r0
	b _02344390
_02344354:
	add r0, r2, #1
	cmp r3, r0
	bne _02344374
	ldrsh r0, [r4, #0xc]
	mov r1, #1
	bl GetExclusiveItem
	mov r1, r0
	b _02344390
_02344374:
	add r0, r2, #2
	cmp r3, r0
	bne _02344390
	ldrsh r0, [r4, #0xc]
	mov r1, #2
	bl GetExclusiveItem
	mov r1, r0
_02344390:
	cmp r1, #0
	bne _023443A8
	ldrsh r0, [r4, #0xc]
	mov r1, #3
	bl GetExclusiveItem
	mov r1, r0
_023443A8:
	mov r0, r1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023443B0: .word 0x00000579
	arm_func_end ov29_023442B8

	arm_func_start GenerateItemExplicit
GenerateItemExplicit: ; 0x023443B4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r5, r2
	mov r4, r3
	bl GetItemCategoryVeneer
	cmp r0, #6
	bne _02344400
	cmp r5, #0
	mov r0, r7
	mov r1, r6
	ble _023443F8
	mov r2, #0
	bl InitStandardItem
	strh r5, [r7, #2]
	b _02344420
_023443F8:
	bl GenerateCleanItem
	b _02344420
_02344400:
	mov r0, r7
	mov r1, r6
	mov r2, #0
	bl InitStandardItem
	cmp r5, #0
	strgth r5, [r7, #2]
	movle r0, #0
	strleh r0, [r7, #2]
_02344420:
	ldrb r0, [r7]
	orr r0, r0, r4
	strb r0, [r7]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end GenerateItemExplicit

	arm_func_start GenerateAndSpawnItem
GenerateAndSpawnItem: ; 0x02344430
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	ldrb ip, [sp, #0x1c]
	mov r5, r0
	mov r4, r3
	strh r1, [sp]
	strh r2, [sp, #2]
	cmp ip, #0
	beq _0234448C
	bl IsItemInBag
	cmp r0, #0
	add r0, sp, #4
	beq _02344478
	ldr r3, [sp, #0x18]
	mov r2, r4
	mov r1, #0x49
	bl GenerateItemExplicit
	b _023444A0
_02344478:
	ldr r3, [sp, #0x18]
	mov r1, r5
	mov r2, r4
	bl GenerateItemExplicit
	b _023444A0
_0234448C:
	ldr r3, [sp, #0x18]
	add r0, sp, #4
	mov r1, r5
	mov r2, r4
	bl GenerateItemExplicit
_023444A0:
	add r0, sp, #0
	add r1, sp, #4
	mov r2, #1
	bl SpawnItem
	ldr r0, _023444D0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x3f00
#ifdef JAPAN
	ldrsh r1, [r0, #0x1e]
	add r1, r1, #1
	strh r1, [r0, #0x1e]
#else
	ldrsh r1, [r0, #0xc2]
	add r1, r1, #1
	strh r1, [r0, #0xc2]
#endif
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_023444D0: .word DUNGEON_PTR
	arm_func_end GenerateAndSpawnItem

	arm_func_start ov29_023444D4
ov29_023444D4: ; 0x023444D4
	stmdb sp!, {r3, lr}
	ldr r0, _02344508 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x7e
	add r0, r0, #0x700
	bl MemZero
	bl IsSecretBazaar
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl ov29_022F07D8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02344508: .word DUNGEON_PTR
	arm_func_end ov29_023444D4

	arm_func_start IsHiddenStairsFloor
IsHiddenStairsFloor: ; 0x0234450C
	stmdb sp!, {r3, lr}
	bl IsSecretBazaar
	cmp r0, #0
	bne _02344528
	bl IsSecretRoom
	cmp r0, #0
	beq _02344530
_02344528:
	mov r0, #1
	ldmia sp!, {r3, pc}
_02344530:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsHiddenStairsFloor

	arm_func_start IsSecretBazaarVeneer
IsSecretBazaarVeneer: ; 0x02344538
	ldr ip, _02344540 ; =IsSecretBazaar
	bx ip
	.align 2, 0
_02344540: .word IsSecretBazaar
	arm_func_end IsSecretBazaarVeneer

	arm_func_start ov29_02344544
ov29_02344544: ; 0x02344544
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__02344AF8
	cmp r0, #0
	beq _02344A58
	mov r0, r4
	bl EntityIsValid__02344AF8
	cmp r0, #0
	beq _02344A58
	ldr r6, [r4, #0xb4]
	mov r0, #1
	bl ov29_022EFB20
	mov r0, r5
	mov r1, r4
	mov r2, #1
	bl ov29_022F05B4
	ldrb r0, [r6, #0xbc]
	sub r0, r0, #0x10
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02344A34
_023445A0: ; jump table
	b _023445B4 ; case 0
	b _023445E0 ; case 1
	b _0234471C ; case 2
	b _0234485C ; case 3
	b _02344950 ; case 4
_023445B4:
	ldr r2, _02344A60 ; =ov29_0237CFFC
	mov r3, #0
	mov r0, r4
	mov r1, r5
	str r3, [r2]
	bl ov29_022F0654
	ldr r0, _02344A64 ; =0x00000F32
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_023445E0:
	ldr r2, _02344A60 ; =ov29_0237CFFC
	mov r3, #1
	mov r0, r4
	mov r1, r5
	str r3, [r2]
	bl ov29_022F0654
	ldr r0, _02344A68 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x77e]
	cmp r0, #0
	beq _02344620
	ldr r0, _02344A6C ; =0x00000F4C
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_02344620:
	mov r0, #0
	mov r1, #0x64
	bl ov29_0234B09C
	ldr r0, _02344A70 ; =0x00000F4A
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	ldr r1, _02344A74 ; =ov29_02353798
	ldr r0, _02344A78 ; =0x00000F4B
	ldr r3, [r1, #4]
	mov r1, r4
	mov r2, #0
	bl ov29_022F062C
	cmp r0, #0
	bne _02344670
	ldr r0, _02344A7C ; =0x00000F4D
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_02344670:
	bl GetMoneyCarried
	cmp r0, #0x64
	bge _02344690
	ldr r0, _02344A80 ; =0x00000F4E
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_02344690:
	mov r0, #0x64
	bl ov29_022F07BC
	ldr r0, _02344A84 ; =0x00000F4F
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	bl ov29_022F05E4
	mov r0, #4
	mov r1, #0x4000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl ov29_0234C738
	mov r0, #4
	mov r1, #0x4000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl ov29_0234C738
	mov r0, r4
	mov r1, #0
	ldr r2, _02344A88 ; =0x000001A7
	bl ov29_022F067C
	bl ov29_022F05E4
	ldr r0, _02344A8C ; =0x00000F51
	bl ov29_022F0780
	mov r3, #1
	ldr r1, _02344A68 ; =DUNGEON_PTR
#ifdef JAPAN
	ldr r0, _02345E54 ; =0x000008C7
#else
	mov r0, #0xf50
#endif
	ldr r2, [r1]
	mov r1, r4
	strb r3, [r2, #0x77e]
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_0234471C:
	ldr r2, _02344A60 ; =ov29_0237CFFC
	mov r3, #2
	mov r0, r4
	mov r1, r5
	str r3, [r2]
	bl ov29_022F0654
	mov r0, #0
	mov r1, #0x64
	bl ov29_0234B09C
	ldr r0, _02344A90 ; =0x00000F33
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	ldr r0, _02344A94 ; =0x00000F34
	mov r1, r4
	mov r2, #0
	ldr r3, _02344A74 ; =ov29_02353798
	ldr r3, [r3, #8]
	bl ov29_022F062C
	cmp r0, #0
	bne _02344784
	ldr r0, _02344A98 ; =0x00000F35
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_02344784:
	bl IsBagFull
	cmp r0, #0
	beq _023447A4
	ldr r0, _02344A9C ; =0x00000F37
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_023447A4:
	bl GetMoneyCarried
	cmp r0, #0x64
	bge _023447C4
	ldr r0, _02344AA0 ; =0x00000F36
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_023447C4:
	mov r0, #0x64
	bl ov29_022F07BC
	ldr r0, _02344AA4 ; =0x00000F38
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	bl ov29_022F05E4
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, #0x32
	movlt r6, #0x46
	blt _023447FC
	bl ov29_022E7BB8
	mov r6, r0
_023447FC:
	mov r1, r5
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r1, r6
	mov r0, #0
	bl ov29_02344B9C
	add r0, sp, #0
	mov r1, r6
	mov r2, #2
	bl GenerateStandardItem
	add r0, sp, #0
	bl ov29_02345004
	ldr r0, _02344AA8 ; =0x00000F3A
	bl ov29_022F0780
	ldr r0, _02344AAC ; =0x00000F3B
	bl ov29_022F0780
	ldr r0, _02344AB0 ; =0x00000F3C
	bl ov29_022F0780
#ifdef JAPAN
	mov r0, #0x8b0
#else
	ldr r0, _02344AB4 ; =0x00000F39
#endif
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_0234485C:
	ldr r2, _02344A60 ; =ov29_0237CFFC
	mov r3, #3
	mov r0, r4
	mov r1, r5
	str r3, [r2]
	bl ov29_022F0654
	mov r0, #0
	mov r1, #0x64
	bl ov29_0234B09C
	ldr r0, _02344AB8 ; =0x00000F54
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	ldr r0, _02344ABC ; =0x00000F55
	mov r1, r4
	mov r2, #0
	ldr r3, _02344A74 ; =ov29_02353798
	ldr r3, [r3, #0xc]
	bl ov29_022F062C
	cmp r0, #0
	bne _023448C4
	ldr r0, _02344AC0 ; =0x00000F56
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_023448C4:
	bl CountStickyItemsInBag
	cmp r0, #0
	bne _023448E4
	ldr r0, _02344AC4 ; =0x00000F58
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_023448E4:
	bl GetMoneyCarried
	cmp r0, #0x64
	bge _02344904
	ldr r0, _02344AC8 ; =0x00000F57
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_02344904:
	mov r0, #0x64
	bl ov29_022F07BC
#ifdef JAPAN
	mov r1, r4
	mov r0, #0x8d0
#else
	ldr r0, _02344ACC ; =0x00000F59
	mov r1, r4
#endif
	mov r2, #0
	bl ov29_022F0604
	bl ov29_022F05E4
	ldr r2, _02344AD0 ; =0x000001A6
	mov r0, r4
	mov r1, r5
	bl ov29_022F067C
	bl ov29_022F05E4
	ldr r0, _02344AD4 ; =0x00000F5D
	bl ov29_022F0780
	ldr r0, _02344AD8 ; =0x00000F5A
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_02344950:
	ldr r2, _02344A60 ; =ov29_0237CFFC
	mov r3, #4
	mov r0, r4
	mov r1, r5
	str r3, [r2]
	bl ov29_022F0654
	mov r0, #0
	mov r1, #0x64
	bl ov29_0234B09C
	ldr r0, _02344ADC ; =0x00000F3F
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
#ifdef JAPAN
	ldr r0, _02345EA0 ; =0x000008B7
#else
	mov r0, #0xf40
#endif
	mov r1, r4
	mov r2, #0
	ldr r3, _02344A74 ; =ov29_02353798
	ldr r3, [r3, #0x10]
	bl ov29_022F062C
	cmp r0, #0
	bne _023449B8
	ldr r0, _02344AE0 ; =0x00000F41
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_023449B8:
	bl GetMoneyCarried
	cmp r0, #0x64
	mov r2, #0
	bge _023449D8
	ldr r0, _02344AE4 ; =0x00000F42
	mov r1, r4
	bl ov29_022F0604
	b _02344A34
_023449D8:
	ldr r1, _02344A74 ; =ov29_02353798
	ldr r0, _02344AE8 ; =0x00000F43
	ldr r3, [r1, #0x14]
	mov r1, r4
	bl ov29_022F0618
	cmp r0, #0
	bne _02344A08
	ldr r0, _02344AEC ; =0x00000F44
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	b _02344A34
_02344A08:
	mov r0, #0x64
	bl ov29_022F07BC
	ldr r0, _02344AF0 ; =0x00000F45
	mov r1, r4
	mov r2, #0
	bl ov29_022F0604
	bl ov29_022F05E4
	ldr r2, _02344AF4 ; =0x000001A5
	mov r0, r4
	mov r1, r5
	bl ov29_022F067C
_02344A34:
	mov r0, #1
	bl ov29_0234B1A4
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl ov29_022F05B4
	mov r0, #0
	bl ov29_022EFB84
	bl ov29_022F0848
_02344A58:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_02344544_OFFSET -0x689
#else
#define OV29_02344544_OFFSET 0
#endif
_02344A60: .word ov29_0237CFFC
_02344A64: .word 0x00000F32 + OV29_02344544_OFFSET
_02344A68: .word DUNGEON_PTR
_02344A6C: .word 0x00000F4C + OV29_02344544_OFFSET
_02344A70: .word 0x00000F4A + OV29_02344544_OFFSET
_02344A74: .word ov29_02353798
_02344A78: .word 0x00000F4B + OV29_02344544_OFFSET
_02344A7C: .word 0x00000F4D + OV29_02344544_OFFSET
_02344A80: .word 0x00000F4E + OV29_02344544_OFFSET
_02344A84: .word 0x00000F4F + OV29_02344544_OFFSET
_02344A88: .word 0x000001A7
_02344A8C: .word 0x00000F51 + OV29_02344544_OFFSET
#ifdef JAPAN
_02345E54: .word 0x000008C7
#endif
_02344A90: .word 0x00000F33 + OV29_02344544_OFFSET
_02344A94: .word 0x00000F34 + OV29_02344544_OFFSET
_02344A98: .word 0x00000F35 + OV29_02344544_OFFSET
_02344A9C: .word 0x00000F37 + OV29_02344544_OFFSET
_02344AA0: .word 0x00000F36 + OV29_02344544_OFFSET
_02344AA4: .word 0x00000F38 + OV29_02344544_OFFSET
_02344AA8: .word 0x00000F3A + OV29_02344544_OFFSET
_02344AAC: .word 0x00000F3B + OV29_02344544_OFFSET
_02344AB0: .word 0x00000F3C + OV29_02344544_OFFSET
#ifndef JAPAN
_02344AB4: .word 0x00000F39
#endif
_02344AB8: .word 0x00000F54 + OV29_02344544_OFFSET
_02344ABC: .word 0x00000F55 + OV29_02344544_OFFSET
_02344AC0: .word 0x00000F56 + OV29_02344544_OFFSET
_02344AC4: .word 0x00000F58 + OV29_02344544_OFFSET
_02344AC8: .word 0x00000F57 + OV29_02344544_OFFSET
#ifndef JAPAN
_02344ACC: .word 0x00000F59
#endif
_02344AD0: .word 0x000001A6
_02344AD4: .word 0x00000F5D + OV29_02344544_OFFSET
_02344AD8: .word 0x00000F5A + OV29_02344544_OFFSET
_02344ADC: .word 0x00000F3F + OV29_02344544_OFFSET
#ifdef JAPAN
_02345EA0: .word 0x000008B7
#endif
_02344AE0: .word 0x00000F41 + OV29_02344544_OFFSET
_02344AE4: .word 0x00000F42 + OV29_02344544_OFFSET
_02344AE8: .word 0x00000F43 + OV29_02344544_OFFSET
_02344AEC: .word 0x00000F44 + OV29_02344544_OFFSET
_02344AF0: .word 0x00000F45 + OV29_02344544_OFFSET
_02344AF4: .word 0x000001A5
	arm_func_end ov29_02344544
