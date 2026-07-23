	.include "asm/macros.inc"
	.include "main_02055528.inc"

	.text

	arm_func_start IsMainCharacter
IsMainCharacter: ; 0x02055528
	stmdb sp!, {r4, lr}
	ldr r1, _020555A4 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, r0
	mov r0, #0x44
	smulbb r0, r4, r0
	ldr r1, [r1]
	ldrb r0, [r1, r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0205559C
	cmp r4, #5
	bge _0205559C
	bl GetGameMode
	cmp r0, #3
	bne _02055584
	cmp r4, #2
	cmpne r4, #3
	cmpne r4, #4
	beq _02055594
	mov r0, #0
	ldmia sp!, {r4, pc}
_02055584:
	cmp r4, #0
	cmpne r4, #1
	movne r0, #0
	ldmneia sp!, {r4, pc}
_02055594:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0205559C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020555A4: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end IsMainCharacter

	arm_func_start GetTeamMember
GetTeamMember: ; 0x020555A8
	mvn r1, #0
	cmp r0, r1
	moveq r0, #0
	bxeq lr
	ldr r2, _020555CC ; =TEAM_MEMBER_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	bx lr
	.align 2, 0
_020555CC: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetTeamMember

	arm_func_start GetRecruitMentryIdBySpecies
GetRecruitMentryIdBySpecies: ; 0x020555D0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _02055648 ; =TEAM_MEMBER_TABLE_PTR
	mov r5, #0
	ldr r2, [r2]
	mov r6, #5
	add r4, r2, #0x154
	mov ip, r5
	mov lr, #1
	ldr r2, _0205564C ; =0x0000022B
	b _02055638
_020555F8:
	ldrb r3, [r4]
	tst r3, #1
	movne r3, lr
	moveq r3, ip
	tst r3, #0xff
	beq _02055630
	ldrsh r3, [r4, #4]
	cmp r3, r0
	bne _02055630
	cmp r5, r1
	moveq r0, r6, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmeqia sp!, {r4, r5, r6, pc}
	add r5, r5, #1
_02055630:
	add r6, r6, #1
	add r4, r4, #0x44
_02055638:
	cmp r6, r2
	blt _020555F8
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02055648: .word TEAM_MEMBER_TABLE_PTR
_0205564C: .word 0x0000022B
	arm_func_end GetRecruitMentryIdBySpecies
