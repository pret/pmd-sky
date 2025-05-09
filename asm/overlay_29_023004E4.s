	.include "asm/macros.inc"
	.include "overlay_29_023004E4.inc"

	.text

	arm_func_start MonsterHasNonvolatileNonsleepStatus
MonsterHasNonvolatileNonsleepStatus: ; 0x023004E4
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xbf]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterHasNonvolatileNonsleepStatus

	arm_func_start MonsterHasImmobilizingStatus
MonsterHasImmobilizingStatus: ; 0x02300500
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xc4]
	cmp r0, #3
	cmpne r0, #5
	cmpne r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end MonsterHasImmobilizingStatus

	arm_func_start MonsterHasAttackInterferingStatus
MonsterHasAttackInterferingStatus: ; 0x02300520
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xd0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterHasAttackInterferingStatus

	arm_func_start MonsterHasSkillInterferingStatus
MonsterHasSkillInterferingStatus: ; 0x0230053C
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xd8]
	cmp r0, #1
	moveq r0, #1
	bxeq lr
	cmp r0, #2
	moveq r0, #1
	bxeq lr
	cmp r0, #4
	moveq r0, #1
	bxeq lr
	cmp r0, #5
	moveq r0, #1
	bxeq lr
	cmp r0, #6
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterHasSkillInterferingStatus

	arm_func_start MonsterHasLeechSeedStatus
MonsterHasLeechSeedStatus: ; 0x02300588
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xe0]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterHasLeechSeedStatus

	arm_func_start MonsterHasWhifferStatus
MonsterHasWhifferStatus: ; 0x023005A4
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xec]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterHasWhifferStatus

	arm_func_start IsMonsterVisuallyImpaired
IsMonsterVisuallyImpaired: ; 0x023005C0
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #0xb4]
	bl IsBlinded
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	ldrb r0, [r4, #0xf1]
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	cmp r0, #4
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end IsMonsterVisuallyImpaired

	arm_func_start IsMonsterMuzzled
IsMonsterMuzzled: ; 0x023005FC
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xf3]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMonsterMuzzled

	arm_func_start MonsterHasMiracleEyeStatus
MonsterHasMiracleEyeStatus: ; 0x02300618
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xf5]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterHasMiracleEyeStatus
