	.include "asm/macros.inc"
	.include "main_02011528.inc"

	.text

	arm_func_start ApplyGummiBoostsToGroundMonster
ApplyGummiBoostsToGroundMonster: ; 0x02011528
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	mov ip, r0
	stmia sp, {r1, r2, r3}
	add r0, ip, #4
	add r1, ip, #8
	add r2, ip, #0xc
	add r3, ip, #0xe
	bl ApplyGummiBoostsGroundMode
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ApplyGummiBoostsToGroundMonster

	arm_func_start ApplyGummiBoostsToTeamMember
ApplyGummiBoostsToTeamMember: ; 0x02011554
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	mov ip, r0
	stmia sp, {r1, r2, r3}
	add r0, ip, #0xc
	add r1, ip, #6
	add r2, ip, #0x12
	add r3, ip, #0x14
	bl ApplyGummiBoostsGroundMode
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ApplyGummiBoostsToTeamMember

	arm_func_start ApplySitrusBerryBoostToGroundMonster
ApplySitrusBerryBoostToGroundMonster: ; 0x02011580
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020115B8 ; =SITRUS_BERRY_FULL_HP_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrsh r4, [r7, #0xa]
	mov r6, r1
	add r0, r7, #0xa
	mov r1, r5
	bl ModifyHpStat
	cmp r6, #0
	strne r5, [r6]
	ldrsh r0, [r7, #0xa]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020115B8: .word SITRUS_BERRY_FULL_HP_BOOST
	arm_func_end ApplySitrusBerryBoostToGroundMonster

	arm_func_start ApplyLifeSeedBoostToGroundMonster
ApplyLifeSeedBoostToGroundMonster: ; 0x020115BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020115F4 ; =LIFE_SEED_HP_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrsh r4, [r7, #0xa]
	mov r6, r1
	add r0, r7, #0xa
	mov r1, r5
	bl ModifyHpStat
	cmp r6, #0
	strne r5, [r6]
	ldrsh r0, [r7, #0xa]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020115F4: .word LIFE_SEED_HP_BOOST
	arm_func_end ApplyLifeSeedBoostToGroundMonster

	arm_func_start ApplyGinsengToGroundMonster
ApplyGinsengToGroundMonster: ; 0x020115F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r0
	mov r0, #0x64
	mov sb, r1
	mov r8, r2
	mvn r4, #0
	mov r6, #0
	bl RandInt
	ldr r1, _02011708 ; =GINSENG_CHANCE_3
	mov ip, #0
	ldrsh r1, [r1]
	mov r2, #1
	cmp r0, r1
	movlt r7, #3
	movge r7, #1
	mov r1, ip
	mov r0, #6
	b _02011664
_02011640:
	mla r3, ip, r0, r5
	ldrb r3, [r3, #0x22]
	tst r3, #1
	movne r3, r2
	moveq r3, r1
	tst r3, #0xff
	movne r4, ip
	bne _0201166C
	add ip, ip, #1
_02011664:
	cmp ip, #4
	blt _02011640
_0201166C:
	mvn r0, #0
	cmp r4, r0
	bne _02011698
	cmp sb, #0
	movne r0, #0
	strneh r0, [sb]
	cmp r8, #0
	movne r0, #0
	strne r0, [r8]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02011698:
	add r1, r5, #0x22
	mov r0, #6
	mla r5, r4, r0, r1
	mov r0, r5
	bl GetMoveBasePowerGround
	cmp r0, #0
	beq _020116E4
	mov r0, r5
	ldrb r4, [r5, #4]
	bl GetMoveMaxGinsengBoostGround
	ldrb r1, [r5, #4]
	add r2, r1, r7
	and r1, r2, #0xff
	strb r2, [r5, #4]
	cmp r1, r0
	strgeb r0, [r5, #4]
	ldrb r0, [r5, #4]
	cmp r4, r0
	movne r6, #1
_020116E4:
	cmp sb, #0
	ldrneh r0, [r5, #2]
	strneh r0, [sb]
	cmp r8, #0
	strne r7, [r8]
	cmp r6, #0
	moveq r7, #0
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02011708: .word GINSENG_CHANCE_3
	arm_func_end ApplyGinsengToGroundMonster

	arm_func_start ApplyProteinBoostToGroundMonster
ApplyProteinBoostToGroundMonster: ; 0x0201170C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02011744 ; =PROTEIN_STAT_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrb r4, [r7, #0xc]
	mov r6, r1
	add r0, r7, #0xc
	mov r1, r5
	bl ModifyOffensiveStat
	cmp r6, #0
	strne r5, [r6]
	ldrb r0, [r7, #0xc]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02011744: .word PROTEIN_STAT_BOOST
	arm_func_end ApplyProteinBoostToGroundMonster

	arm_func_start ApplyCalciumBoostToGroundMonster
ApplyCalciumBoostToGroundMonster: ; 0x02011748
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02011780 ; =CALCIUM_STAT_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrb r4, [r7, #0xd]
	mov r6, r1
	add r0, r7, #0xd
	mov r1, r5
	bl ModifyOffensiveStat
	cmp r6, #0
	strne r5, [r6]
	ldrb r0, [r7, #0xd]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02011780: .word CALCIUM_STAT_BOOST
	arm_func_end ApplyCalciumBoostToGroundMonster

	arm_func_start ApplyIronBoostToGroundMonster
ApplyIronBoostToGroundMonster: ; 0x02011784
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020117BC ; =IRON_STAT_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrb r4, [r7, #0xe]
	mov r6, r1
	add r0, r7, #0xe
	mov r1, r5
	bl ModifyDefensiveStat
	cmp r6, #0
	strne r5, [r6]
	ldrb r0, [r7, #0xe]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020117BC: .word IRON_STAT_BOOST
	arm_func_end ApplyIronBoostToGroundMonster

	arm_func_start ApplyZincBoostToGroundMonster
ApplyZincBoostToGroundMonster: ; 0x020117C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020117F8 ; =ZINC_STAT_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrb r4, [r7, #0xf]
	mov r6, r1
	add r0, r7, #0xf
	mov r1, r5
	bl ModifyDefensiveStat
	cmp r6, #0
	strne r5, [r6]
	ldrb r0, [r7, #0xf]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020117F8: .word ZINC_STAT_BOOST
	arm_func_end ApplyZincBoostToGroundMonster

	arm_func_start ApplyNectarBoostToGroundMonster
ApplyNectarBoostToGroundMonster: ; 0x020117FC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrsh r4, [r6, #8]
	mov r5, r1
	add r0, r6, #8
	mov r1, #0xa
	bl ModifyIqStat
	cmp r5, #0
	movne r0, #0xa
	strne r0, [r5]
	ldrsh r0, [r6, #8]
	sub r0, r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ApplyNectarBoostToGroundMonster
