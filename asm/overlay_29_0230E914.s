	.include "asm/macros.inc"
	.include "overlay_29_0230E914.inc"

	.text

	arm_func_start ov29_0230E914
ov29_0230E914: ; 0x0230E914
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x50
	mov sl, r0
	ldr r7, [sl, #0xb4]
	bl ov29_02300B40
	cmp r0, #0
	movne r0, #0
	strneb r0, [r7, #0x109]
	bne _0230ED98
	ldrb r0, [r7, #0x109]
	cmp r0, #0
	beq _0230EAF0
	ldrb r0, [r7, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0230ED98
	ldrsh r0, [r7, #0x66]
	bl GetItemCategoryVeneer
	cmp r0, #0
	bne _0230EA08
	mov r0, sl
	add r2, r7, #0x62
	mov r1, #2
	mov r3, #1
	bl ov29_0230EDB0
	mov r4, #0
	ldr r6, _0230EDA0 ; =0x0237C9D8
	ldr r5, _0230EDA4 ; =0x023536FC
	b _0230E9DC
_0230E990:
	ldr r0, [r6, r4, lsl #2]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _0230E9D8
	add r0, r7, #0x4a
	mov r1, #0x24
	bl SetMonsterActionFields
	mov r0, #0x81
	strb r0, [r7, #0x4e]
	ldrsh r1, [sl, #4]
	ldr r0, _0230EDA8 ; =0x0237C9F8
	strh r1, [r7, #0x50]
	ldrsh r1, [sl, #6]
	strh r1, [r7, #0x52]
	ldr r0, [r0, r4, lsl #2]
	and r0, r0, #7
	strb r0, [r7, #0x4c]
	b _0230E9E8
_0230E9D8:
	add r4, r4, #1
_0230E9DC:
	ldr r0, [r5]
	cmp r4, r0
	blt _0230E990
_0230E9E8:
	ldr r0, _0230EDA4 ; =0x023536FC
	ldr r0, [r0]
	cmp r4, r0
	bne _0230ED98
	add r0, r7, #0x4a
	mov r1, #0x39
	bl SetMonsterActionFields
	b _0230ED98
_0230EA08:
	cmp r0, #1
	bne _0230EAAC
	add r2, sp, #0
	mov r0, sl
	add r1, r7, #0x62
	mov r3, #1
	bl ov29_0230F02C
	ldr r0, _0230EDA4 ; =0x023536FC
	ldr r1, [r0]
	cmp r1, #0
	beq _0230EA9C
	ldr r0, [r0]
	bl DungeonRandInt
	mov r4, r0
	add r0, r7, #0x4a
	mov r1, #0x24
	bl SetMonsterActionFields
	mov r0, #0x81
	strb r0, [r7, #0x4e]
	ldrsh r2, [sl, #4]
	add r1, sp, #0
	add r0, sl, #4
	strh r2, [r7, #0x50]
	ldrsh r2, [sl, #6]
	add r1, r1, r4, lsl #2
	strh r2, [r7, #0x52]
	bl GetDirectionTowardsPosition
	and r0, r0, #7
	strb r0, [r7, #0x4c]
	add r1, sp, #0
	mov r0, r4, lsl #2
	ldrh r0, [r1, r0]
	add r1, r1, r4, lsl #2
	strh r0, [r7, #0x5a]
	ldrh r0, [r1, #2]
	strh r0, [r7, #0x5c]
	b _0230ED98
_0230EA9C:
	add r0, r7, #0x4a
	mov r1, #0x39
	bl SetMonsterActionFields
	b _0230ED98
_0230EAAC:
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	add r0, r7, #0x4a
	bhi _0230EAE4
	mov r1, #0x23
	bl SetMonsterActionFields
	mov r0, #0x81
	strb r0, [r7, #0x4e]
	ldrsh r0, [sl, #4]
	strh r0, [r7, #0x50]
	ldrsh r0, [sl, #6]
	strh r0, [r7, #0x52]
	b _0230ED98
_0230EAE4:
	mov r1, #0x39
	bl SetMonsterActionFields
	b _0230ED98
_0230EAF0:
	mov r0, sl
	mov r1, #0x16
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0230ED98
	mov r5, #1
	b _0230ED90
_0230EB0C:
	cmp r5, #1
	addeq r8, r7, #0x62
	moveq r6, #0x81
	beq _0230EB84
	cmp r5, #0
	bne _0230EB58
	ldrsh r0, [sl, #4]
	ldrsh r1, [sl, #6]
	bl GetTile
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0230ED8C
	ldr r1, [r0]
	cmp r1, #3
	bne _0230ED8C
	bl ov29_022E1610
	mov r8, r0
	mov r6, #0x80
	b _0230EB84
_0230EB58:
	ldrb r0, [r7, #7]
	cmp r0, #0
	beq _0230ED98
	ldr r0, _0230EDAC ; =0x020AF6B8
	sub r1, r5, #1
	ldr r0, [r0]
	sub r2, r5, #2
	ldr r3, [r0, #0x384]
	mov r0, #6
	mla r8, r2, r0, r3
	and r6, r1, #0xff
_0230EB84:
	ldrb r1, [r8]
	tst r1, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0230ED8C
	ldrb r0, [r8]
	tst r0, #2
	bne _0230ED8C
	tst r1, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _0230ED8C
	ldrsh r0, [r8, #4]
	mov r1, #0
	bl TestItemAiFlag
	cmp r0, #0
	beq _0230EC4C
	mov r0, sl
	mov r1, r8
	mov r2, #2
	bl ov29_0231E05C
	movs r4, r0
	beq _0230EC4C
	ldrsh r0, [r8, #4]
	bl GetItemCategoryVeneer
	mov sb, r0
	cmp sb, #9
	ldreqb r0, [r7, #6]
	cmpeq r0, #0
	beq _0230EC4C
	mov r0, r4
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _0230EC4C
	cmp sb, #9
	add r0, r7, #0x4a
	bne _0230EC2C
	mov r1, #0x31
	bl SetMonsterActionFields
	b _0230EC34
_0230EC2C:
	mov r1, #0x23
	bl SetMonsterActionFields
_0230EC34:
	strb r6, [r7, #0x4e]
	ldrsh r0, [sl, #4]
	strh r0, [r7, #0x50]
	ldrsh r0, [sl, #6]
	strh r0, [r7, #0x52]
	b _0230ED98
_0230EC4C:
	mov r0, r7
	bl ov29_02302368
	cmp r0, #0
	beq _0230ED8C
	mov r4, #1
	ldr fp, _0230EDA4 ; =0x023536FC
	b _0230ED84
_0230EC68:
	ldrsh r0, [r8, #4]
	mov r1, r4
	bl TestItemAiFlag
	cmp r0, #0
	beq _0230ED80
	ldrsh r0, [r8, #4]
	bl GetItemCategoryVeneer
	cmp r0, #1
	mov r0, sl
	mov r3, #0
	bne _0230ED14
	mov r1, r8
	add r2, sp, #0
	bl ov29_0230F02C
	ldr r0, [fp]
	cmp r0, #0
	beq _0230ED80
	ldr r0, _0230EDA4 ; =0x023536FC
	ldr r0, [r0]
	bl DungeonRandInt
	mov r4, r0
	add r0, r7, #0x4a
	mov r1, #0x24
	bl SetMonsterActionFields
	strb r6, [r7, #0x4e]
	ldrsh r2, [sl, #4]
	add r1, sp, #0
	add r0, sl, #4
	strh r2, [r7, #0x50]
	ldrsh r2, [sl, #6]
	add r1, r1, r4, lsl #2
	strh r2, [r7, #0x52]
	bl GetDirectionTowardsPosition
	and r0, r0, #7
	strb r0, [r7, #0x4c]
	add r1, sp, #0
	mov r0, r4, lsl #2
	ldrh r0, [r1, r0]
	add r1, r1, r4, lsl #2
	strh r0, [r7, #0x5a]
	ldrh r0, [r1, #2]
	strh r0, [r7, #0x5c]
	b _0230ED98
_0230ED14:
	mov r1, r4
	mov r2, r8
	bl ov29_0230EDB0
	mov sb, #0
	b _0230ED74
_0230ED28:
	ldr r0, _0230EDA0 ; =0x0237C9D8
	ldr r0, [r0, sb, lsl #2]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _0230ED70
	add r0, r7, #0x4a
	mov r1, #0x24
	bl SetMonsterActionFields
	strb r6, [r7, #0x4e]
	ldrsh r1, [sl, #4]
	ldr r0, _0230EDA8 ; =0x0237C9F8
	strh r1, [r7, #0x50]
	ldrsh r1, [sl, #6]
	strh r1, [r7, #0x52]
	ldr r0, [r0, sb, lsl #2]
	and r0, r0, #7
	strb r0, [r7, #0x4c]
	b _0230ED98
_0230ED70:
	add sb, sb, #1
_0230ED74:
	ldr r0, [fp]
	cmp sb, r0
	blt _0230ED28
_0230ED80:
	add r4, r4, #1
_0230ED84:
	cmp r4, #3
	blt _0230EC68
_0230ED8C:
	add r5, r5, #1
_0230ED90:
	cmp r5, #0x34
	blt _0230EB0C
_0230ED98:
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230EDA0: .word 0x0237C9D8
_0230EDA4: .word 0x023536FC
_0230EDA8: .word 0x0237C9F8
_0230EDAC: .word 0x020AF6B8
	arm_func_end ov29_0230E914

	arm_func_start ov29_0230EDB0
ov29_0230EDB0: ; 0x0230EDB0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r4, _0230EFF4 ; =0x023536FC
	mov r5, #0
	mov sl, r0
	str r3, [sp, #8]
	ldr r0, _0230EFF8 ; =0x0237C9D0
	str r1, [sp]
	str r2, [sp, #4]
	str r5, [r4]
	mov fp, r5
_0230EDDC:
	strb fp, [r0, r5]
	add r5, r5, #1
	cmp r5, #8
	blt _0230EDDC
	mvn r0, #0
	str r0, [sp, #0x10]
_0230EDF4:
	ldr r0, _0230EFFC ; =0x02353538
	ldr r0, [r0]
	add r0, r0, fp, lsl #2
	add r0, r0, #0x12000
	ldr r4, [r0, #0xb78]
	mov r0, r4
	bl EntityIsValid__0230F008
	cmp r0, #0
	cmpne sl, r4
	beq _0230EFE0
	ldr r0, [sp]
	mov r2, #0
	cmp r0, #1
	mov r0, sl
	mov r1, r4
	bne _0230EE50
	mov r3, r2
	bl ov29_0230175C
	cmp r0, #0
	bne _0230EFE0
	mov r0, #3
	str r0, [sp, #0xc]
	b _0230EE68
_0230EE50:
	mov r3, #1
	bl ov29_0230175C
	cmp r0, #1
	bne _0230EFE0
	mov r0, #1
	str r0, [sp, #0xc]
_0230EE68:
	mov r0, sl
	mov r1, r4
	bl ov29_022E274C
	cmp r0, #0
	beq _0230EFE0
	ldrsh r6, [r4, #4]
	ldrsh r7, [sl, #4]
	sub r0, r7, r6
	bl Abs
	mov r5, r0
	ldrsh r8, [r4, #6]
	ldrsh sb, [sl, #6]
	sub r0, sb, r8
	bl Abs
	ldr r1, [sl, #0xb4]
	ldrb r1, [r1, #0xee]
	cmp r1, #0
	bne _0230EEC4
	cmp r5, r0
	movgt r1, r5
	movle r1, r0
	cmp r1, #0xa
	bgt _0230EFE0
_0230EEC4:
	cmp r5, r0
	ldr r5, [sp, #0x10]
	bne _0230EF08
	cmp r7, r6
	cmplt sb, r8
	movlt r5, #1
	blt _0230EF54
	cmp r7, r6
	bge _0230EEF4
	cmp sb, r8
	movgt r5, #3
	bgt _0230EF54
_0230EEF4:
	cmp r7, r6
	cmpgt sb, r8
	movgt r5, #5
	movle r5, #7
	b _0230EF54
_0230EF08:
	cmp r7, r6
	bne _0230EF1C
	cmp sb, r8
	movlt r5, #0
	blt _0230EF54
_0230EF1C:
	cmp r7, r6
	bge _0230EF30
	cmp sb, r8
	moveq r5, #2
	beq _0230EF54
_0230EF30:
	cmp r7, r6
	bne _0230EF44
	cmp sb, r8
	movgt r5, #4
	bgt _0230EF54
_0230EF44:
	cmp r7, r6
	ble _0230EF54
	cmp sb, r8
	moveq r5, #6
_0230EF54:
	cmp r5, #0
	blt _0230EFE0
	ldr r0, _0230EFF8 ; =0x0237C9D0
	ldrb r0, [r0, r5]
	cmp r0, #0
	bne _0230EFE0
	mov r0, sl
	mov r1, r4
	mov r2, r5
	mov r3, #0xa
	bl IsTargetInRange
	cmp r0, #0
	beq _0230EFE0
	ldr r0, _0230EFF8 ; =0x0237C9D0
	mov r1, #1
	strb r1, [r0, r5]
	ldr r0, [sp, #8]
	cmp r0, #0
	ldr r0, _0230EFF4 ; =0x023536FC
	ldr r1, [r0]
	ldr r0, _0230F000 ; =0x0237C9F8
	str r5, [r0, r1, lsl #2]
	movne r0, #0x64
	bne _0230EFC4
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #4]
	mov r0, r4
	bl ov29_0231E05C
_0230EFC4:
	ldr r1, _0230EFF4 ; =0x023536FC
	ldr r2, [r1]
	ldr r1, _0230F004 ; =0x0237C9D8
	str r0, [r1, r2, lsl #2]
	ldr r0, _0230EFF4 ; =0x023536FC
	add r1, r2, #1
	str r1, [r0]
_0230EFE0:
	add fp, fp, #1
	cmp fp, #0x14
	blt _0230EDF4
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230EFF4: .word 0x023536FC
_0230EFF8: .word 0x0237C9D0
_0230EFFC: .word 0x02353538
_0230F000: .word 0x0237C9F8
_0230F004: .word 0x0237C9D8
	arm_func_end ov29_0230EDB0
