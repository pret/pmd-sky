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
	bl MonsterCannotAttack
	cmp r0, #0
	bne _02321888
	b _02321620
_02321610:
	mov r1, #0
	bl MonsterCannotAttack
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
	ldr r1, _02322D1C ; =METRONOME_NEXT_INDEX
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
	bl MonsterCannotAttack
	cmp r0, #0
	bne _02322C98
	b _02322860
_0232284C:
	mov r0, r6
	mov r1, #0
	bl MonsterCannotAttack
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
	bl BuildMoveTargetList
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
_02322D1C: .word METRONOME_NEXT_INDEX
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
