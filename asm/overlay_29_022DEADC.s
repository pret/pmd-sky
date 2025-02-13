	.include "asm/macros.inc"
	.include "overlay_29_022DEADC.inc"

	.text

	arm_func_start ov29_022DEADC
ov29_022DEADC: ; 0x022DEADC
	stmdb sp!, {r3, lr}
	mov r0, #0x20
	bl ov29_0234C654
	mov r0, #0
	mov r1, r0
	bl sub_020091B0
	mov r0, #1
	mov r1, #0
	bl sub_020091B0
	mov r0, #2
	mov r1, #0
	bl sub_02009194
	mov r0, #3
	mov r1, #0
	bl sub_02009194
	mov r0, #4
	mov r1, #0
	bl sub_020091B0
	mov r0, #1
	mov r1, #0x4000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl ov29_0234C738
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022DEADC

	arm_func_start ov29_022DEB40
ov29_022DEB40: ; 0x022DEB40
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0x4000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl ov29_0234C738
	mov r0, #1
	bl ov29_0234C654
	mov r0, #0
	mov r1, r0
	bl sub_020091B0
	mov r0, #1
	mov r1, #0
	bl sub_020091B0
	mov r0, #2
	mov r1, #0
	bl sub_020091B0
	mov r0, #3
	mov r1, #0
	bl sub_020091B0
	mov r0, #4
	mov r1, #0
	bl sub_020091B0
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022DEB40

	arm_func_start ov29_022DEBA4
ov29_022DEBA4: ; 0x022DEBA4
	ldr ip, _022DEBAC ; =ov29_022DEADC
	bx ip
	.align 2, 0
_022DEBAC: .word ov29_022DEADC
	arm_func_end ov29_022DEBA4

	arm_func_start ov29_022DEBB0
ov29_022DEBB0: ; 0x022DEBB0
	ldr ip, _022DEBB8 ; =ov29_022DEB40
	bx ip
	.align 2, 0
_022DEBB8: .word ov29_022DEB40
	arm_func_end ov29_022DEBB0

	arm_func_start ov29_022DEBBC
ov29_022DEBBC: ; 0x022DEBBC
#ifdef JAPAN
#define OV29_022DEBBC_OFFSET -0xA4
#else
#define OV29_022DEBBC_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetHiddenFloorField
	mov r4, r0
	mov r0, #0
	bl SetForcedLossReason
	ldr r3, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0
	ldr r2, [r3]
	sub r0, r1, #1
	strb r1, [r2, #5]
	ldr r2, [r3]
	mov ip, #1
	strb r1, [r2, #6]
	ldr r2, [r3]
	strb r1, [r2, #0xc]
	ldr r2, [r3]
	strb r1, [r2, #7]
	ldr r2, [r3]
	strb r1, [r2, #0xa]
	ldr r2, [r3]
	strb r1, [r2, #0x11]
	ldr r2, [r3]
	str r0, [r2, #0x614]
	ldr r2, [r3]
	strb r1, [r2, #0xb]
	ldr r2, [r3]
	add r2, r2, #0x100
	strh r0, [r2, #0xd8]
	ldr r2, [r3]
	add r2, r2, #0x100
	strh r0, [r2, #0xda]
	ldr r2, [r3]
	add r2, r2, #0x100
	strh r0, [r2, #0xdc]
	ldr r2, [r3]
	add r2, r2, #0x100
	strh r0, [r2, #0xde]
	ldr r0, [r3]
	strb r1, [r0, #0xd]
	ldr r0, [r3]
	strb ip, [r0, #0xf]
	ldr r0, [r3]
	strb r1, [r0, #0x10]
	ldr r0, [r3]
	ldrb r0, [r0, #0x748]
	bl IsIqEnabled
	ldr r1, _022DEF2C ; =DUNGEON_PTR
	ldr r2, [r1]
	strb r0, [r2, #0x12]
	ldr r0, [r1]
	ldrb r0, [r0, #0x748]
	bl IsTrapInvisibleWhenAttacking
	ldr r1, _022DEF2C ; =DUNGEON_PTR
	mov r2, #0
	ldr r3, [r1]
	strb r0, [r3, #0x13]
	ldr r0, [r1]
	add r0, r0, #0x2c000
	strb r2, [r0, #0xb10 + OV29_022DEBBC_OFFSET]
	ldr r0, [r1]
	strb r2, [r0, #8]
	ldr r0, [r1]
	str r2, [r0, #0x18]
	bl ov29_02349658
	cmp r5, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #0
	bl SetHiddenStairsField
	bl ov29_02349188
	ldr r2, _022DEF2C ; =DUNGEON_PTR
	mov r0, #0
	ldr r1, [r2]
	strb r0, [r1, #0x799]
	ldr r1, [r2]
	str r0, [r1, #0x7bc]
	ldr r1, [r2]
	str r0, [r1, #0x7c0]
	ldr r1, [r2]
	str r0, [r1, #0x7c4]
	ldr r1, [r2]
	add r1, r1, #0x700
	strh r0, [r1, #0x80]
	ldr r1, [r2]
	add r1, r1, #0x700
	strh r0, [r1, #0x82]
	ldr r1, [r2]
	strb r0, [r1, #0x790]
	ldr r1, [r2]
	strb r0, [r1, #0x791]
	bl ov29_022EAF34
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0
	ldr r2, [r0]
	ldr r5, _022DEF30 ; =0x000003E7
	strb r1, [r2, #0x78f]
	ldr r2, [r0]
	mov r3, #0x63
	strb r1, [r2, #0x78d]
	ldr r2, [r0]
	strb r1, [r2, #0x793]
	ldr r2, [r0]
	strb r1, [r2, #0x794]
	ldr r2, [r0]
	add r2, r2, #0x700
	strh r5, [r2, #0x96]
	ldr r2, [r0]
	add r2, r2, #0x700
	strh r3, [r2, #0xa4]
	ldr r2, [r0]
	add r2, r2, #0x700
	strh r3, [r2, #0xa6]
	ldr r2, [r0]
	add r2, r2, #0x700
	strh r1, [r2, #0x86]
	ldr r2, [r0]
	add r2, r2, #0xc000
	strb r1, [r2, #0xd38 + OV29_022DEBBC_OFFSET]
	ldr r3, [r0]
	add r1, r3, #0x28000
	ldrb r2, [r1, #0x6b4 + OV29_022DEBBC_OFFSET]
	add r1, r3, #0x4000
	strh r2, [r1, #0xd4 + OV29_022DEBBC_OFFSET]
	ldr r3, [r0]
	add r1, r3, #0x28000
	ldrb r2, [r1, #0x6b5 + OV29_022DEBBC_OFFSET]
	add r1, r3, #0x4000
	strh r2, [r1, #0xd6 + OV29_022DEBBC_OFFSET]
	ldr r3, [r0]
	add r1, r3, #0x28000
	ldrb r2, [r1, #0x6c4 + OV29_022DEBBC_OFFSET]
	add r1, r3, #0x4000
	strb r2, [r1, #0xda + OV29_022DEBBC_OFFSET]
	ldr r1, [r0]
	ldrb r0, [r1, #0x798]
	cmp r0, #1
	bhi _022DEEA4
	add r0, r1, #0x700
	ldrsh r0, [r0, #0x4c]
	bl GetDungeonMode
	sub r0, r0, #2
	cmp r0, #1
	bhi _022DEE38
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r2, [r0, #0xda + OV29_022DEBBC_OFFSET]
	cmp r2, #0
	ldrne r1, _022DEF34 ; =FIXED_ROOM_REVISIT_OVERRIDES
	ldrneb r1, [r1, r2]
	cmpne r1, #0
	strneb r1, [r0, #0xda + OV29_022DEBBC_OFFSET]
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r1, [r0, #0xd4 + OV29_022DEBBC_OFFSET]
	cmp r1, #0xb3
	moveq r1, #0xb7
	streqh r1, [r0, #0xd4 + OV29_022DEBBC_OFFSET]
_022DEE38:
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	cmp r0, #0x7d
	bne _022DEE78
	mov r0, #0
	mov r1, #0x10
	bl LoadScriptVariableValue
	cmp r0, #0
	beq _022DEEA4
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0x2a
	ldr r0, [r0]
	add r0, r0, #0x4000
	strb r1, [r0, #0xda + OV29_022DEBBC_OFFSET]
	b _022DEEA4
_022DEE78:
	cmp r0, #0x87
	bne _022DEEA4
	mov r0, #0
	mov r1, #0xf
	bl LoadScriptVariableValue
	cmp r0, #0
	ldrne r0, _022DEF2C ; =DUNGEON_PTR
	movne r1, #0x2b
	ldrne r0, [r0]
	addne r0, r0, #0x4000
	strneb r1, [r0, #0xda + OV29_022DEBBC_OFFSET]
_022DEEA4:
	bl FillMissionDestinationInfo
	cmp r4, #1
	bne _022DEF08
	ldr r1, _022DEF2C ; =DUNGEON_PTR
	mov r2, #0x70
	ldr r0, [r1]
	add r0, r0, #0x4000
	strb r2, [r0, #0xda + OV29_022DEBBC_OFFSET]
	ldr r0, [r1]
	ldrb r0, [r0, #0x748]
	bl DungeonGoesUp
	cmp r0, #0
	beq _022DEEF0
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0xc4
	ldr r0, [r0]
	add r0, r0, #0x4000
	strh r1, [r0, #0xd4 + OV29_022DEBBC_OFFSET]
	b _022DEF20
_022DEEF0:
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0xc5
	ldr r0, [r0]
	add r0, r0, #0x4000
	strh r1, [r0, #0xd4 + OV29_022DEBBC_OFFSET]
	b _022DEF20
_022DEF08:
	cmp r4, #2
	ldreq r0, _022DEF2C ; =DUNGEON_PTR
	moveq r1, #0x71
	ldreq r0, [r0]
	addeq r0, r0, #0x4000
	streqb r1, [r0, #0xda + OV29_022DEBBC_OFFSET]
_022DEF20:
	mov r0, #0
	bl SetHiddenFloorField
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022DEF2C: .word DUNGEON_PTR
_022DEF30: .word 0x000003E7
_022DEF34: .word FIXED_ROOM_REVISIT_OVERRIDES
	arm_func_end ov29_022DEBBC

	arm_func_start RunDungeon
RunDungeon: ; 0x022DEF38
#ifdef JAPAN
#define RUN_DUNGEON_OFFSET -0xA4
#else
#define RUN_DUNGEON_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xd0
	mov sl, r0
	ldrb r5, [sl, #4]
	mov r8, #0
	mov sb, r1
	str r8, [sp]
	cmp r5, #0
	moveq r0, #1
	movne r0, r8
	ldrsb r1, [sl, #0xe]
	ldrb r6, [sl, #0x11]
	ldrb fp, [sl, #0xf]
	ldrb r7, [sl, #0x10]
	and r0, r0, #0xff
	cmp r1, #1
	str r0, [sp, #4]
	mov r0, #0
	bne _022DEF90
	bl ov29_0234C5EC
	mov r8, #1
	b _022DEF94
_022DEF90:
	bl ov29_0234C584
_022DEF94:
	mov r0, #1
	bl ov29_0234C584
	mov r0, #2
	bl ov29_022DDE00
	ldr r0, _022DFF3C ; =ov29_023510C8
	mov r1, #0x3e0
	bl Debug_Print0
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	cmp r5, #0
	str sb, [r0]
	ldrb r1, [sl]
	strb r1, [sb, #0x748]
	ldrb r1, [sl, #1]
	strb r1, [sb, #0x749]
	bne _022DF0AC
	ldrsb r2, [sl, #0xd]
	ldr r1, [r0]
	strb r2, [r1, #0x798]
	ldr r2, [r0]
	ldr r1, [sl, #0x14]
	ldr r0, [sl, #0x18]
	str r1, [r2, #0x750]
	str r0, [r2, #0x754]
	ldrb r0, [sl]
	bl GetTurnLimit
	ldr r2, _022DFF40 ; =DUNGEON_PTR
	mov r3, #0
	ldr r1, [r2]
	add r1, r1, #0x700
	strh r0, [r1, #0x84]
	ldr r0, [r2]
	strb r3, [r0, #0x79a]
	ldrb r0, [sl]
	bl GetMaxRescueAttempts
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	ldr r2, [r1]
	strb r0, [r2, #0x79b]
	ldr r2, [sl, #0xac]
	ldr r0, [r1]
	str r2, [r0, #0x7cc]
	ldrb r2, [sl, #5]
	ldr r0, [r1]
	strb r2, [r0, #0x75c]
	ldrb r2, [sl, #8]
	ldr r0, [r1]
	strb r2, [r0, #0x75a]
	ldrb r2, [sl, #6]
	ldr r0, [r1]
	strb r2, [r0, #0x759]
	ldrb r2, [sl, #9]
	ldr r0, [r1]
	strb r2, [r0, #0x75b]
	ldrb r2, [sl, #0xa]
	ldr r0, [r1]
	strb r2, [r0, #0x75d]
	ldrb r2, [sl, #0xb]
	ldr r0, [r1]
	strb r2, [r0, #0x75e]
	ldrb r2, [sl, #0xc]
	ldr r0, [r1]
	strb r2, [r0, #0x75f]
	ldr r0, [r1]
	ldrsh r2, [sl, #2]
	add r0, r0, #0x700
	strh r2, [r0, #0x4c]
	ldrb r0, [sl, #7]
	cmp r0, #0
	ldrne r0, [r1]
	movne r1, #0
	strneb r1, [r0, #0x759]
_022DF0AC:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	strb r3, [r2, #0x7c8]
	ldr r2, [r0]
	strb r3, [r2, #0x7c9]
	ldr r0, [r0]
	strb r1, [r0, #0x75b]
	bl ov29_022DE904
	bl ov29_022F6E40
	bl ov29_022ED030
	bl LoadWeather3DFiles
	bl ov29_02338F10
	bl sub_02017B00
	mov r1, r5
	bl ov29_022EAF48
	bl AllocTopScreenStatus
	bl ov29_022E6F94
	bl ov29_022E1640
	bl ov29_023362EC
	bl OpenFixedBin
	bl ov29_022E9F18
	bl ov29_02338F68
	mov r0, #0
	bl ov29_02338F38
	mov r0, #1
	bl ov29_022E2B68
	bl ov29_0234AFA4
	bl ov29_0234BB10
	bl DungeonRngUnsetSecondary
	bl GetDungeonRngPreseed
	ldr r2, _022DFF40 ; =DUNGEON_PTR
	mov r1, #0x340
	ldr r3, [r2]
	mov r2, #0
	str r0, [r3, #0x7ac]
	mov r0, #0x200
	bl ov10_022BDAB0
	mov r0, #0
	bl ov10_022BDB54
	mov r0, #0
	bl sub_02051ED4
	mov r4, r0
	mov r0, #0
	mov r1, r0
	bl sub_02051DFC
	str r0, [sp, #8]
	mov r0, #0
	mov r1, r0
	mov r2, r0
	bl GetBgRegionArea
	ldr r1, [sp, #8]
	mov r2, r4
	mov r3, #0
	bl ov10_022BDB60
	mov r0, #1
	bl sub_02051ED4
	mov r4, r0
	mov r0, #0
	mov r1, #1
	bl sub_02051DFC
	str r0, [sp, #0xc]
	mov r0, #0
	mov r1, r0
	mov r2, #1
	bl GetBgRegionArea
	ldr r1, [sp, #0xc]
	mov r2, r4
	mov r3, #1
	bl ov10_022BDB60
	mov r0, #0xb000
	mov r1, #0xb
	bl ov10_022BDB80
	mov r0, #0x2000
	mov r1, #0xa
	bl ov10_022BDBA4
	bl ov29_022E0F6C
	bl ov29_022E8104
	bl ov29_022E7F7C
	bl ov29_022E1304
	bl ov29_022E6E40
	bl ov29_022FE4A8
	bl ov29_023480FC
	mov r0, #2
	bl ov29_022DDE00
	ldrsb r0, [sl, #0xe]
	cmp r0, #1
	beq _022DF214
	bl ov29_022DEADC
_022DF214:
	cmp r5, #0
	beq _022DF22C
	bl ov29_0234CB34
	bl ov29_0234CB54
	bl ov29_023365E8
#ifndef JAPAN
	bl ov29_02348850
#endif
_022DF22C:
	cmp r6, #0
	beq _022DF238
	bl ov29_022E0434
_022DF238:
	cmp r5, #0
	bne _022DF2D0
	add r0, sb, #0x1a000
	mov r2, #1
	strb r2, [r0, #0x23f + RUN_DUNGEON_OFFSET]
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	strb r2, [r0, #0x240 + RUN_DUNGEON_OFFSET]
	ldr r0, [r1]
	add r0, r0, #0x7d0
	bl ov29_0231B39C
	add r0, sb, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #2
	ldreqb r1, [sl, #0x14]
	moveq r0, #1
	streqb r1, [sb, #0x748]
	streqb r0, [sb, #0x749]
	ldrb r0, [sb, #0x748]
	bl ChangeGiratinaFormIfSkyDungeon
	bl ov29_022E081C
	add r0, sb, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #2
	ldreq r0, [sl, #0x18]
	streq r0, [sb, #0x7a0]
	beq _022DF2C4
	bl sub_02063504
	mov r4, r0
	bl Rand16Bit
	orr r0, r0, r4, lsl #16
	bl sub_020510E8
	bl sub_02051134
	bic r0, r0, #0xff000000
	str r0, [sb, #0x7a0]
	bl sub_020634F4
_022DF2C4:
	ldr r0, [sb, #0x7a0]
	bl SetDungeonRngPreseed23Bit
	b _022DF2D8
_022DF2D0:
	ldr r0, [sb, #0x7ac]
	bl SetDungeonRngPreseed
_022DF2D8:
	cmp r6, #0
	beq _022DF31C
	add r0, sb, #0x700
	ldrsb r1, [r0, #0x9b]
	mov r0, #0
	bl ov29_0234B09C
	add r0, sb, #0x700
	ldrsb r0, [r0, #0x9b]
	mov r2, #1
	cmp r0, #0
	mov r0, #0
	beq _022DF314
	ldr r1, _022DFF44 ; =0x00000B6B
	bl DisplayMessage2
	b _022DF31C
_022DF314:
	ldr r1, _022DFF48 ; =0x00000B6C
	bl DisplayMessage2
_022DF31C:
	cmp fp, #0
	beq _022DF3B0
	add r4, sl, #0x1c
	ldrb r0, [r4, #2]
	cmp r0, #0xfa
	bne _022DF364
	ldrb r0, [sb, #0x748]
	bl IsLevelResetDungeon
	cmp r0, #0
	beq _022DF34C
	mov r0, r4
	bl SetBaseStatsMovesGroundMonster
_022DF34C:
	mov r0, r4
	bl ov29_022F7910
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp]
	b _022DF3A4
_022DF364:
	mov r6, #0
	mov fp, #0x44
_022DF36C:
	ldrb r0, [sb, #0x748]
	bl IsLevelResetDungeon
	cmp r0, #0
	beq _022DF384
	smlabb r0, r6, fp, r4
	bl SetBaseStatsMovesGroundMonster
_022DF384:
	mov r0, #0x44
	smlabb r0, r6, r0, r4
	bl ov29_022F7BF4
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #2
	blt _022DF36C
_022DF3A4:
	cmp r5, #0
	beq _022DF3B0
	bl ov29_022FC9C0
_022DF3B0:
	cmp r5, #0
	addeq r0, sb, #0x700
	ldreqsb r0, [r0, #0x98]
	cmpeq r0, #2
	bne _022DF418
	add r0, sp, #0x10
	bl sub_0204F1B4
	cmp r0, #0
	beq _022DF418
	ldrsb r0, [sp, #0x10]
	bl sub_0205B77C
	ldrsb r0, [r0, #0xac]
	cmp r0, #0
	beq _022DF408
	add r1, r0, #1
	mov r0, #0
	bl ov29_0234B09C
	ldr r1, _022DFF4C ; =0x00000B6D
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _022DF418
_022DF408:
	ldr r1, _022DFF50 ; =0x00000B6E
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
_022DF418:
	ldrsb r0, [sl, #0xe]
	cmp r0, #1
	beq _022DF428
	bl ov29_022DEB40
_022DF428:
	mov r0, #2
	bl ov29_022DDE00
	mov r0, #0
	bl ov10_022BDBB0
	bl ov29_022F6EF4
	bl ov29_022E8104
	bl ov29_022E7F7C
	bl ov29_0234B04C
	bl ov29_0234BB2C
	bl ov29_022DE4FC
	cmp r5, #0
	bne _022DF460
	bl ov29_022DEA34
	bl ov29_022E1640
_022DF460:
	ldr r0, _022DFF54 ; =LEADER_PTR
	mov r1, #0
	str r1, [r0]
	bl GetHiddenFloorField
	mov r6, r0
	bl SetBothScreensWindowColorToDefault
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	mov r2, #0
	ldr r0, [r1]
	cmp r5, #0
	strb r2, [r0, #4]
	ldr r0, [r1]
	add r0, r0, #0x3000
	strb r2, [r0, #0xe28 + RUN_DUNGEON_OFFSET]
	bne _022DF4E4
	ldr r0, [r1]
	mov r1, #0xa
	add r0, r0, #0x700
	strh r1, [r0, #0x88]
	bl GetHiddenFloorField
	cmp r0, #0
	bne _022DF4E4
	bl GenerateDungeonRngSeed
	mov r4, r0
	bl GetDungeonRngPreseed
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	ldr r2, [r1]
	str r0, [r2, #0x7ac]
	ldr r0, [r1]
	str r4, [r0, #0x79c]
	ldr r0, [r1]
	ldr r0, [r0, #0x79c]
	bl InitDungeonRng
_022DF4E4:
	cmp r5, #0
	bne _022DF53C
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r0]
	mov r0, #4
	add r1, r1, #0x3000
	strb r2, [r1, #0xe38 + RUN_DUNGEON_OFFSET]
	bl DungeonRandInt
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	ldr r2, _022DFF58 ; =ov29_023510C0
	mov r3, r0, lsl #1
	ldr r0, [r1]
	ldrsh r3, [r2, r3]
#ifdef JAPAN
	add r0, r0, #0x3d00
	mov r2, #0
	strh r3, [r0, #0x96]
#else
	add r0, r0, #0x3e00
	mov r2, #0
	strh r3, [r0, #0x3a + RUN_DUNGEON_OFFSET]
#endif
	ldr r0, [r1]
	add r0, r0, #0x3000
	strb r2, [r0, #0xe39 + RUN_DUNGEON_OFFSET]
	ldr r0, [r1]
	strb r2, [r0, #0x78a]
_022DF53C:
	cmp r6, #0
	movne r1, #1
	moveq r1, #0
	ldr r2, _022DFF5C ; =ov29_022DEBBC
	mov r0, r5
	and r1, r1, #0xff
	bl LoadMappaFileAttributes
	mov r0, #0
	bl ov29_0234B4CC
	bl ov29_0234BB38
	cmp r5, #0
	bne _022DF574
	mov r0, #0
	bl ov29_02334DA8
_022DF574:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd4 + RUN_DUNGEON_OFFSET]
	bl ov29_023389C4
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd38 + RUN_DUNGEON_OFFSET]
	bl ov29_02338A4C
	bl ov29_022E8708
	bl ov29_022DD5B4
	bl ov29_023369F8
	bl ov29_022E7CFC
	bl ov29_022F7130
	cmp r5, #0
	bne _022DF5C4
	bl ov29_0231B460
	bl ov29_022F7104
	b _022DF5CC
_022DF5C4:
	bl ov29_022F7308
	bl ov29_022FBB1C
_022DF5CC:
	bl ov29_022FE2E4
	bl InitEnemySpawnStats
	cmp r5, #0
	bne _022DF5E4
	bl ov29_022EAD68
	bl ov29_022EF738
_022DF5E4:
	bl ov29_023365E8
	bl ov29_022E1550
	mov r0, #0
	bl ov29_02338F38
	mov r0, #4
	mov r1, #0
	bl ov29_022EA428
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, r5
	bl ov29_022E2B68
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda + RUN_DUNGEON_OFFSET]
	bl IsRoomIlluminated
	cmp r0, #0
	addne r0, sb, #0x1a000
	movne r1, #1
	strneb r1, [r0, #0x23f + RUN_DUNGEON_OFFSET]
	strneb r1, [r0, #0x240 + RUN_DUNGEON_OFFSET]
	bl IsSecretBazaarVeneer
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda + RUN_DUNGEON_OFFSET]
	bl IsBossFight
	cmp r0, #0
	bne _022DF660
	mov r0, #0x3c
	bl DisplayFloorCard
_022DF660:
	bl ov29_022E12F8
	cmp r5, #0
	bne _022DF68C
	bl ov29_0233845C
	bl GenerateFloor
	ldrb r0, [sb, #0x748]
	bl GetTurnLimit
	add r1, sb, #0x700
	strh r0, [r1, #0x84]
	mov r0, #0
	strb r0, [sb, #0x79a]
_022DF68C:
	bl ov29_0233785C
	bl DetermineAllTilesWalkableNeighbors
	bl ov29_02336460
	cmp r5, #0
	bne _022DF6C0
	ldr r0, [sp, #4]
	bl SpawnTeam
	mov r0, #0
	str r0, [sp, #4]
	bl SpawnShopkeepers
	bl SpawnInitialMonsters
	bl ResetGravity
	b _022DF6F8
_022DF6C0:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrb r0, [r0, #0x245 + RUN_DUNGEON_OFFSET]
	cmp r0, #0
	beq _022DF6F4
	bl GetLeader
	cmp r0, #0
	ldrne r0, _022DFF40 ; =DUNGEON_PTR
	movne r1, #1
	ldrne r0, [r0]
	addne r0, r0, #0x2c000
	strneb r1, [r0, #0xb10 + RUN_DUNGEON_OFFSET]
_022DF6F4:
	bl ov29_022FCD04
_022DF6F8:
	bl ov29_0231AFB4
	add r0, sb, #0x19000
	mov r1, #0
	str r1, [r0, #0x904 + RUN_DUNGEON_OFFSET]
	str r1, [r0, #0x90c + RUN_DUNGEON_OFFSET]
	str r1, [r0, #0x908 + RUN_DUNGEON_OFFSET]
	str r1, [r0, #0x910 + RUN_DUNGEON_OFFSET]
	cmp r5, #0
	bne _022DF74C
	bl ov29_022ED888
	bl ov29_0233873C
	bl ov29_02344C4C
	bl TrySpawnDoughSeedPoke
	ldr r1, [sb, #0x7bc]
	mov r0, #0
	str r1, [sb, #0x7c4]
	str r0, [sb, #0x7c0]
	bl ov29_02343980
	bl ov29_0233781C
	bl ClearHiddenStairs
	b _022DF750
_022DF74C:
	bl ReevaluateSnatchMonster
_022DF750:
	bl ov29_022F7EAC
	bl ov29_0233665C
	bl UpdateTrapsVisibility
	cmp r5, #0
	bne _022DF778
	mov r1, #0
	mov r2, r1
	mov r0, #1
	bl ov29_022FA2F0
	b _022DF780
_022DF778:
	bl DetermineAllMonsterShadow
	bl ov29_022FA524
_022DF780:
	mov r0, #1
	bl ov29_022E3A58
	cmp r5, #0
	bne _022DF798
	bl ov29_022EF8A4
	bl ov29_022FA418
_022DF798:
	ldr r0, _022DFF60 ; =ov29_02353563
	mov r1, #1
	strb r1, [r0]
	cmp r5, #0
	beq _022DF7B4
	bl ov29_023350FC
	bl ov29_022FA750
_022DF7B4:
	bl CountItemsOnFloorForAcuteSniffer
	mov r0, r5
	bl ov29_0233904C
	mov r0, #1
	mov r1, #0
	bl ov29_022EA428
	mov r0, #1
	bl ov29_0233A15C
	bl sub_0204AEA0
	cmp r0, #3
	bne _022DF7EC
	mov r0, #1
	bl ov29_0233A1BC
	bl UpdateMinimap
_022DF7EC:
	mov r0, #0
	bl ov29_022E34B0
	mov r0, #0
	mov r1, r0
	bl ov29_022EA3F8
	bl ov29_022E0DFC
	cmp r8, #0
	mov r1, #0x1000
	mov r2, #0
	beq _022DF824
	mov r0, #4
	bl StartFadeDungeonWrapper
	mov r8, #0
	b _022DF82C
_022DF824:
	mov r0, #1
	bl StartFadeDungeonWrapper
_022DF82C:
	mov r0, #1
	mov r2, r0
	mov r1, #0x1000
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl ov29_0234C738
	bl ov29_022E0E44
	mov r0, #1
	bl ov29_022E8BFC
	mov r0, #1
	bl ov29_022EA418
	mov r0, #0
	bl ov29_02339FD0
	mov r0, #0
	mov r1, r0
	bl ov29_0233A0E8
	mov r0, #0
	bl ov29_02338F48
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	ldr r0, [sp]
	mov r1, #0
	str r1, [sb, #0xc4]
	strb r1, [sb, #0x78b]
	cmp r0, #0
	strb r1, [sb, #0x78c]
	mov r0, #0x63
	strh r0, [sb, #0x1c]
	mov r2, #1
	ldr r0, _022DFF54 ; =LEADER_PTR
	strb r2, [sb, #4]
	str r1, [r0]
	beq _022DF8E4
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	mov r0, #4
	ldr r1, [r1]
	strb r2, [r1, #8]
	bl SetForcedLossReason
	ldrsh r1, [sl, #0x20]
	mov r0, #0
	bl ov29_0234B06C
	ldr r1, _022DFF64 ; =0x00000B73
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
_022DF8E4:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	cmp r5, #0
	strb r1, [r0, #9]
	beq _022DF90C
	bl TryActivateArtificialWeatherAbilities
	mov r0, #1
	bl ov29_022F62CC
	b _022DF9B0
_022DF90C:
	bl DisplayFloorTip
	bl ov29_022EF9B8
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #8]
	cmp r0, #0
	ldreqb r0, [r1, #6]
	cmpeq r0, #0
	movne r0, #1
	strneb r0, [r1, #9]
	bne _022DF944
	bl GetLeader
	bl ov29_022E2DFC
	bl UpdateMinimap
_022DF944:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	bne _022DF974
	bl ov29_02334D58
	mov r0, #0
	bl GetApparentWeather
	cmp r0, #0
	beq _022DF974
	mov r0, #1
	bl ov29_02335044
_022DF974:
	mov r0, #1
	bl ov29_022FACBC
	mov r0, #0
	bl ov29_022FAA58
	bl TryActivateIqBooster
	mov r0, #0
	bl ov29_022FAF08
	bl TryActivateSlowStart
	bl ov29_02349C84
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	cmp r0, #0xa4
	bne _022DF9B0
	bl TryInflictBurnStatusWholeTeam
_022DF9B0:
	cmp r7, #0
	beq _022DFA78
	bl GetLeader
	movs r4, r0
	beq _022DFA78
	mov r0, #8
	bl DungeonRandInt
	and r0, r0, #0xff
	and r3, r0, #7
	ldr r0, _022DFF68 ; =DIRECTIONS_XY
	mov r1, r3, lsl #2
	ldrsh r2, [r0, r1]
	add r0, r0, r3, lsl #2
	ldrsh r3, [r4, #4]
	ldrsh r0, [r0, #2]
	ldrsh r1, [r4, #6]
	add r2, r3, r2
	strh r2, [sp, #0x12]
	mov r2, #0
	add r0, r1, r0
	strh r0, [sp, #0x14]
	ldrh r1, [sp, #0x14]
	ldrh r0, [sp, #0x12]
	strb r2, [sp, #0x3c]
	strb r2, [sp, #0x3a]
	add r2, sl, #0xa4
	str r2, [sp, #0xcc]
	mov r2, #3
	str r2, [sp, #0x18]
	mov r2, #1
	strb r2, [sp, #0x38]
	strh r1, [sp, #0x1e]
	strh r0, [sp, #0x1c]
	ldrsh r2, [sp, #0x12]
	mov r0, #0x18
	ldrsh r1, [sp, #0x14]
	smulbb r2, r2, r0
	smulbb r0, r1, r0
	add r1, r2, #4
	add r2, r0, #4
	add r0, sp, #0x18
	mov r1, r1, lsl #8
	mov r2, r2, lsl #8
	bl SetEntityPixelPosXY
	mov r3, #0
	mov r0, r4
	add r1, sp, #0x18
	add r2, sl, #0xa4
	strh r3, [sp, #0x3e]
	bl ov29_02345D84
_022DFA78:
	mov r0, #0
	bl ov29_022EA418
	mov r0, #1
	bl ov29_02338F48
	mov r0, #1
	bl ov29_02339F88
	bl UpdateMinimap
	cmp r5, #0
	bne _022DFAA4
	mov r0, #0
	bl ov29_022FAD4C
_022DFAA4:
	mov r7, #0
	cmp r5, #0
	movne r5, r7
	bne _022DFAD4
	bl ov29_022E5F20
	bl GetLeader
	add r1, sb, #0x4000
	ldrb r1, [r1, #0xc4 + RUN_DUNGEON_OFFSET]
	bl ov29_02305814
	mov r0, #1
	mov r1, r7
	bl TryActivateWeather
_022DFAD4:
#ifdef JAPAN
	mov r0, #0x14000
#else
	mov r0, #0x10c00
#endif
	bl ov10_022BFE6C
	bl sub_02001808
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	bne _022DFB2C
	mov r4, #1
	mov r2, #0
	mov r0, r4
	strb r2, [sb, #0x758]
	add r1, sb, #0x1a000
	strb r2, [r1, #0x24d + RUN_DUNGEON_OFFSET]
	bl SetMinimapDataE447
	mov r6, #0
_022DFB14:
	mov r0, r4
	bl RunFractionalTurn
	mov r4, r6
	bl IsFloorOver
	cmp r0, #0
	beq _022DFB14
_022DFB2C:
	mov r0, #0
	bl ov29_0234B010
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, #0
	bl ov29_022E8BFC
	bl GetLeader
	bl EntityIsValid__022E0354
	cmp r0, #0
	beq _022DFB5C
	bl GetLeader
	bl EnemyEvolution
_022DFB5C:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x758]
	cmp r0, #1
	beq _022DFB8C
	mov r0, #1
	bl TryForcedLoss
	cmp r0, #0
	ldrne r0, _022DFF40 ; =DUNGEON_PTR
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0x758]
_022DFB8C:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x758]
	cmp r0, #1
	beq _022DFBAC
	ldr r0, [r1, #0x18]
	cmp r0, #0
	beq _022DFBC4
_022DFBAC:
	ldrb r0, [r1, #0xa]
	cmp r0, #0
	ldreqb r0, [r1, #0x75f]
	cmpeq r0, #0
	bne _022DFBC4
	bl ov29_022FA648
_022DFBC4:
	bl GetLeader
	bl EntityIsValid__022E0354
	cmp r0, #0
	beq _022DFBE4
	mov r0, #0x4f
	bl ov29_0234BA18
	mov r0, #0x4f
	bl ov29_0234BA54
_022DFBE4:
	mov r0, #0
	bl ov29_02338F38
	mov r0, #1
	mov r1, #0
	bl ov29_022EA428
	mov r0, #0
	bl SetMinimapDataE447
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	mov r2, #1
	ldr r1, [r0]
	mov r0, #4
	add r1, r1, #0x1a000
	strb r2, [r1, #0x24d + RUN_DUNGEON_OFFSET]
	mov r1, #0x4f
	bl ov29_022EA370
	bl ov29_022E9FC0
	cmp r0, #0
	beq _022DFC30
	bl FadeToBlack
_022DFC30:
	mov r0, #2
	mov r1, #0
	bl sub_020091B0
	mov r0, #3
	mov r1, #0
	bl sub_020091B0
	bl GetForcedLossReason
	cmp r0, #2
	beq _022DFC60
	bl GetForcedLossReason
	cmp r0, #3
	bne _022DFDB0
_022DFC60:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _022DFDB0
	bl GetLeader
	mov r4, r0
	mov r0, #0
	bl ov29_0233A248
	mov r0, #1
	bl ov29_023359F8
	mov r0, #0x20
	bl ov29_0234C654
	mov r0, #0
	mov r1, r0
	bl sub_020091B0
	mov r0, #1
	mov r1, #0
	bl sub_020091B0
	mov r0, #2
	mov r1, #0
	bl sub_02009194
	mov r0, #3
	mov r1, #0
	bl sub_02009194
	mov r0, #4
	mov r1, #0
	bl sub_02009194
	mov r0, #1
	mov r1, #0x4000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl ov29_0234C738
	mov r0, #0
#ifdef JAPAN
	mov r1, #0x880
#else
	ldr r1, _022DFF6C ; =0x00000B6F
#endif
	mov r2, #1
	bl DisplayMessage
	mov r0, #2
	mov r1, #0x4000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl ov29_0234C738
	mov r0, #1
	bl ov29_0234C654
	mov r0, #0
	bl ov29_023359F8
	mov r0, #0
	mov r1, r0
	bl sub_020091B0
	mov r0, #1
	mov r1, #0
	bl sub_020091B0
	mov r0, #2
	mov r1, #0
	bl sub_020091B0
	mov r0, #3
	mov r1, #0
	bl sub_020091B0
	mov r0, #4
	mov r1, #0
	bl sub_020091B0
	mov r1, #0
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	strb r1, [r0, #0xa]
	bl GetForcedLossReason
	cmp r0, #3
	bne _022DFD9C
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	ldr r0, _022DFF70 ; =0x00000266
	ldr r2, [r1]
	mov r1, r4
	add r3, r2, #0x248
	mov r2, r4
	add r3, r3, #0x400
	bl ov29_022ECDE4
	b _022DFDB0
_022DFD9C:
	ldr r0, _022DFF74 ; =0x00000261
	mov r1, r4
	mov r2, r4
	mov r3, #0
	bl ov29_022ECDE4
_022DFDB0:
	bl UpdateShouldBoostKecleonShopSpawnChance
	bl UpdateShouldBoostHiddenStairsSpawnChance
	bl DeleteAllMonsterSpriteFiles
	bl ov29_023365B8
	bl ov29_022DD7AC
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, _022DFF60 ; =ov29_02353563
	mov r3, #0
	ldr r2, [r0]
	strb r3, [r1]
	ldrb r0, [r2, #7]
	cmp r0, #0
	beq _022DFE0C
	bl ov29_0234CA84
	mov r1, #3
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	str r1, [sl, #0xb0]
	ldr r1, [r0]
	ldrb r0, [r1, #0x748]
	strb r0, [sl, #0xb4]
	ldrb r0, [r1, #0x749]
	strb r0, [sl, #0xb5]
	b _022E026C
_022DFE0C:
	ldrb r0, [r2, #0xa]
	cmp r0, #0
	beq _022DFE1C
	bl ov29_0234CA84
_022DFE1C:
	bl ov29_022FDFA4
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _022DFE3C
	mov r0, #2
	bl ov29_023469E0
_022DFE3C:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x758]
	cmp r0, #1
	bne _022DFE64
	ldrb r0, [r1, #0x790]
	cmp r0, #0
	beq _022E00EC
	bl ov29_02346A64
	b _022E00EC
_022DFE64:
	ldr r0, [r1, #0x18]
	mov r1, #0
	cmp r0, #1
	bne _022DFE94
	bl GetLeader
	mov r2, r0
	mov r1, #0
	ldr r0, _022DFF78 ; =0x00000279
	mov r3, r1
	bl ov29_022ECDE4
	mov r1, #1
	b _022DFF8C
_022DFE94:
	cmp r0, #2
	bne _022DFED4
	bl GetLeader
	mov r1, #0
	mov r2, r0
	mov r3, r1
	mov r0, #0x27c
	bl ov29_022ECDE4
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	beq _022DFECC
	bl IncrementNbSteals
_022DFECC:
	mov r1, #1
	b _022DFF8C
_022DFED4:
	cmp r0, #3
	bne _022DFF14
	bl GetLeader
	mov r2, r0
	mov r1, #0
	ldr r0, _022DFF7C ; =0x0000027D
	mov r3, r1
	bl ov29_022ECDE4
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	beq _022DFF0C
	bl IncrementNbSteals
_022DFF0C:
	mov r1, #1
	b _022DFF8C
_022DFF14:
	cmp r0, #4
	bne _022DFF84
	bl GetLeader
	mov r2, r0
	mov r1, #0
	ldr r0, _022DFF80 ; =0x0000027A
	mov r3, r1
	bl ov29_022ECDE4
	mov r1, #1
	b _022DFF8C
	.align 2, 0
#ifdef JAPAN
#define RUN_DUNGEON_DATA_OFFSET -0x2EF
#else
#define RUN_DUNGEON_DATA_OFFSET 0
#endif
_022DFF3C: .word ov29_023510C8
_022DFF40: .word DUNGEON_PTR
_022DFF44: .word 0x00000B6B + RUN_DUNGEON_DATA_OFFSET
_022DFF48: .word 0x00000B6C + RUN_DUNGEON_DATA_OFFSET
_022DFF4C: .word 0x00000B6D + RUN_DUNGEON_DATA_OFFSET
_022DFF50: .word 0x00000B6E + RUN_DUNGEON_DATA_OFFSET
_022DFF54: .word LEADER_PTR
_022DFF58: .word ov29_023510C0
_022DFF5C: .word ov29_022DEBBC
_022DFF60: .word ov29_02353563
_022DFF64: .word 0x00000B73 + RUN_DUNGEON_DATA_OFFSET
_022DFF68: .word DIRECTIONS_XY
#ifndef JAPAN
_022DFF6C: .word 0x00000B6F
#endif
_022DFF70: .word 0x00000266
_022DFF74: .word 0x00000261
_022DFF78: .word 0x00000279
_022DFF7C: .word 0x0000027D
_022DFF80: .word 0x0000027A
_022DFF84:
	cmp r0, #5
	moveq r1, #1
_022DFF8C:
	cmp r1, #0
	bne _022E00EC
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #2
	bne _022DFFFC
	bl GetFloorType
	cmp r0, #2
	ldreq r0, _022DFF40 ; =DUNGEON_PTR
	ldreq r0, [r0]
	ldreqb r0, [r0, #0x758]
	cmpeq r0, #2
	bne _022DFFFC
	bl GetLeader
	mov r2, r0
	mov r1, #0
	ldr r0, _022E034C ; =0x0000027B
	mov r3, r1
	bl ov29_022ECDE4
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	beq _022E00EC
	bl IncrementNbSteals
	b _022E00EC
_022DFFFC:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	beq _022E0014
	bl IncrementNbSteals
_022E0014:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r4, [r0]
	add r0, r4, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #3
	bne _022E005C
	ldrb r0, [r4, #0x748]
	bl GetMaxReachedFloor
	ldrb r1, [r4, #0x749]
	cmp r0, r1
	bhi _022E005C
	bl GetLeader
	mov r2, r0
	mov r1, #0
	ldr r0, _022DFF80 ; =0x0000027A
	mov r3, r1
	bl ov29_022ECDE4
	b _022E00EC
_022E005C:
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	ldrb r0, [r4, #0x748]
	ldr r4, [r1]
	bl GetMaxReachedFloor
	ldrb r1, [r4, #0x749]
	cmp r1, r0
	bls _022E008C
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x748]
	ldrb r1, [r1, #0x749]
	bl SetMaxReachedFloor
_022E008C:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0x2c000
	ldrb r1, [r1, #0x749]
	ldrb r0, [r0, #0xaf4 + RUN_DUNGEON_OFFSET]
	add r1, r1, #1
	cmp r1, r0
	blt _022E00C8
	bl GetLeader
	mov r2, r0
	mov r1, #0
	ldr r0, _022DFF80 ; =0x0000027A
	mov r3, r1
	bl ov29_022ECDE4
	b _022E00EC
_022E00C8:
	bl GetHiddenFloorField
	cmp r0, #0
	bne _022DF428
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x749]
	add r0, r0, #1
	strb r0, [r1, #0x749]
	b _022DF428
_022E00EC:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, _022DFF60 ; =ov29_02353563
	mov r2, #0
	ldr r0, [r0]
	strb r2, [r1]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _022E0150
	add r0, sl, #0xc0
	bl ov29_022ECFB8
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	mov r0, #0
	ldr r1, [r1]
	strb r0, [r1, #0x791]
	bl ov29_022EAF34
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	mov r3, #0
	ldr r0, [r1]
	ldr r2, _022E0350 ; =0x000003E7
	strb r3, [r0, #0x794]
	ldr r0, [r1]
	add r0, r0, #0x700
	strh r2, [r0, #0x96]
	ldr r0, [r1]
	strb r3, [r0, #0x7c9]
_022E0150:
	cmp sl, #0
	beq _022E026C
	bl IsDungeonEndReasonFailure
	cmp r0, #0
	beq _022E01D8
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _022E01C8
	mvn r2, #1
	add r0, sl, #0xb8
	mov r1, #8
	str r2, [sl, #0xb0]
	bl MemZero
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r2, [r0]
	ldrb r1, [r2, #0x748]
	strb r1, [sl, #0xb4]
	ldrb r1, [r2, #0x749]
	strb r1, [sl, #0xb5]
	ldr r2, [r0]
	ldrb r1, [r2, #0x748]
	strb r1, [sl, #0xb8]
	ldrb r1, [r2, #0x749]
	strb r1, [sl, #0xb9]
	ldr r0, [r0]
	ldr r0, [r0, #0x7a0]
	str r0, [sl, #0xbc]
	b _022E026C
_022E01C8:
	mvn r0, #0
	str r0, [sl, #0xb0]
	bl ov29_023488C8
	b _022E026C
_022E01D8:
	bl ov29_022ECF78
	cmp r0, #0
	beq _022E0244
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #2
	moveq r0, #4
	streq r0, [sl, #0xb0]
	beq _022E026C
	cmp r0, #3
	moveq r0, #1
	streq r0, [sl, #0xb0]
	beq _022E026C
	cmp r0, #0
	bne _022E022C
	mov r0, #1
	str r0, [sl, #0xb0]
	bl ov29_02348894
	b _022E026C
_022E022C:
	bl ov29_02348918
	bl ov29_02348994
	mov r0, #1
	str r0, [sl, #0xb0]
	bl ov29_02348894
	b _022E026C
_022E0244:
	mov r1, #2
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	str r1, [sl, #0xb0]
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #1
	bne _022E0268
	bl ov29_02348994
_022E0268:
	bl ov29_02348894
_022E026C:
	bl SetBothScreensWindowColorToDefault
	mov r0, #0x14
	bl ov29_022EAEAC
	mov r0, #0x14
	bl ov29_022DDE00
	bl ov29_022E15C8
	bl ov29_022E1604
	bl ov29_02338FC8
	cmp sl, #0
	beq _022E030C
	ldr r1, [sl, #0xb0]
	mvn r0, #1
	cmp r1, r0
	cmpne r1, #3
	beq _022E02B4
	bl sub_02057E90
	mvn r0, #0
	bl sub_02058644
_022E02B4:
	ldr r1, [sl, #0xb0]
	cmp r1, #1
	cmpne r1, #4
	cmpne r1, #2
	bne _022E02D4
	bl ov29_02346DA4
	bl RefillTeam
	b _022E02EC
_022E02D4:
	mvn r0, #0
	cmp r1, r0
	bne _022E02EC
	bl ov29_02346E48
	bl ov29_022F7E34
	bl sub_02057EF4
_022E02EC:
	ldr r0, [sl, #0xb0]
	cmp r0, #1
	cmpne r0, #4
	cmpne r0, #2
	moveq r0, #1
	streqb r0, [sl, #0x1a8]
	movne r0, #0
	strneb r0, [sl, #0x1a8]
_022E030C:
	bl ov10_022BDC0C
	bl FreeTopScreenStatus
	bl ov29_0234AFD0
	bl ov29_0234BB20
	bl ov29_02338D30
	bl ov29_022ED0B0
	bl ov29_022DE930
	bl FreeLoadedAttackSpriteAndMore
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	mov r1, #0
	str r1, [r0]
	bl ov29_022DE15C
	bl CloseFixedBin
	mov r0, #1
	add sp, sp, #0xd0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E034C: .word 0x0000027B
_022E0350: .word 0x000003E7
	arm_func_end RunDungeon
