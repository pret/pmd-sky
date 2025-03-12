	.include "asm/macros.inc"
	.include "overlay_29_02301D84.inc"

	.text

	arm_func_start OtherMonsterAbilityIsActive
OtherMonsterAbilityIsActive: ; 0x02301D84
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	mov r4, r1
	mov r7, #0
	ldr r6, _02301E14 ; =DUNGEON_PTR
	b _02303354
_023032F4:
	ldr r0, [r6]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xad4]
	mov r0, r8
	bl EntityIsValid__023000E4
	cmp r0, #0
	cmpne r5, r8
	beq _02303348
	mov r0, r5
	mov r1, r8
	bl ov29_022FAFD4
	cmp r0, #0
	beq _02303348
	mov r0, r5
	mov r1, r8
	mov r2, r4
	bl DefenderAbilityIsActive__02301A0C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_02303348:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_02303354:
	cmp r7, #0x14
	blt _023032F4
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	mov r6, r1
	mov r5, #0
	mov r4, #1
	ldr r8, _02301E14 ; =DUNGEON_PTR
	b _02301E04
_02301DA0:
	ldr r0, [r8]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr sb, [r0, #0xb78]
	mov r0, sb
	bl EntityIsValid__023000E4
	cmp r0, #0
	cmpne r7, sb
	beq _02301DF8
	mov r0, r7
	mov r1, sb
	bl ov29_022FAFD4
	cmp r0, #0
	beq _02301DF8
	mov r0, r7
	mov r1, sb
	mov r2, r6
	mov r3, r4
	bl DefenderAbilityIsActive__02301A0C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02301DF8:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_02301E04:
	cmp r5, #0x14
	blt _02301DA0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
#endif
	.align 2, 0
_02301E14: .word DUNGEON_PTR
	arm_func_end OtherMonsterAbilityIsActive

	arm_func_start LevitateIsActive
LevitateIsActive: ; 0x02301E18
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GravityIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0x37
	bl AbilityIsActive
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end LevitateIsActive

	arm_func_start MonsterIsType
MonsterIsType: ; 0x02301E50
	cmp r1, #0
	ldr r2, [r0, #0xb4]
	moveq r0, #0
	bxeq lr
	ldrb r0, [r2, #0x5e]
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	ldrb r0, [r2, #0x5f]
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterIsType

	arm_func_start IsTypeAffectedByGravity
IsTypeAffectedByGravity: ; 0x02301E88
	stmdb sp!, {r3, lr}
	cmp r1, #0xa
	bne _02301EA4
	bl GravityIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
_02301EA4:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end IsTypeAffectedByGravity

	arm_func_start HasTypeAffectedByGravity
HasTypeAffectedByGravity: ; 0x02301EAC
	stmdb sp!, {r3, lr}
	ldr r3, [r0, #0xb4]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrb r2, [r3, #0x5e]
	cmp r2, r1
	bne _02301ED4
	bl IsTypeAffectedByGravity
	ldmia sp!, {r3, pc}
_02301ED4:
	ldrb r2, [r3, #0x5f]
	cmp r2, r1
	movne r0, #0
	ldmneia sp!, {r3, pc}
	bl IsTypeAffectedByGravity
	ldmia sp!, {r3, pc}
	arm_func_end HasTypeAffectedByGravity
