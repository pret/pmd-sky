	.include "asm/macros.inc"
	.include "overlay_29_0231EDFC.inc"

	.text

	arm_func_start ov29_0231EDFC
ov29_0231EDFC: ; 0x0231EDFC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xf4
	mov r5, r0
	mov r4, r1
	cmp r5, r4
	beq _0231EE54
	cmp r5, #0
	moveq r0, #0
	beq _0231EE34
	ldr r0, [r5]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
_0231EE34:
	cmp r0, #0
	beq _0231EE54
	mov r0, r5
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _0231EE60
_0231EE54:
	mov r0, r4
	mov r1, #0xe
	bl AbilityIsActiveVeneer
_0231EE60:
	cmp r0, #0
	beq _0231EE8C
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0231F544 ; =0x00000E45
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231F53C
_0231EE8C:
	cmp r5, r4
	bne _0231EEB8
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0231F548 ; =0x00000E46
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231F53C
_0231EEB8:
	ldrh r0, [r4, #4]
	mov sl, #0
	mov r8, sl
	strh r0, [sp, #0x40]
	ldrh r0, [r4, #6]
	strh r0, [sp, #0x42]
	b _0231F098
_0231EED4:
	mov sl, #0
	ldr fp, _0231F54C ; =DIRECTIONS_XY
	mov r6, sl
_0231EEE0:
	ldr r0, _0231F550 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sb, [r0, #0xad4]
#else
	ldr sb, [r0, #0xb78]
#endif
	mov r0, sb
	bl EntityIsValid__0231F570
	cmp r0, #0
	cmpne r5, sb
	cmpne r4, sb
	beq _0231F080
	mov r0, r5
	mov r1, sb
	bl CanSeeTarget
	cmp r0, #0
	beq _0231F080
	cmp r8, #0
	mov r0, r5
	mov r2, #0
	mov r1, sb
	mov r3, #1
	bne _0231EF48
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	bne _0231F080
	b _0231EF54
_0231EF48:
	bl GetTreatmentBetweenMonsters
	cmp r0, #0
	bne _0231F080
_0231EF54:
	cmp r8, #0
	mov r7, #0
	bne _0231EFF8
	b _0231EFBC
_0231EF64:
	mov r0, r7, lsl #2
	ldrsh r1, [fp, r0]
	ldrsh r3, [sb, #4]
	add r0, fp, r7, lsl #2
	ldrsh r2, [r0, #2]
	add r0, r3, r1
	strh r0, [sp, #0x34]
	ldrsh r3, [sb, #6]
	mov r0, r4
	add r1, sp, #0x34
	add r2, r3, r2
	strh r2, [sp, #0x36]
	bl ov29_022FF764
	cmp r0, #0
	bne _0231EFB8
	ldrsh r0, [sp, #0x34]
	ldrsh r1, [sp, #0x36]
	bl GetTile
	ldrh r0, [r0]
	tst r0, #0x800
	beq _0231EFC4
_0231EFB8:
	add r7, r7, #1
_0231EFBC:
	cmp r7, #8
	blt _0231EF64
_0231EFC4:
	cmp r7, #8
	beq _0231F080
	cmp sl, #0x28
	bge _0231F080
	ldrh r1, [sb, #4]
	mov r3, sl, lsl #2
	add r0, sp, #0x54
	add r2, r0, r3
	strh r1, [r0, r3]
	ldrh r0, [sb, #6]
	add sl, sl, #1
	strh r0, [r2, #2]
	b _0231F080
_0231EFF8:
	mov r0, r7, lsl #2
	ldrsh r1, [fp, r0]
	ldrsh r3, [sb, #4]
	add r0, fp, r7, lsl #2
	ldrsh r2, [r0, #2]
	add r0, r3, r1
	strh r0, [sp, #0x30]
	ldrsh r3, [sb, #6]
	mov r0, r4
	add r1, sp, #0x30
	add r2, r3, r2
	strh r2, [sp, #0x32]
	bl ov29_022FF764
	cmp r0, #0
	bne _0231F074
	ldrsh r0, [sp, #0x30]
	ldrsh r1, [sp, #0x32]
	bl GetTile
	ldrh r0, [r0]
	tst r0, #0x800
	bne _0231F074
	cmp sl, #0x28
	bge _0231F074
	ldrh r3, [sp, #0x30]
	ldrh r2, [sp, #0x32]
	mov r0, sl, lsl #2
	add r1, sp, #0x54
	add ip, r1, r0
	strh r3, [r1, r0]
	add sl, sl, #1
	strh r2, [ip, #2]
_0231F074:
	add r7, r7, #1
	cmp r7, #8
	blt _0231EFF8
_0231F080:
	add r6, r6, #1
	cmp r6, #0x14
	blt _0231EEE0
	cmp sl, #0
	bne _0231F0A0
	add r8, r8, #1
_0231F098:
	cmp r8, #2
	blt _0231EED4
_0231F0A0:
	cmp sl, #0
	beq _0231F0D0
	mov r0, sl
	bl DungeonRandInt
	add r1, sp, #0x54
	mov r2, r0, lsl #2
	add r0, r1, r0, lsl #2
	ldrh r1, [r1, r2]
	ldrh r0, [r0, #2]
	strh r1, [sp, #0x40]
	strh r0, [sp, #0x42]
	b _0231F178
_0231F0D0:
	mov r0, r5
	bl HasDropeyeStatus
	mov r2, r0
	add r1, sp, #0x44
	add r0, r5, #4
	bl ov29_022E9298
	mov r7, #0
	add r6, sp, #0x2c
	b _0231F154
_0231F0F4:
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x4c]
	bl DungeonRandRange
	strh r0, [sp, #0x2c]
	ldr r0, [sp, #0x48]
	ldr r1, [sp, #0x50]
	bl DungeonRandRange
	strh r0, [sp, #0x2e]
	mov r0, r4
	mov r1, r6
	bl ov29_022FF764
	cmp r0, #0
	bne _0231F150
	ldrsh r0, [sp, #0x2c]
	ldrsh r1, [sp, #0x2e]
	bl GetTile
	ldrh r0, [r0]
	tst r0, #0x800
	ldreqh r1, [sp, #0x2c]
	ldreqh r0, [sp, #0x2e]
	streqh r1, [sp, #0x40]
	streqh r0, [sp, #0x42]
	beq _0231F15C
_0231F150:
	add r7, r7, #1
_0231F154:
	cmp r7, #0x64
	blt _0231F0F4
_0231F15C:
	cmp r7, #0x64
	bne _0231F178
	ldr r2, _0231F554 ; =0x00000E48
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231F53C
_0231F178:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0231F558 ; =0x00000E47
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r4
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0231F1B0
	ldr r0, _0231F55C ; =0x00000212
	bl ov29_022EACCC
_0231F1B0:
	ldrsh r3, [sp, #0x42]
	ldrsh r2, [r4, #6]
	ldrsh r1, [sp, #0x40]
	ldrsh r0, [r4, #4]
	sub r2, r3, r2
	ldr r6, [r4, #0xb4]
	sub r0, r1, r0
	cmp r0, r2
	movle r0, r2
	mov sb, r0, lsl #4
	cmp sb, #0x50
	movgt sb, #0x50
	cmp sb, #0xa
	add r0, sp, #0x40
	add r1, r4, #4
	ldrb r8, [r6, #0x4c]
	mov r7, #0
	movlt sb, #0xa
	bl GetDirectionTowardsPosition
	mov r6, r0
	ldr r0, _0231F54C ; =DIRECTIONS_XY
	mov r1, r6, lsl #2
	ldrsh r0, [r0, r1]
	mov r1, #3
	mov r0, r0, lsl #8
	bl _s32_div_f
	ldrsh sl, [sp, #0x40]
	mov r1, #0x18
	ldr r2, _0231F560 ; =DIRECTIONS_XY + 2
	mov r3, r6, lsl #2
	smulbb r1, sl, r1
	add r1, r1, #0xc
	add r6, r0, r1, lsl #8
	ldrsh r2, [r2, r3]
	mov r1, #3
	mov r0, r2, lsl #8
	bl _s32_div_f
	ldrsh r2, [sp, #0x42]
	mov r1, #0x18
	ldr sl, [r4, #0xc]
	smulbb r1, r2, r1
	add r1, r1, #0x10
	add fp, r0, r1, lsl #8
	ldr r0, [r4, #0x10]
	mov r1, sb
	sub r0, fp, r0
	bl _s32_div_f
	str sl, [sp, #0x38]
	ldr r1, [r4, #0x10]
	str r0, [sp, #0x18]
	sub r0, r6, sl
	str r1, [sp, #0x3c]
	mov r1, sb
	mov sl, #0
	bl _s32_div_f
	str r0, [sp, #0x1c]
	b _0231F31C
_0231F294:
	ldr r2, [sp, #0x38]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x3c]
	add r0, r2, r0
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x18]
	add r0, r1, r0
	str r0, [sp, #0x3c]
	mov r0, r4
	add r1, sp, #0x38
	bl UpdateEntityPixelPos
	mov r0, r4
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0231F308
	mov r0, r7
	bl sub_020018D0
	mov r0, r0, lsl #5
	str r0, [r4, #0x1c]
	mov r0, #0x3b
	bl AdvanceFrame
	tst sl, #3
	bne _0231F308
	and r8, r8, #7
	mov r0, r4
	mov r1, #6
	mov r2, r8
	bl ChangeMonsterAnimation
	add r8, r8, #1
_0231F308:
	mov r0, #0x800
	mov r1, sb
	bl _s32_div_f
	add r7, r7, r0
	add sl, sl, #1
_0231F31C:
	cmp sl, sb
	blt _0231F294
	add r1, sp, #0x38
	mov r0, r4
	str r6, [sp, #0x38]
	str fp, [sp, #0x3c]
	mov r2, #0
	str r2, [r4, #0x1c]
	bl UpdateEntityPixelPos
	mov r0, #0x3b
	bl AdvanceFrame
	ldr r0, [r4, #0xb4]
	and r1, r8, #7
	strb r1, [r0, #0x4c]
	ldrsh r0, [sp, #0x40]
	ldrsh r1, [sp, #0x42]
	bl GetTile
	ldr r7, [r0, #0xc]
	mov r0, r7
	bl EntityIsValid__0231F570
	cmp r0, #0
	bne _0231F394
	ldrsh r1, [sp, #0x40]
	ldrsh r2, [sp, #0x42]
	mov r0, r4
	mov r3, #1
	bl MoveMonsterToPos
	mov r0, r4
	bl ov29_02321238
	b _0231F53C
_0231F394:
	mov r8, #0
	ldr r6, _0231F54C ; =DIRECTIONS_XY
	add sb, sp, #0x28
	b _0231F40C
_0231F3A4:
	mov r1, r8, lsl #2
	add r0, r6, r8, lsl #2
	ldrsh sl, [sp, #0x40]
	ldrsh r3, [r6, r1]
	ldrsh r2, [sp, #0x42]
	ldrsh r1, [r0, #2]
	add r3, sl, r3
	mov r0, r4
	add r2, r2, r1
	mov r1, sb
	strh r3, [sp, #0x28]
	strh r2, [sp, #0x2a]
	bl ov29_022FF764
	cmp r0, #0
	bne _0231F408
	ldrsh r0, [sp, #0x28]
	ldrsh r1, [sp, #0x2a]
	bl GetTile
	ldrh r0, [r0]
	tst r0, #0x800
	ldreqh r1, [sp, #0x28]
	ldreqh r0, [sp, #0x2a]
	streqh r1, [sp, #0x40]
	streqh r0, [sp, #0x42]
	beq _0231F414
_0231F408:
	add r8, r8, #1
_0231F40C:
	cmp r8, #8
	blt _0231F3A4
_0231F414:
	cmp r8, #8
	bne _0231F434
	mov r2, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl TryWarp
	b _0231F454
_0231F434:
	add r1, sp, #0x40
	mov r0, r4
	bl ov29_0232033C
	ldrsh r1, [sp, #0x40]
	ldrsh r2, [sp, #0x42]
	mov r0, r4
	mov r3, #1
	bl MoveMonsterToPos
_0231F454:
	ldr r0, [r7]
	cmp r0, #1
	bne _0231F4D4
	ldr r1, _0231F564 ; =0x00000163
	add r0, sp, #0x20
	bl InitMove
	add r1, sp, #0x20
	mov r0, r7
	bl TwoTurnMoveForcedMiss
	cmp r0, #0
	bne _0231F4B4
	mov r3, #0
	str r3, [sp]
	ldr r0, _0231F568 ; =ov10_022C4458
	ldr r1, _0231F56C ; =0x00000259
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldrsh r2, [r0]
	mov r0, r5
	mov r1, r7
	str r3, [sp, #0x14]
	bl CalcDamageFixedNoCategory
_0231F4B4:
	mov r0, r7
	bl EntityIsValid__0231F570
	cmp r0, #0
	beq _0231F4D4
	ldr r1, [r7, #0xb4]
	mov r0, r7
	ldrb r1, [r1, #0x4c]
	bl ov29_02304A48
_0231F4D4:
	mov r3, #0
	str r3, [sp]
	ldr r0, _0231F568 ; =ov10_022C4458
	str r3, [sp, #4]
	mov r1, #0x258
	str r1, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldrsh r2, [r0]
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	mov r0, r4
	bl EntityIsValid__0231F570
	cmp r0, #0
	beq _0231F528
	ldr r1, [r4, #0xb4]
	mov r0, r4
	ldrb r1, [r1, #0x4c]
	bl ov29_02304A48
_0231F528:
	mov r0, #0x1e
	mov r1, #0x3b
	bl ov29_022EA370
	mov r0, r4
	bl ov29_02321238
_0231F53C:
	add sp, sp, #0xf4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_0231EDFC_OFFSET -0x2BF
#else
#define OV29_0231EDFC_OFFSET 0
#endif
_0231F544: .word 0x00000E45 + OV29_0231EDFC_OFFSET
_0231F548: .word 0x00000E46 + OV29_0231EDFC_OFFSET
_0231F54C: .word DIRECTIONS_XY
_0231F550: .word DUNGEON_PTR
_0231F554: .word 0x00000E48 + OV29_0231EDFC_OFFSET
_0231F558: .word 0x00000E47 + OV29_0231EDFC_OFFSET
_0231F55C: .word 0x00000212
_0231F560: .word DIRECTIONS_XY + 2
_0231F564: .word 0x00000163
_0231F568: .word ov10_022C4458
_0231F56C: .word 0x00000259
	arm_func_end ov29_0231EDFC
