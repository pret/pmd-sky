	.include "asm/macros.inc"
	.include "main_020563BC.inc"

	.text

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
