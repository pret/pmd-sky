	.include "asm/macros.inc"
	.include "main_020562B8.inc"

	.text

	arm_func_start sub_020562B8
sub_020562B8: ; 0x020562B8
	cmp r0, #0
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_020562B8

	arm_func_start SetActiveTeam
SetActiveTeam: ; 0x020562CC
	ldr r3, _02056314 ; =TEAM_MEMBER_TABLE_PTR
	mov r2, #0x1a0
	ldr r1, [r3]
	add r1, r1, #0x9000
	strb r0, [r1, #0x877]
	ldr ip, [r3]
	add r1, ip, #0x36c
	add r1, r1, #0x9000
	mla r2, r0, r2, r1
	add r1, ip, #0x9000
	str r2, [r1, #0x84c]
	ldr r2, [r3]
	add r1, r2, #0x56
	add r1, r1, #0x9800
	add r1, r1, r0, lsl #3
	add r0, r2, #0x9000
	str r1, [r0, #0x870]
	bx lr
	.align 2, 0
_02056314: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end SetActiveTeam

	arm_func_start sub_02056318
sub_02056318: ; 0x02056318
	ldr r1, _02056338 ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r1]
	add r1, r2, #0x9000
	ldrb r1, [r1, #0x877]
	add r1, r2, r1
	add r1, r1, #0x9000
	strb r0, [r1, #0x874]
	bx lr
	.align 2, 0
_02056338: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056318

	arm_func_start sub_0205633C
sub_0205633C: ; 0x0205633C
	ldr r0, _0205635C ; =TEAM_MEMBER_TABLE_PTR
	ldr r1, [r0]
	add r0, r1, #0x9000
	ldrb r0, [r0, #0x877]
	add r0, r1, r0
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x874]
	bx lr
	.align 2, 0
_0205635C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_0205633C

	arm_func_start sub_02056360
sub_02056360: ; 0x02056360
	ldr r0, _02056388 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r1, [r0, #0x874]
	cmp r1, #0
	ldreqb r0, [r0, #0x875]
	cmpeq r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_02056388: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056360

	arm_func_start GetActiveTeamMember
GetActiveTeamMember: ; 0x0205638C
	mvn r1, #0
	cmp r0, r1
	moveq r0, #0
	bxeq lr
	ldr r1, _020563B8 ; =TEAM_MEMBER_TABLE_PTR
	mov r2, #0x68
	ldr r1, [r1]
	add r1, r1, #0x9000
	ldr r1, [r1, #0x84c]
	smlabb r0, r0, r2, r1
	bx lr
	.align 2, 0
_020563B8: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetActiveTeamMember

	arm_func_start GetActiveRosterIndex
GetActiveRosterIndex: ; 0x020563BC
	mvn r1, #0
	cmp r0, r1
	beq _02056404
	ldr r1, _0205640C ; =TEAM_MEMBER_TABLE_PTR
	mov ip, #0
	ldr r1, [r1]
	add r1, r1, #0x9000
	b _020563FC
_020563DC:
	ldr r3, [r1, #0x870]
	mov r2, ip, lsl #1
	ldrsh r2, [r3, r2]
	cmp r0, r2
	moveq r0, ip, lsl #0x10
	moveq r0, r0, asr #0x10
	bxeq lr
	add ip, ip, #1
_020563FC:
	cmp ip, #4
	blt _020563DC
_02056404:
	mvn r0, #0
	bx lr
	.align 2, 0
_0205640C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetActiveRosterIndex

	arm_func_start sub_02056410
sub_02056410: ; 0x02056410
	mvn r1, #0
	cmp r0, r1
	beq _02056454
	ldr r1, _0205645C ; =TEAM_MEMBER_TABLE_PTR
	mov ip, #0
	ldr r1, [r1]
	add r1, r1, #0x9000
	b _0205644C
_02056430:
	ldr r3, [r1, #0x870]
	mov r2, ip, lsl #1
	ldrsh r2, [r3, r2]
	cmp r0, r2
	moveq r0, #1
	bxeq lr
	add ip, ip, #1
_0205644C:
	cmp ip, #4
	blt _02056430
_02056454:
	mov r0, #0
	bx lr
	.align 2, 0
_0205645C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056410

	arm_func_start sub_02056460
sub_02056460: ; 0x02056460
	mvn r2, #0
	cmp r0, r2
	beq _020564A4
	ldr r2, _020564AC ; =TEAM_MEMBER_TABLE_PTR
	mov r3, #0
	ldr r2, [r2]
	add r2, r2, r1, lsl #3
	b _0205649C
_02056480:
	add r1, r2, r3, lsl #1
	add r1, r1, #0x9800
	ldrsh r1, [r1, #0x56]
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	add r3, r3, #1
_0205649C:
	cmp r3, #4
	blt _02056480
_020564A4:
	mov r0, #0
	bx lr
	.align 2, 0
_020564AC: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056460
