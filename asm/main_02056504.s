	.include "asm/macros.inc"
	.include "main_02056504.inc"

	.text

	arm_func_start sub_02056504
sub_02056504: ; 0x02056504
	mvn r3, #0
	cmp r0, r3
	beq _02056548
	ldr r2, _02056550 ; =TEAM_MEMBER_TABLE_PTR
	ldr ip, [r2]
	add r2, ip, r1, lsl #1
	add r2, r2, #0x9800
	ldrsh r2, [r2, #0x50]
	cmp r2, r3
	beq _02056548
	add r1, ip, r1, lsl #3
	add r1, r1, r2, lsl #1
	add r1, r1, #0x9800
	ldrsh r1, [r1, #0x56]
	cmp r0, r1
	moveq r0, #1
	bxeq lr
_02056548:
	mov r0, #0
	bx lr
	.align 2, 0
_02056550: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056504

	arm_func_start sub_02056554
sub_02056554: ; 0x02056554
	stmdb sp!, {r4, lr}
	mvn r1, #0
	cmp r0, r1
	beq _020565E8
	ldr r1, _020565F0 ; =TEAM_MEMBER_TABLE_PTR
	mov ip, #0
	ldr lr, [r1]
	add r1, lr, #0x9000
	b _02056598
_02056578:
	ldr r3, [r1, #0x870]
	mov r2, ip, lsl #1
	ldrsh r2, [r3, r2]
	cmp r0, r2
	moveq r0, ip, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmeqia sp!, {r4, pc}
	add ip, ip, #1
_02056598:
	cmp ip, #4
	blt _02056578
	mov r4, #0
	add r1, lr, #0x9000
	mvn r2, #0
	b _020565E0
_020565B0:
	ldr r3, [r1, #0x870]
	mov ip, r4, lsl #1
	ldrsh r3, [r3, ip]
	cmp r3, r2
	bne _020565DC
	add r1, lr, #0x9000
	ldr r2, [r1, #0x870]
	mov r1, r4, lsl #0x10
	strh r0, [r2, ip]
	mov r0, r1, asr #0x10
	ldmia sp!, {r4, pc}
_020565DC:
	add r4, r4, #1
_020565E0:
	cmp r4, #4
	blt _020565B0
_020565E8:
	mvn r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020565F0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056554

	arm_func_start sub_020565F4
sub_020565F4: ; 0x020565F4
	stmdb sp!, {r4, lr}
	mvn r2, #0
	cmp r0, r2
	beq _0205668C
	ldr r2, _02056694 ; =TEAM_MEMBER_TABLE_PTR
	mov ip, #0
	ldr lr, [r2]
	add r3, lr, r1, lsl #3
	b _02056638
_02056618:
	add r2, r3, ip, lsl #1
	add r2, r2, #0x9800
	ldrsh r2, [r2, #0x56]
	cmp r0, r2
	moveq r0, ip, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmeqia sp!, {r4, pc}
	add ip, ip, #1
_02056638:
	cmp ip, #4
	blt _02056618
	mov r4, #0
	add ip, lr, r1, lsl #3
	mvn r3, #0
	b _02056684
_02056650:
	add r2, ip, r4, lsl #1
	add r2, r2, #0x9800
	ldrsh r2, [r2, #0x56]
	cmp r2, r3
	bne _02056680
	add r1, lr, r1, lsl #3
	add r1, r1, r4, lsl #1
	add r1, r1, #0x9800
	mov r2, r4, lsl #0x10
	strh r0, [r1, #0x56]
	mov r0, r2, asr #0x10
	ldmia sp!, {r4, pc}
_02056680:
	add r4, r4, #1
_02056684:
	cmp r4, #4
	blt _02056650
_0205668C:
	mvn r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02056694: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020565F4

	arm_func_start sub_02056698
sub_02056698: ; 0x02056698
	mvn r2, #0
	cmp r1, r2
	bxeq lr
	ldr r2, _020566C0 ; =TEAM_MEMBER_TABLE_PTR
	mov r3, r0, lsl #1
	ldr r0, [r2]
	add r0, r0, #0x9000
	ldr r0, [r0, #0x870]
	strh r1, [r0, r3]
	bx lr
	.align 2, 0
_020566C0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056698

	arm_func_start sub_020566C4
sub_020566C4: ; 0x020566C4
	stmdb sp!, {r3, lr}
	mvn r1, #0
	cmp r0, r1
	beq _02056748
	ldr r2, _02056750 ; =TEAM_MEMBER_TABLE_PTR
	mov r1, #0
	ldr lr, [r2]
	add r2, lr, #0x9000
	b _02056740
_020566E8:
	ldr r3, [r2, #0x870]
	mov ip, r1, lsl #1
	ldrsh r3, [r3, ip]
	cmp r0, r3
	bne _0205673C
	add r0, lr, #0x9000
	ldr r2, [r0, #0x870]
	mvn r3, #0
	ldr r0, _02056750 ; =TEAM_MEMBER_TABLE_PTR
	strh r3, [r2, ip]
	ldr r2, [r0]
	add r0, r2, #0x9000
	ldrb r0, [r0, #0x877]
	add r0, r2, r0, lsl #1
	add r0, r0, #0x9800
	ldrsh r2, [r0, #0x50]
	cmp r1, r2
	streqh r3, [r0, #0x50]
	mov r0, r1, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
_0205673C:
	add r1, r1, #1
_02056740:
	cmp r1, #4
	blt _020566E8
_02056748:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02056750: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020566C4

	arm_func_start TryAddMonsterToActiveTeam
TryAddMonsterToActiveTeam: ; 0x02056754
	stmdb sp!, {r4, lr}
	mvn r1, #0
	cmp r0, r1
	beq _02056824
	ldr r1, _0205682C ; =TEAM_MEMBER_TABLE_PTR
	mov ip, #0
	ldr lr, [r1]
	add r1, lr, #0x9000
	b _020567B8
_02056778:
	ldr r3, [r1, #0x870]
	mov r2, ip, lsl #1
	ldrsh r2, [r3, r2]
	cmp r0, r2
	bne _020567B4
	ldr r1, _0205682C ; =TEAM_MEMBER_TABLE_PTR
	mov r0, ip, lsl #0x10
	ldr r2, [r1]
	mov r0, r0, asr #0x10
	add r1, r2, #0x9000
	ldrb r1, [r1, #0x877]
	add r1, r2, r1, lsl #1
	add r1, r1, #0x9800
	strh r0, [r1, #0x50]
	ldmia sp!, {r4, pc}
_020567B4:
	add ip, ip, #1
_020567B8:
	cmp ip, #4
	blt _02056778
	mov r4, #0
	add r1, lr, #0x9000
	mvn r2, #0
	b _0205681C
_020567D0:
	ldr r3, [r1, #0x870]
	mov ip, r4, lsl #1
	ldrsh r3, [r3, ip]
	cmp r3, r2
	bne _02056818
	add r1, lr, #0x9000
	ldr r2, [r1, #0x870]
	ldr r1, _0205682C ; =TEAM_MEMBER_TABLE_PTR
	strh r0, [r2, ip]
	ldr r2, [r1]
	mov r0, r4, lsl #0x10
	add r1, r2, #0x9000
	ldrb r1, [r1, #0x877]
	mov r0, r0, asr #0x10
	add r1, r2, r1, lsl #1
	add r1, r1, #0x9800
	strh r0, [r1, #0x50]
	ldmia sp!, {r4, pc}
_02056818:
	add r4, r4, #1
_0205681C:
	cmp r4, #4
	blt _020567D0
_02056824:
	mvn r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205682C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end TryAddMonsterToActiveTeam

	arm_func_start sub_02056830
sub_02056830: ; 0x02056830
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	mov r6, r7
	mov r4, r7
	mov r5, #1
_02056844:
	mov r0, r6
	bl GetActiveTeamMember
	ldrb r0, [r0]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	addeq r7, r7, #1
	cmp r6, #4
	blt _02056844
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02056830

	arm_func_start sub_02056880
sub_02056880: ; 0x02056880
	ldr r0, _020568A0 ; =TEAM_MEMBER_TABLE_PTR
	ldr r1, [r0]
	add r0, r1, #0x9000
	ldrb r0, [r0, #0x877]
	add r0, r1, r0, lsl #1
	add r0, r0, #0x9800
	ldrsh r0, [r0, #0x50]
	bx lr
	.align 2, 0
_020568A0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056880
