	.include "asm/macros.inc"
	.include "overlay_29_0231516C.inc"

	.text

	arm_func_start TryInflictCoweringStatus
TryInflictCoweringStatus: ; 0x0231516C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r7, r2
	mov r6, r3
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	mov r1, r4
	mov r2, r7
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	mov r1, r4
	mov r2, r7
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	ldr r6, [r4, #0xb4]
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r6, #0xd0]
	cmp r0, #4
	beq _02315240
	ldr r1, _02315260 ; =ov10_022C47B0
	mov r3, #4
	mov r0, r4
	mov r2, #1
	strb r3, [r6, #0xd0]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r4
	strb r1, [r6, #0xd1]
	bl ov29_022E41DC
	ldr r2, _02315264 ; =0x00000D43
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r5
	mov r1, r4
	bl TryActivateQuickFeet
	b _02315250
_02315240:
	ldr r2, _02315268 ; =0x00000D44
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02315250:
	mov r0, r4
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02315260: .word ov10_022C47B0
#ifdef JAPAN
_02315264: .word 0x00000A83
_02315268: .word 0x00000A84
#else
_02315264: .word 0x00000D43
_02315268: .word 0x00000D44
#endif
	arm_func_end TryInflictCoweringStatus

	arm_func_start TryRestoreHp
TryRestoreHp: ; 0x0231526C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r0, r4
	mov r5, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, [r4, #0xb4]
	ldr r3, _023152E0 ; =0x000003E7
	ldrsh r0, [r2, #0x10]
	add r0, r0, r5
	strh r0, [r2, #0x10]
	ldrsh r1, [r2, #0x12]
	ldrsh r0, [r2, #0x16]
	add r1, r1, r0
	cmp r1, r3
	ldrsh r0, [r2, #0x10]
	movle r3, r1
	cmp r0, r3
	ble _023152D0
	ldr r0, _023152E0 ; =0x000003E7
	cmp r1, r0
	movgt r1, r0
	strh r1, [r2, #0x10]
_023152D0:
	mov r0, r4
	bl ov29_022E4480
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023152E0: .word 0x000003E7
	arm_func_end TryRestoreHp

	arm_func_start TryIncreaseHp
TryIncreaseHp: ; 0x023152E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r5, r2
	mov r4, r3
	mov fp, #0
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, fp
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr sb, [r6, #0xb4]
	ldrb r0, [sb, #0xd8]
	cmp r0, #5
	bne _02315348
	mov r0, fp
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _023155EC ; =0x00000D83
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, fp
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02315348:
	mov r0, r6
	mov r1, #0x34
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0231537C
	ldr r1, _023155F0 ; =ov10_022C4470
	mov r0, r5, lsl #8
	ldrsh r1, [r1]
	mov r1, r1, lsl #8
	bl MultiplyByFixedPoint
	mov r1, #0x64
	bl _s32_div_f
	add r5, r5, r0, asr #8
_0231537C:
	ldrsh r1, [sb, #0x12]
	ldrsh r0, [sb, #0x16]
	ldr r8, _023155F4 ; =0x000003E7
	ldrsh sl, [sb, #0x10]
	add r1, r1, r0
	cmp r1, r8
	ldr r0, _023155F4 ; =0x000003E7
	movle r8, r1
	cmp r1, r0
	movgt r1, r0
	cmp sl, r1
	bne _023153B4
	cmp r4, #0
	bgt _023153C4
_023153B4:
	cmp r5, #0
	bne _02315454
	cmp r4, #0
	ble _02315454
_023153C4:
	ldrsh r1, [sb, #0x12]
	ldr r0, _023155F4 ; =0x000003E7
	ldr r2, _023155F4 ; =0x000003E7
	add r1, r1, r4
	strh r1, [sb, #0x12]
	ldrsh r1, [sb, #0x10]
	add r1, r1, r4
	strh r1, [sb, #0x10]
	ldrsh r1, [sb, #0x12]
	cmp r1, r0
	strgth r0, [sb, #0x12]
	ldrsh r1, [sb, #0x12]
	ldrsh r0, [sb, #0x16]
	add r1, r1, r0
	cmp r1, r2
	ldrsh r0, [sb, #0x10]
	movle r2, r1
	cmp r0, r2
	ble _02315420
	ldr r0, _023155F4 ; =0x000003E7
	cmp r1, r0
	movgt r1, r0
	strh r1, [sb, #0x10]
_02315420:
	ldrsh r2, [sb, #0x12]
	ldrsh r1, [sb, #0x16]
	ldr r0, _023155F4 ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	ldrsh r0, [sb, #0x10]
	cmp r0, r1
	moveq sl, r0
	mov r0, r6
	bl ov29_022E4430
	mov fp, #1
	b _02315464
_02315454:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl TryRestoreHp
_02315464:
	ldrsh r2, [sb, #0x12]
	ldrsh r1, [sb, #0x16]
	ldr r0, _023155F4 ; =0x000003E7
	add r2, r2, r1
	ldrsh r1, [sb, #0x10]
	cmp r2, r0
	movgt r2, r0
	mov r0, r6
	sub sl, r1, sl
	sub r8, r2, r8
	bl UpdateStatusIconFlags
	mov r1, sl
	mov r0, #0
	bl ov29_0234B09C
	mov r0, #1
	mov r1, r8
	bl ov29_0234B09C
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp sl, #0
	cmpeq r8, #0
	bne _02315504
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	beq _023154FC
	cmp fp, #0
	beq _023154EC
	ldr r2, _023155F8 ; =0x00000CFD
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023154FC
_023154EC:
	ldr r2, _023155FC ; =0x00000CFA
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_023154FC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02315504:
	cmp r4, #0
	cmpeq sl, #0
	bne _02315534
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	beq _0231552C
	ldr r2, _02315600 ; =0x00000CFB
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_0231552C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02315534:
	cmp r8, #0
	mov r4, #0
	beq _02315560
	mov r0, r6
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	ldr r2, _02315604 ; =0x00000CFC
	mov r0, r7
	mov r1, r6
	movne r4, r8
	bl LogMessageByIdWithPopupCheckUserTarget
_02315560:
	cmp sl, #0
	beq _023155C8
	mov r0, r6
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, sl
	cmp r5, #0
	beq _023155C8
	ldrsh r2, [sb, #0x12]
	ldrsh r1, [sb, #0x16]
	ldr r0, _023155F4 ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	ldrsh r0, [sb, #0x10]
	cmp r0, r1
	bne _023155B8
	ldr r2, _02315608 ; =0x00000CF9
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023155C8
_023155B8:
	ldr r2, _0231560C ; =0x00000CF8
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_023155C8:
	cmp r4, #0
	beq _023155E4
	mov r2, #1
	mov r0, r4
	mov r1, r6
	sub r3, r2, #2
	bl DisplayAnimatedNumbers
_023155E4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INCREASE_HP_OFFSET -0x2C0
#else
#define TRY_INCREASE_HP_OFFSET 0
#endif
_023155EC: .word 0x00000D83 + TRY_INCREASE_HP_OFFSET
_023155F0: .word ov10_022C4470
_023155F4: .word 0x000003E7
_023155F8: .word 0x00000CFD + TRY_INCREASE_HP_OFFSET
_023155FC: .word 0x00000CFA + TRY_INCREASE_HP_OFFSET
_02315600: .word 0x00000CFB + TRY_INCREASE_HP_OFFSET
_02315604: .word 0x00000CFC + TRY_INCREASE_HP_OFFSET
_02315608: .word 0x00000CF9 + TRY_INCREASE_HP_OFFSET
_0231560C: .word 0x00000CF8 + TRY_INCREASE_HP_OFFSET
	arm_func_end TryIncreaseHp

	arm_func_start RevealItems
RevealItems: ; 0x02315610
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, [r4, #0xb4]
	ldrb r0, [r2, #0xfa]
	cmp r0, #0
	beq _02315650
	ldr r2, _02315698 ; =0x00000CE4
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
_02315650:
	mov r1, #1
	mov r0, r4
	strb r1, [r2, #0xfa]
	bl ov29_022E465C
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0231569C ; =0x00000CE2
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	bl UpdateCamera
	bl UpdateMinimap
	mov r0, r4
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_02315698: .word 0x00000A24
_0231569C: .word 0x00000A22
#else
_02315698: .word 0x00000CE4
_0231569C: .word 0x00000CE2
#endif
	arm_func_end RevealItems

	arm_func_start RevealStairs
RevealStairs: ; 0x023156A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl GetFloorType
	cmp r0, #0
	beq _023156DC
	ldr r2, _02315750 ; =0x00000CE6
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
_023156DC:
	ldr r2, [r4, #0xb4]
	ldrb r0, [r2, #0xfb]
	cmp r0, #0
	beq _02315700
	ldr r2, _02315754 ; =0x00000CE5
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
_02315700:
	mov r1, #1
	mov r0, r4
	strb r1, [r2, #0xfb]
	bl ov29_022E4660
	mov r0, #0
	bl HiddenStairsTrigger
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02315758 ; =0x00000CE3
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	bl UpdateCamera
	bl UpdateMinimap
	mov r0, r4
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_02315750: .word 0x00000A26
_02315754: .word 0x00000A25
_02315758: .word 0x00000A23
#else
_02315750: .word 0x00000CE6
_02315754: .word 0x00000CE5
_02315758: .word 0x00000CE3
#endif
	arm_func_end RevealStairs

	arm_func_start RevealEnemies
RevealEnemies: ; 0x0231575C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, [r4, #0xb4]
	ldrb r0, [r2, #0xf9]
	cmp r0, #0
	beq _0231579C
	ldr r2, _023157E4 ; =0x00000CEA
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
_0231579C:
	mov r1, #1
	mov r0, r4
	strb r1, [r2, #0xf9]
	bl ov29_022E4664
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _023157E8 ; =0x00000CE9
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	bl UpdateCamera
	bl UpdateMinimap
	mov r0, r4
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_023157E4: .word 0x00000A2A
_023157E8: .word 0x00000A29
#else
_023157E4: .word 0x00000CEA
_023157E8: .word 0x00000CE9
#endif
	arm_func_end RevealEnemies

	arm_func_start TryInflictLeechSeedStatus
TryInflictLeechSeedStatus: ; 0x023157EC
#ifdef JAPAN
#define TRY_INFLICT_LEECH_SEED_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_LEECH_SEED_STATUS_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r8, r2
	mov r7, r3
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [r6]
	cmp r0, #1
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r6, r5
	ldr r4, [r5, #0xb4]
	bne _02315850
	cmp r8, #0
	beq _02315848
	ldr r2, _023159BC ; =0x00000DE1
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02315848:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02315850:
	mov r0, r6
	mov r1, r5
	mov r2, r8
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r8
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	mov r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, r5
	mov r1, #4
	bl MonsterIsType
	cmp r0, #0
	beq _023158C8
	cmp r8, #0
	beq _023158C0
	ldr r2, _023159C0 ; =0x00000DE2
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023158C0:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023158C8:
	cmp r7, #0
	ldrb r0, [r4, #0xe0]
	beq _023158E8
	cmp r0, #1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023158E8:
	cmp r0, #1
	beq _02315930
	cmp r0, #2
	bne _02315908
	ldr r2, _023159C4 ; =0x00000CAF
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02315908:
	ldr r1, _023159C8 ; =ov10_022C4790
	mov r2, #1
	mov r0, r5
	strb r2, [r4, #0xe0]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r4, #0xe9]
	mov r0, #0
	strb r0, [r4, #0xea]
	b _02315948
_02315930:
	ldr r2, _023159CC ; =0x00000CE1
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02315948:
	mov r0, r5
	bl ov29_022E4668
	mov r0, #0xff
	ldr r1, _023159D0 ; =DUNGEON_PTR
	strb r0, [r4, #0xe8]
	mov r2, #0
_02315960:
	ldr r0, [r1]
	add r0, r0, r2, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xad4]
#else
	ldr r0, [r0, #0xb78]
#endif
	cmp r6, r0
	streqb r2, [r4, #0xe8]
	ldreq r0, [r6, #0xb4]
	add r2, r2, #1
	ldreq r0, [r0, #0xb0]
	streq r0, [r4, #0xe4]
	cmp r2, #0x14
	blt _02315960
	mov r0, r6
	mov r1, r5
	mov r2, #0xce0 + TRY_INFLICT_LEECH_SEED_STATUS_OFFSET
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	mov r0, r5
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023159BC: .word 0x00000DE1 + TRY_INFLICT_LEECH_SEED_STATUS_OFFSET
_023159C0: .word 0x00000DE2 + TRY_INFLICT_LEECH_SEED_STATUS_OFFSET
_023159C4: .word 0x00000CAF + TRY_INFLICT_LEECH_SEED_STATUS_OFFSET
_023159C8: .word ov10_022C4790
_023159CC: .word 0x00000CE1 + TRY_INFLICT_LEECH_SEED_STATUS_OFFSET
_023159D0: .word DUNGEON_PTR
	arm_func_end TryInflictLeechSeedStatus

	arm_func_start ov29_023159D4
ov29_023159D4: ; 0x023159D4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, #0
	ldr r5, [r0, #0xb4]
	ldr r7, _02315A4C ; =DUNGEON_PTR
	mov r8, r4
_023159E8:
	ldr r0, [r7]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _02315A3C
	ldr r2, [r6, #0xb4]
	ldrb r0, [r2, #0xe0]
	add r0, r0, #0xff
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02315A3C
	ldr r1, [r2, #0xe4]
	ldr r0, [r5, #0xb0]
	cmp r1, r0
	bne _02315A3C
	mov r0, r6
	strb r8, [r2, #0xe0]
	bl UpdateStatusIconFlags
_02315A3C:
	add r4, r4, #1
	cmp r4, #0x14
	blt _023159E8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02315A4C: .word DUNGEON_PTR
	arm_func_end ov29_023159D4

	arm_func_start TryInflictDestinyBondStatus
TryInflictDestinyBondStatus: ; 0x02315A50
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [r6]
	cmp r0, #1
	ldreq r0, [r5]
	cmpeq r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r6, #0xb4]
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xe0]
	cmp r0, #2
	beq _02315AE4
	cmp r0, #1
	bne _02315AB8
	ldr r2, _02315B5C ; =0x00000C94
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02315AB8:
	ldr r1, _02315B60 ; =ov10_022C47D4
	mov r3, #2
	mov r0, r5
	mov r2, #1
	strb r3, [r4, #0xe0]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r4, #0xe9]
	mov r0, #0
	strb r0, [r4, #0xea]
	b _02315AF8
_02315AE4:
	ldr r2, _02315B64 ; =0x00000D54
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r4, r5, r6, pc}
_02315AF8:
	mov r0, r5
	bl ov29_022E45CC
	mov r0, #0xff
	ldr r1, _02315B68 ; =DUNGEON_PTR
	strb r0, [r4, #0xe8]
	mov r2, #0
_02315B10:
	ldr r0, [r1]
	add r0, r0, r2, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xad4]
#else
	ldr r0, [r0, #0xb78]
#endif
	cmp r5, r0
	streqb r2, [r4, #0xe8]
	ldreq r0, [r5, #0xb4]
	add r2, r2, #1
	ldreq r0, [r0, #0xb0]
	streq r0, [r4, #0xe4]
	cmp r2, #0x14
	blt _02315B10
	ldr r2, _02315B6C ; =0x00000D53
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_DESTINY_BOND_OFFSET -0x2C0
#else
#define TRY_INFLICT_DESTINY_BOND_OFFSET 0
#endif
_02315B5C: .word 0x00000C94 + TRY_INFLICT_DESTINY_BOND_OFFSET
_02315B60: .word ov10_022C47D4
_02315B64: .word 0x00000D54 + TRY_INFLICT_DESTINY_BOND_OFFSET
_02315B68: .word DUNGEON_PTR
_02315B6C: .word 0x00000D53 + TRY_INFLICT_DESTINY_BOND_OFFSET
	arm_func_end TryInflictDestinyBondStatus

	arm_func_start TryInflictSureShotStatus
TryInflictSureShotStatus: ; 0x02315B70
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r5, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	ldr r4, [r6, #0xb4]
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xec]
	cmp r0, #1
	beq _02315BDC
	mov r1, #1
	mov r0, r6
	strb r1, [r4, #0xec]
	add r1, r5, #1
	strb r1, [r4, #0xed]
	bl ov29_022E456C
	ldr r2, _02315BF8 ; =0x00000D2E
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02315BEC
_02315BDC:
	ldr r2, _02315BFC ; =0x00000D2F
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02315BEC:
	mov r0, r6
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_02315BF8: .word 0x00000A6E
_02315BFC: .word 0x00000A6F
#else
_02315BF8: .word 0x00000D2E
_02315BFC: .word 0x00000D2F
#endif
	arm_func_end TryInflictSureShotStatus

	arm_func_start TryInflictWhifferStatus
TryInflictWhifferStatus: ; 0x02315C00
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r7, r2
	mov r6, r3
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	mov r1, r4
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	mov r1, r4
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	ldr r6, [r4, #0xb4]
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r6, #0xec]
	cmp r0, #2
	beq _02315CC4
	mov r1, #2
	mov r0, r4
	strb r1, [r6, #0xec]
	add r1, r7, #1
	strb r1, [r6, #0xed]
	bl ov29_022E45B8
	mov r0, r5
	mov r1, r4
#ifdef JAPAN
	mov r2, #0xa70
#else
	mov r2, #0xd30
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r5
	mov r1, r4
	bl TryActivateQuickFeet
	b _02315CD4
_02315CC4:
	ldr r2, _02315CE4 ; =0x00000D31
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02315CD4:
	mov r0, r4
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_02315CE4: .word 0x00000A71
#else
_02315CE4: .word 0x00000D31
#endif
	arm_func_end TryInflictWhifferStatus

	arm_func_start TryInflictSetDamageStatus
TryInflictSetDamageStatus: ; 0x02315CE8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xec]
	cmp r0, #3
	beq _02315D60
	ldr r1, _02315D7C ; =ov10_022C47A4
	mov r3, #3
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xec]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xed]
	bl ov29_022E466C
	ldr r2, _02315D80 ; =0x00000D3F
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02315D70
_02315D60:
	mov r0, r6
	mov r1, r5
#ifdef JAPAN
	mov r2, #0xa80
#else
	mov r2, #0xd40
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_02315D70:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02315D7C: .word ov10_022C47A4
#ifdef JAPAN
_02315D80: .word 0x00000A7F
#else
_02315D80: .word 0x00000D3F
#endif
	arm_func_end TryInflictSetDamageStatus

	arm_func_start TryInflictFocusEnergyStatus
TryInflictFocusEnergyStatus: ; 0x02315D84
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xec]
	cmp r0, #4
	beq _02315DFC
	ldr r1, _02315E18 ; =ov10_022C47AC
	mov r3, #4
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xec]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xed]
	bl ov29_022E4670
	ldr r2, _02315E1C ; =0x00000D41
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02315E0C
_02315DFC:
	ldr r2, _02315E20 ; =0x00000D42
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02315E0C:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02315E18: .word ov10_022C47AC
#ifdef JAPAN
_02315E1C: .word 0x00000A81
_02315E20: .word 0x00000A82
#else
_02315E1C: .word 0x00000D41
_02315E20: .word 0x00000D42
#endif
	arm_func_end TryInflictFocusEnergyStatus

	arm_func_start TryInflictDecoyStatus
TryInflictDecoyStatus: ; 0x02315E24
#ifdef JAPAN
#define TRY_INFLICT_DECOY_STATUS_OFFSET -0xA4
#else
#define TRY_INFLICT_DECOY_STATUS_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r8, r2
	mov r7, r3
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	beq _023160C4
	mov r0, sl
	mov r1, sb
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	bne _023160C4
	mov r0, sl
	mov r1, sb
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	mov r0, #0
	bne _023160C4
	ldr r6, [sb, #0xb4]
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r6, #0xd8]
	cmp r0, #2
	bne _02315EC4
	cmp r7, #0
	beq _02315EBC
	ldr r2, _023160CC ; =0x00000D46
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02315EBC:
	mov r0, #1
	b _023160C4
_02315EC4:
	ldrb r0, [sp, #0x38]
	cmp r0, #0
	movne r0, #1
	bne _023160C4
	ldr fp, _023160D0 ; =DUNGEON_PTR
	mov r4, #0
_02315EDC:
	ldr r0, [fp]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r5, [r0, #0xb78 + TRY_INFLICT_DECOY_STATUS_OFFSET]
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	cmpne sb, r5
	beq _02315F34
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #0xd8]
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02315F34
	mov r0, sl
	mov r1, r5
	mov r2, #0
	mov r3, r7
	bl EndCurseClassStatus
	mov r0, #0x2a
	bl AdvanceFrame
_02315F34:
	add r4, r4, #1
	cmp r4, #0x14
	blt _02315EDC
	mov r0, sb
	bl ov29_022E4674
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r6, #0xd8]
	cmp r0, #0
	beq _02315F78
	mov r0, sl
	mov r1, sb
	mov r3, r7
	mov r2, #2
	bl EndCurseClassStatus
_02315F78:
	mov r0, sl
	mov r1, sb
	bl TryRemoveSnatchedMonsterFromDungeonStruct
	mov r0, #2
	strb r0, [r6, #0xd8]
	ldr r0, [sl, #0xb4]
	ldr r1, _023160D4 ; =ov10_022C47B4
	ldrb r3, [r0, #6]
	mov r0, sb
	mov r2, #1
	strb r3, [r6, #0xd9]
	strb r8, [r6, #0xda]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r6, #0xdb]
	mov r0, #0
	strb r0, [r6, #0xdc]
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _02315FCC
	bl ov29_022E81F8
_02315FCC:
	mov r0, sb
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, sb
	bl ov29_02304830
	ldr r0, _023160D0 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	cmp r7, #0
	add r0, r0, #0x3000
	strb r1, [r0, #0xe38 + TRY_INFLICT_DECOY_STATUS_OFFSET]
	beq _0231600C
	ldr r2, _023160D8 ; =0x00000D45
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0231600C:
	mov r0, sl
	mov r1, sb
	bl TryActivateQuickFeet
	mov sl, #0
	mov r4, #1
	mov r6, #6
	mov r5, sl
_02316028:
	ldr r0, _023160D0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, sl, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb78 + TRY_INFLICT_DECOY_STATUS_OFFSET]
	mov r0, r7
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _023160AC
	ldr r8, [r7, #0xb4]
	strb r6, [r8, #0x7c]
	str r5, [r8, #0x84]
	strh r5, [r8, #0x80]
	ldrb r0, [r8, #7]
	cmp r0, #0
	bne _023160AC
	add r2, sp, #0
	add r3, r8, #0x4a
	mov r1, #0xa
_02316074:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _02316074
	mov r0, r7
	mov r1, r4
	bl AiMovement
	add r3, sp, #0
	add r2, r8, #0x4a
	mov r1, #0xa
_0231609C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0231609C
_023160AC:
	add sl, sl, #1
	cmp sl, #0x14
	blt _02316028
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, #1
_023160C4:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_023160CC: .word 0x00000A86
#else
_023160CC: .word 0x00000D46
#endif
_023160D0: .word DUNGEON_PTR
_023160D4: .word ov10_022C47B4
#ifdef JAPAN
_023160D8: .word 0x00000A85
#else
_023160D8: .word 0x00000D45
#endif
	arm_func_end TryInflictDecoyStatus

	arm_func_start TryInflictCurseStatus
TryInflictCurseStatus: ; 0x023160DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	beq _0231626C
	mov r0, r7
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	beq _0231626C
	mov r0, r8
	mov r1, #0xe
	ldr r4, [r8, #0xb4]
	ldr r5, [r7, #0xb4]
	bl MonsterIsType
	cmp r0, #0
	beq _02316218
	mov r0, r8
	mov r1, r7
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	bne _0231626C
	mov r0, r8
	mov r1, r7
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	bne _0231626C
	mov r0, r8
	mov r1, r7
	mov r3, r6
	mov r2, #1
	bl EndCurseClassStatus
	mov r0, r7
	bl ov29_022E46C0
	ldrsh r0, [r4, #0x10]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	strh r0, [r4, #0x10]
	ldrsh r0, [r4, #0x10]
	cmp r0, #0
	moveq r0, #1
	streqh r0, [r4, #0x10]
	ldrb r0, [r5, #0xd8]
	cmp r0, #1
	beq _023161E0
	mov r0, r8
	mov r1, r7
	bl TryRemoveSnatchedMonsterFromDungeonStruct
	mov r2, #1
	ldr r1, _02316274 ; =ov10_022C4784
	mov r0, r7
	strb r2, [r5, #0xd8]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r5, #0xdb]
	mov r0, #0
	strb r0, [r5, #0xdc]
_023161E0:
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r6, #0
	beq _02316208
	ldr r2, _02316278 ; =0x00000CEC
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02316208:
	mov r0, r8
	mov r1, r7
	bl TryActivateQuickFeet
	b _02316260
_02316218:
	ldr r1, _0231627C ; =ATK_STAT_IDX
	mov r0, r8
	ldr r2, [r1]
	mov r1, r8
	mov r3, #1
	str r2, [sp]
	bl BoostOffensiveStat
	add r1, sp, #0
	ldr r2, [r1]
	mov r0, r8
	mov r1, r8
	mov r3, #1
	bl BoostDefensiveStat
	mov r2, #1
	mov r0, r8
	mov r1, r8
	mov r3, r2
	bl LowerSpeed
_02316260:
	mov r0, r7
	bl UpdateStatusIconFlags
	mov r0, #1
_0231626C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02316274: .word ov10_022C4784
#ifdef JAPAN
_02316278: .word 0x00000A2C
#else
_02316278: .word 0x00000CEC
#endif
_0231627C: .word ATK_STAT_IDX
	arm_func_end TryInflictCurseStatus

	arm_func_start TryInflictSnatchStatus
TryInflictSnatchStatus: ; 0x02316280
#ifdef JAPAN
#define TRY_INFLICT_SNATCH_STATUS_OFFSET -0xA4
#else
#define TRY_INFLICT_SNATCH_STATUS_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, r5
	mov r1, r4
	mov r2, #3
	mov r3, #1
	bl EndCurseClassStatus
	mov sb, #0
	ldr r6, _0231639C ; =DUNGEON_PTR
	mov r8, sb
	mov r7, #1
_023162C0:
	ldr r0, [r6]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr sl, [r0, #0xb78 + TRY_INFLICT_SNATCH_STATUS_OFFSET]
	mov r0, sl
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _02316304
	ldr r0, [sl, #0xb4]
	ldrb r0, [r0, #0xd8]
	cmp r0, #3
	bne _02316304
	mov r0, r5
	mov r1, sl
	mov r2, r8
	mov r3, r7
	bl EndCurseClassStatus
_02316304:
	add sb, sb, #1
	cmp sb, #0x14
	blt _023162C0
	mov r0, r4
	bl ov29_022E46D0
	ldr r6, [r4, #0xb4]
	ldrb r0, [r6, #0xd8]
	cmp r0, #3
	beq _02316350
	ldr r1, _023163A0 ; =ov10_022C4788
	mov r3, #3
	mov r0, r4
	mov r2, #0
	strb r3, [r6, #0xd8]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r6, #0xdb]
	mov r0, #0
	strb r0, [r6, #0xdc]
_02316350:
	ldr r3, _0231639C ; =DUNGEON_PTR
	mov r0, #0
	ldr r2, [r3]
	mov r1, r4
	add r2, r2, #0x19000
	str r4, [r2, #0x904 + TRY_INFLICT_SNATCH_STATUS_OFFSET]
	ldr r2, [r3]
	ldr r6, [r6, #0xb0]
	add r3, r2, #0x19000
	mov r2, r0
	str r6, [r3, #0x90c + TRY_INFLICT_SNATCH_STATUS_OFFSET]
	bl SubstitutePlaceholderStringTags
	ldr r2, _023163A4 ; =0x00000CED
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r4
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0231639C: .word DUNGEON_PTR
_023163A0: .word ov10_022C4788
#ifdef JAPAN
_023163A4: .word 0x00000A2D
#else
_023163A4: .word 0x00000CED
#endif
	arm_func_end TryInflictSnatchStatus

	arm_func_start TryInflictTauntStatus
TryInflictTauntStatus: ; 0x023163A8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r6, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	beq _023164C0
	mov r0, r5
	mov r1, r4
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	bne _023164C0
	mov r0, r5
	mov r1, r4
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	bne _023164C0
#ifndef JAPAN
	ldr r3, _023164C8 ; =0x00000C39
#endif
	mov ip, #8
	mov r0, r5
	mov r1, r4
#ifdef JAPAN
	add r3, ip, #0x970
#endif
	mov r2, #1
	str ip, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	movne r0, #0
	bne _023164C0
	cmp r6, #0
	movne r0, #1
	bne _023164C0
	mov r0, #0
	ldr r6, [r4, #0xb4]
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r6, #0xd0]
	cmp r0, #5
	beq _023164A4
	ldr r1, _023164CC ; =ov10_022C47BC
	mov r3, #5
	mov r0, r4
	mov r2, #1
	strb r3, [r6, #0xd0]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r4
	strb r1, [r6, #0xd1]
	bl ov29_022E442C
	ldr r2, _023164D0 ; =0x00000D49
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r5
	mov r1, r4
	bl TryActivateQuickFeet
	b _023164B4
_023164A4:
	ldr r2, _023164D4 ; =0x00000D4A
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_023164B4:
	mov r0, r4
	bl UpdateStatusIconFlags
	mov r0, #1
_023164C0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_023164CC: .word ov10_022C47BC
_023164D0: .word 0x00000A89
_023164D4: .word 0x00000A8A
#else
_023164C8: .word 0x00000C39
_023164CC: .word ov10_022C47BC
_023164D0: .word 0x00000D49
_023164D4: .word 0x00000D4A
#endif
	arm_func_end TryInflictTauntStatus

	arm_func_start TryInflictStockpileStatus
TryInflictStockpileStatus: ; 0x023164D8
#ifdef JAPAN
#define TRY_INFLICT_STOCKPILE_STATUS_OFFSET -4
#else
#define TRY_INFLICT_STOCKPILE_STATUS_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r4, #0
	bl EntityIsValid__02315118
	cmp r0, #0
	mov r0, r4
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r5, [r6, #0xb4]
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r5, #0x11e + TRY_INFLICT_STOCKPILE_STATUS_OFFSET]
	cmp r0, #3
	bhs _02316554
	add r1, r0, #1
	mov r0, #1
	strb r1, [r5, #0x11e + TRY_INFLICT_STOCKPILE_STATUS_OFFSET]
	bl AnimationDelayOrSomething
	mov r0, r6
	bl ov29_022E46D4
	ldrb r1, [r5, #0x11e + TRY_INFLICT_STOCKPILE_STATUS_OFFSET]
	mov r0, r4
	bl ov29_0234B09C
	ldr r2, _02316574 ; =0x00000D4B
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r4, #1
	b _02316564
_02316554:
	ldr r2, _02316578 ; =0x00000D4C
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02316564:
	mov r0, r6
	bl UpdateStatusIconFlags
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_02316574: .word 0x00000A8B
_02316578: .word 0x00000A8C
#else
_02316574: .word 0x00000D4B
_02316578: .word 0x00000D4C
#endif
	arm_func_end TryInflictStockpileStatus

	arm_func_start TryInflictInvisibleStatus
TryInflictInvisibleStatus: ; 0x0231657C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xef]
	cmp r0, #1
	beq _02316604
	mov r0, r6
	mov r1, r5
	mov r2, #0
	bl EndInvisibleClassStatus
	mov r3, #1
	ldr r1, _02316620 ; =ov10_022C47C8
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xef]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xf0]
	bl ov29_022E4704
	ldr r2, _02316624 ; =0x00000D4D
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02316614
_02316604:
	ldr r2, _02316628 ; =0x00000D4E
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02316614:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02316620: .word ov10_022C47C8
#ifdef JAPAN
_02316624: .word 0x00000A8D
_02316628: .word 0x00000A8E
#else
_02316624: .word 0x00000D4D
_02316628: .word 0x00000D4E
#endif
	arm_func_end TryInflictInvisibleStatus

	arm_func_start TryInflictPerishSongStatus
TryInflictPerishSongStatus: ; 0x0231662C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	cmp r4, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl ov29_022E4714
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
#ifdef JAPAN
	ldrb r0, [r4, #0x105]
#else
	ldrb r0, [r4, #0x106]
#endif
	cmp r0, #0
	bne _023166F4
	ldr r1, _02316714 ; =PERISH_SONG_TURN_RANGE
	mov r0, r5
	mov r2, #0
	bl CalcStatusDuration
	add r3, r0, #1
	ldr r2, _02316718 ; =0x00000D51
	mov r0, r6
	mov r1, r5
#ifdef JAPAN
	strb r3, [r4, #0x105]
#else
	strb r3, [r4, #0x106]
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	b _02316704
_023166F4:
	ldr r2, _0231671C ; =0x00000D52
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02316704:
	mov r0, r5
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02316714: .word PERISH_SONG_TURN_RANGE
#ifdef JAPAN
_02316718: .word 0x00000A91
_0231671C: .word 0x00000A92
#else
_02316718: .word 0x00000D51
_0231671C: .word 0x00000D52
#endif
	arm_func_end TryInflictPerishSongStatus

	arm_func_start TryInflictEncoreStatus
TryInflictEncoreStatus: ; 0x02316720
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	ldr r4, [r6, #0xb4]
	mov r7, r0
	mov r0, r6
	mov r5, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov ip, #8
#ifdef JAPAN
	mov r0, r7
	mov r1, r6
	add r3, ip, #0x970
#else
	ldr r3, _023168C4 ; =0x00000C39
	mov r0, r7
	mov r1, r6
#endif
	mov r2, #1
	str ip, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov lr, #0
#ifdef JAPAN
	add ip, r4, #0x120
#else
	add ip, r4, #0x124
#endif
	mov r1, lr
	mov r2, #1
	b _023167E8
_023167BC:
	ldrb r0, [ip, lr, lsl #3]
	mov r3, lr, lsl #3
	tst r0, #1
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	beq _023167E4
	ldrb r0, [ip, r3]
	tst r0, #0x10
	bne _023167F0
_023167E4:
	add lr, lr, #1
_023167E8:
	cmp lr, #4
	blt _023167BC
_023167F0:
	cmp lr, #4
	bne _02316834
#ifdef JAPAN
	ldrb r0, [r4, #0x140]
#else
	ldrb r0, [r4, #0x144]
#endif
	tst r0, #0x10
	bne _02316834
	cmp r5, #0
	bne _0231682C
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _023168C8 ; =0x00000D57
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_0231682C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02316834:
	cmp r5, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd0]
	cmp r0, #6
	beq _023168A4
	ldr r1, _023168CC ; =ov10_022C47D8
	mov r3, #6
	mov r0, r6
	mov r2, #1
	strb r3, [r4, #0xd0]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r6
	strb r1, [r4, #0xd1]
	bl ov29_022E4718
	ldr r2, _023168D0 ; =0x00000D55
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	b _023168B4
_023168A4:
	ldr r2, _023168D4 ; =0x00000D56
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_023168B4:
	mov r0, r6
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_ENCORE_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_ENCORE_STATUS_OFFSET 0
#endif
#ifndef JAPAN
_023168C4: .word 0x00000C39
#endif
_023168C8: .word 0x00000D57 + TRY_INFLICT_ENCORE_STATUS_OFFSET
_023168CC: .word ov10_022C47D8
_023168D0: .word 0x00000D55 + TRY_INFLICT_ENCORE_STATUS_OFFSET
_023168D4: .word 0x00000D56 + TRY_INFLICT_ENCORE_STATUS_OFFSET
	arm_func_end TryInflictEncoreStatus

	arm_func_start TryDecreaseBelly
TryDecreaseBelly: ; 0x023168D8
#ifdef JAPAN
#define TRY_DECREASE_BELLY_OFFSET -4
#else
#define TRY_DECREASE_BELLY_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x24
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r8, r2
	mov r7, r3
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _02316B98
	mov r0, #0
	mov r1, r5
	mov r2, r0
	ldr r4, [r5, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r7, #0
	beq _02316A88
	mov r0, r7
	bl sub_02050FF8
	strh r0, [sp, #0x10]
	add r1, r4, #0x100
	ldrh ip, [r1, #0x4a + TRY_DECREASE_BELLY_OFFSET]
	ldrh r1, [r1, #0x4c + TRY_DECREASE_BELLY_OFFSET]
	mov r0, r0, lsr #0x10
	ldrh r2, [sp, #0x10]
	sub r3, sp, #4
	strh r0, [sp, #0x12]
	strh r1, [sp, #0x1e]
	ldrh r1, [sp, #0x12]
	strh r2, [sp, #0x20]
	ldrh r0, [sp, #0x1e]
	strh ip, [r3]
	strh r1, [sp, #0x22]
	strh r0, [r3, #2]
	ldrh r2, [sp, #0x20]
	ldr r0, [r3]
	ldrh r1, [sp, #0x22]
	strh r2, [r3]
	strh ip, [sp, #0x1c]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl SubFixedPoint
	strh r0, [sp, #0xc]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0xe]
	ldrh r2, [sp, #0xc]
	add r1, r4, #0x100
	ldrh r0, [sp, #0xe]
	strh r2, [r1, #0x4a + TRY_DECREASE_BELLY_OFFSET]
	sub r3, sp, #4
	strh r0, [r1, #0x4c + TRY_DECREASE_BELLY_OFFSET]
	ldrh r0, [r1, #0x46 + TRY_DECREASE_BELLY_OFFSET]
	strh r0, [r3]
	ldrh r0, [r1, #0x48 + TRY_DECREASE_BELLY_OFFSET]
	strh r0, [r3, #2]
	ldrh r2, [r1, #0x4a + TRY_DECREASE_BELLY_OFFSET]
	ldr r0, [r3]
	strh r2, [r3]
	ldrh r1, [r1, #0x4c + TRY_DECREASE_BELLY_OFFSET]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl sub_02050F78
	strh r0, [sp, #8]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0xa]
	ldrh r0, [sp, #8]
	add r1, r4, #0x100
	ldrh r2, [sp, #0xa]
	strh r0, [r1, #0x46 + TRY_DECREASE_BELLY_OFFSET]
	mov r0, #0
	strh r2, [r1, #0x48 + TRY_DECREASE_BELLY_OFFSET]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrh r1, [sp, #0x1c]
	sub r2, sp, #4
	ldrh r0, [sp, #0x1e]
	strh r1, [r2]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	add r1, r4, #0x100
	mov r4, r0
	ldrh r0, [r1, #0x4a + TRY_DECREASE_BELLY_OFFSET]
	sub r2, sp, #4
	strh r0, [r2]
	ldrh r0, [r1, #0x4c + TRY_DECREASE_BELLY_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r4, r0
	beq _02316A74
	mov r0, r5
	bl ov29_022E471C
	ldr r2, _02316BA0 ; =0x00000D64
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02316B90
_02316A74:
	ldr r2, _02316BA4 ; =0x00000D68
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02316B90
_02316A88:
	mov r0, r8
	bl sub_02050FF8
	strh r0, [sp, #4]
	add r1, r4, #0x100
	ldrh ip, [r1, #0x46 + TRY_DECREASE_BELLY_OFFSET]
	ldrh r1, [r1, #0x48 + TRY_DECREASE_BELLY_OFFSET]
	mov r0, r0, lsr #0x10
	ldrh r2, [sp, #4]
	sub r3, sp, #4
	strh r0, [sp, #6]
	strh r1, [sp, #0x1a]
	ldrh r1, [sp, #6]
	strh r2, [sp, #0x14]
	ldrh r0, [sp, #0x1a]
	strh ip, [r3]
	strh r1, [sp, #0x16]
	strh r0, [r3, #2]
	ldrh r2, [sp, #0x14]
	ldr r0, [r3]
	ldrh r1, [sp, #0x16]
	strh r2, [r3]
	strh ip, [sp, #0x18]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl SubFixedPoint
	strh r0, [sp]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #2]
	ldrh r1, [sp]
	add r2, r4, #0x100
	ldrh r3, [sp, #2]
	strh r1, [r2, #0x46 + TRY_DECREASE_BELLY_OFFSET]
	mov r0, #0
	strh r3, [r2, #0x48 + TRY_DECREASE_BELLY_OFFSET]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrh r1, [sp, #0x18]
	sub r2, sp, #4
	ldrh r0, [sp, #0x1a]
	strh r1, [r2]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	add r1, r4, #0x100
	ldrh r2, [r1, #0x46 + TRY_DECREASE_BELLY_OFFSET]
	sub r3, sp, #4
	mov r4, r0
	strh r2, [r3]
	ldrh r0, [r1, #0x48 + TRY_DECREASE_BELLY_OFFSET]
	strh r0, [r3, #2]
	ldr r0, [r3]
	bl CeilFixedPoint
	cmp r4, r0
	beq _02316B80
	mov r0, r5
	bl ov29_022E47B8
	ldr r2, _02316BA8 ; =0x00000D63
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02316B90
_02316B80:
	ldr r2, _02316BAC ; =0x00000D69
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02316B90:
	mov r0, r5
	bl UpdateStatusIconFlags
_02316B98:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_DECREASE_BELLY_DATA_OFFSET -0x2C0
#else
#define TRY_DECREASE_BELLY_DATA_OFFSET 0
#endif
_02316BA0: .word 0x00000D64 + TRY_DECREASE_BELLY_DATA_OFFSET
_02316BA4: .word 0x00000D68 + TRY_DECREASE_BELLY_DATA_OFFSET
_02316BA8: .word 0x00000D63 + TRY_DECREASE_BELLY_DATA_OFFSET
_02316BAC: .word 0x00000D69 + TRY_DECREASE_BELLY_DATA_OFFSET
	arm_func_end TryDecreaseBelly

	arm_func_start TryIncreaseBelly
TryIncreaseBelly: ; 0x02316BB0
#ifdef JAPAN
#define TRY_INCREASE_BELLY_OFFSET -4
#else
#define TRY_INCREASE_BELLY_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x50]
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _023170FC
	mov r0, sb
	mov r1, #0x25
	ldr r5, [sb, #0xb4]
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _02316C08
	mov r0, sb
	mov r1, #0x59
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02316C38
_02316C08:
	ldr r1, _02317104 ; =ov10_022C44B0
	mov r0, r8, lsl #8
	ldrsh r1, [r1]
	mov r1, r1, lsl #8
	bl MultiplyByFixedPoint
	mov r1, #0x64
	bl _s32_div_f
	bl sub_02001888
	ldr r1, _02317108 ; =0x000003E7
	add r8, r8, r0, asr #8
	cmp r8, r1
	movgt r8, r1
_02316C38:
	ldrb r0, [r5, #7]
	cmp r0, #0
	bne _02316C74
	mov r0, sb
	mov r1, #0x22
	bl ItemIsActive__0231513C
	cmp r0, #0
	beq _02316C74
	cmp r6, #0
	beq _023170FC
	ldr r2, _0231710C ; =0x00000D6C
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023170FC
_02316C74:
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r7, #0
	mov r4, #0
	beq _02316CE8
	add r0, r5, #0x100
	ldrh r1, [r0, #0x46 + TRY_INCREASE_BELLY_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + TRY_INCREASE_BELLY_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	add r1, r5, #0x100
	ldrh r2, [r1, #0x4a + TRY_INCREASE_BELLY_OFFSET]
	sub r3, sp, #4
	mov fp, r0
	strh r2, [r3]
	ldrh r0, [r1, #0x4c + TRY_INCREASE_BELLY_OFFSET]
	strh r0, [r3, #2]
	ldr r0, [r3]
	bl CeilFixedPoint
	cmp fp, r0
	ldr r0, _02317108 ; =0x000003E7
	movge r4, #1
	cmp r8, r0
	moveq r4, #1
_02316CE8:
	cmp r4, #0
	add r0, r5, #0x100
	beq _02316F08
	ldrh r4, [r0, #0x4a + TRY_INCREASE_BELLY_OFFSET]
	ldrh r3, [r0, #0x4c + TRY_INCREASE_BELLY_OFFSET]
	ldrh r1, [r0, #0x46 + TRY_INCREASE_BELLY_OFFSET]
	sub r2, sp, #4
	strh r4, [sp, #0x24]
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + TRY_INCREASE_BELLY_OFFSET]
	strh r3, [sp, #0x26]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	add r1, r5, #0x100
	ldrh r2, [r1, #0x4a + TRY_INCREASE_BELLY_OFFSET]
	sub r3, sp, #4
	mov r4, r0
	strh r2, [r3]
	ldrh r0, [r1, #0x4c + TRY_INCREASE_BELLY_OFFSET]
	strh r0, [r3, #2]
	ldr r0, [r3]
	bl CeilFixedPoint
	cmp r4, r0
	moveq r4, #1
	mov r0, r7
	movne r4, #0
	bl sub_02050FF8
	strh r0, [sp, #0x18]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0x1a]
	add r1, r5, #0x100
	ldrh r7, [sp, #0x18]
	ldrh r2, [sp, #0x1a]
	ldrh r0, [r1, #0x4a + TRY_INCREASE_BELLY_OFFSET]
	sub r3, sp, #4
	strh r7, [sp, #0x28]
	strh r0, [r3]
	ldrh r0, [r1, #0x4c + TRY_INCREASE_BELLY_OFFSET]
	strh r2, [sp, #0x2a]
	ldrh r2, [sp, #0x28]
	strh r0, [r3, #2]
	ldr r0, [r3]
	ldrh r1, [sp, #0x2a]
	strh r2, [r3]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl sub_02050EBC
	strh r0, [sp, #0x14]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0x16]
	ldrh r0, [sp, #0x14]
	add r1, r5, #0x100
	ldrh r2, [sp, #0x16]
	strh r0, [r1, #0x4a + TRY_INCREASE_BELLY_OFFSET]
	mov r0, #0xc8
	strh r2, [r1, #0x4c + TRY_INCREASE_BELLY_OFFSET]
	bl sub_02050FF8
	strh r0, [sp, #0x10]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0x12]
	add r1, r5, #0x100
	ldrh r0, [r1, #0x4a + TRY_INCREASE_BELLY_OFFSET]
	sub r7, sp, #4
	ldrh r3, [sp, #0x10]
	strh r0, [r7]
	ldrh r0, [r1, #0x4c + TRY_INCREASE_BELLY_OFFSET]
	ldrh r2, [sp, #0x12]
	strh r0, [r7, #2]
	ldr r0, [r7]
	strh r3, [r7]
	strh r2, [r7, #2]
	ldr r1, [r7]
	bl sub_02050F78
	strh r0, [sp, #0xc]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0xe]
	ldrh r2, [sp, #0xc]
	add r0, r5, #0x100
	ldrh r1, [sp, #0xe]
	strh r2, [r0, #0x4a + TRY_INCREASE_BELLY_OFFSET]
	tst r4, #0xff
	strh r1, [r0, #0x4c + TRY_INCREASE_BELLY_OFFSET]
	ldrh r1, [r0, #0x4a + TRY_INCREASE_BELLY_OFFSET]
	strh r1, [r0, #0x46 + TRY_INCREASE_BELLY_OFFSET]
	ldrh r1, [r0, #0x4c + TRY_INCREASE_BELLY_OFFSET]
	strh r1, [r0, #0x48 + TRY_INCREASE_BELLY_OFFSET]
	bne _02316E60
	cmp r6, #0
	beq _02316E60
	ldr r2, _02317110 ; =0x00000D6A
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02316E60:
	ldrh r1, [sp, #0x24]
	ldrh r0, [sp, #0x26]
	sub r2, sp, #4
	strh r1, [r2]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	add r1, r5, #0x100
	ldrh r2, [r1, #0x4a + TRY_INCREASE_BELLY_OFFSET]
	sub r3, sp, #4
	mov r4, r0
	strh r2, [r3]
	ldrh r0, [r1, #0x4c + TRY_INCREASE_BELLY_OFFSET]
	strh r0, [r3, #2]
	ldr r0, [r3]
	bl CeilFixedPoint
	cmp r4, r0
	bne _02316ED4
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r6, #0
	beq _023170F4
	ldr r2, _02317114 ; =0x00000D66
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023170F4
_02316ED4:
	mov r0, sb
	bl ov29_022E476C
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r6, #0
	beq _023170F4
	ldr r2, _02317118 ; =0x00000D65
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023170F4
_02316F08:
	ldrh r2, [r0, #0x46 + TRY_INCREASE_BELLY_OFFSET]
	ldrh r1, [r0, #0x48 + TRY_INCREASE_BELLY_OFFSET]
	mov r0, r8
	strh r2, [sp, #0x20]
	strh r1, [sp, #0x22]
	bl sub_02050FF8
	strh r0, [sp, #8]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0xa]
	add r1, r5, #0x100
	ldrh r4, [sp, #8]
	ldrh r2, [sp, #0xa]
	ldrh r0, [r1, #0x46 + TRY_INCREASE_BELLY_OFFSET]
	sub r3, sp, #4
	strh r4, [sp, #0x1c]
	strh r0, [r3]
	ldrh r0, [r1, #0x48 + TRY_INCREASE_BELLY_OFFSET]
	strh r2, [sp, #0x1e]
	ldrh r2, [sp, #0x1c]
	strh r0, [r3, #2]
	ldr r0, [r3]
	ldrh r1, [sp, #0x1e]
	strh r2, [r3]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl sub_02050EBC
	strh r0, [sp, #4]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #6]
	ldrh r2, [sp, #4]
	add r1, r5, #0x100
	ldrh r0, [sp, #6]
	strh r2, [r1, #0x46 + TRY_INCREASE_BELLY_OFFSET]
	sub r3, sp, #4
	strh r0, [r1, #0x48 + TRY_INCREASE_BELLY_OFFSET]
	ldrh r0, [r1, #0x46 + TRY_INCREASE_BELLY_OFFSET]
	strh r0, [r3]
	ldrh r0, [r1, #0x48 + TRY_INCREASE_BELLY_OFFSET]
	strh r0, [r3, #2]
	ldrh r2, [r1, #0x4a + TRY_INCREASE_BELLY_OFFSET]
	ldr r0, [r3]
	strh r2, [r3]
	ldrh r1, [r1, #0x4c + TRY_INCREASE_BELLY_OFFSET]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl sub_02050F78
	strh r0, [sp]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #2]
	ldr r0, _02317108 ; =0x000003E7
	ldrh r2, [sp]
	cmp r8, r0
	add r0, r5, #0x100
	ldrh r1, [sp, #2]
	strh r2, [r0, #0x46 + TRY_INCREASE_BELLY_OFFSET]
	strh r1, [r0, #0x48 + TRY_INCREASE_BELLY_OFFSET]
	ldreqh r1, [r0, #0x4a + TRY_INCREASE_BELLY_OFFSET]
	streqh r1, [r0, #0x46 + TRY_INCREASE_BELLY_OFFSET]
	ldreqh r1, [r0, #0x4c + TRY_INCREASE_BELLY_OFFSET]
	streqh r1, [r0, #0x48 + TRY_INCREASE_BELLY_OFFSET]
	mov r0, sb
	bl ov29_022E47BC
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrh r1, [sp, #0x20]
	sub r2, sp, #4
	ldrh r0, [sp, #0x22]
	strh r1, [r2]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	add r1, r5, #0x100
	ldrh r2, [r1, #0x46 + TRY_INCREASE_BELLY_OFFSET]
	sub r3, sp, #4
	mov r4, r0
	strh r2, [r3]
	ldrh r0, [r1, #0x48 + TRY_INCREASE_BELLY_OFFSET]
	strh r0, [r3, #2]
	ldr r0, [r3]
	bl CeilFixedPoint
	cmp r4, r0
	bne _02317074
	cmp r6, #0
	beq _023170F4
	ldr r2, _0231711C ; =0x00000D67
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023170F4
_02317074:
	add r0, r5, #0x100
	ldrh r1, [r0, #0x46 + TRY_INCREASE_BELLY_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + TRY_INCREASE_BELLY_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	add r1, r5, #0x100
	ldrh r2, [r1, #0x4a + TRY_INCREASE_BELLY_OFFSET]
	sub r3, sp, #4
	mov r4, r0
	strh r2, [r3]
	ldrh r0, [r1, #0x4c + TRY_INCREASE_BELLY_OFFSET]
	strh r0, [r3, #2]
	ldr r0, [r3]
	bl CeilFixedPoint
	cmp r4, r0
	blt _023170DC
	cmp r6, #0
	beq _023170F4
	ldr r2, _02317110 ; =0x00000D6A
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023170F4
_023170DC:
	cmp r6, #0
	beq _023170F4
	ldr r2, _02317120 ; =0x00000D6B
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_023170F4:
	mov r0, sb
	bl UpdateStatusIconFlags
_023170FC:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INCREASE_BELLY_DATA_OFFSET -0x2C0
#else
#define TRY_INCREASE_BELLY_DATA_OFFSET 0
#endif
_02317104: .word ov10_022C44B0
_02317108: .word 0x000003E7
_0231710C: .word 0x00000D6C + TRY_INCREASE_BELLY_DATA_OFFSET
_02317110: .word 0x00000D6A + TRY_INCREASE_BELLY_DATA_OFFSET
_02317114: .word 0x00000D66 + TRY_INCREASE_BELLY_DATA_OFFSET
_02317118: .word 0x00000D65 + TRY_INCREASE_BELLY_DATA_OFFSET
_0231711C: .word 0x00000D67 + TRY_INCREASE_BELLY_DATA_OFFSET
_02317120: .word 0x00000D6B + TRY_INCREASE_BELLY_DATA_OFFSET
	arm_func_end TryIncreaseBelly

	arm_func_start TryInflictMuzzledStatus
TryInflictMuzzledStatus: ; 0x02317124
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	cmp r4, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xf3]
	cmp r0, #1
	beq _023171F0
	ldr r1, _02317210 ; =ov10_022C4848
	mov r2, #1
	mov r0, r5
	strb r2, [r4, #0xf3]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xf4]
	bl ov29_022E47C0
	ldr r2, _02317214 ; =0x00000D72
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	b _02317200
_023171F0:
	ldr r2, _02317218 ; =0x00000D73
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02317200:
	mov r0, r5
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02317210: .word ov10_022C4848
#ifdef JAPAN
_02317214: .word 0x00000AB2
_02317218: .word 0x00000AB3
#else
_02317214: .word 0x00000D72
_02317218: .word 0x00000D73
#endif
	arm_func_end TryInflictMuzzledStatus

	arm_func_start TryTransform
TryTransform: ; 0x0231721C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x240
	mov sb, r1
	mov sl, r0
	mov r0, sb
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _023173F4
	ldr r8, [sb, #0xb4]
	ldrb r0, [r8, #0xef]
	cmp r0, #2
	bne _02317260
	ldr r2, _023173FC ; =0x00000D6F
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023173F4
_02317260:
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	add r0, sp, #0x40
	mov r1, #0
	bl MonsterSpawnListPartialCopy
	movs r6, r0
	bne _02317298
	ldr r2, _02317400 ; =0x00000D6E
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023173F4
_02317298:
	mov r0, #0
	bl sub_02024FB8
	mov r1, r0
	add r0, sp, #0
	bl strcpy
	mov r4, #0
	mov r7, r4
	ldrsh r5, [r8, #4]
	add fp, sp, #0x40
	b _02317310
_023172C0:
	mov r0, r6
	bl DungeonRandInt
	add r0, fp, r0, lsl #3
	bl GetMonsterIdFromSpawnEntry
	mov r1, r0
	mov r0, sb
	bl GetMonsterApparentId
	ldrsh r1, [r8, #4]
	mov r5, r0
	cmp r5, r1
	beq _0231730C
	mov r1, #1
	bl MewSpawnCheck
	cmp r0, #0
	beq _0231730C
	mov r0, r5
	bl DungeonGetSpriteIndex
	movs r4, r0
	bne _02317318
_0231730C:
	add r7, r7, #1
_02317310:
	cmp r7, #0x14
	blt _023172C0
_02317318:
	cmp r7, #0x14
	bne _02317334
	ldr r2, _02317400 ; =0x00000D6E
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023173F4
_02317334:
	cmp r4, #0
	bne _02317350
	ldr r2, _02317400 ; =0x00000D6E
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023173F4
_02317350:
	strh r5, [r8, #4]
	mov r0, sb
	strh r4, [sb, #0xa8]
	bl DetermineMonsterShadow
	mov r0, sb
	bl ov29_022E47C4
	mov r0, sb
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, sb
	bl ov29_02304830
	mov r0, sl
	mov r1, sb
	mov r2, #0
	bl EndInvisibleClassStatus
	mov r0, #2
	strb r0, [r8, #0xef]
	ldr r1, _02317404 ; =ov10_022C47FC
	mov r0, sb
	mov r2, #1
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r8, #0xf0]
	mov r0, #1
	bl sub_02024FB8
	ldrsh r1, [r8, #4]
	mov r2, #0x4e
	mov r4, r0
	bl GetNameWithGender
	mov r0, #0
	add r1, sp, #0
	bl ov29_0234B0B4
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0B4
	ldr r2, _02317408 ; =0x00000D6D
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sb
	bl UpdateStatusIconFlags
_023173F4:
	add sp, sp, #0x240
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_TRANSFORM_OFFSET -0x2C0
#else
#define TRY_TRANSFORM_OFFSET 0
#endif
_023173FC: .word 0x00000D6F + TRY_TRANSFORM_OFFSET
_02317400: .word 0x00000D6E + TRY_TRANSFORM_OFFSET
_02317404: .word ov10_022C47FC
_02317408: .word 0x00000D6D + TRY_TRANSFORM_OFFSET
	arm_func_end TryTransform

	arm_func_start TryInflictMobileStatus
TryInflictMobileStatus: ; 0x0231740C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r4, [r5, #0xb4]
	ldrb r0, [r4, #0xef]
	cmp r0, #3
	beq _02317494
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl EndInvisibleClassStatus
	mov r3, #3
	ldr r1, _023174C0 ; =ov10_022C480C
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xef]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xf0]
	bl ov29_022E47C8
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, r6
	mov r1, r5
#ifdef JAPAN
	mov r2, #0xab0
#else
	mov r2, #0xd70
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023174B4
_02317494:
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _023174C4 ; =0x00000D71
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023174B4:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023174C0: .word ov10_022C480C
#ifdef JAPAN
_023174C4: .word 0x00000AB1
#else
_023174C4: .word 0x00000D71
#endif
	arm_func_end TryInflictMobileStatus

	arm_func_start TryInflictExposedStatus
TryInflictExposedStatus: ; 0x023174C8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, #0
	mov r7, r1
	mov r8, r0
	mov r0, r7
	mov r6, r2
	mov sl, r3
	mov r4, sb
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, sb
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, r8
	mov r1, r7
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, sb
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, r8
	mov r1, r7
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	mov r0, sb
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r1, r7
	mov r2, r0
	ldr r5, [r7, #0xb4]
	bl SubstitutePlaceholderStringTags
	cmp sl, #0
	beq _02317568
	mov r0, r7
	mov r1, #0xe
	bl MonsterIsType
	cmp r0, #0
	movne r0, #1
	moveq r0, sb
	and r0, r0, #0xff
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02317568:
	ldrsh r0, [r5, #0x2e]
	cmp r0, #0xa
	movgt r0, #0xa
	movgt sb, #1
	strgth r0, [r5, #0x2e]
	cmp sb, #0
	beq _023175A4
	mov r0, r7
	mov r1, r6
	bl ov29_022E47CC
	ldr r2, _02317638 ; =0x00000D77
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r4, #1
_023175A4:
	ldrb r0, [r5, #0xfe]
	cmp r0, #0
	beq _023175C8
	ldr r2, _0231763C ; =0x00000D75
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_023175C8:
	cmp r4, #0
	bne _023175DC
	mov r0, r7
	mov r1, r6
	bl ov29_022E47CC
_023175DC:
	mov r0, r7
	mov r1, #0xe
	bl MonsterIsType
	cmp r0, #0
	bne _02317604
	ldr r2, _02317640 ; =0x00000D76
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02317628
_02317604:
	ldr r2, _02317644 ; =0x00000D74
	mov r3, #1
	mov r0, r8
	mov r1, r7
	strb r3, [r5, #0xfe]
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	mov r1, r7
	bl TryActivateQuickFeet
_02317628:
	mov r0, r7
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_EXPOSED_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_EXPOSED_STATUS_OFFSET 0
#endif
_02317638: .word 0x00000D77 + TRY_INFLICT_EXPOSED_STATUS_OFFSET
_0231763C: .word 0x00000D75 + TRY_INFLICT_EXPOSED_STATUS_OFFSET
_02317640: .word 0x00000D76 + TRY_INFLICT_EXPOSED_STATUS_OFFSET
_02317644: .word 0x00000D74 + TRY_INFLICT_EXPOSED_STATUS_OFFSET
	arm_func_end TryInflictExposedStatus

	arm_func_start TryActivateIdentifyCondition
TryActivateIdentifyCondition: ; 0x02317648
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _023176C0 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x78d]
	cmp r0, #0
	bne _023176AC
	mov r0, r4
	bl ov29_022E4868
	ldr r1, _023176C0 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #1
	strb r2, [r1, #0x78d]
	bl UpdateStatusIconFlags
	ldr r2, _023176C4 ; =0x00000D78
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
_023176AC:
	ldr r2, _023176C8 ; =0x00000D79
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023176C0: .word DUNGEON_PTR
#ifdef JAPAN
_023176C4: .word 0x00000AB8
_023176C8: .word 0x00000AB9
#else
_023176C4: .word 0x00000D78
_023176C8: .word 0x00000D79
#endif
	arm_func_end TryActivateIdentifyCondition

	arm_func_start TryInflictBlinkerStatus
TryInflictBlinkerStatus: ; 0x023176CC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r6, r2
	mov r7, r3
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	mov r1, r4
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	mov r1, r4
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	ldr r6, [r4, #0xb4]
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r6, #0xf1]
	cmp r0, #1
	beq _023177B8
	mov r2, #1
	cmp r7, #0
	strb r2, [r6, #0xf1]
	movne r0, #0x7f
	bne _0231777C
	ldr r1, _023177D8 ; =ov10_022C4828
	mov r0, r4
	bl CalcStatusDuration
	add r0, r0, #1
_0231777C:
	strb r0, [r6, #0xf2]
	mov r0, r4
	bl ov29_022E486C
	ldr r2, _023177DC ; =0x00000D34
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0x31
	bl AdvanceFrame
	bl UpdateTrapsVisibility
	bl UpdateMinimap
	mov r0, r5
	mov r1, r4
	bl TryActivateQuickFeet
	b _023177C8
_023177B8:
	ldr r2, _023177E0 ; =0x00000D35
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_023177C8:
	mov r0, r4
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023177D8: .word ov10_022C4828
#ifdef JAPAN
_023177DC: .word 0x00000A74
_023177E0: .word 0x00000A75
#else
_023177DC: .word 0x00000D34
_023177E0: .word 0x00000D35
#endif
	arm_func_end TryInflictBlinkerStatus
