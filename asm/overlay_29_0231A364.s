	.include "asm/macros.inc"
	.include "overlay_29_0231A364.inc"

	.text

	arm_func_start WeightMoveWithIqSkills
WeightMoveWithIqSkills: ; 0x0231A364
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r2
	mov sb, r0
	mov r8, r1
	mov r0, r7
	mov r1, #0x6f
	mov r6, r3
	ldr r5, [r7, #0xb4]
	mov r4, #1
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _0231A3A4
	mov r0, r7
	mov r1, #0xf
	bl HasHeldItem
_0231A3A4:
	cmp r0, #0
	movne r0, #0x1f4
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r0, [r5, #6]
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	tst r8, #0xf
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, sb
	mov r1, #9
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0231A404
	ldrsh r0, [r5, #2]
	mov r1, #0x258
	bl _s32_div_f
	ldr r0, _0231A45C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r1
	add r0, r0, #0x3000
#ifdef JAPAN
	ldrb r4, [r0, #0xb24]
#else
	ldrb r4, [r0, #0xb74]
#endif
	b _0231A454
_0231A404:
	mov r0, sb
	mov r1, #0xa
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0231A42C
	ldrsh r0, [r5, #0x10]
	rsb r4, r0, #0x1f4
	cmp r4, #1
	movlt r4, #1
	b _0231A454
_0231A42C:
	mov r0, sb
	mov r1, #0xb
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0231A454
	mov r0, sb
	mov r1, r7
	mov r2, r6
	bl ov29_0230B7D4
	add r4, r0, #1
_0231A454:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0231A45C: .word DUNGEON_PTR
	arm_func_end WeightMoveWithIqSkills

	arm_func_start TargetRegularAttack
TargetRegularAttack: ; 0x0231A460
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x48
	mov sl, r0
	ldr r3, [sl, #0xb4]
	mov sb, r1
	str r2, [sp]
	mov r1, #1
	ldrb r6, [r3, #0x4c]
	mov r4, #0
	bl IsBlinded
	cmp r0, #0
	movne r7, #1
	bne _0231A4AC
	mov r0, sl
	mov r1, #0xf
	bl ov29_0230F8D0
	cmp r0, #0xff
	mov r7, #8
	movne r6, r0
_0231A4AC:
	mov r0, sl
	mov r1, #9
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _0231A4D4
	mov r0, sl
	mov r1, #0xa
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0231A4DC
_0231A4D4:
	mov r2, #1
	b _0231A4E0
_0231A4DC:
	mov r2, #0
_0231A4E0:
	mov r0, sl
	mov r1, #8
	and fp, r2, #0xff
	bl IqSkillIsEnabled
	str r0, [sp, #4]
	mov r5, #0
	b _0231A5CC
_0231A4FC:
	and r6, r6, #7
	ldr r1, _0231A690 ; =DIRECTIONS_XY
	mov r2, r6, lsl #2
	ldrsh r3, [r1, r2]
	add r1, r1, r6, lsl #2
	ldrsh r0, [sl, #4]
	ldrsh r2, [sl, #6]
	ldrsh r1, [r1, #2]
	add r0, r0, r3
	add r1, r2, r1
	bl GetTile
	ldr r8, [r0, #0xc]
	cmp r8, #0
	beq _0231A5C4
	ldr r0, [r8]
	cmp r0, #1
	bne _0231A5C4
	mov r0, sl
	mov r1, r6
	bl CanAttackInDirection
	cmp r0, #0
	beq _0231A5C4
	ldr r3, [sp]
	mov r0, sl
	mov r1, r8
	mov r2, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	bne _0231A5C4
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _0231A58C
	ldr r0, [r8, #0xb4]
	ldrb r0, [r0, #0xc4]
	cmp r0, #1
	beq _0231A5C4
_0231A58C:
	add r0, sp, #0x28
	mov r1, #0
	str r6, [r0, r4, lsl #2]
	mov r2, r8
	mov r0, sl
	mov r3, r1
	bl WeightMoveWithIqSkills
	add r1, sp, #8
	cmp fp, #0
	str r0, [r1, r4, lsl #2]
	streq r6, [sb]
	moveq r0, #1
	beq _0231A688
	add r4, r4, #1
_0231A5C4:
	add r5, r5, #1
	add r6, r6, #1
_0231A5CC:
	cmp r5, r7
	blt _0231A4FC
	cmp r4, #0
	mov r0, #0
	beq _0231A688
	mov r5, r0
	mov r3, r0
	add r2, sp, #8
	b _0231A600
_0231A5F0:
	ldr r1, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r5, r1
	movlt r5, r1
_0231A600:
	cmp r3, r4
	blt _0231A5F0
	mov r6, #0
	mov r1, r6
	add r3, sp, #8
	b _0231A628
_0231A618:
	ldr r2, [r3, r6, lsl #2]
	cmp r5, r2
	strne r1, [r3, r6, lsl #2]
	add r6, r6, #1
_0231A628:
	cmp r6, r4
	blt _0231A618
	mov r3, #0
	add r2, sp, #8
	b _0231A648
_0231A63C:
	ldr r1, [r2, r3, lsl #2]
	add r3, r3, #1
	add r0, r0, r1
_0231A648:
	cmp r3, r4
	blt _0231A63C
	bl DungeonRandInt
	mov r3, #0
	add r2, sp, #8
	b _0231A670
_0231A660:
	ldr r1, [r2, r3, lsl #2]
	subs r0, r0, r1
	bmi _0231A678
	add r3, r3, #1
_0231A670:
	cmp r3, r4
	blt _0231A660
_0231A678:
	add r1, sp, #0x28
	ldr r1, [r1, r3, lsl #2]
	mov r0, #1
	str r1, [sb]
_0231A688:
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0231A690: .word DIRECTIONS_XY
	arm_func_end TargetRegularAttack
