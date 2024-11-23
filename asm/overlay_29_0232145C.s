	.include "asm/macros.inc"
	.include "overlay_29_0232145C.inc"

	.text

	arm_func_start ov29_0232145C
ov29_0232145C: ; 0x0232145C
#ifdef JAPAN
#define OV29_0232145C_OFFSET -4
#else
#define OV29_0232145C_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	mov sb, r1
	mov sl, r0
	cmp sb, #4
	str r2, [sp, #8]
	mov r8, r3
	mov r4, sb
	ldr r7, [sp, #0x58]
	ldr r5, [sl, #0xb4]
	movge r0, #0
	bge _02321A40
	bl ov29_022FBAB4
	mov r0, #0
	strb r0, [r5, #0x163 + OV29_0232145C_OFFSET]
	ldrb r1, [r5, #0xd0]
	cmp r1, #1
	bne _023214C4
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02321A48 ; =0x00000E7C
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0
	b _02321A40
_023214C4:
	cmp r1, #7
	bne _023214EC
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02321A4C ; =0x00000E7D
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0
	b _02321A40
_023214EC:
	ldrb r1, [r5, #0xbf]
	cmp r1, #4
	bne _02321518
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02321A50 ; =0x00000E78
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0
	b _02321A40
_02321518:
	ldr r1, _02321A54 ; =ov29_0237CA68
	mov r2, r0
	strb r0, [r1]
	str r0, [r1, #0x18]
	strb r0, [r1, #4]
_0232152C:
	add r1, r5, r0, lsl #1
	add r1, r1, #0x100
	add r0, r0, #1
	strh r2, [r1, #0x94 + OV29_0232145C_OFFSET]
	cmp r0, #4
	blt _0232152C
	mov r1, r2
	b _02321570
_0232154C:
	add r4, r4, #1
	cmp r4, #4
	add r2, r2, #1
	bge _02321578
	add r0, r5, r4, lsl #3
	ldrb r0, [r0, #0x124 + OV29_0232145C_OFFSET]
	tst r0, #2
	beq _02321578
	add r1, r1, #1
_02321570:
	cmp r1, #4
	blt _0232154C
_02321578:
	cmp r2, #2
	movge r6, #1
	movlt r6, #0
_02321584:
	add r1, r5, #0x124 + OV29_0232145C_OFFSET
	mov r0, sl
	add r4, r1, sb, lsl #3
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02321888
	bl IsFloorOver
	cmp r0, #0
	bne _02321888
	bl AreLateGameTrapsEnabledWrapper
	cmp r0, #0
	bne _023215D8
	ldrh r0, [r4, #4]
	bl IsTrappingMove
	cmp r0, #0
	beq _023215D8
#ifdef JAPAN
	mov r0, sl
	mov r1, #0xbc0
#else
	ldr r1, _02321A58 ; =0x00000E7E
	mov r0, sl
#endif
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0
	b _02321A40
_023215D8:
	ldrh r0, [r4, #4]
	cmp r0, #0x19
	cmpne r0, #0xe3
	mov r0, sl
	bne _02321610
	bl IsMonsterSleeping
	cmp r0, #0
	bne _02321620
	mov r0, sl
	mov r1, #1
	bl ov29_02300DCC
	cmp r0, #0
	bne _02321888
	b _02321620
_02321610:
	mov r1, #0
	bl ov29_02300DCC
	cmp r0, #0
	bne _02321888
_02321620:
	ldr r0, _02321A54 ; =ov29_0237CA68
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _02321888
	ldrb r0, [r4]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02321848
	mov r2, #1
	str r2, [sp, #0x18]
	mov r2, #0
	mov r0, sl
	mov r1, r4
	str r2, [sp, #0x14]
	bl IsChargingTwoTurnMove
	ldrb r1, [r4, #6]
	mov fp, r0
	cmp r1, #0
	beq _02321684
	cmp fp, #0
	moveq r0, #1
	streq r0, [sp, #0x14]
	b _023216AC
_02321684:
	cmp fp, #0
	bne _023216AC
	ldrh r1, [r4, #4]
	mov r0, #0
	bl ov29_0234B084
	ldr r1, _02321A5C ; =0x00000E7F
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0
	str r0, [sp, #0x18]
_023216AC:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _02321848
	ldr r1, _02321A54 ; =ov29_0237CA68
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r1, #0x18]
	strb fp, [r5, #0x163 + OV29_0232145C_OFFSET]
	ldrh r1, [r4, #4]
	str r0, [sp, #0xc]
	cmp r1, #0xe5
	bne _0232179C
	mov r0, sl
	mov r1, r4
	mov r2, #1
	bl CanMonsterUseMove
	cmp r0, #0
	beq _02321764
	add r2, sp, #0x2c
	mov r3, r4
	mov r1, #4
_02321700:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _02321700
	mov r0, sl
	bl ov29_02324698
	strh r0, [sp, #0x30]
	bl ov29_0234B034
	mov r1, #0
	add r2, sp, #0x2c
	mov r3, r1
	bl FormatMoveStringMore
#ifdef JAPAN
	ldr r1, _02322F08 ; =0x00000BC2
	mov r0, sl
#else
	mov r0, sl
	mov r1, #0xe80
#endif
	bl LogMessageByIdWithPopupCheckUser
	str r6, [sp]
	add r1, sp, #0x2c
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	mov r0, sl
	mov r2, r8
	mov r3, r7
	bl ov29_02322374
	str r0, [sp, #0x10]
	b _0232177C
_02321764:
	ldr r1, _02321A60 ; =0x00000E81
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	ldr r1, _02321A64 ; =0x00000E79
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_0232177C:
	mov r0, sl
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _023217E4
	mov r0, sl
	mov r1, r4
	bl ov29_022FAA04
	b _023217E4
_0232179C:
	ldr r0, _02321A68 ; =0x000001D1
	str r6, [sp]
	cmp r1, r0
	mov r0, sl
	bne _023217CC
	ldr r1, [sp, #8]
	mov r2, r8
	mov r3, r7
	str r4, [sp, #4]
	bl ov29_02321288
	str r0, [sp, #0x10]
	b _023217E4
_023217CC:
	ldr r1, [sp, #8]
	mov r2, r8
	mov r3, r7
	str r4, [sp, #4]
	bl ov29_02322374
	str r0, [sp, #0x10]
_023217E4:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	ldrne r0, [sp, #0x10]
	cmpne r0, #0
	beq _02321810
	ldrh r0, [r4, #2]
	tst r0, #4
	bicne r0, r0, #4
	strneh r0, [r4, #2]
	orreq r0, r0, #8
	streqh r0, [r4, #2]
_02321810:
	ldr r0, _02321A54 ; =ov29_0237CA68
	ldr r1, [r0, #0x18]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	bne _02321848
	cmp r8, #0
	bne _0232183C
	ldr r1, _02321A6C ; =0x00000E76
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	b _02321848
_0232183C:
	ldr r1, _02321A70 ; =0x00000E77
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_02321848:
	mov r0, #1
	bl AnimationDelayOrSomething
	mov r0, sl
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02321888
	bl IsFloorOver
	cmp r0, #0
	bne _02321888
	add sb, sb, #1
	cmp sb, #4
	bge _02321888
	add r0, r5, sb, lsl #3
	ldrb r0, [r0, #0x124 + OV29_0232145C_OFFSET]
	tst r0, #2
	bne _02321584
_02321888:
	mov r0, sl
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _023219A0
	mov sb, #0
_0232189C:
	add r0, r5, sb, lsl #1
	add r0, r0, #0x100
	ldrh r1, [r0, #0x94 + OV29_0232145C_OFFSET]
	cmp r1, #0
	beq _02321994
	ldrh r1, [r0, #0x94 + OV29_0232145C_OFFSET]
	add r4, sp, #0x24
	mov r0, r4
	bl InitMoveCheckId
	ldrb r0, [sp, #0x24]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0232198C
	ldrh r1, [r4, #4]
	cmp r1, #0xe5
	bne _0232194C
	add r2, sp, #0x1c
	mov r1, #4
_023218EC:
	ldrh r0, [r4], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _023218EC
	mov r0, sl
	bl ov29_02324698
	strh r0, [sp, #0x20]
	bl ov29_0234B034
	mov r1, #0
	add r2, sp, #0x1c
	mov r3, r1
	bl FormatMoveStringMore
#ifdef JAPAN
	ldr r1, _02322F08 ; =0x00000BC2
	mov r0, sl
#else
	mov r0, sl
	mov r1, #0xe80
#endif
	bl LogMessageByIdWithPopupCheckUser
	str r6, [sp]
	add r1, sp, #0x1c
	str r1, [sp, #4]
	mov r0, sl
	mov r1, #0
	mov r2, r8
	mov r3, r7
	bl ov29_02322374
	b _0232198C
_0232194C:
	ldr r0, _02321A68 ; =0x000001D1
	str r6, [sp]
	cmp r1, r0
	mov r0, sl
	bne _02321978
	ldr r1, [sp, #8]
	mov r2, r8
	mov r3, r7
	str r4, [sp, #4]
	bl ov29_02321288
	b _0232198C
_02321978:
	mov r2, r8
	mov r3, r7
	mov r1, #0
	str r4, [sp, #4]
	bl ov29_02322374
_0232198C:
	mov r0, #1
	bl AnimationDelayOrSomething
_02321994:
	add sb, sb, #1
	cmp sb, #4
	blt _0232189C
_023219A0:
	mov r0, sl
	bl EntityIsValid__02321438
	cmp r0, #0
	moveq r0, #1
	beq _02321A40
	mov r0, sl
	bl EnemyEvolution
	mov r0, sl
	bl EntityIsValid__02321438
	cmp r0, #0
	moveq r0, #1
	beq _02321A40
	ldr r1, _02321A54 ; =ov29_0237CA68
	ldrb r0, [r1]
	cmp r0, #0
	beq _02321A3C
	mov r2, #0
	mov r0, sl
	strb r2, [r1]
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02321A3C
	ldr r1, _02321A74 ; =ov10_022C4714
	mov r0, sl
	ldr r4, [sl, #0xb4]
	mov r2, #1
	bl CalcStatusDuration
	mov r2, #0
	str r2, [sp]
	mov r3, r0
	str r2, [sp, #4]
	mov r0, sl
	mov r1, sl
	mov r2, #1
	bl TryInflictPausedStatus
#ifdef JAPAN
	ldrb r0, [r4, #0x107]
	cmp r0, #1
	movlo r0, #1
	strlob r0, [r4, #0x107]
#else
	ldrb r0, [r4, #0x108]
	cmp r0, #1
	movlo r0, #1
	strlob r0, [r4, #0x108]
#endif
_02321A3C:
	mov r0, #1
_02321A40:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_0232145C_DATA_OFFSET -0x2BE
#else
#define OV29_0232145C_DATA_OFFSET 0
#endif
_02321A48: .word 0x00000E7C + OV29_0232145C_DATA_OFFSET
_02321A4C: .word 0x00000E7D + OV29_0232145C_DATA_OFFSET
_02321A50: .word 0x00000E78 + OV29_0232145C_DATA_OFFSET
_02321A54: .word ov29_0237CA68
#ifdef JAPAN
_02321A5C: .word 0x00000BC1
_02322F08: .word 0x00000BC2
#else
_02321A58: .word 0x00000E7E
_02321A5C: .word 0x00000E7F
#endif
_02321A60: .word 0x00000E81 + OV29_0232145C_DATA_OFFSET
_02321A64: .word 0x00000E79 + OV29_0232145C_DATA_OFFSET
_02321A68: .word 0x000001D1
_02321A6C: .word 0x00000E76 + OV29_0232145C_DATA_OFFSET
_02321A70: .word 0x00000E77 + OV29_0232145C_DATA_OFFSET
_02321A74: .word ov10_022C4714
	arm_func_end ov29_0232145C

	arm_func_start TryActivateNondamagingDefenderAbility
TryActivateNondamagingDefenderAbility: ; 0x02321A78
#ifdef JAPAN
#define TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_OFFSET -4
#else
#define TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EntityIsValid__02321438
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r4, [r5, #0xb4]
	add r0, r4, #0x100
	ldrh r0, [r0, #0x92 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_OFFSET]
	tst r0, #1
	beq _02321ABC
	ldr r1, _02321CC0 ; =0x00000E82
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, r5
	mov r2, #0
	bl TryInflictShadowHoldStatus
_02321ABC:
	add r0, r4, #0x100
	ldrh r0, [r0, #0x92 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_OFFSET]
	tst r0, #2
	beq _02321AE8
	ldr r1, _02321CC4 ; =0x00000E83
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, r5
	mov r2, #0
	bl TryInflictShadowHoldStatus
_02321AE8:
	add r0, r4, #0x100
	ldrh r0, [r0, #0x92 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_OFFSET]
	tst r0, #4
	beq _02321B14
	ldr r1, _02321CC8 ; =0x00000E84
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, r5
	mov r2, #0
	bl TryInflictShadowHoldStatus
_02321B14:
	add r0, r4, #0x100
	ldrh r0, [r0, #0x92 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_OFFSET]
	tst r0, #8
	beq _02321B44
	ldr r1, _02321CCC ; =0x00000E85
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, r5
	mov r2, #1
	mov r3, #0
	bl TryInflictParalysisStatus
_02321B44:
	add r0, r4, #0x100
	ldrh r0, [r0, #0x92 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_OFFSET]
	tst r0, #0x10
	beq _02321B74
	ldr r1, _02321CD0 ; =0x00000E86
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, r5
	mov r2, #1
	mov r3, #0
	bl TryInflictParalysisStatus
_02321B74:
	add r0, r4, #0x100
	ldrh r0, [r0, #0x92 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_OFFSET]
	tst r0, #0x20
	beq _02321BA4
	ldr r1, _02321CD4 ; =0x00000E87
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, r5
	mov r2, #1
	mov r3, #0
	bl TryInflictPoisonedStatus
_02321BA4:
	add r0, r4, #0x100
	ldrh r0, [r0, #0x92 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_OFFSET]
	tst r0, #0x40
	beq _02321BD4
	ldr r1, _02321CD8 ; =0x00000E88
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, r5
	mov r2, #1
	mov r3, #0
	bl TryInflictPoisonedStatus
_02321BD4:
	add r0, r4, #0x100
	ldrh r0, [r0, #0x92 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_OFFSET]
	tst r0, #0x80
	beq _02321C14
	ldr r1, _02321CDC ; =0x00000E89
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldr r1, _02321CE0 ; =SLEEP_TURN_RANGE
	mov r0, r5
	mov r2, #1
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r5
	mov r1, r5
	mov r3, #1
	bl TryInflictSleepStatus
_02321C14:
	add r0, r4, #0x100
	ldrh r0, [r0, #0x92 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_OFFSET]
	tst r0, #0x100
	beq _02321C4C
	ldr r1, _02321CE4 ; =0x00000E8A
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r2, #1
	mov ip, #0
	mov r0, r5
	mov r1, r5
	mov r3, r2
	str ip, [sp]
	bl TryInflictBurnStatus
_02321C4C:
	add r0, r4, #0x100
	ldrh r0, [r0, #0x92 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_OFFSET]
	tst r0, #0x200
	beq _02321C7C
	ldr r1, _02321CE8 ; =0x00000E8B
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, r5
	mov r2, #1
	mov r3, #0
	bl TryInflictInfatuatedStatus
_02321C7C:
	add r0, r4, #0x100
	ldrh r0, [r0, #0x92 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_OFFSET]
	tst r0, #0x400
	beq _02321CB0
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02321CEC ; =0x00000E8C
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	bl ActivateStench
_02321CB0:
	add r0, r4, #0x100
	mov r1, #0
	strh r1, [r0, #0x92 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_OFFSET]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_DATA_OFFSET -0x2BE
#else
#define TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_DATA_OFFSET 0
#endif
_02321CC0: .word 0x00000E82 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_DATA_OFFSET
_02321CC4: .word 0x00000E83 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_DATA_OFFSET
_02321CC8: .word 0x00000E84 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_DATA_OFFSET
_02321CCC: .word 0x00000E85 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_DATA_OFFSET
_02321CD0: .word 0x00000E86 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_DATA_OFFSET
_02321CD4: .word 0x00000E87 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_DATA_OFFSET
_02321CD8: .word 0x00000E88 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_DATA_OFFSET
_02321CDC: .word 0x00000E89 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_DATA_OFFSET
_02321CE0: .word SLEEP_TURN_RANGE
_02321CE4: .word 0x00000E8A + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_DATA_OFFSET
_02321CE8: .word 0x00000E8B + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_DATA_OFFSET
_02321CEC: .word 0x00000E8C + TRY_ACTIVATE_NONDAMAGING_DEFENDER_ABILITY_DATA_OFFSET
	arm_func_end TryActivateNondamagingDefenderAbility

	arm_func_start TryActivateNondamagingDefenderExclusiveItem
TryActivateNondamagingDefenderExclusiveItem: ; 0x02321CF0
#ifdef JAPAN
#define TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET -4
#else
#define TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov r5, r1
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02322244
	ldr r4, [r6, #0xb4]
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #1
	beq _02321D48
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _0232224C ; =0x00000E8D
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r6
	mov r1, r6
	mov r2, #0
	bl TryInflictShadowHoldStatus
_02321D48:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #2
	beq _02321D80
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
#ifdef JAPAN
	mov r0, r6
	mov r1, #0xbd0
#else
	ldr r1, _02322250 ; =0x00000E8E
	mov r0, r6
#endif
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r6
	mov r1, r6
	mov r2, #0
	bl TryInflictShadowHoldStatus
_02321D80:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #4
	beq _02321DB8
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _02322254 ; =0x00000E8F
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r6
	mov r1, r6
	mov r2, #0
	bl TryInflictShadowHoldStatus
_02321DB8:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x80000
	beq _02321E00
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _02322258 ; =0x00000EA3
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	ldr r1, _0232225C ; =NIGHTMARE_TURN_RANGE
	mov r0, r5
	mov r2, #1
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r6
	mov r1, r6
	bl TryInflictNightmareStatus
_02321E00:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #8
	beq _02321E3C
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
#ifdef JAPAN
	ldr r1, _02323708 ; =0x00000BD2
	mov r0, r6
#else
	mov r0, r6
	mov r1, #0xe90
#endif
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r6
	mov r1, r6
	mov r2, #1
	mov r3, #0
	bl TryInflictParalysisStatus
_02321E3C:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x10
	beq _02321E78
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _02322260 ; =0x00000E91
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r6
	mov r1, r6
	mov r2, #1
	mov r3, #0
	bl TryInflictParalysisStatus
_02321E78:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x20
	beq _02321EB4
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _02322264 ; =0x00000E92
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r6
	mov r1, r6
	mov r2, #1
	mov r3, #0
	bl TryInflictPoisonedStatus
_02321EB4:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x40
	beq _02321EF0
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _02322268 ; =0x00000E93
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r6
	mov r1, r6
	mov r2, #1
	mov r3, #0
	bl TryInflictPoisonedStatus
_02321EF0:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x80
	beq _02321F3C
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _0232226C ; =0x00000E94
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	ldr r1, _02322270 ; =SLEEP_TURN_RANGE
	mov r0, r6
	mov r2, #1
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r6
	mov r1, r6
	mov r3, #1
	bl TryInflictSleepStatus
_02321F3C:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x100
	beq _02321F80
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _02322274 ; =0x00000E95
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r2, #1
	mov r1, #0
	mov r0, r6
	str r1, [sp]
	mov r1, r6
	mov r3, r2
	bl TryInflictBurnStatus
_02321F80:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x200
	beq _02321FBC
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _02322278 ; =0x00000E96
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r6
	mov r1, r6
	mov r2, #1
	mov r3, #0
	bl TryInflictInfatuatedStatus
_02321FBC:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x800
	beq _02321FF8
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _0232227C ; =0x00000E98
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r2, #0
	mov r0, r6
	mov r1, r6
	mov r3, r2
	bl TryInflictConfusedStatus
_02321FF8:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x100000
	beq _02322030
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _02322280 ; =0x00000E99
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r6
	mov r1, r6
	mov r2, #1
	bl TryInflictFrozenStatus
_02322030:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x1000
	beq _0232206C
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _02322284 ; =0x00000E9B
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r6
	mov r1, r6
	mov r2, #0x22
	mov r3, #1
	bl TryInflictConstrictionStatus
_0232206C:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x2000
	beq _023220A8
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _02322288 ; =0x00000E9A
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r6
	mov r1, r6
	mov r2, #1
	mov r3, #0
	bl TryInflictCringeStatus
_023220A8:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x4000
	beq _023220E4
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _0232228C ; =0x00000E9C
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r2, #0
	mov r0, r6
	mov r1, r6
	mov r3, r2
	bl TryInflictBlinkerStatus
_023220E4:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x8000
	beq _0232211C
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _02322290 ; =0x00000E9D
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r6
	mov r1, r6
	mov r2, #0
	bl TrySealMove
_0232211C:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x10000
	beq _02322150
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
#ifdef JAPAN
	mov r0, r6
	mov r1, #0xbe0
#else
	ldr r1, _02322294 ; =0x00000E9E
	mov r0, r6
#endif
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, r5
	bl TryInflictInvisibleStatus
_02322150:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x20000
	beq _0232218C
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _02322298 ; =0x00000E9F
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, r5
	mov r2, #0
	mov r3, #1
	bl BoostSpeedOneStage
_0232218C:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x200000
	beq _023221C4
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
#ifdef JAPAN
	ldr r1, _02323744 ; =0x00000BE2
	mov r0, r6
#else
	mov r0, r6
	mov r1, #0xea0
#endif
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r6
	mov r1, r6
	mov r2, #0
	bl TryInflictPerishSongStatus
_023221C4:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x400000
	beq _02322200
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _0232229C ; =0x00000EA1
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r2, #1
	mov r0, r6
	mov r1, r6
	mov r3, r2
	bl LowerSpeed
_02322200:
	ldr r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	tst r0, #0x40000
	beq _0232223C
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x90 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _023222A0 ; =0x00000EA2
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r2, #0
	mov r0, r5
	mov r1, r5
	mov r3, r2
	bl TryWarp
_0232223C:
	mov r0, #0
	str r0, [r4, #0x18c + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_OFFSET]
_02322244:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET -0x2BE
#else
#define TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET 0
#endif
_0232224C: .word 0x00000E8D + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
#ifndef JAPAN
_02322250: .word 0x00000E8E
#endif
_02322254: .word 0x00000E8F + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
_02322258: .word 0x00000EA3 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
_0232225C: .word NIGHTMARE_TURN_RANGE
#ifdef JAPAN
_02323708: .word 0x00000BD2
#endif
_02322260: .word 0x00000E91 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
_02322264: .word 0x00000E92 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
_02322268: .word 0x00000E93 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
_0232226C: .word 0x00000E94 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
_02322270: .word SLEEP_TURN_RANGE
_02322274: .word 0x00000E95 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
_02322278: .word 0x00000E96 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
_0232227C: .word 0x00000E98 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
_02322280: .word 0x00000E99 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
_02322284: .word 0x00000E9B + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
_02322288: .word 0x00000E9A + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
_0232228C: .word 0x00000E9C + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
_02322290: .word 0x00000E9D + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
#ifndef JAPAN
_02322294: .word 0x00000E9E
#endif
_02322298: .word 0x00000E9F + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
#ifdef JAPAN
_02323744: .word 0x00000BE2
#endif
_0232229C: .word 0x00000EA1 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
_023222A0: .word 0x00000EA2 + TRY_ACTIVATE_NONDAMAGING_DEFENDER_EXCLUSIVE_ITEM_DATA_OFFSET
	arm_func_end TryActivateNondamagingDefenderExclusiveItem

	arm_func_start GetMoveRangeDistance
GetMoveRangeDistance: ; 0x023222A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r2, #1
	mov r7, r0
	mov r6, r1
	mov r4, #0
	bl GetEntityMoveTargetAndRange
	and r0, r0, #0xf0
	cmp r0, #0x50
	mov r0, r7
	mov r1, r6
	mov r2, #1
	moveq r4, #0xa
	bl GetEntityMoveTargetAndRange
	and r0, r0, #0xf0
	cmp r0, #0x80
	beq _02322304
	mov r0, r7
	mov r1, r6
	mov r2, #1
	bl GetEntityMoveTargetAndRange
	and r0, r0, #0xf0
	cmp r0, #0x90
	bne _0232236C
_02322304:
	mov r0, r7
	mov r1, r6
	mov r2, #1
	bl GetEntityMoveTargetAndRange
	and r0, r0, #0xf0
	cmp r0, #0x90
	moveq r4, #2
	ldrh r0, [r6, #4]
	movne r4, #1
	cmp r0, #0x97
	bne _02322340
	mov r0, r7
	bl GetApparentWeather
	cmp r0, #1
	beq _0232236C
_02322340:
	cmp r5, #0
	beq _0232236C
	ldrh r0, [r6, #4]
	bl Is2TurnsMove
	cmp r0, #0
	beq _0232236C
	mov r0, r7
	mov r1, r6
	bl IsChargingTwoTurnMove
	cmp r0, #0
	moveq r4, #0
_0232236C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end GetMoveRangeDistance

	arm_func_start ov29_02322374
ov29_02322374: ; 0x02322374
#ifdef JAPAN
#define OV29_02322374_OFFSET -4
#define OV29_02322374_OFFSET_2 -1
#else
#define OV29_02322374_OFFSET 0
#define OV29_02322374_OFFSET_2 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x13c
	ldr sl, [sp, #0x164]
	mov r6, r0
	mov r7, #0
	mov r0, #1
	str r1, [sp, #0xc]
	mov r5, r2
	str r3, [sp, #0x10]
	mov r8, sl
	str r7, [sp, #0x38]
	ldr r4, [sp, #0x160]
	bl AnimationDelayOrSomething
	mov r0, r6
	mov r1, sl
	bl IsChargingTwoTurnMove
	cmp r0, #0
	mov r0, r6
	mov r2, #1
	mov r1, sl
	beq _023223D0
	bl ov29_02324BE8
	b _023223D4
_023223D0:
	bl CanMonsterUseMove
_023223D4:
	mov sb, r0
	cmp sb, #0
	beq _023224C4
	ldrh r1, [sl, #4]
	ldr r0, _02322D18 ; =0x0000014A
	cmp r1, r0
	bne _02322460
	mov r0, #0xa8
	bl DungeonRandInt
	mov r2, r0
	ldr r1, _02322D1C ; =ov29_0237CA88
	add r0, sp, #0x28
	str r2, [r1]
	ldr r1, _02322D20 ; =METRONOME_TABLE
	mov r2, r2, lsl #3
	ldrh r1, [r1, r2]
	bl InitMove
	ldrb r1, [sl]
	ldr r0, _02322D24 ; =0x00000EA4
	strb r1, [sp, #0x28]
	ldrh r1, [sl, #2]
	strh r1, [sp, #0x2a]
	bl StringFromId
	mov r2, r0
	str r5, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, r6
	mov r1, sl
	add r3, sp, #0x38
	bl ov29_02322DDC
	mov r0, #1
	bl AnimationDelayOrSomething
	add r8, sp, #0x28
	b _023224C4
_02322460:
	cmp r1, #0x77
	bne _023224C4
	bl GetNaturePowerVariant
	ldr r1, _02322D28 ; =NATURE_POWER_TABLE
	mov r0, r0, lsl #3
	ldrh r1, [r1, r0]
	add r0, sp, #0x30
	bl InitMove
	ldrb r1, [sl]
	ldr r0, _02322D2C ; =0x00000EA5
	strb r1, [sp, #0x30]
	ldrh r1, [sl, #2]
	strh r1, [sp, #0x32]
	bl StringFromId
	mov r2, r0
	str r5, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, r6
	mov r1, sl
	add r3, sp, #0x38
	bl ov29_02322DDC
	mov r0, #1
	bl AnimationDelayOrSomething
	add r8, sp, #0x30
_023224C4:
	mov r0, r6
	mov r1, r8
	mov r2, #1
	bl GetMoveRangeDistance
	and fp, r0, #0xff
	bl ov29_0234B034
	mov r1, #0
	str r1, [sp]
	ldr r2, [r6, #0xb4]
	mov r3, r1
	bl ov29_0230040C
	bl ov29_0234B034
	mov r1, #0
	mov r2, r8
	mov r3, r1
	bl FormatMoveStringMore
	mov r0, r6
	mov r1, r8
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _02322554
	ldr r0, _02322D30 ; =0x00000EA6
	bl StringFromId
	cmp sb, #0
	ldr r1, [r6, #0xb4]
	mov r2, #0
	str r0, [sp, #0x20]
	strb r2, [r1, #0x10b + OV29_02322374_OFFSET_2]
	cmpne sl, r8
	beq _02322598
	mov r0, r6
	mov r1, r8
	mov r2, #1
	bl ov29_02324BE8
	mov sb, r0
	b _02322598
_02322554:
	cmp r5, #0
	bne _0232256C
	ldrh r0, [r8, #4]
	bl GetMoveMessageFromId
	str r0, [sp, #0x20]
	b _02322578
_0232256C:
	ldr r0, _02322D34 ; =0x00000EA7
	bl StringFromId
	str r0, [sp, #0x20]
_02322578:
	cmp sb, #0
	cmpne sl, r8
	beq _02322598
	mov r0, r6
	mov r1, r8
	mov r2, #1
	bl CanMonsterUseMove
	mov sb, r0
_02322598:
	cmp sb, #0
	ldrne r0, [sp, #0xc]
	cmpne r0, #0
	beq _023225D4
	ldrh r1, [sl, #4]
	ldr r0, _02322D18 ; =0x0000014A
	cmp r1, r0
	cmpne r1, #0x77
	mov r0, r6
	bne _023225CC
	mov r1, sl
	bl ov29_022FAA04
	b _023225D4
_023225CC:
	mov r1, r8
	bl ov29_022FAA04
_023225D4:
	ldr r0, [r6, #0xb4]
	ldrb r0, [r0, #0xf3]
	cmp r0, #1
	bne _02322630
	ldrh r0, [r8, #4]
	bl FailsWhileMuzzled
	cmp r0, #0
	beq _02322630
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, [sp, #0x20]
	mov r0, r6
	bl LogMessageWithPopupCheckUser
	mov r0, #0xa
	mov r1, #0x3f
	bl ov29_022EA370
	ldr r1, _02322D38 ; =0x00000E7B
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0
	b _02322D10
_02322630:
	cmp sb, #0
	bne _023226D0
	bl ov29_0234B034
	mov r1, #0
	str r1, [sp]
	ldr r2, [r6, #0xb4]
	mov r3, r1
	bl ov29_0230040C
	cmp r5, #0
	bne _02322694
	bl ov29_0234B034
	mov r1, #0
	mov r2, r8
	mov r3, r1
	bl FormatMoveStringMore
	ldr r1, [sp, #0x20]
	mov r0, r6
	bl LogMessageWithPopupCheckUser
	mov r0, #0xa
	mov r1, #0x3f
	bl ov29_022EA370
	ldr r1, _02322D3C ; =0x00000E79
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	b _023226C8
_02322694:
	mov r0, r5, lsl #0x10
	mov r1, r0, asr #0x10
	mov r0, #0
	bl ov29_0234B084
	ldr r1, [sp, #0x20]
	mov r0, r6
	bl LogMessageWithPopupCheckUser
	mov r0, #0xa
	mov r1, #0x3f
	bl ov29_022EA370
	ldr r1, _02322D40 ; =0x00000E7A
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
_023226C8:
	mov r0, #0
	b _02322D10
_023226D0:
	ldr r0, _02322D44 ; =ov29_0237CA68
	mov r1, #0
	str r1, [r0, #0x10]
	str r1, [r0, #0xc]
	str r1, [r0, #0x14]
	strb r1, [r0, #3]
	strb r1, [r0, #2]
	strb r1, [r0, #5]
	str r1, [r0, #8]
	strb r1, [r0, #1]
	cmp r4, #0
	beq _02322714
	ldr r1, [r6, #0xb4]
	ldrb r0, [r1, #0x15d + OV29_02322374_OFFSET]
	cmp r0, #4
	addlo r0, r0, #1
	strlob r0, [r1, #0x15d + OV29_02322374_OFFSET]
_02322714:
	ldrh r1, [r8, #4]
	ldr r0, _02322D48 ; =0x00000163
	cmp r1, r0
	bne _02322768
	mov r0, r6
	mov r1, #0x2b
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r7, #1
	bne _02322768
	mov r0, r6
	mov r1, #0x28
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _02322768
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02322D4C ; =ov10_022C4584
	ldrsh r1, [r1]
	cmp r0, r1
	movlt r7, #1
_02322768:
	cmp r7, #0
	movne r0, #2
	strne r0, [sp, #0x24]
	bne _023227B0
	mov r0, r6
	mov r1, #0x5b
	bl AbilityIsActiveVeneer
	cmp r0, #0
	mov r0, r8
	beq _023227A8
	bl GetMoveNbStrikes
	str r0, [sp, #0x24]
	cmp r0, #0
	moveq r0, #5
	streq r0, [sp, #0x24]
	b _023227B0
_023227A8:
	bl ov29_02324514
	str r0, [sp, #0x24]
_023227B0:
	ldr r0, _02322D50 ; =INTIMIDATOR_ACTIVATION_CHANCE
	mov r7, #0
	ldrsh r0, [r0]
	str r0, [sp, #0x14]
	b _02322C8C
_023227C4:
	ldr r0, _02322D44 ; =ov29_0237CA68
	mov sb, #1
	ldrb r1, [r0, #1]
	cmp r1, #0
	ldreqb r0, [r0, #4]
	cmpeq r0, #0
	bne _02322C98
	mov r0, r6
	bl EntityIsValid__02321438
	cmp r0, #0
	moveq r0, sb
	beq _02322D10
	bl IsFloorOver
	cmp r0, #0
	movne r0, sb
	bne _02322D10
	ldr r0, [sp, #0x10]
	ldr sl, [r6, #0xb4]
	cmp r0, #0
	bne _02322824
	ldrh r0, [r8, #4]
	cmp r0, #0x19
	cmpne r0, #0xe3
	bne _0232284C
_02322824:
	mov r0, r6
	bl IsMonsterSleeping
	cmp r0, #0
	bne _02322860
	mov r0, r6
	mov r1, #1
	bl ov29_02300DCC
	cmp r0, #0
	bne _02322C98
	b _02322860
_0232284C:
	mov r0, r6
	mov r1, #0
	bl ov29_02300DCC
	cmp r0, #0
	bne _02322C98
_02322860:
	mov r0, #0
	strb r0, [sl, #0x154 + OV29_02322374_OFFSET]
	bl GravityIsActive
	cmp r0, #0
	beq _023228A4
	ldrh r1, [r8, #4]
	cmp r1, #0xcc
	cmpne r1, #0xcd
	cmpne r1, #0xce
	cmpne r1, #0x99
	cmpne r1, #0xfe
	ldrne r0, _02322D54 ; =0x000001ED
	cmpne r1, r0
	bne _023228A4
	mov r0, r6
	bl ov29_023383A8
	b _02322C98
_023228A4:
	ldrh r0, [r8, #4]
	cmp r0, #9
	bne _023228CC
	ldr sb, [r6, #0xb4]
	mov r0, #8
	bl DungeonRandInt
	strb r0, [sb, #0x4c]
	mov r0, r6
	bl UpdateAiTargetPos
	mov sb, #0
_023228CC:
	ldr r0, _02322D58 ; =ov29_0235370C
	mov r1, #0
	str r1, [r0]
	str r1, [sp, #0x38]
	cmp fp, #1
	bhi _02322918
	add r0, sp, #0x38
	mov r1, r6
	mov r2, r8
	bl ov29_02324030
	add r0, sp, #0x38
	mov r1, r6
	bl ov29_02324C9C
	cmp r7, #0
	cmpne sb, #0
	beq _02322918
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq _02322C98
_02322918:
	mov r0, #0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x18]
	b _02322A54
_02322928:
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp, #0x18]
	mov r0, sl
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02322A54
	ldr r0, [sl]
	cmp r0, #1
	bne _02322A54
	mov r0, sl
	mov r1, #0x24
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _02322A54
	mov r0, sl
	mov r1, r6
	mov r2, #0x1f
#ifndef JAPAN
	mov r3, #0
#endif
	bl DefenderAbilityIsActive__02322D64
	cmp r0, #0
	bne _02322A54
	mov r0, r6
	mov r1, sl
	bl AreEntitiesAdjacent
	cmp r0, #0
	beq _02322A54
	mov r0, r6
	mov r1, r8
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	and r0, r0, #0xf0
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	mov r0, r6
	mov r1, r8
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	and r0, r0, #0xf
	cmp sb, #0x60
	cmpeq r0, #0
	beq _023229FC
	cmp sb, #0
	cmpne sb, #0x10
	cmpne sb, #0x20
	cmpne sb, #0x40
	cmpne sb, #0x50
	cmpne sb, #0x70
	cmpne sb, #0x80
	cmpne sb, #0x90
	bne _02322A54
_023229FC:
	mov r0, #0x64
	bl DungeonRandInt
	mov r1, r0, lsl #0x10
	ldr r0, [sp, #0x14]
	cmp r0, r1, asr #16
	ble _02322A54
	mov r0, sl
	bl ov29_022E5864
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, #1
	mov r1, r6
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02322D5C ; =0x00000EA9
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	str r0, [sp, #0x1c]
	b _02322A68
_02322A54:
	ldr r0, [sp, #0x18]
	add r1, sp, #0x38
	ldr sl, [r1, r0, lsl #2]
	cmp sl, #0
	bne _02322928
_02322A68:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _02322C98
	cmp r7, #0
	moveq r2, #1
	movne r2, #0
	and r2, r2, #0xff
	str r5, [sp]
	str r2, [sp, #4]
	ldr r2, [sp, #0x20]
	add r3, sp, #0x38
	mov r0, r6
	mov r1, r8
	bl ov29_02322DDC
	ldr r1, _02322D58 ; =ov29_0235370C
	mov sb, r0
	ldr r0, [r1]
	mov r1, #0
	str r1, [sp, #0x20]
	cmp r0, #0
	beq _02322AC0
	bl ov29_022F9840
_02322AC0:
	ldr r1, [r6, #0xb4]
	ldrb r0, [r1, #0xd0]
	cmp r0, #2
	cmpne r0, #4
	addne r0, r1, #0x100
	movne r1, #0
	strneh r1, [r0, #0x7e + OV29_02322374_OFFSET]
	strneh r1, [r0, #0x80 + OV29_02322374_OFFSET]
	ldr r0, _02322D44 ; =ov29_0237CA68
	cmp fp, #0
	ldr r1, [r0, #0x10]
	add r1, r1, #1
	str r1, [r0, #0x10]
	beq _02322B24
	ldrh r0, [r8, #4]
	bl ov10_022BFD6C
	mov r3, sb
	str r5, [sp]
	str r4, [sp, #4]
	str r0, [sp, #8]
	mov r0, r6
	mov r1, r8
	mov r2, fp
	bl ov29_023230FC
	b _02322B54
_02322B24:
	ldrh r1, [r8, #4]
	ldr r0, _02322D60 ; =0x000001F6
	mov r2, r8
	cmp r1, r0
	ldreq r0, [r6, #0xb4]
	moveq r1, #1
	streqb r1, [r0, #0x170 + OV29_02322374_OFFSET]
	add r0, sp, #0x38
	mov r1, r6
	mov r3, r5
	str r4, [sp]
	bl ExecuteMoveEffect
_02322B54:
	mov r0, r6
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02322C98
	mov r0, r6
	bl ov29_02304B14
	mov r0, r6
	bl IsMonster__02322DB8
	cmp r0, #0
	beq _02322BE8
	ldrb r0, [r6, #0x28]
	cmp r0, #0
	beq _02322BD8
	mov sb, #0
	mov sl, #0x4a
	b _02322BD0
_02322B94:
	mov r0, r6
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02322BD8
	add r0, r6, #0x2c
	bl sub_0201D1B0
	cmp r0, #0
	ldrneb r0, [r6, #0x28]
	cmpne r0, #0
	beq _02322BD8
	mov r0, sl
	bl AdvanceFrame
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_02322BD0:
	cmp sb, #0x64
	blt _02322B94
_02322BD8:
	mov r0, r6
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02322C98
_02322BE8:
	mov r0, r6
	mov r1, #0x2c
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrne r1, [r6, #0xb4]
	ldrneb r0, [r1, #0x154 + OV29_02322374_OFFSET]
	cmpne r0, #0
	ldrneb r0, [r1, #0xd2]
	cmpne r0, #1
	cmpne r0, #0xb
	beq _02322C68
	mov r2, #0
	strb r2, [r1, #0xd3]
	ldr r1, [r6, #0xb4]
	ldr r0, _02322D44 ; =ov29_0237CA68
	strb r2, [r1, #0x154 + OV29_02322374_OFFSET]
	ldr r1, [r6, #0xb4]
	sub r7, r7, #1
#ifdef JAPAN
	strb r2, [r1, #0x10a]
#else
	strb r2, [r1, #0x10b]
#endif
	ldr r1, [r0, #0x18]
	mov r2, #0
	sub r1, r1, #1
	str r1, [r0, #0x18]
	ldrb r0, [r8, #6]
	mov r1, r8
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r8, #6]
	mov r0, r6
	bl GetMoveRangeDistance
	and fp, r0, #0xff
	b _02322C88
_02322C68:
	ldr r2, [r6, #0xb4]
	ldrb r0, [r2, #0x154 + OV29_02322374_OFFSET]
	cmp r0, #0
	bne _02322C88
	mov r1, #0
	mov r0, r6
	strb r1, [r2, #0x154 + OV29_02322374_OFFSET]
	bl ov29_02318D58
_02322C88:
	add r7, r7, #1
_02322C8C:
	ldr r0, [sp, #0x24]
	cmp r7, r0
	blt _023227C4
_02322C98:
	ldr r0, _02322D44 ; =ov29_0237CA68
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _02322CC4
	mov r0, r6
	mov r1, r6
	mov r2, #1
	bl EndFrozenClassStatus
	mov r0, r6
	mov r1, r6
	bl EndLeechSeedClassStatus
_02322CC4:
	ldr r0, _02322D44 ; =ov29_0237CA68
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _02322D0C
	mov r0, r6
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02322D0C
	mov r2, #0
	ldr r4, [r6, #0xb4]
	mov r0, r6
	mov r1, r6
	mov r3, r2
	bl TryInflictConfusedStatus
	ldrb r0, [r4, #0x108 + OV29_02322374_OFFSET_2]
	cmp r0, #1
	movlo r0, #1
	strlob r0, [r4, #0x108 + OV29_02322374_OFFSET_2]
_02322D0C:
	mov r0, #1
_02322D10:
	add sp, sp, #0x13c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_02322374_DATA_OFFSET -0x2BE
#else
#define OV29_02322374_DATA_OFFSET 0
#endif
_02322D18: .word 0x0000014A
_02322D1C: .word ov29_0237CA88
_02322D20: .word METRONOME_TABLE
_02322D24: .word 0x00000EA4 + OV29_02322374_DATA_OFFSET
_02322D28: .word NATURE_POWER_TABLE
_02322D2C: .word 0x00000EA5 + OV29_02322374_DATA_OFFSET
_02322D30: .word 0x00000EA6 + OV29_02322374_DATA_OFFSET
_02322D34: .word 0x00000EA7 + OV29_02322374_DATA_OFFSET
_02322D38: .word 0x00000E7B + OV29_02322374_DATA_OFFSET
_02322D3C: .word 0x00000E79 + OV29_02322374_DATA_OFFSET
_02322D40: .word 0x00000E7A + OV29_02322374_DATA_OFFSET
_02322D44: .word ov29_0237CA68
_02322D48: .word 0x00000163
_02322D4C: .word ov10_022C4584
_02322D50: .word INTIMIDATOR_ACTIVATION_CHANCE
_02322D54: .word 0x000001ED
_02322D58: .word ov29_0235370C
_02322D5C: .word 0x00000EA9 + OV29_02322374_DATA_OFFSET
_02322D60: .word 0x000001F6
	arm_func_end ov29_02322374

	arm_func_start DefenderAbilityIsActive__02322D64
DefenderAbilityIsActive__02322D64: ; 0x02322D64
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	cmp r6, r5
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r7, r6
#endif
	beq _02322DA8
	bl IsMonster__02322DB8
	cmp r0, #0
#ifdef JAPAN
	beq _02322DA8
	mov r0, r6
#else
	cmpne r4, #0
	beq _02322DA8
	mov r0, r7
#endif
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
#ifdef JAPAN
	ldmneia sp!, {r4, r5, r6, pc}
_02322DA8:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActiveVeneer
	ldmia sp!, {r4, r5, r6, pc}
#else
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_02322DA8:
	mov r0, r6
	mov r1, r5
	bl AbilityIsActiveVeneer
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	arm_func_end DefenderAbilityIsActive__02322D64

	arm_func_start IsMonster__02322DB8
IsMonster__02322DB8: ; 0x02322DB8
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMonster__02322DB8

	arm_func_start ov29_02322DDC
ov29_02322DDC: ; 0x02322DDC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	mov r8, r2
	mov r5, r4
	mov sl, r0
	mov sb, r1
	mov fp, r3
	ldr r7, [sp, #0x28]
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r5, #1
	cmp r8, #0
	beq _02322ED0
	mov r6, #0
	b _02322E38
_02322E18:
	ldr r0, [fp, r6, lsl #2]
	cmp r0, #0
	beq _02322E40
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r5, #1
	bne _02322E40
	add r6, r6, #1
_02322E38:
	cmp r6, #0x41
	blt _02322E18
_02322E40:
	cmp r5, #0
	beq _02322E94
	bl ov29_0234B034
	mov r1, #0
	str r1, [sp]
	ldr r2, [sl, #0xb4]
	mov r3, r1
	bl ov29_0230040C
	cmp r7, #0
	bne _02322E80
	bl ov29_0234B034
	mov r1, #0
	mov r2, sb
	mov r3, r1
	bl FormatMoveStringMore
	b _02322EAC
_02322E80:
	mov r0, r7, lsl #0x10
	mov r1, r0, asr #0x10
	mov r0, #0
	bl ov29_0234B084
	b _02322EAC
_02322E94:
	cmp r7, #0
	beq _02322EAC
	mov r0, r7, lsl #0x10
	mov r1, r0, asr #0x10
	mov r0, #0
	bl ov29_0234B084
_02322EAC:
	ldrh r1, [sb, #4]
	ldr r0, _02322F74 ; =0x00000163
	cmp r1, r0
	mov r0, sl
	mov r1, r8
	beq _02322ECC
	bl LogMessageWithPopup
	b _02322ED0
_02322ECC:
	bl LogMessageQuiet
_02322ED0:
	cmp r5, #0
	beq _02322F5C
	ldrb r0, [sp, #0x2c]
	mov r1, sb
	cmp r0, #0
	mov r0, sl
	beq _02322EF8
	mov r2, #1
	bl ov29_02324E78
	b _02322F00
_02322EF8:
	mov r2, #0
	bl ov29_02324E78
_02322F00:
	mov r4, r0
	ldrh r0, [sb, #4]
	cmp r0, #0xfe
	bne _02322F24
	mov r0, sl
	bl EntityIsValid__02321438
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [sl, #0xaf]
_02322F24:
	ldrh r0, [sb, #4]
	bl ov10_022BFDAC
	cmp r0, #0
	beq _02322F4C
	ldr r1, [sl, #0xb4]
	mov r0, sl
	ldrb r1, [r1, #0x4c]
	bl ov29_02304A48
	mov r0, #1
	bl AnimationDelayOrSomething
_02322F4C:
	mov r0, sl
	mov r1, sb
	bl ov29_023250D4
	b _02322F6C
_02322F5C:
	ldr r1, [sl, #0xb4]
	mov r0, sl
	ldrb r1, [r1, #0x4c]
	bl ov29_02304A48
_02322F6C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02322F74: .word 0x00000163
	arm_func_end ov29_02322DDC

	arm_func_start ov29_02322F78
ov29_02322F78: ; 0x02322F78
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	ldr r4, _023230F4 ; =DUNGEON_PTR
	mov r7, r0
	ldr r0, [r4]
	mov r6, r1
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x19a]
#else
	ldrb r0, [r0, #0x23e]
#endif
	mov r5, r2
	mov r8, r3
	cmp r0, #0
	ldr r4, [r7, #0xb4]
	mvnne r0, #0
	bne _023230EC
	ldrsh r0, [r4, #4]
	bl GetBodySize
	cmp r0, #4
	blo _02322FC8
	cmp r8, #1
	beq _023230E8
_02322FC8:
	mov r0, r7
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r5, #4]
	mov r2, #1
	bl GetMoveAnimationId
	bl GetMoveAnimation
	ldrsh r0, [r0, #6]
	ldrsh r3, [r6, #2]
	mov r1, #0x18
	ldrsh r2, [r6]
	smulbb r3, r3, r1
	smulbb r2, r2, r1
	add r3, r3, #0x10
	add r2, r2, #0xc
	mov r6, r3, lsl #8
	mov r2, r2, lsl #8
	mov r3, r2, asr #8
	mov r2, r6, asr #8
	strh r3, [sp]
	strh r2, [sp, #2]
	cmp r0, #0
	beq _023230E0
	mov r0, #0x5e
	bl AdvanceFrame
	mov r0, r7
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r5, #4]
	mov r2, #1
	bl GetMoveAnimationId
	mov r1, r0
	ldrsh r0, [r4, #4]
	bl ov10_022BF01C
	mov r2, r0
	mvn r0, #0
	cmp r2, r0
	ldreq r0, _023230F8 ; =ov29_02352A54
	ldreqh r1, [r0]
	streqh r1, [sp, #0xc]
	ldreqh r0, [r0, #2]
	streqh r0, [sp, #0xe]
	beq _02323084
	add r0, sp, #0xc
	add r1, r7, #0x2c
	and r2, r2, #0xff
	bl sub_0201CF90
_02323084:
	mov r0, r7
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r5, #4]
	mov r2, #1
	bl GetMoveAnimationId
	strh r0, [sp, #4]
	ldrsh r2, [r4, #4]
	add r0, sp, #4
	add r1, sp, #0
	strh r2, [sp, #6]
	ldr r3, [r7, #0xc]
	mov r2, #0
	mov r3, r3, asr #8
	strh r3, [sp, #8]
	ldr r3, [r7, #0x10]
	mov r3, r3, asr #8
	strh r3, [sp, #0xa]
	ldrb r3, [r4, #0x4c]
	str r3, [sp, #0x10]
	str r2, [sp, #0x14]
	bl ov10_022BE9E8
	b _023230EC
_023230E0:
	sub r0, r1, #0x19
	b _023230EC
_023230E8:
	mvn r0, #0
_023230EC:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023230F4: .word DUNGEON_PTR
_023230F8: .word ov29_02352A54
	arm_func_end ov29_02322F78

	arm_func_start ov29_023230FC
ov29_023230FC: ; 0x023230FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc0
	ldr r4, _023238F4 ; =ov29_02352A54
	mov r8, r0
	mov r0, #0
	str r0, [sp, #0x88]
	ldr r0, [r4, #4]
	mov r7, r1
	ldr r1, [r4, #8]
	str r0, [sp, #0xb0]
	str r1, [sp, #0xb4]
	ldr r1, [sp, #0x88]
	ldrh r0, [r7, #4]
	mov r6, r2
	mov fp, r3
	str r1, [sp, #0x84]
	mov r5, r1
	ldr sb, [r8, #0xb4]
	bl GetMoveAnimationSpeed
	cmp r0, #1
	moveq sl, #2
	beq _02323160
	cmp r0, #2
	moveq sl, #3
	movne sl, #6
_02323160:
	ldrsh r2, [r8, #4]
	ldr r0, _023238F8 ; =DIRECTIONS_XY
	ldr r1, _023238FC ; =ov29_0235171E
	strh r2, [sp, #0xbc]
	ldrsh r2, [r8, #6]
	mov r4, #0
	strh r2, [sp, #0xbe]
	ldrb r2, [sb, #0x4c]
	mov r2, r2, lsl #2
	ldrsh r0, [r0, r2]
	str r0, [sp, #0x6c]
	ldrsh r0, [r1, r2]
	str r0, [sp, #0x68]
	b _02323214
_02323198:
	ldrsh r2, [sp, #0xbc]
	cmp r2, #0
	ldrgesh r1, [sp, #0xbe]
	cmpge r1, #0
	blt _0232321C
	cmp r2, #0x38
	cmplt r1, #0x20
	bge _0232321C
	ldr r0, [sp, #0x6c]
	add r0, r2, r0
	strh r0, [sp, #0xbc]
	ldr r0, [sp, #0x68]
	add r0, r1, r0
	strh r0, [sp, #0xbe]
	ldr r0, [sp, #0x84]
	ldrsh r1, [sp, #0xbe]
	add r0, r0, #1
	str r0, [sp, #0x84]
	ldrsh r0, [sp, #0xbc]
	bl GetTile
	ldrh r1, [r0]
	tst r1, #3
	beq _0232321C
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _02323210
	ldr r0, [r1]
	cmp r0, #1
	moveq r5, r1
	beq _0232321C
_02323210:
	add r4, r4, #1
_02323214:
	cmp r4, r6
	blt _02323198
_0232321C:
	mov r0, r8
	ldrh r1, [r7, #4]
	bl ov29_02324D60
	cmp r0, #0
	beq _02323250
	mov r0, r8
	mov r1, r7
	bl IsChargingTwoTurnMove
	cmp r0, #0
	mvneq r0, #0
	streq r0, [sp, #0xb0]
	streq r0, [sp, #0xb4]
	beq _023232E4
_02323250:
	mov r0, r8
	add r1, sp, #0xbc
	mov r2, r7
	mov r3, r6
	bl ov29_02322F78
	str r0, [sp, #0xb0]
	ldrb r0, [sp, #0xf0]
	cmp r0, #0
	beq _023232E4
	cmp r5, #0
	mvneq r0, #0
	streq r0, [sp, #0xb4]
	beq _023232E4
	ldrsh r2, [r8, #4]
	mov r0, r5
	add r1, sp, #0xb8
	strh r2, [sp, #0xb8]
	ldrsh r4, [r8, #6]
	mov r2, r7
	mov r3, r6
	strh r4, [sp, #0xba]
	bl ov29_02322F78
	ldrsh r2, [r5, #4]
	str r0, [sp, #0xb4]
	ldr r0, _023238F8 ; =DIRECTIONS_XY
	strh r2, [sp, #0xb8]
	ldrsh r2, [r5, #6]
	ldr r1, _023238FC ; =ov29_0235171E
	strh r2, [sp, #0xba]
	ldrb r2, [sb, #0x4c]
	add r2, r2, #4
	mov r2, r2, lsl #0x1d
	mov r2, r2, lsr #0x1b
	ldrsh r0, [r0, r2]
	str r0, [sp, #0x64]
	ldrsh r0, [r1, r2]
	str r0, [sp, #0x60]
_023232E4:
	ldrsh r0, [r8, #4]
	ldr r5, _02323900 ; =ov29_0235175C
	ldr r3, _023238F8 ; =DIRECTIONS_XY
	strh r0, [sp, #0xbc]
	ldrsh r1, [r8, #6]
	ldr r2, _023238FC ; =ov29_0235171E
	mov r0, #0x18
	strh r1, [sp, #0xbe]
	ldrb r1, [sb, #0x4c]
	str r1, [sp, #0x1c]
	ldr r4, [sp, #0x1c]
	mov r1, sl
	ldr r4, [r5, r4, lsl #2]
	str r4, [sp, #0x7c]
	ldr r4, [sp, #0x1c]
	mov r4, r4, lsl #2
	ldrsh r3, [r3, r4]
	ldrsh r2, [r2, r4]
	str r3, [sp, #0x10]
	str r2, [sp, #0xc]
	bl _s32_div_f
	ldr r2, [sp, #0x84]
	str r0, [sp, #0x18]
	mul r1, r2, r0
	cmp r6, #2
	blt _0232335C
	add r4, r1, #8
	cmp r4, #0x40
	movge r4, #0x40
	b _02323360
_0232335C:
	mov r4, #0x20
_02323360:
	mov r0, #0x80000
	mov sb, #0
	bl _s32_div_f
	str r0, [sp, #0x80]
	mov r0, #1
	bl ov29_0234B4CC
	mov r1, sb
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x10]
	mov r0, sl, lsl #8
	mul r2, r1, r0
	ldr r1, [sp, #0xc]
	str r2, [sp, #0x2c]
	mul r2, r1, r0
	ldr r1, [sp, #0x64]
	str r2, [sp, #0x28]
	mul r2, r1, r0
	ldr r1, [sp, #0x60]
	str r2, [sp, #0x48]
	mul r0, r1, r0
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x7c]
	ldr r1, _02323904 ; =0x00000FFF
	add r3, r0, #0xc00
	add r2, r0, #0x1400
	mov r0, r4, asr #1
	str r0, [sp, #0x3c]
	and r0, r3, r1
	str r0, [sp, #0x40]
	and r0, r2, r1
	str r0, [sp, #0x30]
	rsb r0, r4, #0
	str r0, [sp, #0x34]
	ldr r1, _02323908 ; =ov29_02352A6C
	ldr r0, [sp, #0x1c]
	ldr r5, [sp, #0xb4]
	ldr r0, [r1, r0, lsl #2]
	str r0, [sp, #0x38]
	b _02323824
_023233FC:
	ldrsh r1, [sp, #0xbc]
	cmp r1, #0
	ldrgesh r2, [sp, #0xbe]
	cmpge r2, #0
	blt _02323830
	cmp r1, #0x38
	cmplt r2, #0x20
	bge _02323830
	ldr r0, [sp, #0x10]
	ldrh r3, [sp, #0xbc]
	add r1, r1, r0
	ldr r0, [sp, #0xc]
	cmp r5, #0
	add r0, r2, r0
	ldrh r2, [sp, #0xbe]
	strh r3, [sp, #0xa0]
	strh r1, [sp, #0xbc]
	strh r2, [sp, #0xa2]
	strh r0, [sp, #0xbe]
	blt _0232347C
	ldrh r0, [sp, #0xba]
	ldrh r2, [sp, #0xb8]
	ldrsh r1, [sp, #0xb8]
	strh r0, [sp, #0xa6]
	ldr r0, [sp, #0x64]
	strh r2, [sp, #0xa4]
	add r0, r1, r0
	strh r0, [sp, #0xb8]
	ldrsh r1, [sp, #0xba]
	ldr r0, [sp, #0x60]
	add r0, r1, r0
	strh r0, [sp, #0xba]
_0232347C:
	add r0, sp, #0xbc
	bl ov29_022E2CA0
	cmp r0, #0
	beq _02323740
	ldr r0, _0232390C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x19a]
#else
	ldrb r0, [r0, #0x23e]
#endif
	cmp r0, #0
	bne _02323740
	ldrsh r0, [sp, #0xa0]
	mov r1, #0x18
	ldrsh r2, [sp, #0xa2]
	smulbb r0, r0, r1
	add r0, r0, #0xc
	mov r0, r0, lsl #8
	str r0, [sp, #0x5c]
	smulbb r0, r2, r1
	add r0, r0, #0x10
	cmp r5, #0
	mov sl, r0, lsl #8
	blt _0232350C
	ldrsh r3, [sp, #0xa4]
	ldr r0, [sp, #0x48]
	ldrsh r2, [sp, #0xa6]
	str r0, [sp, #0x24]
	smulbb r0, r3, r1
	add r0, r0, #0xc
	mov r0, r0, lsl #8
	smulbb r1, r2, r1
	str r0, [sp, #0x58]
	add r0, r1, #0x10
	mov r0, r0, lsl #8
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x44]
	str r0, [sp, #0x20]
_0232350C:
	mov r0, #0
	str r0, [sp, #0x78]
	ldr r0, [sp, #0xb0]
	str r0, [sp, #0x8c]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp, #0x90]
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp, #0x94]
	b _0232372C
_02323538:
	ldr r0, [sp, #0x8c]
	cmp r0, #0
	blt _02323600
	cmp fp, #1
	bne _02323564
	mov r0, sb, asr #8
	bl sub_020018D0
	mul r0, r4, r0
	str r0, [sp, #0x50]
	mov r2, #0
	b _023235B4
_02323564:
	cmp fp, #2
	movne r0, #0
	strne r0, [sp, #0x50]
	movne r2, r0
	bne _023235B4
	mov r0, sb, asr #8
	bl sub_020018D0
	ldr r1, [sp, #0x3c]
	mul r0, r1, r0
	mov r0, r0, asr #8
	str r0, [sp, #0x74]
	ldr r0, [sp, #0x40]
	bl sub_020018D0
	ldr r1, [sp, #0x74]
	mul r0, r1, r0
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x40]
	bl sub_02001980
	ldr r1, [sp, #0x74]
	mul r2, r1, r0
_023235B4:
	ldr r0, [sp, #0x5c]
	add r1, sp, #0x9c
	add r0, r0, r2
	mov r0, r0, asr #8
	strh r0, [sp, #0x9c]
	ldr r0, [sp, #0x50]
	ldr r2, _0232390C ; =DUNGEON_PTR
	sub r0, sl, r0
	mov r0, r0, asr #8
	ldr r3, [r2]
	strh r0, [sp, #0x9e]
	ldr r2, _02323910 ; =0x0001A226
	ldr r0, [sp, #0x90]
	ldrsh r2, [r3, r2]
	rsb r2, r2, sl, asr #8
	add r3, r2, r2, lsr #31
	ldr r2, [sp, #0x38]
	add r2, r2, r3, asr #1
	bl ov10_022BEB2C
_02323600:
	cmp r5, #0
	blt _023236D0
	cmp fp, #1
	bne _0232362C
	mov r0, sb, asr #8
	bl sub_020018D0
	ldr r1, [sp, #0x34]
	mov r2, #0
	mul r0, r1, r0
	str r0, [sp, #0x4c]
	b _0232367C
_0232362C:
	cmp fp, #2
	movne r2, #0
	movne r0, r2
	strne r0, [sp, #0x4c]
	bne _0232367C
	mov r0, sb, asr #8
	bl sub_020018D0
	ldr r1, [sp, #0x3c]
	mul r0, r1, r0
	mov r0, r0, asr #8
	str r0, [sp, #0x70]
	ldr r0, [sp, #0x30]
	bl sub_020018D0
	ldr r1, [sp, #0x70]
	mul r0, r1, r0
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x30]
	bl sub_02001980
	ldr r1, [sp, #0x70]
	mul r2, r1, r0
_0232367C:
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #0x54]
	add r0, r0, r2
	mov r0, r0, asr #8
	strh r0, [sp, #0x98]
	ldr r0, [sp, #0x4c]
	ldr r2, _0232390C ; =DUNGEON_PTR
	sub r0, r1, r0
	mov r0, r0, asr #8
	ldr r3, [r2]
	strh r0, [sp, #0x9a]
	ldr r2, _02323910 ; =0x0001A226
	ldr r0, [sp, #0x94]
	ldrsh r3, [r3, r2]
	ldr r2, [sp, #0x54]
	add r1, sp, #0x98
	rsb r2, r3, r2, asr #8
	add r3, r2, r2, lsr #31
	ldr r2, [sp, #0x38]
	add r2, r2, r3, asr #1
	bl ov10_022BEB2C
_023236D0:
	mov r0, #0x30
	bl AdvanceFrame
	ldr r1, [sp, #0x5c]
	ldr r0, [sp, #0x2c]
	cmp r5, #0
	add r0, r1, r0
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0x28]
	add sl, sl, r0
	blt _02323718
	ldr r1, [sp, #0x58]
	ldr r0, [sp, #0x24]
	add r0, r1, r0
	str r0, [sp, #0x58]
	ldr r1, [sp, #0x54]
	ldr r0, [sp, #0x20]
	add r0, r1, r0
	str r0, [sp, #0x54]
_02323718:
	ldr r0, [sp, #0x80]
	add sb, sb, r0
	ldr r0, [sp, #0x78]
	add r0, r0, #1
	str r0, [sp, #0x78]
_0232372C:
	ldr r1, [sp, #0x78]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	blt _02323538
	b _0232374C
_02323740:
	ldr r1, [sp, #0x80]
	ldr r0, [sp, #0x18]
	mla sb, r1, r0, sb
_0232374C:
	ldrsh r0, [sp, #0xbc]
	ldrsh r1, [sp, #0xbe]
	bl GetTile
	mov sl, r0
	ldrh r0, [sl]
	tst r0, #3
	beq _02323830
	ldr r0, [sl, #0xc]
	cmp r0, #0
	beq _02323818
	ldr r0, [r0]
	cmp r0, #1
	bne _02323818
	mov r0, r8
	mov r1, #0x2e
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _023237A8
	mov r0, r8
	mov r1, #0x60
	bl ExclusiveItemEffectIsActive__02323918
	cmp r0, #0
	beq _023237BC
_023237A8:
	mov r0, r8
	ldr r1, [sl, #0xc]
	bl ov29_022FAFD4
	cmp r0, #0
	bne _02323818
_023237BC:
	ldr r0, [sl, #0xc]
	mov r1, r7
	bl TwoTurnMoveForcedMiss
	cmp r0, #0
	bne _02323818
	mov r0, r8
	mov r1, #1
	bl ov29_023024E0
	mov r4, r0
	mov r0, r8
	mov r1, r7
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	ldr r1, [sl, #0xc]
	mov r2, r0
	stmia sp, {r1, r7}
	add r1, sp, #0xa8
	mov r0, #0
	mov r3, r8
	str r4, [sp, #8]
	bl ov29_023243B4
	str r0, [sp, #0x88]
	b _02323830
_02323818:
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
_02323824:
	ldr r0, [sp, #0x14]
	cmp r0, r6
	blt _023233FC
_02323830:
	ldr r0, [sp, #0xb0]
	cmp r0, #0
	blt _02323848
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BDE50
_02323848:
	cmp r5, #0
	blt _0232385C
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BDE50
_0232385C:
	mov r0, #0
	bl ov29_0234B4CC
	ldrh r1, [r7, #4]
	ldr r0, _02323914 ; =0x000001E5
	cmp r1, r0
	bne _0232387C
	mov r0, #1
	bl AnimationDelayOrSomething
_0232387C:
	ldr r0, [sp, #0x88]
	cmp r0, #0
	ble _023238B4
	ldr r1, [sp, #0x88]
	add r0, sp, #0xa8
	mov r2, #0
	str r2, [r0, r1, lsl #2]
	ldr r4, [sp, #0xec]
	ldr r3, [sp, #0xe8]
	mov r1, r8
	mov r2, r7
	str r4, [sp]
	bl ExecuteMoveEffect
	b _023238EC
_023238B4:
	cmp r6, #1
	bne _023238EC
	add r0, sp, #0xbc
	bl ov29_022E2CA0
	cmp r0, #0
	beq _023238EC
	mov r0, #1
	mov r1, #0x4a
	bl ov29_022EA370
	add r3, sp, #0xbc
	mov r0, r8
	mov r2, r7
	mov r1, #0
	bl PlayMoveAnimation
_023238EC:
	add sp, sp, #0xc0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023238F4: .word ov29_02352A54
_023238F8: .word DIRECTIONS_XY
_023238FC: .word ov29_0235171E
_02323900: .word ov29_0235175C
_02323904: .word 0x00000FFF
_02323908: .word ov29_02352A6C
_0232390C: .word DUNGEON_PTR
#ifdef JAPAN
_02323910: .word 0x0001A182
#else
_02323910: .word 0x0001A226
#endif
_02323914: .word 0x000001E5
	arm_func_end ov29_023230FC

	arm_func_start ExclusiveItemEffectIsActive__02323918
ExclusiveItemEffectIsActive__02323918: ; 0x02323918
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
	arm_func_end ExclusiveItemEffectIsActive__02323918

	arm_func_start ov29_0232393C
ov29_0232393C: ; 0x0232393C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x38
	ldr r0, [r0, #0xb4]
	mov sb, r2
	str r0, [sp, #0x18]
	mov sl, r1
	ldrh r0, [sb, #4]
	ldr r1, [sp, #0x60]
	str r3, [sp]
	str r1, [sp, #0x60]
	ldr r7, [sl, #0xb4]
	bl GetMoveAnimationSpeed
	cmp r0, #1
	moveq r6, #2
	beq _02323984
	cmp r0, #2
	moveq r6, #3
	movne r6, #6
_02323984:
	ldr r0, [sp, #0x18]
	ldr r4, _02323C30 ; =DIRECTIONS_XY
	ldrb r1, [r0, #0x4c]
	ldrsh r0, [sl, #4]
	ldr r5, _02323C34 ; =ov29_0235171E
	add r1, r1, #4
	strh r0, [sp, #0x34]
	and r0, r1, #7
	mov r8, r0, lsl #2
	ldrsh r4, [r4, r8]
	ldrsh r3, [sl, #6]
	add r1, sp, #0x34
	str r4, [sp, #0x24]
	ldrsh r4, [r5, r8]
	strh r3, [sp, #0x36]
	ldr r3, [sp]
	mov r0, sl
	mov r2, sb
	str r4, [sp, #0x20]
	bl ov29_02322F78
	mov r4, r0
	mov r1, r6
	mov r0, #0x18
	bl _s32_div_f
	str r0, [sp, #4]
	ldr r0, [sp]
	cmp r0, #2
	mov r2, r0
	ldr r0, [sp, #4]
	mul r1, r2, r0
	blt _02323A18
	add r0, r1, #8
	str r0, [sp, #0x14]
	cmp r0, #0x40
	movge r0, #0x40
	strge r0, [sp, #0x14]
	b _02323A20
_02323A18:
	mov r0, #0x20
	str r0, [sp, #0x14]
_02323A20:
	mov r0, #0x80000
	mov r5, #0
	bl _s32_div_f
	str r0, [sp, #0x1c]
	ldrb r2, [r7, #0x4c]
	ldr r1, _02323C38 ; =ov29_02352A8C
	mov r0, #1
	ldr r1, [r1, r2, lsl #2]
	str r1, [sp, #0x10]
	bl ov29_0234B4CC
	ldr r0, [sp, #0x24]
	mov r2, r6, lsl #8
	mul r1, r0, r2
	ldr r0, [sp, #0x20]
	str r1, [sp, #0xc]
	mul r1, r0, r2
	mov fp, r5
	str r1, [sp, #8]
	b _02323BC0
_02323A6C:
	ldrsh r2, [sp, #0x34]
	cmp r2, #0
	ldrgesh r1, [sp, #0x36]
	cmpge r1, #0
	blt _02323BCC
	cmp r2, #0x38
	cmplt r1, #0x20
	bge _02323BCC
	ldr r0, [sp, #0x24]
	ldrh r6, [sp, #0x34]
	add r2, r2, r0
	ldr r0, [sp, #0x20]
	ldrh r3, [sp, #0x36]
	add r1, r1, r0
	add r0, sp, #0x34
	strh r6, [sp, #0x30]
	strh r3, [sp, #0x32]
	strh r2, [sp, #0x34]
	strh r1, [sp, #0x36]
	bl ov29_022E2CA0
	cmp r0, #0
	beq _02323BB0
	ldr r0, _02323C3C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x19a]
#else
	ldrb r0, [r0, #0x23e]
#endif
	cmp r0, #0
	bne _02323BB0
	ldrsh r2, [sp, #0x30]
	ldrsh r1, [sp, #0x32]
	mov r0, #0x18
	smulbb r2, r2, r0
	smulbb r0, r1, r0
	add r0, r0, #0x10
	mov r8, r0, lsl #8
	mov r0, r4, lsl #0x10
	add r1, r2, #0xc
	mov r0, r0, asr #0x10
	mov r7, r1, lsl #8
	mov r6, #0
	str r0, [sp, #0x28]
	b _02323BA0
_02323B14:
	cmp r4, #0
	blt _02323B7C
	ldr r0, [sp, #0x60]
	cmp r0, #1
	movne r0, #0
	bne _02323B3C
	mov r0, r5, asr #8
	bl sub_020018D0
	ldr r1, [sp, #0x14]
	mul r0, r1, r0
_02323B3C:
	sub r0, r8, r0
	ldr r2, _02323C3C ; =DUNGEON_PTR
	mov r0, r0, asr #8
	strh r0, [sp, #0x2e]
	mov r0, r7, asr #8
	ldr r3, [r2]
	strh r0, [sp, #0x2c]
	ldr r2, _02323C40 ; =0x0001A226
	ldr r0, [sp, #0x28]
	ldrsh r2, [r3, r2]
	add r1, sp, #0x2c
	rsb r2, r2, r8, asr #8
	add r3, r2, r2, lsr #31
	ldr r2, [sp, #0x10]
	add r2, r2, r3, asr #1
	bl ov10_022BEB2C
_02323B7C:
	mov r0, #0x30
	bl AdvanceFrame
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	add r7, r7, r0
	ldr r0, [sp, #8]
	add r8, r8, r0
	ldr r0, [sp, #0x1c]
	add r5, r5, r0
_02323BA0:
	ldr r0, [sp, #4]
	cmp r6, r0
	blt _02323B14
	b _02323BBC
_02323BB0:
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #4]
	mla r5, r1, r0, r5
_02323BBC:
	add fp, fp, #1
_02323BC0:
	ldr r0, [sp]
	cmp fp, r0
	blt _02323A6C
_02323BCC:
	cmp r4, #0
	blt _02323BE0
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BDE50
_02323BE0:
	mov r0, #1
	bl AnimationDelayOrSomething
	mov r0, #0
	bl ov29_0234B4CC
	mov r0, #1
	mov r1, #0x4a
	bl ov29_022EA370
	ldrh r1, [sb, #4]
	ldr r0, _02323C44 ; =0x00000232
	add r3, sp, #0x34
	cmp r1, r0
	ldreq r0, [sp, #0x18]
	moveq r1, #0
#ifdef JAPAN
	streqb r1, [r0, #0x16c]
#else
	streqb r1, [r0, #0x170]
#endif
	mov r0, sl
	mov r2, sb
	mov r1, #0
	bl PlayMoveAnimation
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02323C30: .word DIRECTIONS_XY
_02323C34: .word ov29_0235171E
_02323C38: .word ov29_02352A8C
_02323C3C: .word DUNGEON_PTR
#ifdef JAPAN
_02323C40: .word 0x0001A182
#else
_02323C40: .word 0x0001A226
#endif
_02323C44: .word 0x00000232
	arm_func_end ov29_0232393C

	arm_func_start MoveHitCheck
MoveHitCheck: ; 0x02323C48
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov fp, r2
	mov r7, r0
	mov r6, r1
	mov r0, fp
	mov r1, r3
	bl GetMoveAccuracyOrAiChance
	mov r8, r0
	mov r0, #0x64
	bl DungeonRandInt
	mov r1, #0
	str r1, [sp, #4]
	ldr sb, [r7, #0xb4]
	str r0, [sp, #8]
	ldrsh r0, [sb, #2]
	mov r1, r1
	str r1, [sp]
	ldr r5, [r6, #0xb4]
	bl GetMonsterGenderVeneer
	cmp r0, #2
	moveq r0, #1
	streq r0, [sp, #4]
	ldrsh r0, [r5, #2]
	bl GetMonsterGenderVeneer
	cmp r0, #2
	moveq r0, #1
	streq r0, [sp]
	ldrb r0, [sp, #0x30]
	mov sl, #0
	mov r4, sl
	cmp r0, #0
	beq _02323CD8
	cmp r7, r6
	moveq r0, #1
	beq _02324008
_02323CD8:
	ldrh r1, [fp, #4]
	ldr r0, _02324010 ; =0x00000163
	cmp r1, r0
	bne _02323D00
	mov r0, r7
	mov r1, #4
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r0, #1
	bne _02324008
_02323D00:
	ldrb r0, [sb, #0xec]
	cmp r0, #1
	moveq r0, #1
	beq _02324008
	cmp r0, #2
	moveq r0, #0
	beq _02324008
	cmp r8, #0x64
	movgt r0, #1
	bgt _02324008
	mov r0, r6
	mov r1, #0x6f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _02323D4C
	mov r0, r6
	mov r1, #0x2a
	bl HasHeldItem
_02323D4C:
	cmp r0, #0
	ldrne r0, _02324014 ; =DETECT_BAND_MOVE_ACCURACY_DROP
	mov r1, #5
	ldrne r0, [r0]
	subne r8, r8, r0
	mov r0, r6
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrne r0, _02324018 ; =QUICK_DODGER_MOVE_ACCURACY_DROP
	mov r1, #0x33
	ldrne r0, [r0]
	ldrsh sb, [sb, #0x2c]
	subne r8, r8, r0
	mov r0, r7
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrh r0, [fp, #4]
	addne sl, sl, #2
	cmp r0, #0x40
	bne _02323DB8
	mov r0, r7
	bl GetApparentWeather
	cmp r0, #4
	moveq r0, #1
	beq _02324008
	cmp r0, #1
	subeq sl, sl, #2
_02323DB8:
	ldrh r1, [fp, #4]
	ldr r0, _0232401C ; =0x0000010E
	cmp r1, r0
	bne _02323DDC
	mov r0, r7
	bl GetApparentWeather
	cmp r0, #5
	moveq r0, #1
	beq _02324008
_02323DDC:
	mov r0, r7
	mov r1, #0x30
	bl IqSkillIsEnabled
	cmp r0, #0
	addne sl, sl, #1
	ldrb r0, [r5, #0xfe]
	add sb, sb, sl
	ldrsh sl, [r5, #0x2e]
	cmp r0, #0
	mov r0, r6
	movne sl, #0xa
	bl GetApparentWeather
	cmp r0, #2
	bne _02323E30
	mov r0, r7
	mov r1, r6
	mov r2, #0x1d
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02322D64
	cmp r0, #0
	addne r4, r4, #2
_02323E30:
	mov r0, r7
	mov r1, #0x30
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02323E54
	ldrh r0, [fp, #4]
	bl MoveIsNotPhysical
	cmp r0, #0
	addeq r4, r4, #2
_02323E54:
	mov r0, r6
	mov r1, #0x3f
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _02323E94
	ldrsh r2, [r5, #0x12]
	ldrsh r1, [r5, #0x16]
	ldr r0, _02324020 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r5, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	addle r4, r4, #2
_02323E94:
	mov r0, r6
	mov r1, #0x30
	bl IqSkillIsEnabled
	cmp r0, #0
	mov r0, r7
	mov r1, r6
	mov r2, #0x62
#ifndef JAPAN
	mov r3, #1
#endif
	subne r4, r4, #1
	bl DefenderAbilityIsActive__02322D64
	cmp r0, #0
	beq _02323ED8
	ldrb r0, [r5, #0xd0]
	cmp r0, #2
	ldrneb r0, [r5, #0xf1]
	cmpne r0, #2
	addeq r4, r4, #3
_02323ED8:
	mov r0, r7
	mov r1, r6
	mov r2, #0x77
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02322D64
	cmp r0, #0
	beq _02323F18
	mov r0, r6
	bl GetApparentWeather
	cmp r0, #5
	beq _02323F14
	mov r0, r6
	bl GetApparentWeather
	cmp r0, #7
	bne _02323F18
_02323F14:
	add r4, r4, #2
_02323F18:
	mov r0, r6
	bl GetApparentWeather
	ldr r2, _02324024 ; =EXCL_ITEM_EFFECTS_EVASION_BOOST
	ldrb r1, [r2, r0]
	cmp r1, #0
	beq _02323F44
	ldrb r1, [r2, r0]
	mov r0, r6
	bl ExclusiveItemEffectIsActive__02323918
	cmp r0, #0
	addne r4, r4, #1
_02323F44:
	mov r0, r7
	mov r1, #0x6a
	add sl, sl, r4
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne sb, #0xa
	mov r0, r7
	mov r1, r6
	mov r2, #0x6a
#ifndef JAPAN
	mov r3, #1
#endif
	movne sl, sb
	bl DefenderAbilityIsActive__02322D64
	cmp r0, #0
	movne sb, #0xa
	movne sl, sb
	cmp sb, #0
	movlt sb, #0
	blt _02323F94
	cmp sb, #0x14
	movgt sb, #0x14
_02323F94:
	ldr r2, _02324028 ; =MALE_ACCURACY_STAGE_MULTIPLIERS
	ldr r0, [sp, #4]
	mov r1, #0xa8
	mla r1, r0, r1, r2
	ldr r3, [r1, sb, lsl #2]
	cmp sl, #0
	movlt sl, #0
	cmp sl, #0x14
	movgt sl, #0x14
	cmp r3, #0
	movlt r3, #0
	cmp r3, #0x6400
	ldr r2, _0232402C ; =MALE_EVASION_STAGE_MULTIPLIERS
	ldr r0, [sp]
	mov r1, #0xa8
	mla r1, r0, r1, r2
	movgt r3, #0x6400
	mul r0, r8, r3
	ldr r1, [r1, sl, lsl #2]
	mov r8, r0, asr #8
	cmp r1, #0
	movlt r1, #0
	cmp r1, #0x6400
	movgt r1, #0x6400
	mul r1, r8, r1
	ldr r0, [sp, #8]
	cmp r0, r1, asr #8
	movlt r0, #1
	movge r0, #0
_02324008:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02324010: .word 0x00000163
_02324014: .word DETECT_BAND_MOVE_ACCURACY_DROP
_02324018: .word QUICK_DODGER_MOVE_ACCURACY_DROP
_0232401C: .word 0x0000010E
_02324020: .word 0x000003E7
_02324024: .word EXCL_ITEM_EFFECTS_EVASION_BOOST
_02324028: .word MALE_ACCURACY_STAGE_MULTIPLIERS
_0232402C: .word MALE_EVASION_STAGE_MULTIPLIERS
	arm_func_end MoveHitCheck

	arm_func_start ov29_02324030
ov29_02324030: ; 0x02324030
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r1, #1
	mov r4, #0
	mov r8, r2
	bl ov29_023024E0
	mov r6, r0
	mov r0, sb
	mov r1, r4
	bl ov29_023024E0
	str r0, [sp, #0x10]
	mov r0, sb
	mov r1, r8
	mov r2, r4
	bl GetEntityMoveTargetAndRange
	mov r5, r0
	and r0, r5, #0xf
	cmp r0, #4
	bne _023240C0
	mov r0, sb
	mov r1, r8
	bl IsChargingTwoTurnMove
	ldrh r1, [r8, #4]
	mov r5, r0
	cmp r1, #0x97
	bne _023240B4
	mov r0, sb
	bl GetApparentWeather
	cmp r0, #1
	moveq r5, #1
_023240B4:
	cmp r5, #0
	movne r5, #0
	moveq r5, #0x73
_023240C0:
	ands r0, r5, #0xf0
	bne _023240FC
	mov r0, sb
	bl ov29_022F87C0
	cmp r0, #0
	beq _0232439C
	stmia sp, {r0, r8}
	mov r1, sl
	mov r2, r5
	mov r3, sb
	mov r0, #0
	str r6, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
	b _0232439C
_023240FC:
	cmp r0, #0x10
	cmpne r0, #0x20
	bne _023241AC
	cmp r0, #0x20
	ldr r0, [sb, #0xb4]
	mov fp, #0
	ldreqb r7, [r0, #0x4c]
	moveq r0, #8
	ldrneb r1, [r0, #0x4c]
	streq r0, [sp, #0xc]
	movne r0, #3
	strne r0, [sp, #0xc]
	subne r7, r1, #1
	b _0232419C
_02324134:
	and r7, r7, #7
	ldr r1, _023243AC ; =DIRECTIONS_XY
	mov r2, r7, lsl #2
	ldrsh r2, [r1, r2]
	ldrsh r0, [sb, #4]
	add r1, r1, r7, lsl #2
	ldrsh r1, [r1, #2]
	add r0, r0, r2
	strh r0, [sp, #0x14]
	ldrsh r2, [sb, #6]
	add r0, sp, #0x14
	add r1, r2, r1
	strh r1, [sp, #0x16]
	bl PositionHasMonster
	cmp r0, #0
	beq _02324194
	stmia sp, {r0, r8}
	mov r0, r4
	mov r1, sl
	mov r2, r5
	mov r3, sb
	str r6, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
_02324194:
	add fp, fp, #1
	add r7, r7, #1
_0232419C:
	ldr r0, [sp, #0xc]
	cmp fp, r0
	blt _02324134
	b _0232439C
_023241AC:
	cmp r0, #0x30
	bne _02324248
	mov fp, #0
_023241B8:
	ldr r0, _023243B0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, fp, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xad4]
#else
	ldr r7, [r0, #0xb78]
#endif
	mov r0, r7
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02324238
	mov r0, sb
	mov r1, r7
	bl ov29_022E28D4
	cmp r0, #0
	beq _02324238
	cmp r7, sb
	stmia sp, {r7, r8}
	mov r0, r4
	bne _02324220
	ldr r4, [sp, #0x10]
	mov r1, sl
	mov r2, r5
	mov r3, sb
	str r4, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
	b _02324238
_02324220:
	mov r1, sl
	mov r2, r5
	mov r3, sb
	str r6, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
_02324238:
	add fp, fp, #1
	cmp fp, #0x14
	blt _023241B8
	b _0232439C
_02324248:
	cmp r0, #0x40
	bne _023242C4
	mov r0, sb
	mov r7, #0
	bl ov29_022F8830
	cmp r0, #0
	beq _02324288
	stmia sp, {r0, r8}
	mov r1, sl
	mov r2, r5
	mov r3, sb
	mov r0, r7
	str r6, [sp, #8]
	bl ov29_023243B4
	movs r4, r0
	movne r7, #1
_02324288:
	cmp r7, #0
	bne _0232439C
	mov r0, sb
	bl ov29_022F88C0
	cmp r0, #0
	beq _0232439C
	stmia sp, {r0, r8}
	mov r0, r4
	mov r1, sl
	mov r2, r5
	mov r3, sb
	str r6, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
	b _0232439C
_023242C4:
	cmp r0, #0x50
	beq _0232439C
	cmp r0, #0x80
	cmpne r0, #0x90
	bne _0232430C
	mov r0, sb
	bl ov29_022F8830
	cmp r0, #0
	beq _0232439C
	stmia sp, {r0, r8}
	mov r1, sl
	mov r2, r5
	mov r3, sb
	mov r0, #0
	str r6, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
	b _0232439C
_0232430C:
	cmp r0, #0x60
	bne _02324370
	mov r7, #0
_02324318:
	ldr r0, _023243B0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr fp, [r0, #0xad4]
#else
	ldr fp, [r0, #0xb78]
#endif
	mov r0, fp
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02324360
	str fp, [sp]
	str r8, [sp, #4]
	mov r0, r4
	mov r1, sl
	mov r2, r5
	mov r3, sb
	str r6, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
_02324360:
	add r7, r7, #1
	cmp r7, #0x14
	blt _02324318
	b _0232439C
_02324370:
	cmp r0, #0x70
	bne _0232439C
	str sb, [sp]
	str r8, [sp, #4]
	mov r1, sl
	mov r2, r5
	mov r3, sb
	mov r0, #0
	str r6, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
_0232439C:
	mov r0, #0
	str r0, [sl, r4, lsl #2]
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023243AC: .word DIRECTIONS_XY
_023243B0: .word DUNGEON_PTR
	arm_func_end ov29_02324030

	arm_func_start ov29_023243B4
ov29_023243B4: ; 0x023243B4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, [sp, #0x1c]
	ldr r5, [sp, #0x18]
	ldrh r4, [r4, #4]
	mov r7, r1
	mov r8, r0
	cmp r4, #0xfc
	mov r6, r3
	mov r4, #0
	ldr r1, [r5, #0xb4]
	cmpeq r6, r5
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r1, #9]
	cmp r0, #1
	moveq r0, r8
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r1, #0xbc]
	cmp r0, #7
	moveq r0, r8
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	movne r4, #1
	bne _023244C0
	ands r0, r2, #0xf
	cmpne r0, #4
	bne _02324440
	mov r0, r6
	mov r1, r5
	mov r2, #1
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	moveq r4, #1
	b _023244C0
_02324440:
	cmp r0, #1
	bne _02324468
	mov r0, r6
	mov r1, r5
	mov r2, #1
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #0
	moveq r4, #1
	b _023244C0
_02324468:
	cmp r0, #2
	moveq r4, #1
	beq _023244C0
	cmp r0, #5
	bne _02324488
	cmp r6, r5
	movne r4, #1
	b _023244C0
_02324488:
	cmp r0, #6
	bne _023244B8
	mov r0, r6
	mov r1, r5
	mov r2, #1
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #0
	bne _023244C0
	cmp r6, r5
	movne r4, #1
	b _023244C0
_023244B8:
	cmp r0, #3
	moveq r4, #1
_023244C0:
	ldr r1, [sp, #0x1c]
	mov r0, r5
	bl TwoTurnMoveForcedMiss
	cmp r0, #0
	movne r4, #0
	cmp r4, #0
	beq _02324508
	cmp r8, #0x40
	bge _02324508
	str r5, [r7, r8, lsl #2]
	ldr r0, [r5, #0xb4]
	add r8, r8, #1
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldreq r0, _02324510 ; =ov29_0235370C
	ldreq r1, [r0]
	cmpeq r1, #0
	streq r5, [r0]
_02324508:
	mov r0, r8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02324510: .word ov29_0235370C
	arm_func_end ov29_023243B4

	arm_func_start ov29_02324514
ov29_02324514: ; 0x02324514
	stmdb sp!, {r3, lr}
	bl GetMoveNbStrikes
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #2
	mov r1, #6
	bl DungeonRandRange
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02324514

	arm_func_start IsHyperBeamVariant
IsHyperBeamVariant: ; 0x02324534
	ldrh r2, [r0, #4]
	cmp r2, #0xee
	moveq r0, #1
	bxeq lr
	cmp r2, #0xef
	moveq r0, #1
	bxeq lr
	cmp r2, #0xf2
	moveq r0, #1
	bxeq lr
	cmp r2, #0x110
	moveq r0, #1
	bxeq lr
	ldr r1, _023245A0 ; =0x000001C5
	cmp r2, r1
	moveq r0, #1
	bxeq lr
	add r0, r1, #2
	cmp r2, r0
	moveq r0, #1
	bxeq lr
	add r0, r1, #0x29
	cmp r2, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_023245A0: .word 0x000001C5
	arm_func_end IsHyperBeamVariant

	arm_func_start IsChargingTwoTurnMove
IsChargingTwoTurnMove: ; 0x023245A4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__02321438
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr ip, [r5, #0xb4]
	mov lr, #0
	ldr r2, _02324618 ; =TWO_TURN_MOVES_AND_STATUSES
	b _02324608
_023245D0:
	mov r3, lr, lsl #2
	ldrh r1, [r2, r3]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r0, [r4, #4]
	cmp r0, r1
	addeq r0, r2, r3
	ldreqb r1, [ip, #0xd2]
	ldreqb r0, [r0, #2]
	cmpeq r1, r0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	add lr, lr, #1
_02324608:
	cmp lr, #0x64
	blt _023245D0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02324618: .word TWO_TURN_MOVES_AND_STATUSES
	arm_func_end IsChargingTwoTurnMove

	arm_func_start IsChargingAnyTwoTurnMove
IsChargingAnyTwoTurnMove: ; 0x0232461C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__02321438
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr ip, [r5, #0xb4]
	mov r3, #0
	ldr r2, _02324694 ; =ov29_02352A60
	b _0232466C
_02324648:
	ldrb r1, [r2, r3]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [ip, #0xd2]
	cmp r0, r1
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	add r3, r3, #1
_0232466C:
	cmp r3, #0x64
	blt _02324648
	cmp r4, #0
	beq _0232468C
	ldrb r0, [ip, #0xd2]
	cmp r0, #0xb
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
_0232468C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02324694: .word ov29_02352A60
	arm_func_end IsChargingAnyTwoTurnMove

	arm_func_start ov29_02324698
ov29_02324698: ; 0x02324698
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x140
	mov r6, #0
	ldr fp, _02324740 ; =DUNGEON_PTR
	mov r7, r6
	add r4, sp, #0
_023246B0:
	ldr r0, [fp]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sb, [r0, #0xad4]
#else
	ldr sb, [r0, #0xb78]
#endif
	mov r0, sb
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _0232470C
	ldr r0, [sb, #0xb4]
	mov r8, #0
#ifdef JAPAN
	add r5, r0, #0x120
#else
	add r5, r0, #0x124
#endif
_023246DC:
	add sl, r5, r8, lsl #3
	mov r0, sb
	mov r1, sl
	bl ov29_02324748
	cmp r0, #0
	beq _02324700
	cmp r6, #0x50
	strlt sl, [r4, r6, lsl #2]
	addlt r6, r6, #1
_02324700:
	add r8, r8, #1
	cmp r8, #4
	blt _023246DC
_0232470C:
	add r7, r7, #1
	cmp r7, #0x14
	blt _023246B0
	cmp r6, #0
	ldreq r0, _02324744 ; =0x00000163
	beq _02324738
	mov r0, r6
	bl DungeonRandInt
	add r1, sp, #0
	ldr r0, [r1, r0, lsl #2]
	ldrh r0, [r0, #4]
_02324738:
	add sp, sp, #0x140
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02324740: .word DUNGEON_PTR
_02324744: .word 0x00000163
	arm_func_end ov29_02324698

	arm_func_start ov29_02324748
ov29_02324748: ; 0x02324748
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldrb r1, [r4]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _02324788
	ldrh r1, [r4, #4]
	bl ov29_02324D60
	cmp r0, #0
	bne _02324788
	ldrh r0, [r4, #4]
	bl IsCopyingMove
	cmp r0, #0
	beq _02324790
_02324788:
	mov r0, #0
	ldmia sp!, {r4, pc}
_02324790:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02324748

	arm_func_start HasMaxGinsengBoost99
HasMaxGinsengBoost99: ; 0x02324798
	stmdb sp!, {r3, lr}
	bl GetMoveMaxGinsengBoost
	cmp r0, #0x63
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end HasMaxGinsengBoost99

	arm_func_start ov29_023247B4
ov29_023247B4: ; 0x023247B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov r8, r0
	ldr r0, [r8, #0xb4]
	mov r7, #0
	mov r6, r7
#ifdef JAPAN
	add r5, r0, #0x120
#else
	add r5, r0, #0x124
#endif
	add r4, sp, #0
_023247D4:
	add sb, r5, r6, lsl #3
	mov r0, r8
	mov r1, sb
	bl ov29_02324748
	cmp r0, #0
	beq _02324814
	mov r0, sb
	bl HasMaxGinsengBoost99
	cmp r0, #0
	beq _02324814
	ldrh r2, [sb, #4]
	add r0, r7, #1
	mov r1, r7, lsl #1
	mov r0, r0, lsl #0x10
	strh r2, [r4, r1]
	mov r7, r0, asr #0x10
_02324814:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #4
	blt _023247D4
	cmp r7, #0
	movle r0, #0
	ble _0232484C
	mov r0, r7
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	add r1, sp, #0
	mov r0, r0, asr #0xf
	ldrh r0, [r1, r0]
_0232484C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_023247B4

	arm_func_start TwoTurnMoveForcedMiss
TwoTurnMoveForcedMiss: ; 0x02324854
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
#ifdef JAPAN
	ldrb r0, [r2, #0x10a]
#else
	ldrb r0, [r2, #0x10b]
#endif
	cmp r0, #1
	bne _023248A4
	ldrh r0, [r1, #4]
	cmp r0, #0x88
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xa2
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x39
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x40
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_023248A4:
	cmp r0, #2
	bne _02324928
	ldrb r0, [r2, #0xd2]
	cmp r0, #9
	bne _023248D8
	ldrh r0, [r1, #4]
	cmp r0, #0x20
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xdb
	bne _02324920
	mov r0, #0
	ldmia sp!, {r3, pc}
_023248D8:
	cmp r0, #0xa
	bne _02324920
	ldrh r0, [r1, #4]
	cmp r0, #0x76
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x128
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x77
	bne _02324920
	bl GetNaturePowerVariant
	ldr r1, _02324930 ; =NATURE_POWER_TABLE
	mov r0, r0, lsl #3
	ldrh r0, [r1, r0]
	cmp r0, #0x76
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_02324920:
	mov r0, #1
	ldmia sp!, {r3, pc}
_02324928:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02324930: .word NATURE_POWER_TABLE
	arm_func_end TwoTurnMoveForcedMiss

	arm_func_start DungeonRandOutcomeUserTargetInteraction
DungeonRandOutcomeUserTargetInteraction: ; 0x02324934
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl IsFloorOver
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl EntityIsValid__02321438
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl EntityIsValid__02321438
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r1, [r5, #0xb4]
#ifdef JAPAN
	ldrb r0, [r1, #0x15e]
#else
	ldrb r0, [r1, #0x162]
#endif
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsh r0, [r1, #0x10]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r4, #0
	beq _023249DC
	mov r0, r6
	mov r1, #0x26
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023249CC
	mov r0, r4, lsl #1
	bl DungeonRandOutcome__022EAB50
	mov r4, r0
	b _023249E0
_023249CC:
	mov r0, r4
	bl DungeonRandOutcome__022EAB50
	mov r4, r0
	b _023249E0
_023249DC:
	mov r4, #1
_023249E0:
	cmp r4, #0
	cmpne r6, r5
	beq _02324A18
	mov r0, r6
	mov r1, r5
	mov r2, #0x4c
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02322D64
	cmp r0, #0
	beq _02324A18
	mov r0, r5
	bl ov29_022E65A8
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02324A18:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DungeonRandOutcomeUserTargetInteraction

	arm_func_start DungeonRandOutcomeUserAction
DungeonRandOutcomeUserAction: ; 0x02324A20
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__02321438
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, #0x26
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02324A68
	mov r0, r4, lsl #1
	bl DungeonRandOutcome__022EAB50
	ldmia sp!, {r3, r4, r5, pc}
_02324A68:
	mov r0, r4
	bl DungeonRandOutcome__022EAB50
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DungeonRandOutcomeUserAction

	arm_func_start CanAiUseMove
CanAiUseMove: ; 0x02324A74
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	ldr r3, [r6, #0xb4]
	mov r5, r2
#ifdef JAPAN
	add r0, r3, #0x120
#else
	add r0, r3, #0x124
#endif
	ldrb r2, [r0, r1, lsl #3]
	add r4, r0, r1, lsl #3
	tst r2, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	tst r2, #2
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	tst r2, #0x20
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrh r0, [r4, #2]
	tst r0, #1
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r8, #0
#ifdef JAPAN
	add r7, r3, #0x140
#else
	add r7, r3, #0x144
#endif
	b _02324B14
_02324ADC:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl CanMonsterUseMove
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r4, r4, #8
	cmp r4, r7
	bhs _02324B1C
	ldrb r0, [r4]
	tst r0, #2
	beq _02324B1C
	add r8, r8, #1
_02324B14:
	cmp r8, #4
	blt _02324ADC
_02324B1C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end CanAiUseMove

	arm_func_start CanMonsterUseMove
CanMonsterUseMove: ; 0x02324B24
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldrh r3, [r5, #4]
	ldr r1, _02324BE4 ; =0x00000163
	ldr r4, [r0, #0xb4]
	cmp r3, r1
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5]
	tst r0, #0x20
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrh r0, [r5, #2]
	tst r0, #1
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r2, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5, #6]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xd0]
	cmp r0, #5
	bne _02324BA0
	mov r0, r5
	bl IsAffectedByTaunt
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02324BA0:
	ldrb r0, [r4, #0xd0]
	cmp r0, #6
	bne _02324BDC
	ldrh r0, [r5, #4]
	cmp r0, #0x160
	bne _02324BCC
#ifdef JAPAN
	ldrb r0, [r4, #0x140]
#else
	ldrb r0, [r4, #0x144]
#endif
	tst r0, #0x10
	bne _02324BDC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02324BCC:
	ldrb r0, [r5]
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02324BDC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02324BE4: .word 0x00000163
	arm_func_end CanMonsterUseMove

	arm_func_start ov29_02324BE8
ov29_02324BE8: ; 0x02324BE8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldrh r3, [r5, #4]
	ldr r1, _02324C98 ; =0x00000163
	ldr r4, [r0, #0xb4]
	cmp r3, r1
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5]
	tst r0, #0x20
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrh r0, [r5, #2]
	tst r0, #1
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r2, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xd0]
	cmp r0, #5
	bne _02324C54
	mov r0, r5
	bl IsAffectedByTaunt
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02324C54:
	ldrb r0, [r4, #0xd0]
	cmp r0, #6
	bne _02324C90
	ldrh r0, [r5, #4]
	cmp r0, #0x160
	bne _02324C80
#ifdef JAPAN
	ldrb r0, [r4, #0x140]
#else
	ldrb r0, [r4, #0x144]
#endif
	tst r0, #0x10
	bne _02324C90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02324C80:
	ldrb r0, [r5]
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02324C90:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02324C98: .word 0x00000163
	arm_func_end ov29_02324BE8

	arm_func_start ov29_02324C9C
ov29_02324C9C: ; 0x02324C9C
	stmdb sp!, {lr}
	sub sp, sp, #0x104
	mov ip, #0
	mov lr, ip
	add r2, sp, #0
	b _02324CDC
_02324CB4:
	ldr r3, [r0, lr, lsl #2]
	cmp r3, #0
	beq _02324CE4
	cmp r3, r1
	beq _02324CD8
	cmp ip, #0x40
	bge _02324CE4
	str r3, [r2, ip, lsl #2]
	add ip, ip, #1
_02324CD8:
	add lr, lr, #1
_02324CDC:
	cmp lr, #0x41
	blt _02324CB4
_02324CE4:
	mov lr, #0
	add r2, sp, #0
	b _02324D18
_02324CF0:
	ldr r3, [r0, lr, lsl #2]
	cmp r3, #0
	beq _02324D20
	cmp r3, r1
	bne _02324D14
	cmp ip, #0x40
	bge _02324D20
	str r3, [r2, ip, lsl #2]
	add ip, ip, #1
_02324D14:
	add lr, lr, #1
_02324D18:
	cmp lr, #0x41
	blt _02324CF0
_02324D20:
	mov r2, #0
	add r1, sp, #0
	b _02324D34
_02324D2C:
	str r2, [r1, ip, lsl #2]
	add ip, ip, #1
_02324D34:
	cmp ip, #0x41
	blt _02324D2C
	mov r3, #0
	add r2, sp, #0
_02324D44:
	ldr r1, [r2, r3, lsl #2]
	str r1, [r0, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #0x41
	blt _02324D44
	add sp, sp, #0x104
	ldmia sp!, {pc}
	arm_func_end ov29_02324C9C

	arm_func_start ov29_02324D60
ov29_02324D60: ; 0x02324D60
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r4, #0x97
	bne _02324D80
	bl GetApparentWeather
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
_02324D80:
	mov r0, r4
	bl Is2TurnsMove
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02324D60

	arm_func_start UpdateMovePp
UpdateMovePp: ; 0x02324D8C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__02321438
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0xb4]
	mov r1, #0
_02324DAC:
#ifdef JAPAN
	add r2, r0, #0x120
#else
	add r2, r0, #0x124
#endif
	ldrb r3, [r2, r1, lsl #3]
	add r2, r2, r1, lsl #3
	tst r3, #1
	movne r3, #1
	moveq r3, #0
	tst r3, #0xff
	beq _02324E34
	ldrh r3, [r2, #2]
	mov lr, #1
	tst r3, #0x10
	bicne r3, r3, #0x10
	strneh r3, [r2, #2]
	ldrh r3, [r2, #2]
	movne lr, #2
	tst r3, #0x40
	bicne r3, r3, #0x40
	strneh r3, [r2, #2]
	ldrh r3, [r2, #2]
	movne lr, #4
	tst r3, #8
	bicne r3, r3, #8
	strneh r3, [r2, #2]
	cmpne r4, #0
	beq _02324E34
	mov ip, #0
	b _02324E2C
_02324E18:
	ldrb r3, [r2, #6]
	add ip, ip, #1
	cmp r3, #0
	subne r3, r3, #1
	strneb r3, [r2, #6]
_02324E2C:
	cmp ip, lr
	blt _02324E18
_02324E34:
	add r1, r1, #1
	cmp r1, #4
	blt _02324DAC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpdateMovePp

	arm_func_start GetDamageSourceWrapper
GetDamageSourceWrapper: ; 0x02324E44
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl LowerSshort
	mov r1, r0
	ldrh r0, [r4, #4]
	bl GetDamageSource
	ldmia sp!, {r4, pc}
	arm_func_end GetDamageSourceWrapper

	arm_func_start LowerSshort
LowerSshort: ; 0x02324E64
	cmp r0, #0
	moveq r0, #0
	movne r0, r0, lsl #0x10
	movne r0, r0, asr #0x10
	bx lr
	arm_func_end LowerSshort

	arm_func_start ov29_02324E78
ov29_02324E78: ; 0x02324E78
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov r7, r0
	mov r6, r1
	mov r8, r2
	bl ShouldMovePlayAlternativeAnimation
	mov r4, r0
	mov r0, r7
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r6, #4]
	mov r2, r4
	bl GetMoveAnimationId
	bl ov10_022BFD58
	mov sl, r0
	mov r0, r7
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r6, #4]
	mov r2, r4
	bl GetMoveAnimationId
	bl GetMoveAnimation
	ldrsh r5, [r0]
	mov r0, r7
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	moveq r0, sl
	beq _023250C8
	mov r0, r7
	mov r1, r6
	bl ov29_02325D20
	cmp r0, #0
	movne r0, sl
	bne _023250C8
	cmp r8, #0
	moveq r0, sl
	beq _023250C8
	cmp r5, #0
	beq _023250C4
	mov r0, r7
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r6, #4]
	mov r2, r4
	bl GetMoveAnimationId
	mov r4, r0
	ldrh r0, [r6, #4]
	ldr r5, [r7, #0xb4]
	bl ov10_022BFD8C
	mov sb, r0
	mov r0, r7
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r6, #4]
	mov r2, #1
	bl GetMoveAnimationId
	mov r1, r0
	ldrsh r0, [r5, #4]
	bl ov10_022BF01C
	mov r2, r0
	mvn r0, #0
	cmp r2, r0
	ldreq r0, _023250D0 ; =ov29_02352AD8
	ldreqh r1, [r0, #8]
	streqh r1, [sp, #8]
	ldreqh r0, [r0, #0xa]
	streqh r0, [sp, #0xa]
	beq _02324F98
	add r0, sp, #8
	add r1, r7, #0x2c
	and r2, r2, #0xff
	bl sub_0201CF90
_02324F98:
	strh r4, [sp]
	ldrsh r1, [r5, #4]
	add r0, sp, #0
	mov r2, #0
	strh r1, [sp, #2]
	ldr r3, [r7, #0xc]
	mov r1, #1
	mov r3, r3, asr #8
	strh r3, [sp, #4]
	ldr r3, [r7, #0x10]
	mov r3, r3, asr #8
	strh r3, [sp, #6]
	ldrb r3, [r5, #0x4c]
	str r3, [sp, #0xc]
	str r2, [sp, #0x10]
	bl ov29_02325D7C
	mov r0, #0x58
	bl AdvanceFrame
	add r0, sp, #0
	bl ov10_022BFAA8
	mov r1, r7
	mov r2, #5
	mov r8, r0
	bl ov29_022E6D68
	mov r0, #1
	bl ov29_022DE5F0
	mov r7, r0
	cmp sb, #0
	bne _0232506C
	ldrh r0, [r6, #4]
	bl ov10_022BFDEC
	cmp r0, #0
	beq _0232506C
	mov r6, #0
	bl ov29_022ED0C4
	mov r5, r0
	mov r0, #1
	bl ov29_022E3560
	mov r4, #0xff
	mov fp, #1
	b _02325064
_0232503C:
	add r0, r5, #0x20
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0xff
	movgt r5, r4
	mov r0, r5
	movgt r6, fp
	bl ov29_022ED0D4
	mov r0, #0x26
	bl AdvanceFrame
_02325064:
	cmp r6, #0
	beq _0232503C
_0232506C:
	mov r0, r8, lsl #0x10
	mov r4, r0, asr #0x10
	mov r8, #0
	mov r6, #1
	mov r5, #0x26
	b _023250B0
_02325084:
	beq _023250A8
	cmp r7, #0x20
	subgt r7, r7, #0x20
	movle r7, r8
	mov r0, r7, lsl #0x10
	mov r1, r6
	mov r0, r0, asr #0x10
	movle sb, r8
	bl ov29_022DE5D8
_023250A8:
	mov r0, r5
	bl AdvanceFrame
_023250B0:
	mov r0, r4
	bl AnimationHasMoreFrames
	cmp r0, #0
	cmpne sb, #0
	bne _02325084
_023250C4:
	mov r0, sl
_023250C8:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023250D0: .word ov29_02352AD8
	arm_func_end ov29_02324E78

	arm_func_start ov29_023250D4
ov29_023250D4: ; 0x023250D4
#ifdef JAPAN
#define OV29_023250D4_OFFSET -0xA4
#else
#define OV29_023250D4_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	mov sb, r1
	bl ShouldMovePlayAlternativeAnimation
	mov r8, r0
	ldr r7, [sl, #0xb4]
	mov r1, #0
	mov r0, sl
	str r1, [sp]
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [sb, #4]
	mov r2, r8
	bl GetMoveAnimationId
	mov r1, r0
	ldrsh r0, [r7, #4]
	bl ov10_022BFA3C
	mov r4, r0
	mov r0, sl
	ldr r6, [sl, #0xb4]
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [sb, #4]
	mov r2, r8
	bl GetMoveAnimationId
	mov r5, r0
	bl GetMoveAnimation
	ldrsh r0, [r0, #2]
	cmp r0, #0
	beq _023251E0
	mov r0, sl
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [sb, #4]
	mov r2, r8
	bl GetMoveAnimationId
	mov r1, r0
	ldrsh r0, [r6, #4]
	bl ov10_022BF01C
	mov r2, r0
	mvn r0, #0
	cmp r2, r0
	ldreq r0, _02325608 ; =ov29_02352AD8
	ldreqh r1, [r0, #4]
	streqh r1, [sp, #0xc]
	ldreqh r0, [r0, #6]
	streqh r0, [sp, #0xe]
	beq _023251A8
	add r0, sp, #0xc
	add r1, sl, #0x2c
	and r2, r2, #0xff
	bl sub_0201CF90
_023251A8:
	strh r5, [sp, #4]
	ldrsh r1, [r6, #4]
	mov r0, #0
	strh r1, [sp, #6]
	ldr r1, [sl, #0xc]
	mov r1, r1, asr #8
	strh r1, [sp, #8]
	ldr r1, [sl, #0x10]
	mov r1, r1, asr #8
	strh r1, [sp, #0xa]
	ldrb r1, [r6, #0x4c]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	b _023251E8
_023251E0:
	mov r0, #0
	strh r0, [sp, #4]
_023251E8:
	add r0, sp, #4
	mov r1, #1
	bl ov10_022BF1FC
	cmp r0, #0
	ldrne r0, _0232560C ; =DUNGEON_PTR
	ldrne r0, [r0]
	addne r0, r0, #0x1a000
	ldrne r5, [r0, #0x22c + OV29_023250D4_OFFSET]
	bne _02325228
	ldrh r0, [sb, #4]
	cmp r0, #0x52
	ldreq r0, _0232560C ; =DUNGEON_PTR
	ldreq r0, [r0]
	addeq r0, r0, #0x1a000
	ldreq r5, [r0, #0x22c + OV29_023250D4_OFFSET]
	movne r5, sl
_02325228:
	mov r0, r5
	bl EntityIsValid__02325620
	cmp r0, #0
	moveq r5, sl
	ldr r1, [r5, #0xc]
	mov r0, r5
	mov r1, r1, asr #8
	strh r1, [sp, #8]
	ldr r1, [r5, #0x10]
	mov r1, r1, asr #8
	strh r1, [sp, #0xa]
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	beq _02325600
	mov r0, sl
	mov r1, sb
	bl ov29_02325D20
	cmp r0, #0
	bne _02325600
	ldrh r0, [sb, #4]
	cmp r0, #0x128
	bne _023252E4
	mov r0, #7
	bl DungeonRandInt
	ldr r1, _0232560C ; =DUNGEON_PTR
	ldr r6, _02325610 ; =ov29_02352B1C
	ldr r3, [r1]
	ldr r2, _02325614 ; =ov29_0237CA84
	ldr r6, [r6, r0, lsl #2]
	str r0, [r2]
	add r0, r3, #0x1a000
	str r6, [r0, #0x234 + OV29_023250D4_OFFSET]
	ldr r1, [r1]
	mov r0, #0
	add r1, r1, #0x1a000
	ldr r3, [r1, #0x234 + OV29_023250D4_OFFSET]
	str r3, [r1, #0x238 + OV29_023250D4_OFFSET]
	ldr r1, [r2]
	add r1, r1, #4
	bl ov29_0234B09C
	ldr r1, _02325618 ; =0x00000EAA
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, #0x214
	bl ov29_022E56A0
	b _0232531C
_023252E4:
	cmp r0, #0x76
	bne _0232531C
	ldr r2, _0232560C ; =DUNGEON_PTR
	mov r3, #0xc
	ldr r1, [r2]
	mov r0, r5
	add r1, r1, #0x1a000
	str r3, [r1, #0x234 + OV29_023250D4_OFFSET]
	ldr r2, [r2]
	mov r1, #0x214
	add r2, r2, #0x1a000
	ldr r3, [r2, #0x234 + OV29_023250D4_OFFSET]
	str r3, [r2, #0x238 + OV29_023250D4_OFFSET]
	bl ov29_022E56A0
_0232531C:
	mov r0, sl
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [sb, #4]
	mov r2, r8
	bl GetMoveAnimationId
	mov r1, r0
	ldrsh r0, [r7, #4]
	bl ov10_022BF0F4
	cmp r0, #0x3f00
	beq _02325354
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov29_022EACCC
_02325354:
	cmp r4, #0x63
	bne _023253C8
	mov r0, r5
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	beq _02325600
	mov r3, r8
	add r0, sp, #4
	mov r1, sl
	mov r2, sb
	ldrb r8, [r7, #0x4c]
	bl ov29_02325644
	mov r7, #0
	mov r6, r7
	mov r5, #2
	mov r4, #0x15
_02325394:
	sub r0, r8, #1
	and r8, r0, #7
	mov r0, sl
	mov r1, r6
	mov r2, r8
	bl ChangeMonsterAnimation
	mov r0, r5
	mov r1, r4
	bl ov29_022EA370
	add r7, r7, #1
	cmp r7, #8
	blt _02325394
	b _02325600
_023253C8:
	cmp r4, #0x62
	bne _0232543C
	mov r0, r5
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	beq _02325600
	add r0, sp, #4
	mov r1, sl
	mov r2, sb
	mov r3, r8
	ldrb r7, [r7, #0x4c]
	bl ov29_02325644
	mov r8, #0
	mov r6, r8
	mov r5, #2
	mov r4, #0x15
_02325408:
	and r7, r7, #7
	mov r0, sl
	mov r1, r6
	mov r2, r7
	bl ChangeMonsterAnimation
	mov r0, r5
	mov r1, r4
	bl ov29_022EA370
	add r8, r8, #1
	cmp r8, #8
	add r7, r7, #1
	ble _02325408
	b _02325600
_0232543C:
	ldrb r0, [r7, #0xd8]
	mov fp, #0
	cmp r0, #2
	moveq fp, #1
	beq _02325470
	ldr r0, _0232560C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldr r1, [r0, #0x22c + OV29_023250D4_OFFSET]
	cmp r1, sl
	ldrneb r0, [r0, #0x245 + OV29_023250D4_OFFSET]
	cmpne r0, #0
	movne fp, #1
_02325470:
	ldrb r0, [sl, #0x28]
	cmp r0, #0
	bne _02325524
	mov r5, #0
_02325480:
	ldr r0, _0232560C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb78 + OV29_023250D4_OFFSET]
	mov r0, r6
	bl EntityIsValid__02325620
	cmp r0, #0
	cmpne r6, sl
	ldrneb r0, [r6, #0x28]
	cmpne r0, #0
	beq _023254C8
	ldr r1, [r6, #0xb4]
	mov r0, r6
	ldrb r1, [r1, #0x4c]
	bl ov29_02304A48
	mov r0, #0
	strb r0, [r6, #0x28]
_023254C8:
	add r5, r5, #1
	cmp r5, #0x14
	blt _02325480
	mov r0, #0x59
	bl AdvanceFrame
	cmp fp, #0
	beq _02325500
	ldr r0, _0232561C ; =0x00000229
	bl GetSpriteIndex__02052708
	mov r1, r0
	mov r0, #1
	bl SetAndLoadCurrentAttackAnimation
	mov r5, r0
	b _02325530
_02325500:
	ldrsh r0, [r7, #4]
	bl GetSpriteIndex__02052708
	mov r1, r0
	mov r0, #1
	bl SetAndLoadCurrentAttackAnimation
	mov r1, #0xff
	mov r5, r0
	strb r1, [sl, #0xaf]
	b _02325530
_02325524:
	mov r0, #0x59
	bl AdvanceFrame
	ldrsh r5, [sl, #0xa8]
_02325530:
	ldrb r2, [r7, #0x4c]
	mov r0, sl
	mov r1, r4
	bl ChangeMonsterAnimation
	ldrb r1, [sl, #0xae]
	mov r0, r5
	bl WanTableSpriteHasAnimationGroup
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	strb r0, [sl, #0x28]
	mov r7, #0
	strb r7, [sl, #0x21]
	mov r5, #0x59
	add fp, sp, #4
	b _023255D8
_02325570:
	mov r0, r5
	bl AdvanceFrame
	add r0, sl, #0x2c
	bl sub_0201D1D4
	cmp r4, #0
	cmpne r4, #7
	mov r6, r0
	cmpne r4, #9
	orreq r6, r6, #2
	tst r6, #2
	beq _023255C4
	ldr r0, [sp]
	cmp r0, #0
	bne _023255C4
	mov r0, fp
	mov r1, sl
	mov r2, sb
	mov r3, r8
	bl ov29_02325644
	mov r0, #1
	str r0, [sp]
_023255C4:
	tst r6, #1
	ldreqb r0, [sl, #0x21]
	cmpeq r0, #0
	bne _023255E0
	add r7, r7, #1
_023255D8:
	cmp r7, #0x78
	blt _02325570
_023255E0:
	mov r0, #0
	strb r0, [sl, #0x21]
	ldrh r0, [sb, #4]
	bl ov10_022BFDCC
	cmp r0, #0
	beq _02325600
	mov r0, #1
	bl AnimationDelayOrSomething
_02325600:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02325608: .word ov29_02352AD8
_0232560C: .word DUNGEON_PTR
_02325610: .word ov29_02352B1C
_02325614: .word ov29_0237CA84
#ifdef JAPAN
_02325618: .word 0x00000BEC
#else
_02325618: .word 0x00000EAA
#endif
_0232561C: .word 0x00000229
	arm_func_end ov29_023250D4
