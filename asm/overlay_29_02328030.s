	.include "asm/macros.inc"
	.include "overlay_29_02328030.inc"

	.text

	arm_func_start ov29_02328030
ov29_02328030: ; 0x02328030
	stmdb sp!, {r3, lr}
	ldr r3, [r1, #0xb4]
	ldr r2, _02328070 ; =0x000003E7
	ldrsh ip, [r3, #0x12]
	ldrsh r3, [r3, #0x16]
	add r3, ip, r3
	cmp r3, r2
	movgt r3, r2
	add r2, r3, r3, lsr #31
	mov ip, #1
	mov r2, r2, asr #1
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02328070: .word 0x000003E7
	arm_func_end ov29_02328030

	arm_func_start ov29_02328074
ov29_02328074: ; 0x02328074
	stmdb sp!, {r3, r4, r5, lr}
	ldr lr, _023280D0 ; =0x02353538
	ldr r5, [r1, #0xb4]
	ldr ip, [lr]
	mov r4, #0xc
	add ip, ip, #0x1a000
	str r4, [ip, #0x234]
	ldr ip, [lr]
	mov lr, #0
	add ip, ip, #0x1a000
	str lr, [ip, #0x238]
	ldrb ip, [r5, #0xd2]
	mov r4, #1
	cmp ip, #0xa
	moveq r4, #2
	str r3, [sp]
	mov r3, r4, lsl #8
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023280D0: .word 0x02353538
	arm_func_end ov29_02328074

	arm_func_start ov29_023280D4
ov29_023280D4: ; 0x023280D4
	ldr r0, _02328108 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r2, [r0, #0xd4]
	mov r0, #0xc
	cmp r2, #0
	movlt r2, #0
	cmp r2, #0xc7
	movge r2, #0xc6
	mul r1, r2, r0
	ldr r0, _0232810C ; =0x022C6324
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_02328108: .word 0x02353538
_0232810C: .word 0x022C6324
	arm_func_end ov29_023280D4

	arm_func_start ov29_02328110
ov29_02328110: ; 0x02328110
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	mov r6, r1
	mov r5, r3
	bl ov29_023280D4
	mov r4, r0
	ldr r0, _02328164 ; =0x022C4E40
	mov r1, r4, lsl #3
	ldrh r1, [r0, r1]
	add r0, sp, #0
	bl InitMove
	ldr ip, _02328168 ; =0x022C4E44
	mov r0, r7
	ldr ip, [ip, r4, lsl #3]
	mov r1, r6
	mov r3, r5
	add r2, sp, #0
	blx ip
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02328164: .word 0x022C4E40
_02328168: .word 0x022C4E44
	arm_func_end ov29_02328110

	arm_func_start ov29_0232816C
ov29_0232816C: ; 0x0232816C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023281C8
	ldr r1, _023281D4 ; =0x022C4528
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023281C8
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictParalysisStatus
_023281C8:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_023281D4: .word 0x022C4528
	arm_func_end ov29_0232816C

	arm_func_start ov29_023281D8
ov29_023281D8: ; 0x023281D8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r6, r2
	mov r8, r0
	mov r5, r3
	mov r0, r6
	mov r7, r1
	bl GetMoveType
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl ov29_02324E44
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, r8
	mov r1, r7
	add r2, r7, #4
	mov r3, #1
	bl ov29_02320448
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov29_023281D8

	arm_func_start ov29_02328230
ov29_02328230: ; 0x02328230
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryInflictParalysisStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02328230

	arm_func_start ov29_02328248
ov29_02328248: ; 0x02328248
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023282B4
	ldr r1, _023282C0 ; =0x022C461C
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023282B4
	ldr r0, _023282C4 ; =0x02352AE8
	mov r3, r4
	ldr r2, [r0]
	mov r0, r6
	mov r1, r5
	str r3, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl LowerDefensiveStat
_023282B4:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023282C0: .word 0x022C461C
_023282C4: .word 0x02352AE8
	arm_func_end ov29_02328248

	arm_func_start ov29_023282C8
ov29_023282C8: ; 0x023282C8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	ldr r0, _02328320 ; =0x00000CD9
	mov r5, r1
	mov r4, r2
	bl StringFromMessageId
	str r0, [sp]
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0xb
	bl ov29_02318BBC
	ldr r2, _02328324 ; =0x02352AE8
	mov r0, r6
	mov r1, r5
	ldr r2, [r2]
	mov r3, #1
	bl BoostDefensiveStat
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02328320: .word 0x00000CD9
_02328324: .word 0x02352AE8
	arm_func_end ov29_023282C8

	arm_func_start ov29_02328328
ov29_02328328: ; 0x02328328
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02328384
	ldr r1, _02328390 ; =0x022C465C
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02328384
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictParalysisStatus
_02328384:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02328390: .word 0x022C465C
	arm_func_end ov29_02328328

	arm_func_start ov29_02328394
ov29_02328394: ; 0x02328394
	stmdb sp!, {r3, lr}
	bl ov29_02318F10
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02328394

	arm_func_start ov29_023283A4
ov29_023283A4: ; 0x023283A4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov r7, r2
	mov sb, r0
	mov r2, #0
	mov r0, r7
	mov r8, r1
	mov r6, r3
	strb r2, [sp, #0x1c]
	mov r5, #1
	bl GetMoveType
	mov r4, r0
	mov r0, sb
	mov r1, #0x57
	bl AbilityIsActive2
	mov r3, r0
	mov r2, r4
	mov r0, sb
	mov r1, r8
	bl ov29_0230D4A4
	cmp r0, #0
	mov r0, sb
	mov r1, #0x53
	moveq r5, #0
	bl AbilityIsActive2
	cmp r0, #0
	bne _02328420
	mov r0, r8
	bl LevitateIsActive
	cmp r0, #0
	movne r5, #0
_02328420:
	cmp r5, #0
	bne _0232843C
	ldr r2, _023284B4 ; =0x00000ED3
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023284A8
_0232843C:
	mov r0, r7
	bl GetMoveType
	mov r5, r0
	ldrh r0, [r7, #4]
	bl GetMoveCategory
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl ov29_02324E44
	add r3, sp, #0x1c
	stmia sp, {r3, r5}
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	ldr r2, _023284B8 ; =0x0000270F
	mov r1, r8
	mov r0, sb
	str r3, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [sp, #0x1c]
_023284A8:
	ldrb r0, [sp, #0x1c]
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_023284B4: .word 0x00000ED3
_023284B8: .word 0x0000270F
	arm_func_end ov29_023283A4

	arm_func_start ov29_023284BC
ov29_023284BC: ; 0x023284BC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02328518
	ldr r1, _02328524 ; =0x022C4448
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02328518
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictCringeStatus
_02328518:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02328524: .word 0x022C4448
	arm_func_end ov29_023284BC

	arm_func_start ov29_02328528
ov29_02328528: ; 0x02328528
	stmdb sp!, {r3, lr}
	bl ov29_02318E70
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02328528

	arm_func_start ov29_02328538
ov29_02328538: ; 0x02328538
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r2
	mov r6, r3
	mov r7, r0
	mov sb, r1
	mov r2, #0x3a
	mov r3, #1
	mov r4, #0
	bl DefenderAbilityIsActive__02328634
	mov r5, r0
	mov r0, r7
	mov r1, sb
	mov r2, r8
	mov r3, #0x100
	str r6, [sp]
	bl DealDamage
	cmp r0, #0
	beq _0232862C
	add r0, r0, r0, lsr #31
	mov r6, r0, asr #1
	cmp r6, #1
	mov r0, r7
	movlt r6, #1
	bl EntityIsValid__0232800C
	cmp r0, #0
	beq _0232862C
	ldr r1, [r7, #0xb4]
	mov r4, #1
	ldrb r0, [r1, #0x108]
	cmp r0, #1
	strlob r4, [r1, #0x108]
	mov r0, r7
	mov r1, #0
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _0232862C
	ldr r1, [r7, #0xb4]
	ldrb r0, [r1, #6]
	cmp r0, #0
	movne r0, #0
	bne _023285E8
	add r0, r1, #0x228
	mov r1, #0x57
	bl ExclusiveItemEffectFlagTest
_023285E8:
	cmp r0, #0
	movne r6, r6, lsl #1
	cmp r5, #0
	beq _02328610
	mov r2, #0xd
	mov r0, r7
	mov r1, r6
	add r3, r2, #0x22c
	bl ov29_0230D11C
	b _0232862C
_02328610:
	mov r5, #1
	mov r0, r7
	mov r1, r7
	mov r2, r6
	mov r3, #0
	str r5, [sp]
	bl TryIncreaseHp
_0232862C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_02328538

	arm_func_start DefenderAbilityIsActive__02328634
DefenderAbilityIsActive__02328634: ; 0x02328634
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	cmp r0, r5
	beq _02328688
	cmp r0, #0
	moveq r1, #0
	beq _02328668
	ldr r1, [r0]
	cmp r1, #1
	moveq r1, #1
	movne r1, #0
	and r1, r1, #0xff
_02328668:
	cmp r1, #0
	cmpne r3, #0
	beq _02328688
	mov r1, #0x53
	bl AbilityIsActive2
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_02328688:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActive2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DefenderAbilityIsActive__02328634

	arm_func_start ov29_02328698
ov29_02328698: ; 0x02328698
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r1
	mov r7, r0
	mov r1, #0x35
	ldr r4, [r7, #0xb4]
	ldr r5, [r6, #0xb4]
	bl AbilityIsActive2
	cmp r0, #0
	bne _023286D0
	mov r0, r6
	mov r1, #0x35
	bl AbilityIsActive2
	cmp r0, #0
	beq _023286E8
_023286D0:
	ldr r2, _02328784 ; =0x00000ED5
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023286E8:
	mov r0, r7
	mov r1, #0x74
	bl AbilityIsActive2
	cmp r0, #0
	beq _02328714
	ldr r2, _02328788 ; =0x00000ED6
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02328714:
	ldrb r8, [r5, #0x60]
	ldrb lr, [r5, #0x61]
	ldrb r0, [r4, #0x60]
	ldr r1, _0232878C ; =0x02353538
	mov ip, #1
	strb r0, [r5, #0x60]
	ldrb r3, [r4, #0x61]
	ldr r2, _02328790 ; =0x00000ED4
	mov r0, r7
	strb r3, [r5, #0x61]
	strb r8, [r4, #0x60]
	strb lr, [r4, #0x61]
	ldr r3, [r1]
	mov r1, r6
	strb ip, [r3, #0xe]
	bl LogMessageByIdWithPopupCheckUserTarget
	ldrb r0, [r4, #0x108]
	mov r1, r7
	cmp r0, #1
	movlo r0, #1
	strlob r0, [r4, #0x108]
	mov r0, r7
	bl ov29_022FA7DC
	mov r0, r7
	mov r1, r6
	bl ov29_022FA7DC
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02328784: .word 0x00000ED5
_02328788: .word 0x00000ED6
_0232878C: .word 0x02353538
_02328790: .word 0x00000ED4
	arm_func_end ov29_02328698

	arm_func_start ov29_02328794
ov29_02328794: ; 0x02328794
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r4, #0
	mov sb, r1
	str r4, [sp]
	ldr r6, [sb, #0xb4]
	mov sl, r0
	add r0, r6, #0x124
	mov r8, r2
	mov fp, r4
	mov r7, r4
	ldr r5, [sl, #0xb4]
	str r0, [sp, #4]
	b _02328820
_023287CC:
	add r0, r6, r7, lsl #3
	ldrb r0, [r0, #0x124]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0232881C
	ldr r1, [sp, #4]
	add r0, r5, #0x124
	add r1, r1, r7, lsl #3
	bl IsSameMove
	cmp r0, #0
	bne _0232881C
	add r1, r6, r7, lsl #3
	ldrb r0, [r1, #0x124]
	tst r0, #0x10
	addne r0, r1, #0x100
	ldrneh fp, [r0, #0x28]
	movne r4, #1
	bne _02328828
_0232881C:
	add r7, r7, #1
_02328820:
	cmp r7, #4
	blt _023287CC
_02328828:
	cmp r4, #0
	bne _02328848
	ldr r2, _023288BC ; =0x00000DB8
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _023288B4
_02328848:
	cmp fp, #0
	bne _02328864
	ldr r2, _023288BC ; =0x00000DB8
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023288B0
_02328864:
	mov r0, r8
	mov r1, fp
	bl InitMove
	ldrh r1, [r8, #4]
	mov r0, #0
	bl ov29_0234B084
	ldrh r1, [r8, #2]
	ldr r2, _023288C0 ; =0x00000DB7
	mov r0, sl
	orr r3, r1, #0x24
	mov r1, sb
	strh r3, [r8, #2]
	bl LogMessageByIdWithPopupCheckUserTarget
	ldrb r0, [r5, #0x108]
	cmp r0, #1
	movlo r0, #1
	strlob r0, [r5, #0x108]
	mov r0, #1
	str r0, [sp]
_023288B0:
	ldr r0, [sp]
_023288B4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023288BC: .word 0x00000DB8
_023288C0: .word 0x00000DB7
	arm_func_end ov29_02328794

	arm_func_start ov29_023288C4
ov29_023288C4: ; 0x023288C4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02328920
	ldr r1, _0232892C ; =0x022C4498
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02328920
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictCringeStatus
_02328920:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232892C: .word 0x022C4498
	arm_func_end ov29_023288C4

	arm_func_start ov29_02328930
ov29_02328930: ; 0x02328930
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r2
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023289E8
	mov r0, r6
	mov r1, #7
	mov r4, #1
	bl AbilityIsActive2
	cmp r0, #0
	bne _023289E8
	mov r0, r6
	mov r1, #0
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _023289E8
	ldr r1, [r6, #0xb4]
	ldr r0, _023289F4 ; =0x000003E7
	ldrsh r2, [r1, #0x12]
	ldrsh r1, [r1, #0x16]
	ldrh r3, [r5, #4]
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
	mov r0, r6
	mov r3, r2
	str r2, [sp, #0x14]
	bl CalcRecoilDamageFixed
_023289E8:
	mov r0, r4
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023289F4: .word 0x000003E7
	arm_func_end ov29_02328930

	arm_func_start ov29_023289F8
ov29_023289F8: ; 0x023289F8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02328A48 ; =0x022C4654
	ldr r2, _02328A4C ; =0x02353538
	ldrsh r3, [r3]
	ldr r2, [r2]
	mov r5, r0
	mov r4, r1
	add r2, r2, #0xcd00
	mov r0, #1
	mov r1, #0
	strh r3, [r2, #0x3e]
	bl ov29_023354C4
	cmp r0, #0
	bne _02328A40
	ldr r2, _02328A50 ; =0x00000EC6
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02328A40:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02328A48: .word 0x022C4654
_02328A4C: .word 0x02353538
_02328A50: .word 0x00000EC6
	arm_func_end ov29_023289F8

	arm_func_start ov29_02328A54
ov29_02328A54: ; 0x02328A54
	stmdb sp!, {r3, lr}
	ldr r2, _02328A70 ; =0x02352AEC
	mov r3, #1
	ldr r2, [r2]
	bl LowerHitChanceStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02328A70: .word 0x02352AEC
	arm_func_end ov29_02328A54

	arm_func_start ov29_02328A74
ov29_02328A74: ; 0x02328A74
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02328AD0
	ldr r1, _02328ADC ; =0x022C451C
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02328AD0
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictPoisonedStatus
_02328AD0:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02328ADC: .word 0x022C451C
	arm_func_end ov29_02328A74

	arm_func_start ov29_02328AE0
ov29_02328AE0: ; 0x02328AE0
	stmdb sp!, {r3, lr}
	ldr r2, _02328AFC ; =0x02352AE8
	mov r3, #1
	ldr r2, [r2]
	bl BoostOffensiveStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02328AFC: .word 0x02352AE8
	arm_func_end ov29_02328AE0

	arm_func_start ov29_02328B00
ov29_02328B00: ; 0x02328B00
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl ov29_02307C78
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x100
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	beq _02328B78
	ldr r1, _02328B84 ; =0x022C44A0
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02328B78
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	str r2, [sp]
	bl TryInflictBurnStatus
_02328B78:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02328B84: .word 0x022C44A0
	arm_func_end ov29_02328B00

	arm_func_start ov29_02328B88
ov29_02328B88: ; 0x02328B88
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov r7, r2
	mov sb, r0
	mov r2, #0
	mov r0, r7
	mov r8, r1
	mov r6, r3
	strb r2, [sp, #0x1c]
	bl GetMoveType
	mov r4, r0
	mov r0, sb
	mov r1, #0x57
	bl AbilityIsActive2
	mov r2, r4
	mov r3, r0
	mov r0, sb
	mov r1, r8
	bl ov29_0230D4A4
	cmp r0, #0
	bne _02328BF4
	ldr r2, _02328C6C ; =0x00000ED7
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _02328C64
_02328BF4:
	mov r0, r7
	bl GetMoveType
	mov r5, r0
	ldrh r0, [r7, #4]
	bl GetMoveCategory
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl ov29_02324E44
	add r3, sp, #0x1c
	stmia sp, {r3, r5}
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r2, _02328C70 ; =0x0000270F
	mov r1, r8
	mov r0, sb
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
_02328C64:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02328C6C: .word 0x00000ED7
_02328C70: .word 0x0000270F
	arm_func_end ov29_02328B88

	arm_func_start ov29_02328C74
ov29_02328C74: ; 0x02328C74
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl GetApparentWeather
	mov r8, r0
	cmp r8, #1
	moveq r0, #1
	beq _02328CAC
	mov r0, r7
	mov r1, r5
	bl ov29_023245A4
_02328CAC:
	cmp r0, #0
	beq _02328D0C
	ldr r0, _02328D3C ; =0x022C48A4
	cmp r8, #2
	ldr r3, [r0]
	beq _02328CD4
	add r0, r8, #0xfc
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02328CDC
_02328CD4:
	add r0, r3, r3, lsr #31
	mov r3, r0, asr #1
_02328CDC:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	mov r0, r7
	and r4, r1, #0xff
	bl ov29_02318D58
	b _02328D30
_02328D0C:
	ldr r0, _02328D40 ; =0x00000CD2
	bl StringFromMessageId
	str r0, [sp]
	mov r0, r7
	mov r1, r7
	mov r3, r5
	mov r2, #2
	bl ov29_02318BBC
	mov r4, #1
_02328D30:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02328D3C: .word 0x022C48A4
_02328D40: .word 0x00000CD2
	arm_func_end ov29_02328C74

	arm_func_start ov29_02328D44
ov29_02328D44: ; 0x02328D44
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
	bl ov29_02324E44
	add r3, sp, #0x1c
	stmia sp, {r3, r6}
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r2, _02328DE0 ; =0x022C4568
	mov r1, r8
	ldrsh r2, [r2]
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
_02328DE0: .word 0x022C4568
	arm_func_end ov29_02328D44

	arm_func_start ov29_02328DE4
ov29_02328DE4: ; 0x02328DE4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r6, r1
	mov r1, r5
	mov r7, r0
	mov r4, r3
	bl ov29_023245A4
	cmp r0, #0
	beq _02328E40
	ldr r1, _02328E6C ; =0x022C48C0
	mov r0, r7
	ldr r3, [r1]
	mov r1, r6
	mov r2, r5
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	mov r0, r7
	and r4, r1, #0xff
	bl ov29_02318D58
	b _02328E64
_02328E40:
	ldr r0, _02328E70 ; =0x00000CD3
	bl StringFromMessageId
	str r0, [sp]
	mov r0, r7
	mov r1, r7
	mov r3, r5
	mov r2, #7
	bl ov29_02318BBC
	mov r4, #1
_02328E64:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02328E6C: .word 0x022C48C0
_02328E70: .word 0x00000CD3
	arm_func_end ov29_02328DE4

	arm_func_start ov29_02328E74
ov29_02328E74: ; 0x02328E74
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r6, r2
	mov r8, r0
	mov r5, r3
	mov r0, r6
	mov r7, r1
	bl GetMoveType
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl ov29_02324E44
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, r8
	mov r1, r7
	add r2, r7, #4
	mov r3, #2
	bl ov29_02320448
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov29_02328E74

	arm_func_start ov29_02328ECC
ov29_02328ECC: ; 0x02328ECC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl GetTileAtEntity
	bl ov29_02337E2C
	cmp r0, #0
	beq _02328F0C
	ldr r2, _02328F88 ; =0x00000ED8
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02328F7C
_02328F0C:
	mov r0, r8
	mov r1, r6
	bl ov29_023245A4
	cmp r0, #0
	beq _02328F58
	ldr r1, _02328F8C ; =0x022C47E8
	mov r0, r8
	ldr r3, [r1]
	mov r1, r7
	mov r2, r6
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	movne r1, #1
	moveq r1, r4
	mov r0, r8
	and r4, r1, #0xff
	bl ov29_02318D58
	b _02328F7C
_02328F58:
	ldr r0, _02328F90 ; =0x00000CD5
	bl StringFromMessageId
	str r0, [sp]
	mov r0, r8
	mov r1, r8
	mov r3, r6
	mov r2, #9
	bl ov29_02318BBC
	mov r4, #1
_02328F7C:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02328F88: .word 0x00000ED8
_02328F8C: .word 0x022C47E8
_02328F90: .word 0x00000CD5
	arm_func_end ov29_02328ECC

	arm_func_start ov29_02328F94
ov29_02328F94: ; 0x02328F94
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02328FF0
	ldr r1, _02328FFC ; =0x022C4424
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02328FF0
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictCringeStatus
_02328FF0:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02328FFC: .word 0x022C4424
	arm_func_end ov29_02328F94

	arm_func_start ov29_02329000
ov29_02329000: ; 0x02329000
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02329060
	ldr r1, _0232906C ; =0x022C4484
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02329060
	ldr r1, _02329070 ; =0x02352AEC
	mov r0, r6
	ldr r2, [r1]
	mov r1, r5
	mov r3, #0
	bl LowerHitChanceStat
_02329060:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232906C: .word 0x022C4484
_02329070: .word 0x02352AEC
	arm_func_end ov29_02329000

	arm_func_start ov29_02329074
ov29_02329074: ; 0x02329074
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl ov29_023164D8
	cmp r0, #0
	beq _023290BC
	ldr r1, _023290C4 ; =0x02352AEC
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #1
	bl BoostDefensiveStat
	ldr r1, _023290C8 ; =0x02352AE8
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #1
	bl BoostDefensiveStat
_023290BC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023290C4: .word 0x02352AEC
_023290C8: .word 0x02352AE8
	arm_func_end ov29_02329074

	arm_func_start ov29_023290CC
ov29_023290CC: ; 0x023290CC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r1
	ldr r1, [r4, #0xb4]
	mov r5, r0
	ldrb r0, [r1, #0xd2]
	mov ip, #1
	mov r1, r4
	add r0, r0, #0xf9
	and r0, r0, #0xff
	cmp r0, #1
	movls ip, #2
	str r3, [sp]
	mov r0, r5
	mov r3, ip, lsl #8
	mov r6, #0
	bl DealDamage
	cmp r0, #0
	beq _0232914C
	ldr r1, _02329158 ; =0x022C4668
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	mov r6, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232914C
	mov r2, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl TryInflictCringeStatus
_0232914C:
	mov r0, r6
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02329158: .word 0x022C4668
	arm_func_end ov29_023290CC

	arm_func_start ov29_0232915C
ov29_0232915C: ; 0x0232915C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	ldrne r0, _023291E8 ; =0x0237CA6B
	movne r4, #1
	strneb r4, [r0]
	ldr r0, _023291E8 ; =0x0237CA6B
	ldrb r0, [r0]
	cmp r0, #0
	beq _023291DC
	ldr r0, _023291EC ; =0x0237CA78
	ldr r0, [r0]
	cmp r0, #2
	bne _023291DC
	ldr r1, _023291F0 ; =0x022C4444
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023291DC
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictPoisonedStatus
_023291DC:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_023291E8: .word 0x0237CA6B
_023291EC: .word 0x0237CA78
_023291F0: .word 0x022C4444
	arm_func_end ov29_0232915C

	arm_func_start ov29_023291F4
ov29_023291F4: ; 0x023291F4
	stmdb sp!, {r3, lr}
	ldr r3, [r1, #0xb4]
	ldr r2, _02329238 ; =0x000003E7
	ldrsh ip, [r3, #0x12]
	ldrsh r3, [r3, #0x16]
	add r3, ip, r3
	cmp r3, r2
	movgt r3, r2
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	mov ip, #1
	mov r2, r2, asr #2
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329238: .word 0x000003E7
	arm_func_end ov29_023291F4

	arm_func_start ov29_0232923C
ov29_0232923C: ; 0x0232923C
	stmdb sp!, {r3, lr}
	ldr r2, _02329254 ; =0x02352AE8
	ldr r2, [r2]
	bl BoostHitChanceStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329254: .word 0x02352AE8
	arm_func_end ov29_0232923C

	arm_func_start ov29_02329258
ov29_02329258: ; 0x02329258
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x20
	mov r4, #0
	mov r6, r0
	strb r4, [sp, #0x1c]
	mov r5, r1
	ldr r1, [r6, #0xb4]
	mov r0, r5
	mov r4, r2
	mov sl, r3
	ldr r7, [r5, #0xb4]
	ldrb sb, [r1, #0xa]
	bl ov29_022E5ED0
	cmp r0, #0
	beq _02329350
	ldrb r2, [r7, #0x4c]
	mov r0, r5
	mov r1, #0xc
	mov r3, r2, lsr #0x1f
	rsb r2, r3, r2, lsl #29
	add r2, r3, r2, ror #29
	bl ov29_023049A8
	mov r0, r5
	mov r1, #1
	bl ov29_02318A90
	ldr r1, _023293C8 ; =0x00000221
	mov r0, r5
	bl ov29_022E56A0
	mov r0, r5
	bl ov29_02318AD4
	mov r0, #0x10
	mov r1, #0x67
	bl ov29_022EA370
	mov r0, r5
	mov r1, #0
	bl ov29_02318A90
	ldrb r2, [r7, #0x4c]
	mov r0, r5
	mov r1, #0xc
	mov r3, r2, lsr #0x1f
	rsb r2, r3, r2, lsl #29
	add r2, r3, r2, ror #29
	bl ov29_023049A8
	mov r0, r5
	bl ov29_02318B48
	mov r0, r5
	mov r1, #0x210
	bl ov29_022E56A0
	mov r0, #5
	mov r1, #0x2000
	mov r2, #0
	bl ov29_0234C668
	mov r0, #0
	bl ov29_0234C738
	mov r0, #4
	mov r1, #0x400
	mov r2, #0
	bl ov29_0234C668
	mov r0, #1
	bl ov29_022ECAFC
	mov r0, #0
	bl ov29_0234C738
_02329350:
	mov r0, r4
	bl GetMoveType
	mov r8, r0
	ldrh r0, [r4, #4]
	bl GetMoveCategory
	mov r7, r0
	mov r1, sl
	mov r0, r4
	bl ov29_02324E44
	add r3, sp, #0x1c
	stmia sp, {r3, r8}
	str r7, [sp, #8]
	str r0, [sp, #0xc]
	mov r4, #0
	str r4, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	mov r1, r5
	mov r2, sb
	mov r0, r6
	str r4, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, r4
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_023293C8: .word 0x00000221
	arm_func_end ov29_02329258

	arm_func_start ov29_023293CC
ov29_023293CC: ; 0x023293CC
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryInflictConfusedStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_023293CC

	arm_func_start ov29_023293E4
ov29_023293E4: ; 0x023293E4
	stmdb sp!, {r3, lr}
	mov r2, #0
	bl ov29_023163A8
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_023293E4

	arm_func_start ov29_023293F8
ov29_023293F8: ; 0x023293F8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl GetApparentWeather
	mov ip, #1
	ldr r1, _02329434 ; =0x022C4974
	mov r0, r0, lsl #1
	ldrsh r2, [r1, r0]
	mov r0, r5
	mov r1, r4
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02329434: .word 0x022C4974
	arm_func_end ov29_023293F8

	arm_func_start ov29_02329438
ov29_02329438: ; 0x02329438
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov r7, r2
	mov sb, r0
	mov r2, #0
	mov r0, r7
	mov r8, r1
	mov r6, r3
	strb r2, [sp, #0x1c]
	bl GetMoveType
	mov r4, r0
	mov r0, sb
	mov r1, #0x57
	bl AbilityIsActive2
	mov r2, r4
	mov r3, r0
	mov r0, sb
	mov r1, r8
	bl ov29_0230D4A4
	cmp r0, #0
	bne _023294A4
	ldr r2, _0232952C ; =0x00000ED9
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _02329524
_023294A4:
	mov r0, r7
	bl GetMoveType
	mov r5, r0
	ldrh r0, [r7, #4]
	bl GetMoveCategory
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl ov29_02324E44
	add r2, sp, #0x1c
	stmia sp, {r2, r5}
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r2, _02329530 ; =0x0000270F
	mov r0, sb
	mov r1, r8
	mov r3, #1
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	mov r1, r8
	cmp r0, #0
	moveq r3, #1
	movne r3, #0
	mov r0, #0
	mov r2, r0
	strb r3, [sp, #0x1c]
	bl SubstitutePlaceholderStringTags
	ldrb r0, [sp, #0x1c]
_02329524:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0232952C: .word 0x00000ED9
_02329530: .word 0x0000270F
	arm_func_end ov29_02329438

	arm_func_start ov29_02329534
ov29_02329534: ; 0x02329534
	stmdb sp!, {r3, lr}
	ldr r2, _02329550 ; =0x02352AEC
	mov r3, #2
	ldr r2, [r2]
	bl BoostOffensiveStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329550: .word 0x02352AEC
	arm_func_end ov29_02329534

	arm_func_start ov29_02329554
ov29_02329554: ; 0x02329554
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r1, #0x25
	ldr r7, [sb, #0xb4]
	mov r8, #0
	bl AbilityIsActive2
	cmp r0, #0
	beq _02329598
	ldr r2, _02329658 ; =0x00000DC3
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	b _02329650
_02329598:
	mov r5, r8
	add r4, r7, #0x124
	add fp, sp, #0
_023295A4:
	ldrb r0, [r4, r5, lsl #3]
	add r6, r4, r5, lsl #3
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _023295D8
	mov r0, sb
	mov r1, r6
	bl GetMoveTypeForMonster
	cmp r0, #0
	strne r6, [fp, r8, lsl #2]
	addne r8, r8, #1
_023295D8:
	add r5, r5, #1
	cmp r5, #4
	blt _023295A4
	cmp r8, #0
	bne _02329604
	ldr r2, _0232965C ; =0x00000DB6
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _02329650
_02329604:
	mov r0, r8
	bl DungeonRandInt
	add r1, sp, #0
	ldr r4, [r1, r0, lsl #2]
	mov r0, sb
	mov r1, r4
	bl GetMoveTypeForMonster
	strb r0, [r7, #0x5e]
	mov r0, #0
	strb r0, [r7, #0x5f]
	mov r1, #1
	strb r1, [r7, #0xff]
	ldrh r1, [r4, #4]
	bl ov29_0234B084
	ldr r2, _02329660 ; =0x00000DB5
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
_02329650:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02329658: .word 0x00000DC3
_0232965C: .word 0x00000DB6
_02329660: .word 0x00000DB5
	arm_func_end ov29_02329554

	arm_func_start ov29_02329664
ov29_02329664: ; 0x02329664
	stmdb sp!, {r3, lr}
	bl ov29_023194B8
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02329664

	arm_func_start ov29_02329674
ov29_02329674: ; 0x02329674
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	cmp r6, r5
	mov r4, #0
	bne _02329698
	ldr r2, _023296CC ; =0x00000EDA
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023296C4
_02329698:
	ldr r2, _023296D0 ; =0x02352AEC
	mov r3, #1
	ldr r2, [r2]
	bl BoostOffensiveStat
	ldr r1, _023296D4 ; =0x02352AE8
	mov r0, r6
	ldr r2, [r1]
	mov r1, r5
	mov r3, #1
	bl BoostOffensiveStat
	mov r4, #1
_023296C4:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023296CC: .word 0x00000EDA
_023296D0: .word 0x02352AEC
_023296D4: .word 0x02352AE8
	arm_func_end ov29_02329674

	arm_func_start ov29_023296D8
ov29_023296D8: ; 0x023296D8
	stmdb sp!, {r3, lr}
	ldr r2, _023296F4 ; =0x02352AEC
	mov r3, #2
	ldr r2, [r2]
	bl BoostDefensiveStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023296F4: .word 0x02352AEC
	arm_func_end ov29_023296D8

	arm_func_start ov29_023296F8
ov29_023296F8: ; 0x023296F8
	stmdb sp!, {r3, lr}
	mov r2, #0
	mov r3, r2
	bl TryWarp
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_023296F8

	arm_func_start ov29_02329710
ov29_02329710: ; 0x02329710
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232976C
	ldr r1, _02329778 ; =0x022C4490
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232976C
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictParalysisStatus
_0232976C:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02329778: .word 0x022C4490
	arm_func_end ov29_02329710

	arm_func_start ov29_0232977C
ov29_0232977C: ; 0x0232977C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r6, r1
	mov r1, r5
	mov r7, r0
	bl GetMoveTypeForMonster
	mov r4, r0
	mov r0, r5
	bl GetMoveType
	cmp r4, r0
	bne _023297D4
	mov r0, r7
	mov r1, r6
	mov r2, #0x66
	mov r3, #1
	bl DefenderAbilityIsActive__02328634
	cmp r0, #0
	beq _023297D4
	mov r0, r6
	bl ov29_0231B060
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023297D4:
	mov r0, r7
	mov r1, r6
	mov r2, #1
	mov r3, #0
	bl TryInflictParalysisStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0232977C

	arm_func_start ov29_023297F0
ov29_023297F0: ; 0x023297F0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02329848
	mov r2, r4
	mov r0, r6
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02329848
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictParalysisStatus
_02329848:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov29_023297F0

	arm_func_start ov29_02329854
ov29_02329854: ; 0x02329854
	stmdb sp!, {r3, lr}
	mov r2, #0
	bl TryInflictShadowHoldStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02329854

	arm_func_start ov29_02329868
ov29_02329868: ; 0x02329868
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryInflictPoisonedStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02329868

	arm_func_start ov29_02329880
ov29_02329880: ; 0x02329880
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryInflictBadlyPoisonedStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02329880

	arm_func_start ov29_02329898
ov29_02329898: ; 0x02329898
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023298F4
	ldr r1, _02329900 ; =0x022C4644
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023298F4
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictBadlyPoisonedStatus
_023298F4:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02329900: .word 0x022C4644
	arm_func_end ov29_02329898

	arm_func_start ov29_02329904
ov29_02329904: ; 0x02329904
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02329960
	ldr r1, _0232996C ; =0x022C463C
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02329960
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictPoisonedStatus
_02329960:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232996C: .word 0x022C463C
	arm_func_end ov29_02329904

	arm_func_start ov29_02329970
ov29_02329970: ; 0x02329970
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x30
	ldrb r4, [sp, #0x50]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	cmp r4, #0
	mov r4, #0
	bne _023299A8
	str r3, [sp]
	mov r3, #0x100
	bl DealDamage
	cmp r0, #0
	movne r4, #1
_023299A8:
	cmp r4, #0
	bne _02329A88
	mov r0, r7
	mov r1, r5
	bl GetMoveTypeForMonster
	mov sb, r0
	mov r0, r7
	mov r1, r5
	bl GetMovePower
	mov r8, r0
	mov r0, r5
	bl GetMoveCritChance
	str r0, [sp]
	add r1, sp, #0x1c
	str r1, [sp, #4]
	mov r0, #0x100
	str r0, [sp, #8]
	ldrh ip, [r5, #4]
	mov r1, #0
	mov r2, sb
	str ip, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r3, r8
	mov r0, r7
	mov r1, r6
	bl CalcDamage
	bl ov29_0234B034
	mov r1, #0
	str r1, [sp]
	ldr r2, [r7, #0xb4]
	mov r3, r1
	bl ov29_0230040C
	ldr r2, _02329A94 ; =0x00000EDB
	mov r1, r6
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	ldr r0, [sp, #0x1c]
	mov r2, #0
	add r0, r0, r0, lsr #31
	movs r0, r0, asr #1
	str r0, [sp, #0x1c]
	addeq r0, r0, #1
	streq r0, [sp, #0x1c]
	ldrh r1, [r5, #4]
	ldr r0, _02329A98 ; =0x00000236
	add r3, sp, #0x18
	stmia sp, {r1, r2}
	str r0, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	mov r0, r7
	bl CalcRecoilDamageFixed
_02329A88:
	mov r0, r4
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02329A94: .word 0x00000EDB
_02329A98: .word 0x00000236
	arm_func_end ov29_02329970

	arm_func_start ov29_02329A9C
ov29_02329A9C: ; 0x02329A9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r6, r2
	mov r7, r1
	mov r1, r6
	mov r8, r0
	mov r5, r3
	mov r4, #0
	bl ov29_023245A4
	cmp r0, #0
	beq _02329B2C
	ldr r1, _02329B5C ; =0x022C47EC
	mov r0, r8
	ldr r3, [r1]
	mov r1, r7
	mov r2, r6
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	beq _02329B20
	ldr r1, _02329B60 ; =0x022C4494
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02329B20
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	bl TryInflictParalysisStatus
_02329B20:
	mov r0, r8
	bl ov29_02318D58
	b _02329B50
_02329B2C:
	ldr r0, _02329B64 ; =0x00000CD4
	bl StringFromMessageId
	str r0, [sp]
	mov r0, r8
	mov r1, r8
	mov r3, r6
	mov r2, #8
	bl ov29_02318BBC
	mov r4, #1
_02329B50:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02329B5C: .word 0x022C47EC
_02329B60: .word 0x022C4494
_02329B64: .word 0x00000CD4
	arm_func_end ov29_02329A9C

	arm_func_start ov29_02329B68
ov29_02329B68: ; 0x02329B68
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x30
	ldrb r4, [sp, #0x50]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	cmp r4, #0
	mov r4, #0
	bne _02329BA0
	str r3, [sp]
	mov r3, #0x200
	bl DealDamage
	cmp r0, #0
	movne r4, #1
_02329BA0:
	cmp r4, #0
	bne _02329C80
	mov r0, r7
	mov r1, r5
	bl GetMoveTypeForMonster
	mov sb, r0
	mov r0, r7
	mov r1, r5
	bl GetMovePower
	mov r8, r0
	mov r0, r5
	bl GetMoveCritChance
	str r0, [sp]
	add r1, sp, #0x1c
	str r1, [sp, #4]
	mov r0, #0x200
	str r0, [sp, #8]
	ldrh ip, [r5, #4]
	mov r1, #0
	mov r2, sb
	str ip, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r3, r8
	mov r0, r7
	mov r1, r6
	bl CalcDamage
	bl ov29_0234B034
	mov r1, #0
	str r1, [sp]
	ldr r2, [r7, #0xb4]
	mov r3, r1
	bl ov29_0230040C
	ldr r2, _02329C8C ; =0x00000EDB
	mov r1, r6
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	ldr r0, [sp, #0x1c]
	mov r2, #0
	add r0, r0, r0, lsr #31
	movs r0, r0, asr #1
	str r0, [sp, #0x1c]
	addeq r0, r0, #1
	streq r0, [sp, #0x1c]
	ldrh r1, [r5, #4]
	ldr r0, _02329C90 ; =0x00000237
	add r3, sp, #0x18
	stmia sp, {r1, r2}
	str r0, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	mov r0, r7
	bl CalcRecoilDamageFixed
_02329C80:
	mov r0, r4
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02329C8C: .word 0x00000EDB
_02329C90: .word 0x00000237
	arm_func_end ov29_02329B68

	arm_func_start ov29_02329C94
ov29_02329C94: ; 0x02329C94
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02329D40
	ldr r1, _02329D4C ; =0x022C4694
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02329D40
	mov r0, #3
	bl DungeonRandInt
	cmp r0, #0
	beq _02329CFC
	cmp r0, #1
	beq _02329D14
	cmp r0, #2
	beq _02329D30
_02329CFC:
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictParalysisStatus
	b _02329D40
_02329D14:
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	str r2, [sp]
	bl TryInflictBurnStatus
	b _02329D40
_02329D30:
	mov r0, r6
	mov r1, r5
	mov r2, #0
	bl TryInflictFrozenStatus
_02329D40:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02329D4C: .word 0x022C4694
	arm_func_end ov29_02329C94

	arm_func_start ov29_02329D50
ov29_02329D50: ; 0x02329D50
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r7, r0
	mov r8, #0
	mov r6, r1
	mov r0, r8
	mov r1, r7
	mov r2, r8
	ldr r4, [r7, #0xb4]
	ldr r5, [r6, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r1, r6
	mov r0, #1
	mov r2, r8
	bl SubstitutePlaceholderStringTags
	mov r0, r7
	mov r1, r6
	mov r2, #0x2c
	mov r3, #1
	bl DefenderAbilityIsActive__02329F14
	cmp r0, #0
	beq _02329DC0
	ldr r2, _02329F08 ; =0x00000EDE
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	b _02329F00
_02329DC0:
	ldrb r0, [r4, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, r8
	tst r0, #0xff
	ldrb r0, [r5, #0x62]
	moveq r8, #1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	moveq r8, #1
	cmp r8, #0
	beq _02329E10
	ldr r2, _02329F0C ; =0x00000EDD
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _02329F00
_02329E10:
	ldrh r3, [r4, #0x62]
	ldrh r2, [r4, #0x64]
	ldrh r1, [r4, #0x66]
	ldrb r0, [r4, #6]
	strh r3, [sp]
	strh r2, [sp, #2]
	strh r1, [sp, #4]
	cmp r0, #0
	bne _02329E3C
	add r0, r4, #0x62
	bl RemoveEquivItemNoHole
_02329E3C:
	ldrh r0, [r5, #0x62]
	strh r0, [r4, #0x62]
	ldrh r0, [r5, #0x64]
	strh r0, [r4, #0x64]
	ldrh r0, [r5, #0x66]
	strh r0, [r4, #0x66]
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _02329E68
	mov r0, r4
	bl ov29_02346F14
_02329E68:
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _02329E7C
	add r0, r5, #0x62
	bl RemoveEquivItemNoHole
_02329E7C:
	ldrh r2, [sp]
	ldrh r1, [sp, #2]
	ldrh r0, [sp, #4]
	strh r2, [r5, #0x62]
	strh r1, [r5, #0x64]
	strh r0, [r5, #0x66]
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _02329EA8
	mov r0, r5
	bl ov29_02346F14
_02329EA8:
	bl ov29_02347030
	ldrb r0, [r4, #6]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r4, #0x63]
	ldrb r0, [r5, #6]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r5, #0x63]
	mov r0, r7
	bl ov29_022F9EA0
	mov r0, r6
	bl ov29_022F9EA0
	ldrb r0, [r4, #0x108]
	ldr r2, _02329F10 ; =0x00000EDC
	mov r1, r6
	cmp r0, #1
	movlo r0, #1
	strlob r0, [r4, #0x108]
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
_02329F00:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02329F08: .word 0x00000EDE
_02329F0C: .word 0x00000EDD
_02329F10: .word 0x00000EDC
	arm_func_end ov29_02329D50

	arm_func_start DefenderAbilityIsActive__02329F14
DefenderAbilityIsActive__02329F14: ; 0x02329F14
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	cmp r0, r5
	beq _02329F68
	cmp r0, #0
	moveq r1, #0
	beq _02329F48
	ldr r1, [r0]
	cmp r1, #1
	moveq r1, #1
	movne r1, #0
	and r1, r1, #0xff
_02329F48:
	cmp r1, #0
	cmpne r3, #0
	beq _02329F68
	mov r1, #0x53
	bl AbilityIsActive2
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_02329F68:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActive2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DefenderAbilityIsActive__02329F14

	arm_func_start ov29_02329F78
ov29_02329F78: ; 0x02329F78
	stmdb sp!, {r3, lr}
	ldr ip, _02329FB0 ; =0x0237CA7C
	ldr lr, [ip]
	add lr, lr, #1
	str lr, [ip]
	str r3, [sp]
	ldr r3, [ip]
	mov r3, r3, lsl #8
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329FB0: .word 0x0237CA7C
	arm_func_end ov29_02329F78

	arm_func_start ov29_02329FB4
ov29_02329FB4: ; 0x02329FB4
	stmdb sp!, {r3, lr}
	ldrh r0, [r2, #4]
	cmp r0, #0xd4
	bne _02329FD0
	mov r0, #0
	bl ov29_0233544C
	b _02329FD8
_02329FD0:
	mov r0, #1
	bl ov29_0233544C
_02329FD8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02329FB4

	arm_func_start ov29_02329FE0
ov29_02329FE0: ; 0x02329FE0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232A03C
	mov r2, r4
	mov r0, r6
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232A03C
	ldr r1, _0232A048 ; =0x02352AEC
	mov r0, r6
	ldr r2, [r1]
	mov r1, r5
	mov r3, #0
	bl LowerHitChanceStat
_0232A03C:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232A048: .word 0x02352AEC
	arm_func_end ov29_02329FE0

	arm_func_start ov29_0232A04C
ov29_0232A04C: ; 0x0232A04C
	ldr ip, _0232A054 ; =ov29_0232C310
	bx ip
	.align 2, 0
_0232A054: .word ov29_0232C310
	arm_func_end ov29_0232A04C

	arm_func_start ov29_0232A058
ov29_0232A058: ; 0x0232A058
	stmdb sp!, {r3, lr}
	ldr r2, _0232A074 ; =0x02352AE8
	mov r3, #2
	ldr r2, [r2]
	bl BoostDefensiveStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232A074: .word 0x02352AE8
	arm_func_end ov29_0232A058

	arm_func_start ov01_0232A078
ov01_0232A078: ; 0x0232A078
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov r4, #0
	strb r4, [sp, #0x1c]
	mov r6, r0
	mov r4, r2
	ldr r2, [r6, #0xb4]
	mov r0, r4
	mov r5, r1
	mov r7, r3
	ldrb sb, [r2, #0xa]
	bl GetMoveType
	mov r8, r0
	ldrh r0, [r4, #4]
	bl GetMoveCategory
	mov r1, r7
	mov r7, r0
	mov r0, r4
	bl ov29_02324E44
	add r3, sp, #0x1c
	stmia sp, {r3, r8}
	str r7, [sp, #8]
	str r0, [sp, #0xc]
	mov r4, #0
	str r4, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	mov r1, r5
	mov r2, sb
	mov r0, r6
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
	arm_func_end ov01_0232A078

	arm_func_start ov29_0232A118
ov29_0232A118: ; 0x0232A118
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _0232A144 ; =0x02352AEC
	mov r3, #1
	ldr r2, [r2]
	str r3, [sp]
	str r3, [sp, #4]
	bl LowerOffensiveStat
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232A144: .word 0x02352AEC
	arm_func_end ov29_0232A118

	arm_func_start ov29_0232A148
ov29_0232A148: ; 0x0232A148
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, [r1, #0xb4]
	mov r4, #0
	ldrb ip, [ip, #0xd2]
	cmp ip, #9
	moveq ip, #0x200
	movne ip, #0x100
	str r3, [sp]
	mov r3, ip
	bl DealDamage
	cmp r0, #0
	movne r4, #1
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov29_0232A148

	arm_func_start ov29_0232A188
ov29_0232A188: ; 0x0232A188
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r2, #0x35
	mov r3, #1
	ldr r4, [r6, #0xb4]
	ldr r7, [r5, #0xb4]
	bl DefenderAbilityIsActive__02329F14
	cmp r0, #0
	beq _0232A1C8
	ldr r2, _0232A218 ; =0x00000EE1
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0232A1C8:
	ldrb r2, [r7, #0x60]
	ldr r0, _0232A21C ; =0x02353538
	mov r1, #1
	strb r2, [r4, #0x60]
	ldrb r2, [r7, #0x61]
	strb r2, [r4, #0x61]
	ldr r0, [r0]
	mov r2, #0xee0
	strb r1, [r0, #0xe]
	ldrb r0, [r4, #0x108]
	cmp r0, #1
	strlob r1, [r4, #0x108]
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	mov r1, r6
	bl ov29_022FA7DC
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232A218: .word 0x00000EE1
_0232A21C: .word 0x02353538
	arm_func_end ov29_0232A188

	arm_func_start ov29_0232A220
ov29_0232A220: ; 0x0232A220
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _0232A270 ; =0x022C4654
	ldr r2, _0232A274 ; =0x02353538
	ldrsh r3, [r3]
	ldr r2, [r2]
	mov r5, r0
	mov r4, r1
	add r2, r2, #0xcd00
	mov r0, #1
	mov r1, #0
	strh r3, [r2, #0x3c]
	bl ov29_023354C4
	cmp r0, #0
	bne _0232A268
	ldr r2, _0232A278 ; =0x00000EC7
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_0232A268:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232A270: .word 0x022C4654
_0232A274: .word 0x02353538
_0232A278: .word 0x00000EC7
	arm_func_end ov29_0232A220

	arm_func_start ov29_0232A27C
ov29_0232A27C: ; 0x0232A27C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _0232A2A8 ; =0x02352AEC
	mov r3, #1
	ldr r2, [r2]
	str r3, [sp]
	str r3, [sp, #4]
	bl LowerDefensiveStat
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232A2A8: .word 0x02352AEC
	arm_func_end ov29_0232A27C

	arm_func_start ov29_0232A2AC
ov29_0232A2AC: ; 0x0232A2AC
	stmdb sp!, {r3, lr}
	bl ov29_02318FAC
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0232A2AC

	arm_func_start ov29_0232A2BC
ov29_0232A2BC: ; 0x0232A2BC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232A318
	ldr r1, _0232A324 ; =0x022C4670
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232A318
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictCringeStatus
_0232A318:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232A324: .word 0x022C4670
	arm_func_end ov29_0232A2BC

	arm_func_start ov29_0232A328
ov29_0232A328: ; 0x0232A328
	stmdb sp!, {r3, lr}
	ldr r2, _0232A33C ; =0x00000EE2
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232A33C: .word 0x00000EE2
	arm_func_end ov29_0232A328

	arm_func_start ov29_0232A340
ov29_0232A340: ; 0x0232A340
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232A3C8
	mov r1, r4
	mov r0, r6
	mov r4, #1
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _0232A3C8
	mov r0, r5
	bl EntityIsValid__0232A3D8
	cmp r0, #0
	bne _0232A3C8
	ldr r3, _0232A3D4 ; =0x02352B18
	add r0, sp, #8
	ldrh ip, [r3]
	mov r1, #0xb7
	mov r2, #2
	strh ip, [sp, #4]
	ldrh r3, [r3, #2]
	strh r3, [sp, #6]
	bl ov29_02344BD0
	add r2, sp, #8
	add r3, sp, #4
	mov r0, r6
	mov r1, r5
	bl ov29_0232A834
_0232A3C8:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232A3D4: .word 0x02352B18
	arm_func_end ov29_0232A340
