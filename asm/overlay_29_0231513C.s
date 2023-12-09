	.include "asm/macros.inc"
	.include "overlay_29_0231513C.inc"

	.text

	arm_func_start ItemIsActive__0231513C
ItemIsActive__0231513C: ; 0x0231513C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0x6f
	mov r5, r0
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl HasHeldItem
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ItemIsActive__0231513C

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
_02315264: .word 0x00000D43
_02315268: .word 0x00000D44
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
_023155EC: .word 0x00000D83
_023155F0: .word ov10_022C4470
_023155F4: .word 0x000003E7
_023155F8: .word 0x00000CFD
_023155FC: .word 0x00000CFA
_02315600: .word 0x00000CFB
_02315604: .word 0x00000CFC
_02315608: .word 0x00000CF9
_0231560C: .word 0x00000CF8
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
_02315698: .word 0x00000CE4
_0231569C: .word 0x00000CE2
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
_02315750: .word 0x00000CE6
_02315754: .word 0x00000CE5
_02315758: .word 0x00000CE3
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
_023157E4: .word 0x00000CEA
_023157E8: .word 0x00000CE9
	arm_func_end RevealEnemies

	arm_func_start TryInflictLeechSeedStatus
TryInflictLeechSeedStatus: ; 0x023157EC
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
	ldr r0, [r0, #0xb78]
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
	mov r2, #0xce0
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	mov r0, r5
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023159BC: .word 0x00000DE1
_023159C0: .word 0x00000DE2
_023159C4: .word 0x00000CAF
_023159C8: .word ov10_022C4790
_023159CC: .word 0x00000CE1
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
	ldr r6, [r0, #0xb78]
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
	ldr r0, [r0, #0xb78]
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
_02315B5C: .word 0x00000C94
_02315B60: .word ov10_022C47D4
_02315B64: .word 0x00000D54
_02315B68: .word DUNGEON_PTR
_02315B6C: .word 0x00000D53
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
_02315BF8: .word 0x00000D2E
_02315BFC: .word 0x00000D2F
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
	mov r2, #0xd30
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
_02315CE4: .word 0x00000D31
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
	mov r2, #0xd40
	bl LogMessageByIdWithPopupCheckUserTarget
_02315D70:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02315D7C: .word ov10_022C47A4
_02315D80: .word 0x00000D3F
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
_02315E1C: .word 0x00000D41
_02315E20: .word 0x00000D42
	arm_func_end TryInflictFocusEnergyStatus

	arm_func_start TryInflictDecoyStatus
TryInflictDecoyStatus: ; 0x02315E24
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
	ldr r5, [r0, #0xb78]
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
	bl GetSleepAnimationId
	mov r1, r0
	mov r0, sb
	bl ov29_02304830
	ldr r0, _023160D0 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	cmp r7, #0
	add r0, r0, #0x3000
	strb r1, [r0, #0xe38]
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
	ldr r7, [r0, #0xb78]
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
_023160CC: .word 0x00000D46
_023160D0: .word DUNGEON_PTR
_023160D4: .word ov10_022C47B4
_023160D8: .word 0x00000D45
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
_02316278: .word 0x00000CEC
_0231627C: .word ATK_STAT_IDX
	arm_func_end TryInflictCurseStatus

	arm_func_start TryInflictSnatchStatus
TryInflictSnatchStatus: ; 0x02316280
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
	ldr sl, [r0, #0xb78]
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
	str r4, [r2, #0x904]
	ldr r2, [r3]
	ldr r6, [r6, #0xb0]
	add r3, r2, #0x19000
	mov r2, r0
	str r6, [r3, #0x90c]
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
_023163A4: .word 0x00000CED
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
	ldr r3, _023164C8 ; =0x00000C39
	mov ip, #8
	mov r0, r5
	mov r1, r4
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
_023164C8: .word 0x00000C39
_023164CC: .word ov10_022C47BC
_023164D0: .word 0x00000D49
_023164D4: .word 0x00000D4A
	arm_func_end TryInflictTauntStatus

	arm_func_start TryInflictStockpileStatus
TryInflictStockpileStatus: ; 0x023164D8
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
	ldrb r0, [r5, #0x11e]
	cmp r0, #3
	bhs _02316554
	add r1, r0, #1
	mov r0, #1
	strb r1, [r5, #0x11e]
	bl AnimationDelayOrSomething
	mov r0, r6
	bl ov29_022E46D4
	ldrb r1, [r5, #0x11e]
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
_02316574: .word 0x00000D4B
_02316578: .word 0x00000D4C
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
_02316624: .word 0x00000D4D
_02316628: .word 0x00000D4E
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
	ldrb r0, [r4, #0x106]
	cmp r0, #0
	bne _023166F4
	ldr r1, _02316714 ; =ov10_022C47D0
	mov r0, r5
	mov r2, #0
	bl CalcStatusDuration
	add r3, r0, #1
	ldr r2, _02316718 ; =0x00000D51
	mov r0, r6
	mov r1, r5
	strb r3, [r4, #0x106]
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
_02316714: .word ov10_022C47D0
_02316718: .word 0x00000D51
_0231671C: .word 0x00000D52
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
	ldr r3, _023168C4 ; =0x00000C39
	mov r0, r7
	mov r1, r6
	mov r2, #1
	str ip, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov lr, #0
	add ip, r4, #0x124
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
	ldrb r0, [r4, #0x144]
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
_023168C4: .word 0x00000C39
_023168C8: .word 0x00000D57
_023168CC: .word ov10_022C47D8
_023168D0: .word 0x00000D55
_023168D4: .word 0x00000D56
	arm_func_end TryInflictEncoreStatus

	arm_func_start TryDecreaseBelly
TryDecreaseBelly: ; 0x023168D8
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
	ldrh ip, [r1, #0x4a]
	ldrh r1, [r1, #0x4c]
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
	strh r2, [r1, #0x4a]
	sub r3, sp, #4
	strh r0, [r1, #0x4c]
	ldrh r0, [r1, #0x46]
	strh r0, [r3]
	ldrh r0, [r1, #0x48]
	strh r0, [r3, #2]
	ldrh r2, [r1, #0x4a]
	ldr r0, [r3]
	strh r2, [r3]
	ldrh r1, [r1, #0x4c]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl sub_02050F78
	strh r0, [sp, #8]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0xa]
	ldrh r0, [sp, #8]
	add r1, r4, #0x100
	ldrh r2, [sp, #0xa]
	strh r0, [r1, #0x46]
	mov r0, #0
	strh r2, [r1, #0x48]
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
	ldrh r0, [r1, #0x4a]
	sub r2, sp, #4
	strh r0, [r2]
	ldrh r0, [r1, #0x4c]
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
	ldrh ip, [r1, #0x46]
	ldrh r1, [r1, #0x48]
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
	strh r1, [r2, #0x46]
	mov r0, #0
	strh r3, [r2, #0x48]
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
	ldrh r2, [r1, #0x46]
	sub r3, sp, #4
	mov r4, r0
	strh r2, [r3]
	ldrh r0, [r1, #0x48]
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
_02316BA0: .word 0x00000D64
_02316BA4: .word 0x00000D68
_02316BA8: .word 0x00000D63
_02316BAC: .word 0x00000D69
	arm_func_end TryDecreaseBelly

	arm_func_start TryIncreaseBelly
TryIncreaseBelly: ; 0x02316BB0
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
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	add r1, r5, #0x100
	ldrh r2, [r1, #0x4a]
	sub r3, sp, #4
	mov fp, r0
	strh r2, [r3]
	ldrh r0, [r1, #0x4c]
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
	ldrh r4, [r0, #0x4a]
	ldrh r3, [r0, #0x4c]
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r4, [sp, #0x24]
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r3, [sp, #0x26]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	add r1, r5, #0x100
	ldrh r2, [r1, #0x4a]
	sub r3, sp, #4
	mov r4, r0
	strh r2, [r3]
	ldrh r0, [r1, #0x4c]
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
	ldrh r0, [r1, #0x4a]
	sub r3, sp, #4
	strh r7, [sp, #0x28]
	strh r0, [r3]
	ldrh r0, [r1, #0x4c]
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
	strh r0, [r1, #0x4a]
	mov r0, #0xc8
	strh r2, [r1, #0x4c]
	bl sub_02050FF8
	strh r0, [sp, #0x10]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0x12]
	add r1, r5, #0x100
	ldrh r0, [r1, #0x4a]
	sub r7, sp, #4
	ldrh r3, [sp, #0x10]
	strh r0, [r7]
	ldrh r0, [r1, #0x4c]
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
	strh r2, [r0, #0x4a]
	tst r4, #0xff
	strh r1, [r0, #0x4c]
	ldrh r1, [r0, #0x4a]
	strh r1, [r0, #0x46]
	ldrh r1, [r0, #0x4c]
	strh r1, [r0, #0x48]
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
	ldrh r2, [r1, #0x4a]
	sub r3, sp, #4
	mov r4, r0
	strh r2, [r3]
	ldrh r0, [r1, #0x4c]
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
	ldrh r2, [r0, #0x46]
	ldrh r1, [r0, #0x48]
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
	ldrh r0, [r1, #0x46]
	sub r3, sp, #4
	strh r4, [sp, #0x1c]
	strh r0, [r3]
	ldrh r0, [r1, #0x48]
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
	strh r2, [r1, #0x46]
	sub r3, sp, #4
	strh r0, [r1, #0x48]
	ldrh r0, [r1, #0x46]
	strh r0, [r3]
	ldrh r0, [r1, #0x48]
	strh r0, [r3, #2]
	ldrh r2, [r1, #0x4a]
	ldr r0, [r3]
	strh r2, [r3]
	ldrh r1, [r1, #0x4c]
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
	strh r2, [r0, #0x46]
	strh r1, [r0, #0x48]
	ldreqh r1, [r0, #0x4a]
	streqh r1, [r0, #0x46]
	ldreqh r1, [r0, #0x4c]
	streqh r1, [r0, #0x48]
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
	ldrh r2, [r1, #0x46]
	sub r3, sp, #4
	mov r4, r0
	strh r2, [r3]
	ldrh r0, [r1, #0x48]
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
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	add r1, r5, #0x100
	ldrh r2, [r1, #0x4a]
	sub r3, sp, #4
	mov r4, r0
	strh r2, [r3]
	ldrh r0, [r1, #0x4c]
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
_02317104: .word ov10_022C44B0
_02317108: .word 0x000003E7
_0231710C: .word 0x00000D6C
_02317110: .word 0x00000D6A
_02317114: .word 0x00000D66
_02317118: .word 0x00000D65
_0231711C: .word 0x00000D67
_02317120: .word 0x00000D6B
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
_02317214: .word 0x00000D72
_02317218: .word 0x00000D73
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
	bl ov29_02304BAC
	mov r0, sb
	bl ov29_022E47C4
	mov r0, sb
	bl GetSleepAnimationId
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
_023173FC: .word 0x00000D6F
_02317400: .word 0x00000D6E
_02317404: .word ov10_022C47FC
_02317408: .word 0x00000D6D
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
	mov r2, #0xd70
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
_023174C4: .word 0x00000D71
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
_02317638: .word 0x00000D77
_0231763C: .word 0x00000D75
_02317640: .word 0x00000D76
_02317644: .word 0x00000D74
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
_023176C4: .word 0x00000D78
_023176C8: .word 0x00000D79
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
_023177DC: .word 0x00000D34
_023177E0: .word 0x00000D35
	arm_func_end TryInflictBlinkerStatus

	arm_func_start IsBlinded
IsBlinded: ; 0x023177E4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _0231783C
	ldr r1, [r5, #0xb4]
	ldrb r0, [r1, #0xf1]
	cmp r0, #1
	beq _02317834
	cmp r4, #0
	beq _0231783C
	ldrb r0, [r1, #7]
	cmp r0, #0
	bne _0231783C
	mov r0, r5
	mov r1, #0xe
	bl ItemIsActive__0231513C
	cmp r0, #0
	beq _0231783C
_02317834:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0231783C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end IsBlinded

	arm_func_start TryInflictCrossEyedStatus
TryInflictCrossEyedStatus: ; 0x02317844
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
	ldrb r0, [r4, #0xf1]
	cmp r0, #2
	beq _02317930
	mov r0, r5
	bl ov29_022E48B8
	ldr r2, _02317950 ; =0x00000D36
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r3, #2
	ldr r1, _02317954 ; =ov10_022C4830
	mov r0, r5
	mov r2, #1
	strb r3, [r4, #0xf1]
	bl CalcStatusDuration
	add r2, r0, #1
	mov r0, r6
	mov r1, r5
	strb r2, [r4, #0xf2]
	bl TryActivateSteadfast
	mov r0, #1
	bl UpdateCamera
	bl UpdateTrapsVisibility
	bl UpdateMinimap
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	b _02317940
_02317930:
	ldr r2, _02317958 ; =0x00000D37
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02317940:
	mov r0, r5
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02317950: .word 0x00000D36
_02317954: .word ov10_022C4830
_02317958: .word 0x00000D37
	arm_func_end TryInflictCrossEyedStatus

	arm_func_start TryInflictEyedropStatus
TryInflictEyedropStatus: ; 0x0231795C
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
	ldrb r0, [r4, #0xf1]
	cmp r0, #3
	beq _023179E4
	ldr r1, _02317A00 ; =ov10_022C4838
	mov r3, #3
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xf1]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xf2]
	bl ov29_022E4914
	ldr r2, _02317A04 ; =0x00000D38
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0x31
	bl AdvanceFrame
	bl UpdateTrapsVisibility
	bl UpdateMinimap
	b _023179F4
_023179E4:
	ldr r2, _02317A08 ; =0x00000D39
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023179F4:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02317A00: .word ov10_022C4838
_02317A04: .word 0x00000D38
_02317A08: .word 0x00000D39
	arm_func_end TryInflictEyedropStatus

	arm_func_start TryInflictSlipStatus
TryInflictSlipStatus: ; 0x02317A0C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _02317A4C
	ldr r0, [r4, #0xb4]
	ldrsh r0, [r0, #2]
	bl GetMobilityType
	cmp r0, #0
	cmpne r0, #4
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	bne _02317A54
_02317A4C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02317A54:
	ldr r6, [r4, #0xb4]
	ldrb r0, [r6, #0xef]
	cmp r0, #4
	beq _02317AB8
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl EndInvisibleClassStatus
	mov r3, #4
	ldr r1, _02317AE8 ; =ov10_022C486C
	mov r0, r4
	mov r2, #1
	strb r3, [r6, #0xef]
	bl CalcStatusDuration
	add r3, r0, #1
	mov r0, #0
	mov r1, r4
	mov r2, r0
	strb r3, [r6, #0xf0]
	bl SubstitutePlaceholderStringTags
	ldr r2, _02317AEC ; =0x00000D3A
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02317AD8
_02317AB8:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02317AF0 ; =0x00000D3B
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02317AD8:
	mov r0, r4
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02317AE8: .word ov10_022C486C
_02317AEC: .word 0x00000D3A
_02317AF0: .word 0x00000D3B
	arm_func_end TryInflictSlipStatus

	arm_func_start TryInflictDropeyeStatus
TryInflictDropeyeStatus: ; 0x02317AF4
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _02317B40
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	bne _02317B40
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	beq _02317B48
_02317B40:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02317B48:
	ldr r4, [r5, #0xb4]
	ldrb r0, [r4, #0xf1]
	cmp r0, #1
	bne _02317B70
	ldr r2, _02317C0C ; =0x00000D3E
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02317B70:
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xf1]
	cmp r0, #4
	beq _02317BEC
	ldr r1, _02317C10 ; =ov10_022C487C
	mov r3, #4
	mov r0, r5
	mov r2, #1
	strb r3, [r4, #0xf1]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xf2]
	bl sub_01FFB62C
	ldr r0, _02317C14 ; =0x00000115
	bl ov29_022EACCC
	ldr r2, _02317C18 ; =0x00000D3C
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0x31
	bl AdvanceFrame
	bl UpdateTrapsVisibility
	bl UpdateMinimap
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	b _02317BFC
_02317BEC:
	ldr r2, _02317C1C ; =0x00000D3D
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02317BFC:
	mov r0, r5
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02317C0C: .word 0x00000D3E
_02317C10: .word ov10_022C487C
_02317C14: .word 0x00000115
_02317C18: .word 0x00000D3C
_02317C1C: .word 0x00000D3D
	arm_func_end TryInflictDropeyeStatus

	arm_func_start RestoreAllMovePP
RestoreAllMovePP: ; 0x02317C20
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov fp, r2
	mov r8, r3
	mov r6, #0
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _02317D48
	ldr r0, [sb, #0xb4]
	mov r5, r6
	add r4, r0, #0x124
_02317C58:
	ldrb r0, [r4, r5, lsl #3]
	add r7, r4, r5, lsl #3
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02317CD0
	ldrb r1, [r7, #6]
	mov r0, r7
	str r1, [sp, #4]
	bl GetMaxPp
	str r0, [sp]
	mov r0, r7
	bl GetMaxPpWrapper
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	cmp r1, r0
	bge _02317CD0
	ldr r0, [sp, #4]
	mov r6, #1
	add r0, r0, fp
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	cmp r1, r0
	ldrgt r0, [sp]
	strgt r0, [sp, #4]
	ldr r0, [sp, #4]
	strb r0, [r7, #6]
_02317CD0:
	add r5, r5, #1
	cmp r5, #4
	blt _02317C58
	cmp r6, #0
	beq _02317D18
	mov r0, sb
	bl ShowPpRestoreEffect
	cmp r8, #0
	bne _02317D40
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02317D50 ; =0x00000DB3
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02317D40
_02317D18:
	cmp r8, #0
	bne _02317D40
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02317D54 ; =0x00000DB4
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02317D40:
	mov r0, sb
	bl UpdateStatusIconFlags
_02317D48:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02317D50: .word 0x00000DB3
_02317D54: .word 0x00000DB4
	arm_func_end RestoreAllMovePP

	arm_func_start RestoreOneMovePP
RestoreOneMovePP: ; 0x02317D58
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r7, r1
	mov r8, r0
	mov r0, r7
	mov r5, r2
	mov r6, r3
	mov r4, #0
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _02317E78
	ldr r0, [r7, #0xb4]
	add r1, r0, #0x124
	ldrb r0, [r1, r5, lsl #3]
	add r5, r1, r5, lsl #3
	tst r0, #1
	movne r0, #1
	moveq r0, r4
	tst r0, #0xff
	beq _02317E78
	ldrb r1, [r5, #6]
	mov r0, r5
	str r1, [sp, #4]
	bl GetMaxPp
	str r0, [sp]
	mov r0, r5
	bl GetMaxPpWrapper
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	cmp r1, r0
	bge _02317E04
	ldr r0, [sp, #4]
	mov r4, #1
	add r0, r0, r6
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	cmp r1, r0
	ldrgt r0, [sp]
	strgt r0, [sp, #4]
	ldr r0, [sp, #4]
	strb r0, [r5, #6]
_02317E04:
	cmp r4, #0
	beq _02317E44
	mov r0, r7
	bl ShowPpRestoreEffect
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	beq _02317E70
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02317E80 ; =0x00000DB3
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02317E70
_02317E44:
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	beq _02317E70
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02317E84 ; =0x00000DB4
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02317E70:
	mov r0, r7
	bl UpdateStatusIconFlags
_02317E78:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02317E80: .word 0x00000DB3
_02317E84: .word 0x00000DB4
	arm_func_end RestoreOneMovePP

	arm_func_start RestoreRandomMovePP
RestoreRandomMovePP: ; 0x02317E88
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov sb, r1
	ldr r1, [sb, #0xb4]
	mov r6, #0
	mov sl, r0
	mov r8, r2
	mov r7, r3
	mov r5, r6
	add r4, r1, #0x124
	add fp, sp, #0xc
_02317EB4:
	ldrb r1, [r4, r5, lsl #3]
	add r0, r4, r5, lsl #3
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _02317F00
	ldrb r1, [r0, #6]
	str r1, [sp, #8]
	bl GetMaxPp
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	cmp r1, r0
	addlt r0, r6, #1
	movlt r1, r6, lsl #1
	movlt r0, r0, lsl #0x10
	strlth r5, [fp, r1]
	movlt r6, r0, asr #0x10
_02317F00:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #4
	blt _02317EB4
	cmp r6, #0
	ble _02317F48
	mov r0, r6
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	add r1, sp, #0xc
	mov r0, r0, asr #0xf
	ldrh r2, [r1, r0]
	mov r0, sl
	mov r1, sb
	mov r3, r8
	str r7, [sp]
	bl RestoreOneMovePP
_02317F48:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end RestoreRandomMovePP

	arm_func_start ApplyProteinEffect
ApplyProteinEffect: ; 0x02317F50
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, [r5, #0xb4]
	ldrb r3, [r2, #0x1a]
	add r1, r3, r4
	cmp r1, #0xff
	movge r1, #0xff
	and r0, r1, #0xff
	strb r1, [r2, #0x1a]
	cmp r3, r0
	bhs _02317FC0
	mov r0, r5
	bl ov29_022E49B4
	ldr r2, _02317FDC ; =0x00000D96
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02317FD0
_02317FC0:
	ldr r2, _02317FE0 ; =0x00000D97
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02317FD0:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02317FDC: .word 0x00000D96
_02317FE0: .word 0x00000D97
	arm_func_end ApplyProteinEffect

	arm_func_start ApplyCalciumEffect
ApplyCalciumEffect: ; 0x02317FE4
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, [r5, #0xb4]
	ldrb r3, [r2, #0x1b]
	add r1, r3, r4
	cmp r1, #0xff
	movge r1, #0xff
	and r0, r1, #0xff
	strb r1, [r2, #0x1b]
	cmp r3, r0
	bhs _02318054
	mov r0, r5
	bl ov29_022E4A04
	ldr r2, _02318070 ; =0x00000D98
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02318064
_02318054:
	ldr r2, _02318074 ; =0x00000D99
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02318064:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02318070: .word 0x00000D98
_02318074: .word 0x00000D99
	arm_func_end ApplyCalciumEffect

	arm_func_start ApplyIronEffect
ApplyIronEffect: ; 0x02318078
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, [r5, #0xb4]
	ldrb r3, [r2, #0x1c]
	add r1, r3, r4
	cmp r1, #0xff
	movge r1, #0xff
	and r0, r1, #0xff
	strb r1, [r2, #0x1c]
	cmp r3, r0
	bhs _023180E8
	mov r0, r5
	bl ov29_022E4A54
	ldr r2, _02318104 ; =0x00000D9A
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023180F8
_023180E8:
	ldr r2, _02318108 ; =0x00000D9B
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023180F8:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02318104: .word 0x00000D9A
_02318108: .word 0x00000D9B
	arm_func_end ApplyIronEffect

	arm_func_start ApplyZincEffect
ApplyZincEffect: ; 0x0231810C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, [r5, #0xb4]
	ldrb r3, [r2, #0x1d]
	add r1, r3, r4
	cmp r1, #0xff
	movge r1, #0xff
	and r0, r1, #0xff
	strb r1, [r2, #0x1d]
	cmp r3, r0
	bhs _0231817C
	mov r0, r5
	bl ov29_022E4AA4
	ldr r2, _02318198 ; =0x00000D9C
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231818C
_0231817C:
	ldr r2, _0231819C ; =0x00000D9D
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_0231818C:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02318198: .word 0x00000D9C
_0231819C: .word 0x00000D9D
	arm_func_end ApplyZincEffect

	arm_func_start TryInflictLongTossStatus
TryInflictLongTossStatus: ; 0x023181A0
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r4, [r5, #0xb4]
	mov r6, r0
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xee]
	cmp r0, #1
	beq _023181EC
	mov r1, #1
	mov r0, r5
	strb r1, [r4, #0xee]
	bl ov29_022E4AF0
	ldr r2, _02318208 ; =0x00000DDD
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023181FC
_023181EC:
	ldr r2, _0231820C ; =0x00000DDE
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023181FC:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02318208: .word 0x00000DDD
_0231820C: .word 0x00000DDE
	arm_func_end TryInflictLongTossStatus

	arm_func_start TryInflictPierceStatus
TryInflictPierceStatus: ; 0x02318210
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r4, [r5, #0xb4]
	mov r6, r0
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xee]
	cmp r0, #2
	beq _0231825C
	mov r1, #2
	mov r0, r5
	strb r1, [r4, #0xee]
	bl ov29_022E4B3C
	ldr r2, _02318278 ; =0x00000DDF
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231826C
_0231825C:
	mov r0, r6
	mov r1, r5
	mov r2, #0xde0
	bl LogMessageByIdWithPopupCheckUserTarget
_0231826C:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02318278: .word 0x00000DDF
	arm_func_end TryInflictPierceStatus

	arm_func_start TryInflictGastroAcidStatus
TryInflictGastroAcidStatus: ; 0x0231827C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r8, r3
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r6
	bl EntityIsValid__02315118
	cmp r0, #0
	mov r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r1, r6
	mov r2, r0
	ldr r4, [r6, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r0, r7
	mov r1, r6
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r7
	mov r1, r6
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r8, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r4, #0xd8]
	cmp r0, #4
	beq _02318388
	mov r0, r7
	mov r1, r6
	bl TryRemoveSnatchedMonsterFromDungeonStruct
	mov r3, #4
	ldr r1, _023183B0 ; =ov10_022C476C
	mov r0, r6
	mov r2, #1
	strb r3, [r4, #0xd8]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r4, #0xdb]
	mov r1, #0
	ldr r0, _023183B4 ; =DUNGEON_PTR
	strb r1, [r4, #0xdc]
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0xe]
	cmp r5, #0
	beq _02318370
	ldr r2, _023183B8 ; =0x00000D7B
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02318370:
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	mov r0, r6
	bl ov29_022FB984
	b _023183A0
_02318388:
	cmp r5, #0
	beq _023183A0
	ldr r2, _023183BC ; =0x00000D7C
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_023183A0:
	mov r0, r6
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023183B0: .word ov10_022C476C
_023183B4: .word DUNGEON_PTR
_023183B8: .word 0x00000D7B
_023183BC: .word 0x00000D7C
	arm_func_end TryInflictGastroAcidStatus

	arm_func_start SetAquaRingHealingCountdownTo4
SetAquaRingHealingCountdownTo4: ; 0x023183C0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__02315118
	cmp r0, #0
	ldrne r0, _023183E4 ; =ov10_022C4620
	ldrne r1, [r4, #0xb4]
	ldrnesh r0, [r0]
	strneb r0, [r1, #0xd7]
	ldmia sp!, {r4, pc}
	.align 2, 0
_023183E4: .word ov10_022C4620
	arm_func_end SetAquaRingHealingCountdownTo4

	arm_func_start ApplyAquaRingHealing
ApplyAquaRingHealing: ; 0x023183E8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _0231844C
	ldr r3, [r4, #0xb4]
	ldr r0, _02318454 ; =0x000003E7
	ldrsh r2, [r3, #0x12]
	ldrsh r1, [r3, #0x16]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	ldrsh r0, [r3, #0x10]
	cmp r0, r1
	bge _02318444
	ldr r0, _02318458 ; =ov10_022C4628
	mov r3, #0
	ldrsh r2, [r0]
	mov r0, r4
	mov r1, r4
	str r3, [sp]
	bl TryIncreaseHp
_02318444:
	mov r0, r4
	bl SetAquaRingHealingCountdownTo4
_0231844C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02318454: .word 0x000003E7
_02318458: .word ov10_022C4628
	arm_func_end ApplyAquaRingHealing

	arm_func_start TryInflictAquaRingStatus
TryInflictAquaRingStatus: ; 0x0231845C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #0x10
	beq _023184E0
	ldr r1, _023184FC ; =ov10_022C4764
	mov r3, #0x10
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xd6]
	bl SetAquaRingHealingCountdownTo4
	ldr r2, _02318500 ; =0x00000D7D
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023184F0
_023184E0:
	ldr r2, _02318504 ; =0x00000D7E
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023184F0:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023184FC: .word ov10_022C4764
_02318500: .word 0x00000D7D
_02318504: .word 0x00000D7E
	arm_func_end TryInflictAquaRingStatus

	arm_func_start TryInflictLuckyChantStatus
TryInflictLuckyChantStatus: ; 0x02318508
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #0x11
	beq _02318584
	ldr r1, _023185A0 ; =ov10_022C4768
	mov r3, #0x11
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r3, r0, #1
	ldr r2, _023185A4 ; =0x00000D7F
	mov r0, r6
	mov r1, r5
	strb r3, [r4, #0xd6]
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02318594
_02318584:
	mov r0, r6
	mov r1, r5
	mov r2, #0xd80
	bl LogMessageByIdWithPopupCheckUserTarget
_02318594:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023185A0: .word ov10_022C4768
_023185A4: .word 0x00000D7F
	arm_func_end TryInflictLuckyChantStatus

	arm_func_start TryInflictHealBlockStatus
TryInflictHealBlockStatus: ; 0x023185A8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r7, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	ldr r7, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r7, #0xd8]
	cmp r0, #5
	beq _02318698
	mov r0, r6
	mov r1, r5
	bl TryRemoveSnatchedMonsterFromDungeonStruct
	mov r3, #5
	ldr r1, _023186C0 ; =ov10_022C4774
	mov r0, r5
	mov r2, #1
	strb r3, [r7, #0xd8]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r7, #0xdb]
	cmp r4, #0
	beq _02318688
	ldr r2, _023186C4 ; =0x00000D81
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02318688:
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	b _023186B0
_02318698:
	cmp r4, #0
	beq _023186B0
	ldr r2, _023186C8 ; =0x00000D82
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023186B0:
	mov r0, r5
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023186C0: .word ov10_022C4774
_023186C4: .word 0x00000D81
_023186C8: .word 0x00000D82
	arm_func_end TryInflictHealBlockStatus

	arm_func_start MonsterHasEmbargoStatus
MonsterHasEmbargoStatus: ; 0x023186CC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xd8]
	cmp r0, #6
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end MonsterHasEmbargoStatus

	arm_func_start LogItemBlockedByEmbargo
LogItemBlockedByEmbargo: ; 0x02318700
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02318728 ; =0x00000D86
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, pc}
	.align 2, 0
_02318728: .word 0x00000D86
	arm_func_end LogItemBlockedByEmbargo

	arm_func_start TryInflictEmbargoStatus
TryInflictEmbargoStatus: ; 0x0231872C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r7, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	ldr r7, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r7, #0xd8]
	cmp r0, #6
	beq _0231881C
	mov r0, r6
	mov r1, r5
	bl TryRemoveSnatchedMonsterFromDungeonStruct
	mov r3, #6
	ldr r1, _02318844 ; =ov10_022C4778
	mov r0, r5
	mov r2, #1
	strb r3, [r7, #0xd8]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r7, #0xdb]
	cmp r4, #0
	beq _0231880C
	ldr r2, _02318848 ; =0x00000D84
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_0231880C:
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	b _02318834
_0231881C:
	cmp r4, #0
	beq _02318834
	ldr r2, _0231884C ; =0x00000D85
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02318834:
	mov r0, r5
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02318844: .word ov10_022C4778
_02318848: .word 0x00000D84
_0231884C: .word 0x00000D85
	arm_func_end TryInflictEmbargoStatus

	arm_func_start TryInflictMiracleEyeStatus
TryInflictMiracleEyeStatus: ; 0x02318850
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
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
	mov r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r1, r6
	mov r2, r0
	ldr r4, [r6, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r0, r6
	mov r1, #0x10
	bl HasTypeAffectedByGravity
	cmp r0, #0
	bne _02318900
	cmp r5, #0
	bne _023188F8
	ldr r2, _02318974 ; =0x00000D89
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_023188F8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02318900:
	cmp r5, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r0, [r4, #0xf5]
	cmp r0, #1
	beq _02318954
	ldr r1, _02318978 ; =ov10_022C477C
	mov r2, #1
	mov r0, r6
	strb r2, [r4, #0xf5]
	bl CalcStatusDuration
	add r3, r0, #1
	ldr r2, _0231897C ; =0x00000D87
	mov r0, r7
	mov r1, r6
	strb r3, [r4, #0xf6]
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	b _02318964
_02318954:
	ldr r2, _02318980 ; =0x00000D88
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02318964:
	mov r0, r6
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02318974: .word 0x00000D89
_02318978: .word ov10_022C477C
_0231897C: .word 0x00000D87
_02318980: .word 0x00000D88
	arm_func_end TryInflictMiracleEyeStatus

	arm_func_start TryInflictMagnetRiseStatus
TryInflictMagnetRiseStatus: ; 0x02318984
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl GravityIsActive
	cmp r0, #0
	beq _023189B0
	ldr r2, _02318A3C ; =0x00000D8C
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r4, r5, r6, pc}
_023189B0:
	mov r0, r6
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xf7]
	cmp r0, #1
	beq _02318A20
	ldr r1, _02318A40 ; =ov10_022C4780
	mov r2, #1
	mov r0, r5
	strb r2, [r4, #0xf7]
	bl CalcStatusDuration
	add r3, r0, #1
	ldr r2, _02318A44 ; =0x00000D8A
	mov r0, r6
	mov r1, r5
	strb r3, [r4, #0xf8]
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02318A30
_02318A20:
	ldr r2, _02318A48 ; =0x00000D8B
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02318A30:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02318A3C: .word 0x00000D8C
_02318A40: .word ov10_022C4780
_02318A44: .word 0x00000D8A
_02318A48: .word 0x00000D8B
	arm_func_end TryInflictMagnetRiseStatus

	arm_func_start IsFloating
IsFloating: ; 0x02318A4C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl GravityIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xf7]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end IsFloating

	arm_func_start ov29_02318A90
ov29_02318A90: ; 0x02318A90
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl IsMonster__02318AB0
	cmp r0, #0
	ldrne r0, [r5, #0xb4]
	strneb r4, [r0, #0x10b]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02318A90

	arm_func_start IsMonster__02318AB0
IsMonster__02318AB0: ; 0x02318AB0
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMonster__02318AB0

	arm_func_start ov29_02318AD4
ov29_02318AD4: ; 0x02318AD4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	mov r8, #1
	bl IsMonster__02318AB0
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov sb, #0
	ldr r7, [r4, #0xb4]
	mov r5, sb
	mov r6, r8
	mov r4, #0x53
	b _02318B3C
_02318B04:
	ldrb r0, [r7, #0x10b]
	cmp r0, #1
	bne _02318B20
	ldr r0, [r7, #0x188]
	cmp r0, #0xc800
	movge r8, r6
	movlt r8, r5
_02318B20:
	cmp r8, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r4
	bl AdvanceFrame
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_02318B3C:
	cmp sb, #0x190
	blt _02318B04
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_02318AD4

	arm_func_start ov29_02318B48
ov29_02318B48: ; 0x02318B48
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	mov r8, #1
	bl IsMonster__02318AB0
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov sb, #0
	ldr r7, [r4, #0xb4]
	mov r5, sb
	mov r6, r8
	mov r4, #0x53
	b _02318BB0
_02318B78:
	ldrb r0, [r7, #0x10b]
	cmp r0, #0
	bne _02318B94
	ldr r0, [r7, #0x188]
	cmp r0, #0
	movle r8, r6
	movgt r8, r5
_02318B94:
	cmp r8, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r4
	bl AdvanceFrame
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_02318BB0:
	cmp sb, #0x190
	blt _02318B78
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_02318B48

	arm_func_start ov29_02318BBC
ov29_02318BBC: ; 0x02318BBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov sb, r0
	mov r0, r8
	mov r7, r2
	mov r6, r3
	bl EntityIsValid__02318D34
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #0
	ldr r5, [r8, #0xb4]
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r5, #0xd2]
	cmp r0, r7
	cmpeq r7, #0xc
	bne _02318C18
	ldr r2, _02318D20 ; =0x00000D7A
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02318C18:
	strb r7, [r5, #0xd2]
	mov r2, #0
	add r0, r5, #0x124
	b _02318C3C
_02318C28:
	add r1, r0, r2, lsl #3
	cmp r1, r6
	streqb r2, [r5, #0xd4]
	beq _02318C44
	add r2, r2, #1
_02318C3C:
	cmp r2, #4
	blt _02318C28
_02318C44:
	add r0, r7, #0xf9
	mov r1, #1
	and r0, r0, #0xff
	strb r1, [r5, #0x154]
	cmp r0, #1
	mov r4, #0
	movls r4, r1
	strlsb r1, [r5, #0x10b]
	bls _02318C7C
	cmp r7, #9
	cmpne r7, #0xa
	cmpne r7, #0xd
	moveq r0, #2
	streqb r0, [r5, #0x10b]
_02318C7C:
	cmp r7, #1
	bne _02318CD0
	ldr r1, _02318D24 ; =ov10_022C4754
	mov r0, r8
	mov r2, #0
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r5, #0xd3]
	mov r0, #0
	str r0, [r5, #0xb8]
	ldrh r1, [r6, #4]
	cmp r1, #0x154
	ldreq r0, _02318D28 ; =0x00000166
	streqh r0, [r5, #0xac]
	beq _02318CD0
	ldr r0, _02318D2C ; =0x00000217
	cmp r1, r0
	subeq r0, r0, #0xb0
	streqh r0, [r5, #0xac]
	subne r0, r0, #0xb2
	strneh r0, [r5, #0xac]
_02318CD0:
	cmp r7, #0xc
	bne _02318CF0
	ldr r1, _02318D30 ; =ov10_022C475C
	mov r0, r8
	mov r2, #0
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r5, #0xd3]
_02318CF0:
	mov r0, r8
	mov r1, r4
	bl ov29_022E41B0
	ldr r2, [sp, #0x20]
	mov r0, sb
	mov r1, r8
	bl LogMessageWithPopupCheckUserTarget
	mov r0, r8
	bl UpdateStatusIconFlags
	mov r0, r8
	bl ov29_02318AD4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02318D20: .word 0x00000D7A
_02318D24: .word ov10_022C4754
_02318D28: .word 0x00000166
_02318D2C: .word 0x00000217
_02318D30: .word ov10_022C475C
	arm_func_end ov29_02318BBC
