	.include "asm/macros.inc"
	.include "main_02013C30.inc"

	.text

	arm_func_start GetMoveMessageFromId
GetMoveMessageFromId: ; 0x02013C30
	ldr r2, _02013C5C ; =DUNGEON_MOVE_TABLES
	mov r1, #0x1a
	ldr r2, [r2, #8]
	ldr ip, _02013C60 ; =StringFromId
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0x18]
#ifdef JAPAN
	add r0, r0, #0x13c
	add r0, r0, #0x1400
#else
	add r0, r0, #0x314
	add r0, r0, #0xc00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx ip
	.align 2, 0
_02013C5C: .word DUNGEON_MOVE_TABLES
_02013C60: .word StringFromId
	arm_func_end GetMoveMessageFromId

	arm_func_start GetNbMoves
GetNbMoves: ; 0x02013C64
	stmdb sp!, {r4, lr}
	mov r4, #0
	mov lr, r4
	mov r2, r4
	mov r3, #1
	mov r1, #6
_02013C7C:
	mul ip, lr, r1
	ldrb ip, [r0, ip]
	add lr, lr, #1
	tst ip, #1
	movne ip, r3
	moveq ip, r2
	tst ip, #0xff
	addne r4, r4, #1
	cmp lr, #4
	blt _02013C7C
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end GetNbMoves

	arm_func_start GetMovesetIdx__02013CAC
GetMovesetIdx__02013CAC: ; 0x02013CAC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	mov ip, r5
	mov lr, #1
	mov r2, #6
	b _02013CF8
_02013CC4:
	mul r4, r5, r2
	ldrb r3, [r0, r4]
	add r4, r0, r4
	tst r3, #1
	movne r3, lr
	moveq r3, ip
	tst r3, #0xff
	beq _02013CF4
	ldrh r3, [r4, #2]
	cmp r1, r3
	moveq r0, r5
	ldmeqia sp!, {r3, r4, r5, pc}
_02013CF4:
	add r5, r5, #1
_02013CF8:
	cmp r5, #4
	blt _02013CC4
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetMovesetIdx__02013CAC

	arm_func_start IsReflectedByMagicCoat
IsReflectedByMagicCoat: ; 0x02013D08
	ldr r2, _02013D20 ; =DUNGEON_MOVE_TABLES
	mov r1, #0x1a
	ldr r2, [r2, #8]
	mla r1, r0, r1, r2
	ldrb r0, [r1, #0x10]
	bx lr
	.align 2, 0
_02013D20: .word DUNGEON_MOVE_TABLES
	arm_func_end IsReflectedByMagicCoat

	arm_func_start CanBeSnatched
CanBeSnatched: ; 0x02013D24
	ldr r2, _02013D3C ; =DUNGEON_MOVE_TABLES
	mov r1, #0x1a
	ldr r2, [r2, #8]
	mla r1, r0, r1, r2
	ldrb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_02013D3C: .word DUNGEON_MOVE_TABLES
	arm_func_end CanBeSnatched

	arm_func_start FailsWhileMuzzled
FailsWhileMuzzled: ; 0x02013D40
	ldr r2, _02013D58 ; =DUNGEON_MOVE_TABLES
	mov r1, #0x1a
	ldr r2, [r2, #8]
	mla r1, r0, r1, r2
	ldrb r0, [r1, #0x12]
	bx lr
	.align 2, 0
_02013D58: .word DUNGEON_MOVE_TABLES
	arm_func_end FailsWhileMuzzled

	arm_func_start IsSoundMove
IsSoundMove: ; 0x02013D5C
	ldrh r2, [r0, #4]
	cmp r2, #0xd9
	moveq r0, #1
	bxeq lr
	cmp r2, #0x11c
	moveq r0, #1
	bxeq lr
	cmp r2, #0x53
	moveq r0, #1
	bxeq lr
	cmp r2, #0x22
	moveq r0, #1
	bxeq lr
	cmp r2, #0x54
	moveq r0, #1
	bxeq lr
	cmp r2, #0xab
	moveq r0, #1
	bxeq lr
	ldr r1, _02013E10 ; =0x00000125
	cmp r2, r1
	moveq r0, #1
	bxeq lr
	cmp r2, #0x1b
	moveq r0, #1
	bxeq lr
	cmp r2, #0xf1
	moveq r0, #1
	bxeq lr
	cmp r2, #0x19
	moveq r0, #1
	bxeq lr
	cmp r2, #0x1a
	moveq r0, #1
	bxeq lr
	add r0, r1, #0xed
	cmp r2, r0
	moveq r0, #1
	bxeq lr
	add r0, r1, #0x99
	cmp r2, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02013E10: .word 0x00000125
	arm_func_end IsSoundMove

	arm_func_start IsRecoilMove
IsRecoilMove: ; 0x02013E14
	mov r3, #0
	ldr r2, _02013E50 ; =RECOIL_MOVE_LIST
	b _02013E38
_02013E20:
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
_02013E38:
	mov r1, r3, lsl #1
	ldrh r1, [r2, r1]
	cmp r1, #0
	bne _02013E20
	mov r0, #0
	bx lr
	.align 2, 0
_02013E50: .word RECOIL_MOVE_LIST
	arm_func_end IsRecoilMove

	arm_func_start sub_02013E54
sub_02013E54: ; 0x02013E54
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x88
	mov r4, r1
	mov r5, r0
	ldrb r2, [r5, r4, lsl #3]
	add r1, sp, #8
	orr r2, r2, #0x80
	strb r2, [r5, r4, lsl #3]
	bl ManipMoves1v1
	add r0, sp, #8
	bl sub_02014230
	cmp r0, #0
	blt _02013F14
	cmp r0, #3
	bge _02013F14
	add r1, r0, #1
	mov r2, #0
_02013E98:
	add r3, sp, #8
	add r3, r3, r0, lsl #5
	add ip, sp, #0
	add lr, r3, r2, lsl #3
	mov r6, #4
_02013EAC:
	ldrh r3, [lr], #2
	subs r6, r6, #1
	strh r3, [ip], #2
	bne _02013EAC
	add r3, sp, #8
	add ip, r3, r0, lsl #5
	add r3, r3, r1, lsl #5
	mov r6, #4
	add lr, r3, r2, lsl #3
	add ip, ip, r2, lsl #3
_02013ED4:
	ldrh r3, [lr], #2
	subs r6, r6, #1
	strh r3, [ip], #2
	bne _02013ED4
	add r3, sp, #8
	add r3, r3, r1, lsl #5
	add r6, sp, #0
	add lr, r3, r2, lsl #3
	mov ip, #4
_02013EF8:
	ldrh r3, [r6], #2
	subs ip, ip, #1
	strh r3, [lr], #2
	bne _02013EF8
	add r2, r2, #1
	cmp r2, #4
	blt _02013E98
_02013F14:
	add r1, sp, #8
	mov r0, r5
	bl ManipMoves1v2
	mov r1, #0
	b _02013F44
_02013F28:
	ldrb r0, [r5, r1, lsl #3]
	tst r0, #0x80
	bicne r0, r0, #0x80
	movne r4, r1
	strneb r0, [r5, r1, lsl #3]
	bne _02013F4C
	add r1, r1, #1
_02013F44:
	cmp r1, #4
	blt _02013F28
_02013F4C:
	mov r0, r4
	add sp, sp, #0x88
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02013E54

	arm_func_start sub_02013F58
sub_02013F58: ; 0x02013F58
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x88
	mov r4, r1
	mov r5, r0
	ldrb r2, [r5, r4, lsl #3]
	add r1, sp, #8
	orr r2, r2, #0x80
	strb r2, [r5, r4, lsl #3]
	bl ManipMoves1v1
	add r0, sp, #8
	bl sub_02014230
	cmp r0, #1
	blt _02014018
	cmp r0, #4
	bge _02014018
	sub r1, r0, #1
	mov r2, #0
_02013F9C:
	add r3, sp, #8
	add r3, r3, r0, lsl #5
	add ip, sp, #0
	add lr, r3, r2, lsl #3
	mov r6, #4
_02013FB0:
	ldrh r3, [lr], #2
	subs r6, r6, #1
	strh r3, [ip], #2
	bne _02013FB0
	add r3, sp, #8
	add ip, r3, r0, lsl #5
	add r3, r3, r1, lsl #5
	mov r6, #4
	add lr, r3, r2, lsl #3
	add ip, ip, r2, lsl #3
_02013FD8:
	ldrh r3, [lr], #2
	subs r6, r6, #1
	strh r3, [ip], #2
	bne _02013FD8
	add r3, sp, #8
	add r3, r3, r1, lsl #5
	add r6, sp, #0
	add lr, r3, r2, lsl #3
	mov ip, #4
_02013FFC:
	ldrh r3, [r6], #2
	subs ip, ip, #1
	strh r3, [lr], #2
	bne _02013FFC
	add r2, r2, #1
	cmp r2, #4
	blt _02013F9C
_02014018:
	add r1, sp, #8
	mov r0, r5
	bl ManipMoves1v2
	mov r1, #0
	b _02014048
_0201402C:
	ldrb r0, [r5, r1, lsl #3]
	tst r0, #0x80
	bicne r0, r0, #0x80
	movne r4, r1
	strneb r0, [r5, r1, lsl #3]
	bne _02014050
	add r1, r1, #1
_02014048:
	cmp r1, #4
	blt _0201402C
_02014050:
	mov r0, r4
	add sp, sp, #0x88
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02013F58

	arm_func_start sub_0201405C
sub_0201405C: ; 0x0201405C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r3, #0
	mov ip, r3
	mov lr, #0x63
	mov r4, r3
	mov r5, #1
	b _020140A4
_02014078:
	ldrb r2, [r0, r1, lsl #3]
	mov r6, r1, lsl #3
	tst r2, #1
	movne r2, r5
	moveq r2, r4
	tst r2, #0xff
	beq _020140AC
	ldrb r2, [r0, r6]
	tst r2, #2
	beq _020140AC
	sub r1, r1, #1
_020140A4:
	cmp r1, #0
	bge _02014078
_020140AC:
	mov r7, #1
	add r2, r1, #1
	mov r6, #0
	mov r4, r7
	b _020140F0
_020140C0:
	ldrb r5, [r0, r2, lsl #3]
	mov r8, r2, lsl #3
	tst r5, #1
	movne r5, r7
	moveq r5, r6
	tst r5, #0xff
	beq _020140F8
	ldrb r5, [r0, r8]
	tst r5, #2
	beq _020140F8
	mov ip, r4
	add r2, r2, #1
_020140F0:
	cmp r2, #4
	blt _020140C0
_020140F8:
	cmp ip, #0
	moveq r0, #0x63
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r8, #1
	mov ip, #0
	sub r2, r2, #1
	mov r7, ip
	mov r6, r8
	mov r4, r8
	b _02014168
_02014120:
	ldrb r5, [r0, r2, lsl #3]
	add sb, r0, r2, lsl #3
	tst r5, #1
	movne r5, r8
	moveq r5, r7
	tst r5, #0xff
	beq _02014170
	ldrb r5, [sb, #6]
	sub r2, r2, #1
	cmp lr, r5
	movgt lr, r5
	cmp r5, #0
	ldrh r5, [sb, #2]
	moveq ip, r6
	tst r5, #0x20
	bicne r5, r5, #0x20
	movne ip, r4
	strneh r5, [sb, #2]
_02014168:
	cmp r2, r1
	bge _02014120
_02014170:
	cmp ip, #0
	moveq r0, lr
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r4, #1
	add r6, r1, #1
	mov ip, #0
	mov r1, r4
	b _020141C8
_02014190:
	ldrb r2, [r0, r6, lsl #3]
	mov r5, r6, lsl #3
	tst r2, #1
	movne r2, r4
	moveq r2, ip
	tst r2, #0xff
	beq _020141D0
	ldrb r2, [r0, r5]
	tst r2, #2
	beq _020141D0
	bic r2, r2, #2
	mov r3, r1
	strb r2, [r0, r5]
	add r6, r6, #1
_020141C8:
	cmp r6, #4
	blt _02014190
_020141D0:
	cmp r3, #0
	movne lr, #0
	mov r0, lr
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_0201405C

	arm_func_start AllManip1
AllManip1: ; 0x020141E0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x80
	add r1, sp, #0
	mov r4, r0
	bl ManipMoves1v1
	add r1, sp, #0
	mov r0, r4
	bl ManipMoves1v2
	add sp, sp, #0x80
	ldmia sp!, {r4, pc}
	arm_func_end AllManip1

	arm_func_start AllManip2
AllManip2: ; 0x02014208
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	add r1, sp, #0
	mov r4, r0
	bl ManipMoves2v1
	add r1, sp, #0
	mov r0, r4
	bl ManipMoves2v2
	add sp, sp, #0x200
	ldmia sp!, {r4, pc}
	arm_func_end AllManip2

	arm_func_start sub_02014230
sub_02014230: ; 0x02014230
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, #0
	mov r2, r4
	mov r3, #1
	mov lr, r4
	b _0201428C
_02014248:
	mov r5, lr
	add ip, r0, r4, lsl #5
	b _02014280
_02014254:
	ldrb r1, [ip, r5, lsl #3]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _0201427C
	ldrb r1, [ip, r5, lsl #3]
	tst r1, #0x80
	movne r0, r4
	ldmneia sp!, {r3, r4, r5, pc}
_0201427C:
	add r5, r5, #1
_02014280:
	cmp r5, #4
	blt _02014254
	add r4, r4, #1
_0201428C:
	cmp r4, #4
	blt _02014248
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02014230

	arm_func_start ManipMoves1v1
ManipMoves1v1: ; 0x0201429C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov ip, r4
	mov r3, r4
_020142AC:
	mov r5, r3
	add r2, r1, r4, lsl #5
_020142B4:
	strb ip, [r2, r5, lsl #3]
	add r5, r5, #1
	cmp r5, #4
	blt _020142B4
	add r4, r4, #1
	cmp r4, #4
	blt _020142AC
	mov r2, ip
	mvn r3, #0
	mov r7, #0
_020142DC:
	cmp r2, #0
	beq _020142F0
	ldrb r4, [r0, r2, lsl #3]
	tst r4, #2
	bne _020142F8
_020142F0:
	mov ip, r7
	add r3, r3, #1
_020142F8:
	add r4, r1, r3, lsl #5
	add r6, r0, r2, lsl #3
	add r5, r4, ip, lsl #3
	mov lr, #4
_02014308:
	ldrh r4, [r6], #2
	subs lr, lr, #1
	strh r4, [r5], #2
	bne _02014308
	add r4, r1, r3, lsl #5
	ldrb lr, [r4, ip, lsl #3]
	add r2, r2, #1
	cmp r2, #4
	bic lr, lr, #2
	strb lr, [r4, ip, lsl #3]
	add ip, ip, #1
	blt _020142DC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ManipMoves1v1

	arm_func_start ManipMoves1v2
ManipMoves1v2: ; 0x0201433C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r2, #0
	mov r4, #1
	mov r7, r2
	mov r3, r2
	mov fp, r4
	mov sb, r4
	add r6, sp, #4
	mov lr, r2
	add ip, sp, #0
_02014368:
	mov r8, lr
	strb lr, [r6, r7]
	strb lr, [ip, r7]
	add r5, r1, r7, lsl #5
_02014378:
	ldrb sl, [r5, r8, lsl #3]
	tst sl, #1
	movne sl, r4
	moveq sl, r3
	tst sl, #0xff
	beq _020143A8
	ldrb sl, [r5, r8, lsl #3]
	tst sl, #8
	strneb fp, [r6, r7]
	ldrb sl, [r5, r8, lsl #3]
	tst sl, #4
	strneb sb, [ip, r7]
_020143A8:
	add r8, r8, #1
	cmp r8, #4
	blt _02014378
	add r7, r7, #1
	cmp r7, #4
	blt _02014368
	mov r6, #0
	b _02014494
_020143C8:
	mov r7, #0
	add r5, sp, #4
	add r4, sp, #0
	add lr, r1, r6, lsl #5
	mov r3, r7
	mov ip, #1
	b _02014488
_020143E4:
	ldrb r8, [lr, r7, lsl #3]
	tst r8, #1
	movne r8, ip
	moveq r8, r3
	tst r8, #0xff
	beq _02014484
	add fp, lr, r7, lsl #3
	add sl, r0, r2, lsl #3
	mov sb, #4
_02014408:
	ldrh r8, [fp], #2
	subs sb, sb, #1
	strh r8, [sl], #2
	bne _02014408
	ldrb r8, [r0, r2, lsl #3]
	cmp r7, #0
	biceq r8, r8, #2
	orrne r8, r8, #2
	strb r8, [r0, r2, lsl #3]
	ldrb r8, [r0, r2, lsl #3]
	bic sb, r8, #8
	and r8, sb, #0xff
	bic r8, r8, #4
	strb r8, [r0, r2, lsl #3]
	ldrb r8, [r5, r6]
	cmp r8, #0
	beq _0201445C
	cmp r7, #0
	ldreqb r8, [r0, r2, lsl #3]
	orreq r8, r8, #8
	streqb r8, [r0, r2, lsl #3]
_0201445C:
	ldrb r8, [r4, r6]
	cmp r8, #0
	beq _02014478
	cmp r7, #0
	ldreqb r8, [r0, r2, lsl #3]
	orreq r8, r8, #4
	streqb r8, [r0, r2, lsl #3]
_02014478:
	add r2, r2, #1
	cmp r2, #4
	beq _0201449C
_02014484:
	add r7, r7, #1
_02014488:
	cmp r7, #4
	blt _020143E4
	add r6, r6, #1
_02014494:
	cmp r6, #4
	blt _020143C8
_0201449C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ManipMoves1v2

	arm_func_start ManipMoves2v1
ManipMoves2v1: ; 0x020144A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov ip, r4
	mov r3, r4
_020144B4:
	mov r5, r3
	add r2, r1, r4, lsl #6
_020144BC:
	strb ip, [r2, r5, lsl #3]
	add r5, r5, #1
	cmp r5, #8
	blt _020144BC
	add r4, r4, #1
	cmp r4, #8
	blt _020144B4
	mov r2, ip
	mvn r3, #0
	mov r7, #0
_020144E4:
	cmp r2, #0
	beq _020144F8
	ldrb r4, [r0, r2, lsl #3]
	tst r4, #2
	bne _02014500
_020144F8:
	mov ip, r7
	add r3, r3, #1
_02014500:
	add r4, r1, r3, lsl #6
	add r6, r0, r2, lsl #3
	add r5, r4, ip, lsl #3
	mov lr, #4
_02014510:
	ldrh r4, [r6], #2
	subs lr, lr, #1
	strh r4, [r5], #2
	bne _02014510
	add r4, r1, r3, lsl #6
	ldrb lr, [r4, ip, lsl #3]
	add r2, r2, #1
	cmp r2, #8
	bic lr, lr, #2
	strb lr, [r4, ip, lsl #3]
	add ip, ip, #1
	blt _020144E4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ManipMoves2v1

	arm_func_start ManipMoves2v2
ManipMoves2v2: ; 0x02014544
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r2, #0
	mov r4, #1
	mov r7, r2
	mov r3, r2
	mov fp, r4
	mov sb, r4
	add r6, sp, #8
	mov lr, r2
	add ip, sp, #0
_02014570:
	mov r8, lr
	strb lr, [r6, r7]
	strb lr, [ip, r7]
	add r5, r1, r7, lsl #6
_02014580:
	ldrb sl, [r5, r8, lsl #3]
	tst sl, #1
	movne sl, r4
	moveq sl, r3
	tst sl, #0xff
	beq _020145B0
	ldrb sl, [r5, r8, lsl #3]
	tst sl, #8
	strneb fp, [r6, r7]
	ldrb sl, [r5, r8, lsl #3]
	tst sl, #4
	strneb sb, [ip, r7]
_020145B0:
	add r8, r8, #1
	cmp r8, #8
	blt _02014580
	add r7, r7, #1
	cmp r7, #8
	blt _02014570
	mov r6, #0
	b _0201469C
_020145D0:
	mov r7, #0
	add r5, sp, #8
	add r4, sp, #0
	add lr, r1, r6, lsl #6
	mov r3, r7
	mov ip, #1
	b _02014690
_020145EC:
	ldrb r8, [lr, r7, lsl #3]
	tst r8, #1
	movne r8, ip
	moveq r8, r3
	tst r8, #0xff
	beq _0201468C
	add fp, lr, r7, lsl #3
	add sl, r0, r2, lsl #3
	mov sb, #4
_02014610:
	ldrh r8, [fp], #2
	subs sb, sb, #1
	strh r8, [sl], #2
	bne _02014610
	ldrb r8, [r0, r2, lsl #3]
	cmp r7, #0
	biceq r8, r8, #2
	orrne r8, r8, #2
	strb r8, [r0, r2, lsl #3]
	ldrb r8, [r0, r2, lsl #3]
	bic sb, r8, #8
	and r8, sb, #0xff
	bic r8, r8, #4
	strb r8, [r0, r2, lsl #3]
	ldrb r8, [r5, r6]
	cmp r8, #0
	beq _02014664
	cmp r7, #0
	ldreqb r8, [r0, r2, lsl #3]
	orreq r8, r8, #8
	streqb r8, [r0, r2, lsl #3]
_02014664:
	ldrb r8, [r4, r6]
	cmp r8, #0
	beq _02014680
	cmp r7, #0
	ldreqb r8, [r0, r2, lsl #3]
	orreq r8, r8, #4
	streqb r8, [r0, r2, lsl #3]
_02014680:
	add r2, r2, #1
	cmp r2, #8
	beq _020146A4
_0201468C:
	add r7, r7, #1
_02014690:
	cmp r7, #8
	blt _020145EC
	add r6, r6, #1
_0201469C:
	cmp r6, #8
	blt _020145D0
_020146A4:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ManipMoves2v2

	arm_func_start DungeonMoveToGroundMove
DungeonMoveToGroundMove: ; 0x020146AC
	ldrb r2, [r1]
	tst r2, #1
	movne r3, #1
	moveq r3, #0
	tst r3, #0xff
	moveq r1, #0
	streqb r1, [r0]
	bxeq lr
	strb r2, [r0]
	ldrh r2, [r1, #4]
	strh r2, [r0, #2]
	ldrb r1, [r1, #7]
	strb r1, [r0, #4]
	bx lr
	arm_func_end DungeonMoveToGroundMove

	arm_func_start GroundToDungeonMoveset
GroundToDungeonMoveset: ; 0x020146E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	mov r5, #6
	ldr r8, _02014774 ; =DUNGEON_MOVE_TABLES
	mov lr, #1
	mov sb, r4
	mov r3, r4
	mov r6, #0x1a
	mov r7, r5
_02014708:
	mul r2, r4, r7
	ldrb r2, [r1, r2]
	tst r2, #1
	movne sl, lr
	moveq sl, #0
	tst sl, #0xff
	streqb sb, [r0, r4, lsl #3]
	beq _0201475C
	mla ip, r4, r5, r1
	strb r2, [r0, r4, lsl #3]
	add r2, r0, r4, lsl #3
	strh r3, [r2, #2]
	ldrh sl, [ip, #2]
	strh sl, [r2, #4]
	ldrh fp, [ip, #2]
	ldr sl, [r8, #8]
	mla sl, fp, r6, sl
	ldrb sl, [sl, #8]
	strb sl, [r2, #6]
	ldrb ip, [ip, #4]
	strb ip, [r2, #7]
_0201475C:
	add r4, r4, #1
	cmp r4, #4
	blt _02014708
	mov r1, #0
	strb r1, [r0, #0x20]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02014774: .word DUNGEON_MOVE_TABLES
	arm_func_end GroundToDungeonMoveset

	arm_func_start DungeonToGroundMoveset
DungeonToGroundMoveset: ; 0x02014778
	stmdb sp!, {r4, lr}
	mov r4, #0
	mov r2, #6
_02014784:
	mul lr, r4, r2
	ldrb r3, [r1, r4, lsl #3]
	add ip, r1, r4, lsl #3
	add r4, r4, #1
	strb r3, [r0, lr]
	ldrh r3, [ip, #4]
	add lr, r0, lr
	cmp r4, #4
	strh r3, [lr, #2]
	ldrb r3, [ip, #7]
	strb r3, [lr, #4]
	blt _02014784
	ldmia sp!, {r4, pc}
	arm_func_end DungeonToGroundMoveset

	arm_func_start GetInfoGroundMoveset
GetInfoGroundMoveset: ; 0x020147B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, #0
	mov r7, #6
	mov r6, r0
	mov r5, r1
	mov sb, r4
	mov r8, r7
_020147D4:
	mov r0, r4, lsl #1
	ldrh r1, [r5, r0]
	cmp r1, #0
	muleq r0, r4, r7
	streqb sb, [r6, r0]
	beq _020147F4
	mla r0, r4, r8, r6
	bl GetInfoMoveGround
_020147F4:
	add r4, r4, #1
	cmp r4, #4
	blt _020147D4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end GetInfoGroundMoveset

	arm_func_start GetMovesetIdx__02014804
GetMovesetIdx__02014804: ; 0x02014804
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	mov ip, r5
	mov lr, #1
	mov r2, #6
	b _02014850
_0201481C:
	mul r4, r5, r2
	ldrb r3, [r0, r4]
	add r4, r0, r4
	tst r3, #1
	movne r3, lr
	moveq r3, ip
	tst r3, #0xff
	beq _0201484C
	ldrh r3, [r4, #2]
	cmp r1, r3
	moveq r0, r5
	ldmeqia sp!, {r3, r4, r5, pc}
_0201484C:
	add r5, r5, #1
_02014850:
	cmp r5, #4
	blt _0201481C
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetMovesetIdx__02014804

	arm_func_start FindFirstFreeMovesetIdx
FindFirstFreeMovesetIdx: ; 0x02014860
	stmdb sp!, {r3, lr}
	mov lr, #0
	mov r2, lr
	mov r3, #1
	mov r1, #6
	b _0201489C
_02014878:
	mul ip, lr, r1
	ldrb ip, [r0, ip]
	tst ip, #1
	movne ip, r3
	moveq ip, r2
	tst ip, #0xff
	moveq r0, lr
	ldmeqia sp!, {r3, pc}
	add lr, lr, #1
_0201489C:
	cmp lr, #4
	blt _02014878
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end FindFirstFreeMovesetIdx

	arm_func_start LearnMoves
LearnMoves: ; 0x020148AC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov r7, r1
	mov r1, #0
	mov r8, r0
	mov r6, r1
	add r0, sp, #0
_020148C8:
	strb r6, [r0, r1]
	add r1, r1, #1
	cmp r1, #4
	blt _020148C8
	b _020149B0
_020148DC:
	mov r0, r6, lsl #1
	ldrh r4, [r7, r0]
	cmp r4, #0
	beq _020149B8
	mov r0, r8
	mov r1, r4
	bl GetMovesetIdx__02014804
	mvn r1, #0
	cmp r0, r1
	addne r1, sp, #0
	movne r2, #1
	strneb r2, [r1, r0]
	bne _020149AC
	mov r0, r8
	bl FindFirstFreeMovesetIdx
	mvn r1, #0
	cmp r0, r1
	bne _02014990
	mov r5, #0
	mov r3, r5
	add r0, sp, #4
	add r2, sp, #0
_02014934:
	ldrb r1, [r2, r3]
	cmp r1, #0
	streq r3, [r0, r5, lsl #2]
	add r3, r3, #1
	addeq r5, r5, #1
	cmp r3, #4
	blt _02014934
	bl Rand16Bit
	mov r1, r5
	bl _s32_div_f
	add r2, sp, #4
	ldr r5, [r2, r1, lsl #2]
	mov r0, #6
	mul r3, r5, r0
	mov r2, #0
	mov r1, r4
	add r0, r8, r3
	strb r2, [r8, r3]
	bl GetInfoMoveGround
	add r0, sp, #0
	mov r1, #1
	strb r1, [r0, r5]
	b _020149AC
_02014990:
	mov r1, #6
	mla r0, r1, r0, r8
	mov r1, r4
	bl GetInfoMoveGround
	add r0, sp, #0
	mov r1, #1
	strb r1, [r0, r6]
_020149AC:
	add r6, r6, #1
_020149B0:
	cmp r6, #4
	blt _020148DC
_020149B8:
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end LearnMoves

	arm_func_start sub_020149C0
sub_020149C0: ; 0x020149C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r2, #0
	mov r3, r2
	mov r6, r2
	mov r7, #1
	b _02014A24
_020149D8:
	ldrb r4, [r1, r3, lsl #3]
	tst r4, #1
	movne r4, r7
	moveq r4, r6
	tst r4, #0xff
	beq _02014A2C
	add r5, r1, r3, lsl #3
	add r4, r0, r3, lsl #3
	mov lr, #4
_020149FC:
	ldrh ip, [r5], #2
	subs lr, lr, #1
	strh ip, [r4], #2
	bne _020149FC
	add lr, r0, r3, lsl #3
	ldrh ip, [lr, #2]
	add r2, r2, #1
	add r3, r3, #1
	bic ip, ip, #4
	strh ip, [lr, #2]
_02014A24:
	cmp r3, #4
	blt _020149D8
_02014A2C:
	mov r1, #0
	b _02014A3C
_02014A34:
	strb r1, [r0, r3, lsl #3]
	add r3, r3, #1
_02014A3C:
	cmp r3, #8
	blt _02014A34
	mov r0, r2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020149C0

	arm_func_start CopyMoveTo
CopyMoveTo: ; 0x02014A4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #2
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #4
	mov r2, #7
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CopyMoveTo

	arm_func_start CopyMoveFrom
CopyMoveFrom: ; 0x02014A84
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #2
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #4
	mov r2, #7
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CopyMoveFrom

	arm_func_start CopyMovesetTo
CopyMovesetTo: ; 0x02014ABC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, #0
	mov r4, #6
_02014AD0:
	mla r1, r5, r4, r6
	mov r0, r7
	bl CopyMoveTo
	add r5, r5, #1
	cmp r5, #4
	blt _02014AD0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CopyMovesetTo

	arm_func_start CopyMovesetFrom
CopyMovesetFrom: ; 0x02014AEC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, #0
	mov r4, #6
_02014B00:
	mla r1, r5, r4, r6
	mov r0, r7
	bl CopyMoveFrom
	add r5, r5, #1
	cmp r5, #4
	blt _02014B00
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CopyMovesetFrom

	arm_func_start sub_02014B1C
sub_02014B1C: ; 0x02014B1C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #2
	mov r2, #1
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #4
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #6
	mov r2, #7
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #7
	mov r2, #7
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02014B1C

	arm_func_start sub_02014B74
sub_02014B74: ; 0x02014B74
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
_02014B84:
	mov r0, r6
	add r1, r5, r4, lsl #3
	bl sub_02014B1C
	add r4, r4, #1
	cmp r4, #4
	blt _02014B84
	mov r0, r6
	add r1, r5, #0x20
	mov r2, #8
	bl CopyBitsTo
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02014B74

	arm_func_start sub_02014BB0
sub_02014BB0: ; 0x02014BB0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, #0
	mov r2, #8
	bl memset
	mov r0, r5
	mov r1, r4
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #2
	mov r2, #1
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #4
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #6
	mov r2, #7
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #7
	mov r2, #7
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02014BB0

	arm_func_start sub_02014C20
sub_02014C20: ; 0x02014C20
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
_02014C30:
	mov r0, r6
	add r1, r5, r4, lsl #3
	bl sub_02014BB0
	add r4, r4, #1
	cmp r4, #4
	blt _02014C30
	mov r3, #0
	mov r0, r6
	add r1, r5, #0x20
	mov r2, #8
	strb r3, [r5, #0x20]
	bl CopyBitsFrom
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02014C20

	arm_func_start Is2TurnsMove
Is2TurnsMove: ; 0x02014C64
	cmp r0, #0x97
	moveq r0, #1
	bxeq lr
	cmp r0, #0x64
	moveq r0, #1
	bxeq lr
	cmp r0, #0x3c
	moveq r0, #1
	bxeq lr
	cmp r0, #0x4b
	moveq r0, #1
	bxeq lr
	cmp r0, #0x15c
	moveq r0, #1
	bxeq lr
	cmp r0, #0x99
	moveq r0, #1
	bxeq lr
	cmp r0, #0xcd
	moveq r0, #1
	bxeq lr
	cmp r0, #0x9c
	moveq r0, #1
	bxeq lr
	cmp r0, #8
	moveq r0, #1
	bxeq lr
	ldr r1, _02014CE8 ; =0x000001DD
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02014CE8: .word 0x000001DD
	arm_func_end Is2TurnsMove
