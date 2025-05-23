	.include "asm/macros.inc"
	.include "main_02013AD0.inc"

	.text

	arm_func_start GetMoveMaxGinsengBoost
GetMoveMaxGinsengBoost: ; 0x02013AD0
	ldr r1, _02013AEC ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0xe]
	bx lr
	.align 2, 0
_02013AEC: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveMaxGinsengBoost

	arm_func_start GetMoveMaxGinsengBoostGround
GetMoveMaxGinsengBoostGround: ; 0x02013AF0
	ldr r1, _02013B0C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #2]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0xe]
	bx lr
	.align 2, 0
_02013B0C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveMaxGinsengBoostGround

	arm_func_start GetMoveCritChance
GetMoveCritChance: ; 0x02013B10
	ldr r1, _02013B2C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0xf]
	bx lr
	.align 2, 0
_02013B2C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveCritChance

	arm_func_start IsThawingMove
IsThawingMove: ; 0x02013B30
	ldr r1, _02013B4C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0x13]
	bx lr
	.align 2, 0
_02013B4C: .word DUNGEON_MOVE_TABLES
	arm_func_end IsThawingMove

	arm_func_start IsAffectedByTaunt
IsAffectedByTaunt: ; 0x02013B50
	ldr r1, _02013B6C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0x14]
	bx lr
	.align 2, 0
_02013B6C: .word DUNGEON_MOVE_TABLES
	arm_func_end IsAffectedByTaunt

	arm_func_start GetMoveRangeId
GetMoveRangeId: ; 0x02013B70
	ldr r1, _02013B8C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0x15]
	bx lr
	.align 2, 0
_02013B8C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveRangeId

	arm_func_start GetMoveActualAccuracy
GetMoveActualAccuracy: ; 0x02013B90
	stmdb sp!, {r3, lr}
	ldr r2, _02013BE4 ; =DUNGEON_MOVE_TABLES
	mov r1, #0x1a
	ldr r2, [r2, #8]
	mla r1, r0, r1, r2
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	ldreqb r0, [r1, #0xa]
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x63
	bne _02013BDC
	ldrb r2, [r1, #0xa]
	ldrb r0, [r1, #0xb]
	cmp r2, #0x7d
	ldmeqia sp!, {r3, pc}
	mul r0, r2, r0
	mov r1, #0x64
	bl _s32_div_f
	ldmia sp!, {r3, pc}
_02013BDC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02013BE4: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveActualAccuracy

	arm_func_start GetMoveBasePowerFromId
GetMoveBasePowerFromId: ; 0x02013BE8
	mov r1, #0x1a
	mul r1, r0, r1
	ldr r0, _02013C00 ; =DUNGEON_MOVE_TABLES
	ldr r0, [r0, #8]
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_02013C00: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveBasePowerFromId

	arm_func_start IsMoveRangeString19
IsMoveRangeString19: ; 0x02013C04
	ldr r1, _02013C2C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0x15]
	cmp r0, #0x13
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_02013C2C: .word DUNGEON_MOVE_TABLES
	arm_func_end IsMoveRangeString19

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

	arm_func_start IsRegularAttackOrProjectile
IsRegularAttackOrProjectile: ; 0x02014CEC
	ldr r1, _02014D14 ; =0x00000163
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	add r1, r1, #0x32
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02014D14: .word 0x00000163
	arm_func_end IsRegularAttackOrProjectile

	arm_func_start IsPunchMove
IsPunchMove: ; 0x02014D18
	mov r3, #0
	ldr r2, _02014D54 ; =PUNCH_MOVE_LIST
	b _02014D3C
_02014D24:
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
_02014D3C:
	mov r1, r3, lsl #1
	ldrh r1, [r2, r1]
	cmp r1, #0
	bne _02014D24
	mov r0, #0
	bx lr
	.align 2, 0
_02014D54: .word PUNCH_MOVE_LIST
	arm_func_end IsPunchMove

	arm_func_start IsHealingWishOrLunarDance
IsHealingWishOrLunarDance: ; 0x02014D58
	ldr r1, _02014D80 ; =0x000001B7
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	add r1, r1, #0x57
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02014D80: .word 0x000001B7
	arm_func_end IsHealingWishOrLunarDance

	arm_func_start IsCopyingMove
IsCopyingMove: ; 0x02014D84
	ldr r1, _02014DB8 ; =0x00000147
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	cmp r0, #0x8a
	moveq r0, #1
	bxeq lr
	add r1, r1, #0xc6
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02014DB8: .word 0x00000147
	arm_func_end IsCopyingMove

	arm_func_start IsTrappingMove
IsTrappingMove: ; 0x02014DBC
	ldr r1, _02014DFC ; =0x00000127
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	cmp r0, #0x1f0
	moveq r0, #1
	bxeq lr
	cmp r0, #0x1e0
	moveq r0, #1
	bxeq lr
	add r1, r1, #0x6a
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02014DFC: .word 0x00000127
	arm_func_end IsTrappingMove

	arm_func_start IsOneHitKoMove
IsOneHitKoMove: ; 0x02014E00
	cmp r0, #0x83
	moveq r0, #1
	bxeq lr
	cmp r0, #0x96
	moveq r0, #1
	bxeq lr
	cmp r0, #0xb1
	moveq r0, #1
	bxeq lr
	cmp r0, #0xf7
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsOneHitKoMove

	arm_func_start IsNot2TurnsMoveOrSketch
IsNot2TurnsMoveOrSketch: ; 0x02014E38
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl Is2TurnsMove
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	cmp r4, #0x8a
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end IsNot2TurnsMoveOrSketch

	arm_func_start IsRealMove
IsRealMove: ; 0x02014E64
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r1, _02014EEC ; =0x000001D3
	cmp r0, r1
	moveq r0, #0
	bxeq lr
	cmp r0, #0x160
	moveq r0, #0
	bxeq lr
	sub r1, r1, #0x70
	cmp r0, r1
	blo _02014EA4
	cmp r0, #0x168
	movlo r0, #0
	bxlo lr
_02014EA4:
	cmp r0, #0x168
	bls _02014EBC
	ldr r1, _02014EF0 ; =0x0000018A
	cmp r0, r1
	movlo r0, #0
	bxlo lr
_02014EBC:
	ldr r1, _02014EF0 ; =0x0000018A
	cmp r0, r1
	bls _02014ED8
	add r1, r1, #0x23
	cmp r0, r1
	movls r0, #0
	bxls lr
_02014ED8:
	ldr r1, _02014EF4 ; =0x0000021F
	cmp r0, r1
	movhs r0, #0
	movlo r0, #1
	bx lr
	.align 2, 0
_02014EEC: .word 0x000001D3
_02014EF0: .word 0x0000018A
_02014EF4: .word 0x0000021F
	arm_func_end IsRealMove

	arm_func_start IsMovesetValid
IsMovesetValid: ; 0x02014EF8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, #0
	mov r4, r0
	mov r6, r8
	mov r7, #1
	mov r5, #6
	b _02014F54
_02014F14:
	smulbb r1, r8, r5
	ldrb r0, [r4, r1]
	add r1, r4, r1
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _02014F48
	ldrh r0, [r1, #2]
	bl IsRealMove
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_02014F48:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_02014F54:
	cmp r8, #4
	blt _02014F14
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end IsMovesetValid

	arm_func_start IsRealMoveInTimeDarkness
IsRealMoveInTimeDarkness: ; 0x02014F64
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r1, _02014FF8 ; =0x000001D3
	cmp r0, r1
	moveq r0, #0
	bxeq lr
	cmp r0, #0x1d4
	moveq r0, #0
	bxeq lr
	cmp r0, #0x160
	moveq r0, #0
	bxeq lr
	sub r1, r1, #0x70
	cmp r0, r1
	blo _02014FB0
	cmp r0, #0x168
	movlo r0, #0
	bxlo lr
_02014FB0:
	cmp r0, #0x168
	bls _02014FC8
	ldr r1, _02014FFC ; =0x0000018A
	cmp r0, r1
	movlo r0, #0
	bxlo lr
_02014FC8:
	ldr r1, _02014FFC ; =0x0000018A
	cmp r0, r1
	bls _02014FE4
	add r1, r1, #0x23
	cmp r0, r1
	movls r0, #0
	bxls lr
_02014FE4:
	ldr r1, _02015000 ; =0x0000021F
	cmp r0, r1
	movhs r0, #0
	movlo r0, #1
	bx lr
	.align 2, 0
_02014FF8: .word 0x000001D3
_02014FFC: .word 0x0000018A
_02015000: .word 0x0000021F
	arm_func_end IsRealMoveInTimeDarkness

	arm_func_start IsMovesetValidInTimeDarkness
IsMovesetValidInTimeDarkness: ; 0x02015004
	stmdb sp!, {r3, lr}
	bl GetFirstNotRealMoveInTimeDarkness
	mvn r1, #0
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsMovesetValidInTimeDarkness

	arm_func_start GetFirstNotRealMoveInTimeDarkness
GetFirstNotRealMoveInTimeDarkness: ; 0x02015024
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, #0
	mov r4, r0
	mov r6, r8
	mov r7, #1
	mov r5, #6
	b _02015080
_02015040:
	smulbb r1, r8, r5
	ldrb r0, [r4, r1]
	add r1, r4, r1
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _02015074
	ldrh r0, [r1, #2]
	bl IsRealMoveInTimeDarkness
	cmp r0, #0
	moveq r0, r8
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_02015074:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_02015080:
	cmp r8, #4
	blt _02015040
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end GetFirstNotRealMoveInTimeDarkness

	arm_func_start sub_02015090
sub_02015090: ; 0x02015090
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r6, r0
	mov r5, r1
	mov lr, r4
	mov r2, r4
	mov r3, #1
	mov r0, #6
	b _020150E0
_020150B4:
	mul ip, lr, r0
	ldrb r1, [r6, ip]
	add lr, lr, #1
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	ldrneb r1, [r6, ip]
	addne r4, r4, #1
	bicne r1, r1, #2
	strneb r1, [r6, ip]
_020150E0:
	cmp lr, r5
	blt _020150B4
	bl Rand16Bit
	mov r1, r4
	bl _s32_div_f
	mov r0, #6
	mla r0, r1, r0, r6
	ldrh r0, [r0, #2]
	sub r3, r5, #1
	mov r2, #6
	b _02015130
_0201510C:
	mul r5, r1, r2
	add ip, r6, r5
	ldrh r4, [ip, #6]
	add r1, r1, #1
	strh r4, [r6, r5]
	ldrh r4, [ip, #8]
	strh r4, [ip, #2]
	ldrh r4, [ip, #0xa]
	strh r4, [ip, #4]
_02015130:
	cmp r1, r3
	blt _0201510C
	mov r1, #6
	mul r1, r3, r1
	mov r2, #0
	strb r2, [r6, r1]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02015090

	arm_func_start IsSameMove
IsSameMove: ; 0x0201514C
	stmdb sp!, {r4, lr}
	ldrb r2, [r1]
	tst r2, #1
	movne r2, #1
	moveq r2, #0
	tst r2, #0xff
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r4, #0
	mov ip, r4
	mov lr, #1
	b _020151B8
_0201517C:
	ldrb r2, [r0, r4, lsl #3]
	tst r2, #1
	movne r2, lr
	moveq r2, ip
	tst r2, #0xff
	beq _020151C0
	add r2, r0, r4, lsl #3
	ldrh r3, [r1, #4]
	ldrh r2, [r2, #4]
	cmp r3, r2
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	add r2, r4, #1
	mov r2, r2, lsl #0x10
	mov r4, r2, asr #0x10
_020151B8:
	cmp r4, #4
	blt _0201517C
_020151C0:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end IsSameMove

	arm_func_start GetMoveCategory
GetMoveCategory: ; 0x020151C8
	ldr r2, _020151E0 ; =DUNGEON_MOVE_TABLES
	mov r1, #0x1a
	ldr r2, [r2, #8]
	mla r1, r0, r1, r2
	ldrb r0, [r1, #3]
	bx lr
	.align 2, 0
_020151E0: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveCategory

	arm_func_start GetPpIncrease
GetPpIncrease: ; 0x020151E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r0, r1
	mov r1, #0x39
	mov r6, #0
	bl IqSkillFlagTest
	cmp r0, #0
	orrne r0, r6, #0x100
	movne r0, r0, lsl #0x10
	movne r6, r0, lsr #0x10
	mov r0, r4
	mov r1, #0
	bl GetAbility
	mov r5, r0
	mov r0, r4
	mov r1, #1
	bl GetAbility
	mov r3, r0
	mov r1, r4
	mov r2, r5
	mov r0, #0x4a
	bl BagHasExclusiveItemTypeForMonster
	cmp r0, #0
	orrne r0, r6, #0x200
	movne r0, r0, lsl #0x10
	movne r6, r0, lsr #0x10
	mov r0, r4
	mov r1, #0
	bl GetAbility
	mov r5, r0
	mov r0, r4
	mov r1, #1
	bl GetAbility
	mov r3, r0
	mov r1, r4
	mov r2, r5
	mov r0, #0x4b
	bl BagHasExclusiveItemTypeForMonster
	cmp r0, #0
	orrne r0, r6, #0x400
	movne r0, r0, lsl #0x10
	movne r6, r0, lsr #0x10
	mov r0, r6
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end GetPpIncrease

	arm_func_start OpenWaza
OpenWaza: ; 0x02015294
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _020152EC ; =_020AF6E8
	mov r4, r0
	ldr r0, _020152F0 ; =_020AF700
	ldr r1, [r1, r4, lsl #2]
	add r0, r0, r4, lsl #3
	mov r2, #0
	bl LoadFileFromRom
	ldr r1, _020152F0 ; =_020AF700
	add r0, sp, #0
	ldr r1, [r1, r4, lsl #3]
	bl HandleSir0Translation
	ldr r3, [sp]
	ldr r1, _020152F4 ; =_020AF6F8
	ldr r2, [r3]
	ldr r0, _020152F8 ; =_020AF6F0
	str r2, [r1, r4, lsl #2]
	ldr r1, [r3, #4]
	str r1, [r0, r4, lsl #2]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020152EC: .word _020AF6E8
_020152F0: .word _020AF700
_020152F4: .word _020AF6F8
_020152F8: .word _020AF6F0
	arm_func_end OpenWaza

	arm_func_start SelectWaza
SelectWaza: ; 0x020152FC
	ldr r1, _0201531C ; =_020AF6F8
	ldr r2, _02015320 ; =_020AF6F0
	ldr r3, [r1, r0, lsl #2]
	ldr r1, _02015324 ; =DUNGEON_MOVE_TABLES
	ldr r0, [r2, r0, lsl #2]
	str r3, [r1, #8]
	str r0, [r1]
	bx lr
	.align 2, 0
_0201531C: .word _020AF6F8
_02015320: .word _020AF6F0
_02015324: .word DUNGEON_MOVE_TABLES
	arm_func_end SelectWaza

	arm_func_start sub_02015328
sub_02015328: ; 0x02015328
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	mov r6, r1
	mov r0, #0x40
	mov r1, #0
	mov r5, r2
	mov r4, r3
	bl MemAlloc
	ldr r2, _02015500 ; =_020AF710
	mov r1, #0x40
	str r0, [r2]
	bl MemZero
	ldr r0, _02015500 ; =_020AF710
	ldr r2, [sp, #0x28]
	ldr r1, _02015504 ; =_020AF714
	ldr r0, [r0]
	ldr r1, [r1, r2, lsl #2]
	add r0, r0, #0x1c
	mov r2, #0
	bl LoadFileFromRom
	ldr r0, _02015500 ; =_020AF710
	ldr r1, [r0]
	add r0, r1, #0x10
	ldr r1, [r1, #0x1c]
	bl HandleSir0Translation
	ldr r0, _02015500 ; =_020AF710
	ldr r1, [sp, #0x28]
	ldr ip, [r0]
	ldrsh r3, [sp, #0x24]
	ldr r2, [ip, #0x10]
	cmp r1, #2
	ldr r2, [r2, #4]
	str r2, [ip, #0x2c]
	ldr r2, [r0]
	str r5, [r2, #8]
	ldr r2, [r0]
	str r4, [r2, #0xc]
	ldr r2, [r0]
	strh r3, [r2, #0x30]
	mov r2, #0
	bne _02015454
	ldr r1, _02015508 ; =_02098F60
	add r0, sp, #0
	bl LoadFileFromRom
	ldr r0, _02015500 ; =_020AF710
	ldr r1, [sp]
	ldr r0, [r0]
	add r0, r0, #0x14
	bl HandleSir0Translation
	ldr r0, _02015500 ; =_020AF710
	ldrsh r4, [sp, #0x24]
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	mov r1, r4
	bl sub_0201614C
	add r0, sp, #0
	bl UnloadFile
	ldr r1, _0201550C ; =_02098F78
	add r0, sp, #0
	mov r2, #0
	bl LoadFileFromRom
	ldr r0, _02015500 ; =_020AF710
	ldr r1, [sp]
	ldr r0, [r0]
	add r0, r0, #0x14
	bl HandleSir0Translation
	ldr r0, _02015500 ; =_020AF710
	add r1, r4, #1
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	bl sub_0201614C
	add r0, sp, #0
	bl UnloadFile
	b _020154CC
_02015454:
	cmp r1, #1
	ldr r0, [r0]
	bne _02015470
	ldr r1, _02015510 ; =_02098F90
	add r0, r0, #0x24
	bl LoadFileFromRom
	b _0201547C
_02015470:
	ldr r1, _02015514 ; =_02098FA8
	add r0, r0, #0x24
	bl LoadFileFromRom
_0201547C:
	ldr r0, _02015500 ; =_020AF710
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	add r0, r0, #0x14
	bl HandleSir0Translation
	ldr r0, _02015500 ; =_020AF710
	ldrsh r4, [sp, #0x24]
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	mov r1, r4
	bl sub_0201614C
	ldr r0, _02015500 ; =_020AF710
	ldr r2, _02015518 ; =_020AF720
	ldr r0, [r0]
	add r1, r4, #1
	bl sub_0201614C
	ldr r0, _02015500 ; =_020AF710
	ldr r0, [r0]
	add r0, r0, #0x24
	bl UnloadFile
_020154CC:
	ldr r0, _02015500 ; =_020AF710
	ldrsh r3, [sp, #0x20]
	ldr r2, [r0]
	mov r1, #0
	str r7, [r2]
	ldr r2, [r0]
	str r6, [r2, #4]
	ldr r2, [r0]
	strh r3, [r2, #0x32]
	ldr r0, [r0]
	strb r1, [r0, #0x3c]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02015500: .word _020AF710
_02015504: .word _020AF714
_02015508: .word _02098F60
_0201550C: .word _02098F78
_02015510: .word _02098F90
_02015514: .word _02098FA8
_02015518: .word _020AF720
	arm_func_end sub_02015328

	arm_func_start sub_0201551C
sub_0201551C: ; 0x0201551C
	stmdb sp!, {r3, lr}
	ldr r0, _0201556C ; =_020AF710
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrb r0, [r0, #0x3c]
	cmp r0, #0
	beq _02015540
	bl sub_02015EB4
_02015540:
	ldr r0, _0201556C ; =_020AF710
	ldr r0, [r0]
	add r0, r0, #0x1c
	bl UnloadFile
	ldr r0, _0201556C ; =_020AF710
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0201556C ; =_020AF710
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201556C: .word _020AF710
	arm_func_end sub_0201551C

	arm_func_start sub_02015570
sub_02015570: ; 0x02015570
	ldr r0, _02015584 ; =_020AF710
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x3c]
	bx lr
	.align 2, 0
_02015584: .word _020AF710
	arm_func_end sub_02015570

	arm_func_start sub_02015588
sub_02015588: ; 0x02015588
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _020155F4 ; =_020AF710
	mov r1, #0x6000
	ldr r2, [r0]
	ldrsh r0, [r2, #0x32]
	ldr r2, [r2]
	add r0, r2, r0, lsl #5
	bl MemZero32
	ldr r0, _020155F4 ; =_020AF710
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020155EC
	bl sub_02015EB4
	ldr r1, _020155F8 ; =_02098EA8
	ldr r0, _020155F4 ; =_020AF710
	ldr r2, [r1, #4]
	ldr r1, [r1]
	ldr r0, [r0]
	str r1, [sp]
	str r2, [sp, #4]
	ldr r0, [r0, #4]
	add r1, sp, #0
	bl sub_0200B3C0
_020155EC:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020155F4: .word _020AF710
_020155F8: .word _02098EA8
	arm_func_end sub_02015588

	arm_func_start sub_020155FC
sub_020155FC: ; 0x020155FC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x104
	bl StringFromId
	mov r8, #0
	mov r7, r0
	mov sb, r8
	mov r6, r8
	add r5, sp, #4
	mov fp, #0x100
	mov r4, r8
_02015624:
	ldrb r0, [r7, r8]
	cmp r0, #0
	beq _02015698
	mov r0, r5
	mov r1, fp
	mov r3, #0x440
	str r6, [sp]
	add r2, r7, r8
	bl PreprocessString
	strb r4, [r5, r0]
	add r8, r8, r0
	ldrb sl, [r7, r8]
	cmp sl, #0
	beq _02015690
	ldr r1, _020156A8 ; =_02098FBC
	mov r2, #3
	add r0, r7, r8
	bl strncmp
	cmp r0, #0
	bne _02015684
	ldr r0, _020156A8 ; =_02098FBC
	bl strlen
	add r8, r8, r0
	b _02015690
_02015684:
	cmp sl, #0xd
	cmpne sl, #0xa
	addeq r8, r8, #1
_02015690:
	add sb, sb, #1
	b _02015624
_02015698:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020156A8: .word _02098FBC
	arm_func_end sub_020155FC

	arm_func_start sub_020156AC
sub_020156AC: ; 0x020156AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	cmp r1, #0
	beq _02015780
	ldr r3, _02015788 ; =_020AF710
	mov r2, r0, asr #2
	ldr r6, [r3]
	add r2, r0, r2, lsr #29
	ldrsh r5, [r6, #0x32]
	mov r2, r2, asr #3
	mov r4, r0, lsr #0x1f
	rsb r3, r4, r0, lsl #29
	ldr r6, [r6]
	add r5, r5, r2, lsl #5
	mov r0, #0
	add r3, r4, r3, ror #29
	add r5, r6, r5, lsl #5
	add r3, r5, r3, lsl #2
	mov r4, r0
	and r5, r1, #0xf
_020156FC:
	mov r1, r4, lsl #2
	add r4, r4, #1
	cmp r4, #8
	orr r0, r0, r5, lsl r1
	blt _020156FC
	mov r1, #0
_02015714:
	add r1, r1, #1
	cmp r1, #0x20
	str r0, [r3], #0x20
	blt _02015714
	ldr r7, _02015788 ; =_020AF710
	mov r6, #0
	ldr r0, [r7]
	add r4, sp, #0
	ldrsh r0, [r0, #0x32]
	add r0, r0, r2, lsl #5
	mov r0, r0, lsl #0x10
	str r2, [sp, #4]
	mov r5, r0, asr #0x10
_02015748:
	ldr r0, [r7]
	str r6, [sp]
	ldrsh r2, [r0, #0x30]
	ldr r0, [r0, #4]
	mov r1, r4
	add r2, r2, #1
	orr r2, r5, r2, lsl #12
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
	add r6, r6, #1
	cmp r6, #0x20
	add r5, r5, #1
	blt _02015748
_02015780:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02015788: .word _020AF710
	arm_func_end sub_020156AC

	arm_func_start sub_0201578C
sub_0201578C: ; 0x0201578C
#ifdef EUROPE
#define SUB_0201578C_STACK_OFFSET 4
#else
#define SUB_0201578C_STACK_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2f8
	sub sp, sp, #0x400
	ldr r5, [sp, #0x720]
	mov r4, #0
	str r5, [sp, #0x720]
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r7, r2
	str r3, [sp, #0xc]
	str r4, [sp, #0x2c + SUB_0201578C_STACK_OFFSET]
_020157B8:
	ldr r0, [sp, #0xc]
	ldrb r0, [r0, r4]
	cmp r0, #0
	beq _02015CF8
	ldr r1, [sp, #0xc]
	add r0, sp, #0x500
	mov r5, #0
	add r2, r1, r4
	add r0, r0, #0xf8
	mov r1, #0x100
	mov r3, #0x440
	str r5, [sp]
	bl PreprocessString
	add r1, sp, #0x500
	add r1, r1, #0xf8
	mov r2, r5
	strb r2, [r1, r0]
	add r4, r4, r0
	ldr r0, [sp, #0xc]
	ldrb r5, [r0, r4]
	cmp r5, #0
	beq _02015844
	ldr r1, _02015D08 ; =_02098FBC
	add r0, r0, r4
	mov r2, #3
	bl strncmp
	cmp r0, #0
	bne _02015838
	ldr r0, _02015D08 ; =_02098FBC
	bl strlen
	add r4, r4, r0
	b _02015844
_02015838:
	cmp r5, #0xd
	cmpne r5, #0xa
	addeq r4, r4, #1
_02015844:
	ldr r0, [sp, #0x720]
	cmp r0, #2
	bne _0201586C
	add r0, sp, #0x500
	add r0, r0, #0xf8
	bl sub_020161CC
	rsb r0, r0, #0x100
	add r0, r0, r0, lsr #31
	mov r5, r0, asr #1
	b _02015888
_0201586C:
	cmp r0, #1
	ldrne r5, [sp, #8]
	bne _02015888
	add r0, sp, #0x500
	add r0, r0, #0xf8
	bl sub_020161CC
	rsb r5, r0, #0x100
_02015888:
	add r0, r7, #0xa
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	mov r2, r0, asr #2
	mov r3, r0, lsr #0x1f
	add r2, r1, r2, lsr #29
	rsb r1, r3, r1, lsl #29
	add r1, r3, r1, ror #29
	mov r0, r7, lsr #0x1f
	rsb r3, r0, r7, lsl #29
	add r0, r0, r3, ror #29
	str r0, [sp, #0x3c + SUB_0201578C_STACK_OFFSET]
	mov r0, r2, asr #3
	mov r6, r7, asr #2
	str r1, [sp, #0x34 + SUB_0201578C_STACK_OFFSET]
	add r1, r7, r6, lsr #29
	str r0, [sp, #0x30 + SUB_0201578C_STACK_OFFSET]
	mov r0, r1, asr #3
	add r6, sp, #0x500
	str r0, [sp, #0x38 + SUB_0201578C_STACK_OFFSET]
	add r6, r6, #0xf8
	b _02015CD8
#ifdef EUROPE
_020158E0:
	ldrb r0, [r6], #1
	cmp r0, #0x23
	str r0, [sp, #0x18]
	addeq r5, r5, #8
	beq _02015CD8
	cmp r0, #0x20
	addeq r5, r5, #6
	beq _02015CD8
	cmp r0, #0x5b
	bne _02015B14
	mov r0, #1
	str r6, [sp, #0x44]
	str r0, [sp, #0x1c]
	mov r1, r0
_020159C0:
	ldrb r0, [r6], #1
	cmp r0, #0x5d
	beq _020159E0
	cmp r0, #0x3a
	addeq r0, sp, #0x44
	streq r6, [r0, r1, lsl #2]
	addeq r1, r1, #1
	b _020159C0
_020159E0:
	ldr r0, [sp, #0x44]
	ldr r1, _02015DEC ; =_02099404_EU
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02015A0C
	ldr r0, [sp, #0x48]
	bl sub_0202380C_EU
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	b _02015B08
_02015A0C:
	ldr r0, [sp, #0x44]
	ldr r1, _02015D0C ; =_02098FC0
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02015B08
	ldr r0, [sp, #0x48]
	bl AtoiTagVeneer
	ldr r0, [sp, #0x4c]
	bl AtoiTagVeneer
	ldr r1, _02015D10 ; =_020AF710
	add ip, r5, #2
	ldr r1, [r1]
	ldr r8, [sp, #0x10]
	ldrsh r3, [r1, #0x32]
	mov r1, ip, asr #2
	add r1, ip, r1, lsr #29
	mov r2, r1, asr #3
	ldr r1, [sp, #0x34]
	mov r0, r0, lsl #0x10
	add r1, r2, r1, lsl #5
	add r2, r3, r1
	ldr r1, [sp, #4]
	add r2, r1, r2, lsl #5
	ldr r1, [sp, #0x38]
	add sb, r2, r1, lsl #2
	mov r1, #0
	str r1, [sp, #0x20]
_02015A78:
	mov sl, sb
	mov lr, #0
	b _02015AD0
_02015A84:
	add r1, ip, lr
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #29
	add r1, r2, r1, ror #29
	ldr r2, _02015D14 ; =_02098EE0
	add lr, lr, #8
	add r3, r2, r1, lsl #4
	ldr r1, [r2, r1, lsl #4]
	ldr r2, [sl]
	ldr fp, [r3, #8]
	bic r1, r1, #0
	orr r1, r2, r1, lsl fp
	str r1, [sl]
	ldr r1, [r3, #4]
	ldr r2, [sl, #0x20]!
	ldr r3, [r3, #0xc]
	bic r1, r1, #0
	orr r1, r2, r1, lsr r3
	str r1, [sl]
_02015AD0:
	cmp lr, r0, asr #16
	blt _02015A84
	add r8, r8, #1
	mov r2, r8, lsr #0x1f
	rsb r1, r2, r8, lsl #29
	adds r1, r2, r1, ror #29
	ldr r1, [sp, #0x20]
	add sb, sb, #4
	add r1, r1, #1
	addeq sb, sb, #0x3e0
	str r1, [sp, #0x20]
	cmp r1, #2
	blt _02015A78
	add r5, r5, r0, asr #16
_02015B08:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _02015CD8
_02015B14:
	ldr r0, [sp, #0x18]
	bl sub_02025480
	bl sub_0201628C
	mov sl, #0
	add r1, sp, #0x400
	add r1, r1, #0xd8
	ldr r3, [r0]
	str r1, [sp, #0x24]
	mov r8, sl
	mov sb, sl
_02015B3C:
	ldrb r2, [r3], #1
	add r1, sp, #0x58
	add r1, r1, sb
	mov fp, r2, asr #4
	and ip, fp, #0xf
	add fp, sp, #0x58
	strb ip, [fp, sb]
	and r2, r2, #0xf
	add sb, sb, #2
	strb r2, [r1, #1]
	cmp sb, #0x240
	blt _02015B3C
_02015B6C:
	cmp r8, #0x240
	bge _02015BFC
	add r1, sp, #0x58
	ldrb r1, [r1, sl]
	add r3, sl, #1
	mov sl, r3
	tst r1, #8
	and r1, r1, #7
	mov sb, #0
	beq _02015BF0
	add r2, sp, #0x58
	ldrb r2, [r2, r3]
	add sl, r3, #1
	and r3, r2, #0xff
	b _02015BC0
_02015BA8:
	add r2, sp, #0x298
	strb r3, [r2, r8]
	add r8, r8, #1
	cmp r8, #0x240
	bge _02015B6C
	add sb, sb, #1
_02015BC0:
	cmp sb, r1
	blt _02015BA8
	b _02015B6C
_02015BCC:
	add r2, sp, #0x58
	ldrb r3, [r2, sl]
	add r2, sp, #0x298
	add sl, sl, #1
	strb r3, [r2, r8]
	add r8, r8, #1
	cmp r8, #0x240
	bge _02015B6C
	add sb, sb, #1
_02015BF0:
	cmp sb, r1
	blt _02015BCC
	b _02015B6C
_02015BFC:
	mov fp, #0
_02015C00:
	ldr r1, [sp, #0x24]
	str r1, [sp, #0x14]
	add r1, r1, #4
	str r1, [sp, #0x24]
	add r1, sp, #0x298
	add ip, r1, fp
	ldrb r3, [r1, fp]
	ldrb r1, [ip, #2]
	ldrb r2, [ip, #1]
	and sl, r3, #0xf
	mov r1, r1, lsl #8
	and r8, r1, #0xf00
	ldrb r1, [ip, #5]
	mov r2, r2, lsl #4
	and sb, r2, #0xf0
	mov r1, r1, lsl #0x14
	ldrb r3, [ip, #3]
	ldrb r2, [ip, #4]
	and lr, r1, #0xf00000
	ldrb r1, [ip, #7]
	ldrb ip, [ip, #6]
	mov r2, r2, lsl #0x10
	mov r1, r1, lsl #0x1c
	mov ip, ip, lsl #0x18
	mov r3, r3, lsl #0xc
	add fp, fp, #8
	and r1, r1, #0xf0000000
	and ip, ip, #0xf000000
	orr r1, r1, ip
	and r2, r2, #0xf0000
	orr r1, lr, r1
	and r3, r3, #0xf000
	orr r1, r2, r1
	orr r1, r3, r1
	orr r1, r8, r1
	orr r1, sb, r1
	orr r2, sl, r1
	ldr r1, [sp, #0x14]
	cmp fp, #0x240
	str r2, [r1]
	blt _02015C00
	ldrb lr, [r0, #6]
	ldr r0, _02015D10 ; =_020AF710
	add r8, sp, #0x400
	ldr r1, [r0]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	ldrsh r3, [r1, #0x32]
	mov r1, r0, asr #3
	ldr r0, [sp, #0x3c]
	mov r2, r7
	add r0, r1, r0, lsl #5
	add r1, r3, r0
	ldr r0, [sp, #4]
	add r8, r8, #0xd8
	add r1, r0, r1, lsl #5
	ldr r0, [sp, #0x40]
	add r3, r1, r0, lsl #2
	mov r1, r5, lsr #0x1f
	rsb r0, r1, r5, lsl #29
	add r1, r1, r0, ror #29
	ldr r0, _02015D14 ; =_02098EE0
	add sb, r0, r1, lsl #4
	mov r0, #0
	str r0, [sp, #0x28]
_02015D04:
	mov r0, #0
	mov sl, r3
	str r0, [sp, #0x2c]
_02015D10_EU:
	ldr r1, [r8]
	cmp r1, #0
	beq _02015D4C
	ldr r0, [sl]
	ldr ip, [sb]
	ldr fp, [sb, #8]
	and ip, r1, ip
	orr r0, r0, ip, lsl fp
	str r0, [sl]
	ldr ip, [sl, #0x20]
	ldr fp, [sb, #4]
	ldr r0, [sb, #0xc]
	and r1, r1, fp
	orr r0, ip, r1, lsr r0
	str r0, [sl, #0x20]
_02015D4C:
	ldr r0, [sp, #0x2c]
	add r8, r8, #4
	add r0, r0, #1
	add sl, sl, #0x20
	str r0, [sp, #0x2c]
	cmp r0, #3
	blt _02015D10_EU
	add r2, r2, #1
	mov r1, r2, lsr #0x1f
	rsb r0, r1, r2, lsl #29
	adds r0, r1, r0, ror #29
	ldr r0, [sp, #0x28]
	add r3, r3, #4
	add r0, r0, #1
	addeq r3, r3, #0x3e0
	str r0, [sp, #0x28]
	cmp r0, #0x18
	blt _02015D04
	ldr r0, [sp, #0x18]
	add r5, r5, lr
	cmp r0, #0x7e
#else
_020158E0:
	ldrb r8, [r6], #1
	cmp r8, #0x23
	addeq r5, r5, #8
	beq _02015CD8
	cmp r8, #0x20
#ifdef JAPAN
	addeq r5, r5, #0xc
#else
	addeq r5, r5, #6
#endif
	beq _02015CD8
	cmp r8, #0x5b
	bne _02015A2C
	str r6, [sp, #0x44]
	mov r1, #1
_0201590C:
	ldrb r0, [r6], #1
	cmp r0, #0x5d
	beq _0201592C
	cmp r0, #0x3a
	addeq r0, sp, #0x44
	streq r6, [r0, r1, lsl #2]
	addeq r1, r1, #1
	b _0201590C
_0201592C:
	ldr r0, [sp, #0x44]
	ldr r1, _02015D0C ; =_02098FC0
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02015CD8
	ldr r0, [sp, #0x48]
	bl AtoiTagVeneer
	ldr r0, [sp, #0x4c]
	bl AtoiTagVeneer
	ldr r1, _02015D10 ; =_020AF710
	add ip, r5, #2
	ldr r1, [r1]
	ldr r8, [sp, #0x10]
	ldrsh r3, [r1, #0x32]
	mov r1, ip, asr #2
	add r1, ip, r1, lsr #29
	mov r2, r1, asr #3
	ldr r1, [sp, #0x30]
	mov r0, r0, lsl #0x10
	add r1, r2, r1, lsl #5
	add r2, r3, r1
	ldr r1, [sp, #4]
	add r2, r1, r2, lsl #5
	ldr r1, [sp, #0x34]
	add sb, r2, r1, lsl #2
	mov r1, #0
	str r1, [sp, #0x18]
_02015998:
	mov sl, sb
	mov lr, #0
	b _020159F0
_020159A4:
	add r1, ip, lr
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #29
	add r1, r2, r1, ror #29
	ldr r2, _02015D14 ; =_02098EE0
	add lr, lr, #8
	add r3, r2, r1, lsl #4
	ldr r1, [r2, r1, lsl #4]
	ldr r2, [sl]
	ldr fp, [r3, #8]
	bic r1, r1, #0
	orr r1, r2, r1, lsl fp
	str r1, [sl]
	ldr r1, [r3, #4]
	ldr r2, [sl, #0x20]!
	ldr r3, [r3, #0xc]
	bic r1, r1, #0
	orr r1, r2, r1, lsr r3
	str r1, [sl]
_020159F0:
	cmp lr, r0, asr #16
	blt _020159A4
	add r8, r8, #1
	mov r2, r8, lsr #0x1f
	rsb r1, r2, r8, lsl #29
	adds r1, r2, r1, ror #29
	ldr r1, [sp, #0x18]
	add sb, sb, #4
	add r1, r1, #1
	addeq sb, sb, #0x3e0
	str r1, [sp, #0x18]
	cmp r1, #2
	blt _02015998
	add r5, r5, r0, asr #16
	b _02015CD8
_02015A2C:
#ifdef JAPAN
	tst r8, #0x80
	beq _02015A24
	ldrb r0, [r6]
	cmp r0, #0
	orrne r8, r0, r8, lsl #8
	ldr r0, _02015D10_JP ; =0x00008140
	addne r6, r6, #1
	cmp r8, r0
	addeq r5, r5, #0xc
	beq _02015CD8
_02015A24:
#endif
	mov r0, r8
	bl sub_02025480
	bl sub_0201628C
	mov ip, #0
	add r1, sp, #0x400
	add r1, r1, #0xd8
	ldr sb, [r0]
	str r1, [sp, #0x1c]
	mov sl, ip
	mov fp, ip
_02015A54:
	ldrb r3, [sb], #1
	add r1, sp, #0x58
	add lr, r1, fp
	mov r1, r3, asr #4
	and r2, r1, #0xf
	add r1, sp, #0x58
	strb r2, [r1, fp]
	and r1, r3, #0xf
	add fp, fp, #2
	strb r1, [lr, #1]
	cmp fp, #0x240
	blt _02015A54
_02015A84:
	cmp sl, #0x240
	bge _02015B14
	add r1, sp, #0x58
	ldrb r1, [r1, ip]
	add r3, ip, #1
	mov ip, r3
	tst r1, #8
	and r1, r1, #7
	mov sb, #0
	beq _02015B08
	add r2, sp, #0x58
	ldrb r2, [r2, r3]
	add ip, r3, #1
	and r3, r2, #0xff
	b _02015AD8
_02015AC0:
	add r2, sp, #0x298
	strb r3, [r2, sl]
	add sl, sl, #1
	cmp sl, #0x240
	bge _02015A84
	add sb, sb, #1
_02015AD8:
	cmp sb, r1
	blt _02015AC0
	b _02015A84
_02015AE4:
	add r2, sp, #0x58
	ldrb r3, [r2, ip]
	add r2, sp, #0x298
	add ip, ip, #1
	strb r3, [r2, sl]
	add sl, sl, #1
	cmp sl, #0x240
	bge _02015A84
	add sb, sb, #1
_02015B08:
	cmp sb, r1
	blt _02015AE4
	b _02015A84
_02015B14:
	mov fp, #0
_02015B18:
	ldr r1, [sp, #0x1c]
	str r1, [sp, #0x14]
	add r1, r1, #4
	str r1, [sp, #0x1c]
	add r1, sp, #0x298
	add ip, r1, fp
	ldrb r3, [r1, fp]
	ldrb r1, [ip, #2]
	ldrb r2, [ip, #1]
	and sl, r3, #0xf
	mov r1, r1, lsl #8
	and r1, r1, #0xf00
	str r1, [sp, #0x40]
	ldrb r1, [ip, #5]
	mov r2, r2, lsl #4
	and sb, r2, #0xf0
	mov r1, r1, lsl #0x14
	ldrb r3, [ip, #3]
	ldrb r2, [ip, #4]
	and lr, r1, #0xf00000
	ldrb r1, [ip, #7]
	ldrb ip, [ip, #6]
	mov r2, r2, lsl #0x10
	mov r1, r1, lsl #0x1c
	mov ip, ip, lsl #0x18
	mov r3, r3, lsl #0xc
	add fp, fp, #8
	and r1, r1, #0xf0000000
	and ip, ip, #0xf000000
	orr r1, r1, ip
	and r2, r2, #0xf0000
	orr r1, lr, r1
	and r3, r3, #0xf000
	orr r1, r2, r1
	orr r2, r3, r1
	ldr r1, [sp, #0x40]
	cmp fp, #0x240
	orr r1, r1, r2
	orr r1, sb, r1
	orr r2, sl, r1
	ldr r1, [sp, #0x14]
	str r2, [r1]
	blt _02015B18
	ldrb r0, [r0, #6]
	add r3, sp, #0x400
	mov lr, r7
	str r0, [sp, #0x20]
	ldr r0, _02015D10 ; =_020AF710
	add r3, r3, #0xd8
	ldr r1, [r0]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	ldrsh r2, [r1, #0x32]
	mov r1, r0, asr #3
	ldr r0, [sp, #0x38]
	add r0, r1, r0, lsl #5
	add r1, r2, r0
	ldr r0, [sp, #4]
	add r1, r0, r1, lsl #5
	ldr r0, [sp, #0x3c]
	add r2, r1, r0, lsl #2
	mov r1, r5, lsr #0x1f
	rsb r0, r1, r5, lsl #29
	add r1, r1, r0, ror #29
	ldr r0, _02015D14 ; =_02098EE0
	add sb, r0, r1, lsl #4
	mov r0, #0
	str r0, [sp, #0x24]
_02015C28:
	mov r0, #0
	mov sl, r2
	str r0, [sp, #0x28]
_02015C34:
	ldr r1, [r3]
	cmp r1, #0
	beq _02015C70
	ldr r0, [sl]
	ldr ip, [sb]
	ldr fp, [sb, #8]
	and ip, r1, ip
	orr r0, r0, ip, lsl fp
	str r0, [sl]
	ldr ip, [sl, #0x20]
	ldr fp, [sb, #4]
	ldr r0, [sb, #0xc]
	and r1, r1, fp
	orr r0, ip, r1, lsr r0
	str r0, [sl, #0x20]
_02015C70:
	ldr r0, [sp, #0x28]
	add r3, r3, #4
	add r0, r0, #1
	add sl, sl, #0x20
	str r0, [sp, #0x28]
	cmp r0, #3
	blt _02015C34
	add lr, lr, #1
	mov r1, lr, lsr #0x1f
	rsb r0, r1, lr, lsl #29
	adds r0, r1, r0, ror #29
	ldr r0, [sp, #0x24]
	add r2, r2, #4
	add r0, r0, #1
	addeq r2, r2, #0x3e0
	str r0, [sp, #0x24]
	cmp r0, #0x18
	blt _02015C28
	ldr r0, [sp, #0x20]
	cmp r8, #0x7e
	add r5, r5, r0
#endif
	ldreqb r0, [r6]
	cmpeq r0, #0x32
	ldreqb r0, [r6, #1]
	cmpeq r0, #0x37
	addeq r6, r6, #2
_02015CD8:
	ldrb r0, [r6]
	cmp r0, #0
	bne _020158E0
	ldr r0, [sp, #0x2c + SUB_0201578C_STACK_OFFSET]
	add r7, r7, #0x18
	add r0, r0, #1
	str r0, [sp, #0x2c + SUB_0201578C_STACK_OFFSET]
	b _020157B8
_02015CF8:
	ldr r0, [sp, #0x2c + SUB_0201578C_STACK_OFFSET]
	add sp, sp, #0x2f8
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02015D08: .word _02098FBC
#ifdef EUROPE
_02015DEC: .word _02099404_EU
#endif
_02015D0C: .word _02098FC0
_02015D10: .word _020AF710
_02015D14: .word _02098EE0
#ifdef JAPAN
_02015D10_JP: .word 0x00008140
#endif
	arm_func_end sub_0201578C

	arm_func_start sub_02015D18
sub_02015D18: ; 0x02015D18
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov r5, r1
	mov r4, r2
	mov r1, #0
	mov r6, r4
	str r1, [sp, #4]
	str r5, [sp, #8]
	b _02015D60
_02015D3C:
	ldrb r1, [r2], #1
	cmp r1, #0x7e
	strb r1, [r6], #1
	bne _02015D60
	ldrb r1, [r2]
	cmp r1, #0x32
	ldreqb r1, [r2, #1]
	cmpeq r1, #0x37
	addeq r2, r2, #2
_02015D60:
	ldrb r1, [r2]
	cmp r1, #0
	bne _02015D3C
	mov r1, #0
	strb r1, [r6]
	str r3, [sp]
	ldr r2, _02015E40 ; =_020AF710
	mov r1, r0
	ldr r0, [r2]
	mov r2, r5
	ldr r0, [r0]
	mov r3, r4
	bl sub_0201578C
	mov r1, r5, asr #2
	add r2, r5, r1, lsr #29
	mov r7, r0
	mov r1, #0x18
	mul r0, r7, r1
	add r0, r0, r2, asr #3
	add r3, r0, #7
	mov r0, r3, asr #2
	add r0, r3, r0, lsr #29
	mov r0, r0, asr #3
	mov sb, r2, asr #3
	bl _s32_div_f
	ldr fp, _02015E40 ; =_020AF710
	mov sl, r1
	ldr r0, [fp]
	mov r4, #0
	ldrsh r0, [r0, #0x32]
	add r0, r0, sb, lsl #5
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	b _02015E2C
_02015DE8:
	mov r5, #0
	add r8, sb, r4
_02015DF0:
	ldr r0, [fp]
	str r5, [sp, #4]
	str r8, [sp, #8]
	ldrsh r2, [r0, #0x30]
	ldr r0, [r0, #4]
	add r1, sp, #4
	orr r2, r6, r2, lsl #12
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
	add r5, r5, #1
	cmp r5, #0x20
	add r6, r6, #1
	blt _02015DF0
	add r4, r4, #1
_02015E2C:
	cmp r4, sl
	blt _02015DE8
	mov r0, r7
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02015E40: .word _020AF710
	arm_func_end sub_02015D18

	arm_func_start sub_02015E44
sub_02015E44: ; 0x02015E44
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl StringFromId
	mov r2, r0
	mov r1, r4
	mov r0, #0
	mov r3, #2
	bl sub_02015D18
	ldmia sp!, {r4, pc}
	arm_func_end sub_02015E44

	arm_func_start sub_02015E6C
sub_02015E6C: ; 0x02015E6C
	stmdb sp!, {r3, lr}
	ldr r0, _02015EB0 ; =_020AF710
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02015E88
	bl sub_0200B330
_02015E88:
	ldr r0, _02015EB0 ; =_020AF710
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _02015EA4
	bl sub_0200A174
	ldmia sp!, {r3, pc}
_02015EA4:
	ldr r0, [r1, #0xc]
	bl sub_0200A504
	ldmia sp!, {r3, pc}
	.align 2, 0
_02015EB0: .word _020AF710
	arm_func_end sub_02015E6C

	arm_func_start sub_02015EB4
sub_02015EB4: ; 0x02015EB4
	stmdb sp!, {r3, lr}
	ldr r0, _02015EE4 ; =_020AF710
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0200B3D4
	ldr r0, _02015EE4 ; =_020AF710
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl sub_0200B330
	ldmia sp!, {r3, pc}
	.align 2, 0
_02015EE4: .word _020AF710
	arm_func_end sub_02015EB4

	arm_func_start sub_02015EE8
sub_02015EE8: ; 0x02015EE8
	stmdb sp!, {r3, lr}
	ldr r1, _02015F14 ; =_020AF710
	ldr r2, [r1]
	ldr r1, [r2, #8]
	cmp r1, #0
	ldmneia sp!, {r3, pc}
	mov r1, r0, lsl #0x10
	ldr r0, [r2, #0xc]
	mov r1, r1, lsr #0x10
	bl sub_0200A618
	ldmia sp!, {r3, pc}
	.align 2, 0
_02015F14: .word _020AF710
	arm_func_end sub_02015EE8

	arm_func_start sub_02015F18
sub_02015F18: ; 0x02015F18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r4, _02015FD4 ; =_020AF710
	mov r6, #0
	ldr r0, [r4]
	add r5, sp, #0
	ldr r0, [r0, #8]
	mov r8, #0x10
	cmp r0, #0
	beq _02015F88
	ldr r7, _02015FD8 ; =_020AFC70
_02015F44:
	ldr r0, [r4]
	mov r2, r6, lsl #0x10
	ldr r0, [r0, #8]
	mov r1, r5
	mov r2, r2, lsr #0x10
	bl sub_0200A2B4
	ldr r0, [r7]
	mov r3, r6, lsl #0x10
	mov r1, r5
	mov r2, r8
	add r0, r0, #0xcc
	mov r3, r3, asr #0x10
	bl sub_0201E380
	add r6, r6, #1
	cmp r6, #0x100
	blt _02015F44
	b _02015FCC
_02015F88:
	ldr r7, _02015FD8 ; =_020AFC70
_02015F8C:
	ldr r0, [r4]
	mov r2, r6, lsl #0x10
	ldr r0, [r0, #0xc]
	mov r1, r5
	mov r2, r2, lsr #0x10
	bl sub_0200A5F8
	ldr r0, [r7]
	mov r3, r6, lsl #0x10
	mov r1, r5
	mov r2, r8
	add r0, r0, #0xcc
	mov r3, r3, asr #0x10
	bl sub_0201E380
	add r6, r6, #1
	cmp r6, #0x100
	blt _02015F8C
_02015FCC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02015FD4: .word _020AF710
_02015FD8: .word _020AFC70
	arm_func_end sub_02015F18

	arm_func_start sub_02015FDC
sub_02015FDC: ; 0x02015FDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, #0
	mov r3, r2, asr #2
	add r2, r2, r3, lsr #29
	mov ip, r5
	mov lr, r5
	b _0201602C
_02015FF8:
	mov r6, lr
	add r8, r1, r5, lsl #10
_02016000:
	mov r7, ip
	add r4, r8, r6, lsl #2
_02016008:
	ldr r3, [r4], #0x20
	add r7, r7, #1
	cmp r7, #0x20
	str r3, [r0], #4
	blt _02016008
	add r6, r6, #1
	cmp r6, #8
	blt _02016000
	add r5, r5, #1
_0201602C:
	cmp r5, r2, asr #3
	blt _02015FF8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02015FDC

	arm_func_start sub_02016038
sub_02016038: ; 0x02016038
	ldr ip, _02016048 ; =sub_0201E050
	add r1, r1, #0x10000
	mov r3, #0
	bx ip
	.align 2, 0
_02016048: .word sub_0201E050
	arm_func_end sub_02016038

	arm_func_start sub_0201604C
sub_0201604C: ; 0x0201604C
	stmdb sp!, {r3, lr}
	add r1, r1, #0x10000
	str r1, [r0, #0x20]
	mov ip, #0
	strh ip, [r0, #0x16]
	mov r1, #8
	strh ip, [r0, #0x18]
	mov ip, #0x100
	mov r1, r1, lsl r3
	strh ip, [r0, #0x1a]
	strh r1, [r0, #0x1c]
	ldrh lr, [r0, #0x14]
	mov ip, r3, lsl #0x1d
	ldr r1, _02016110 ; =_020AF710
	bic r3, lr, #7
	orr r3, r3, #5
	strh r3, [r0, #0x14]
	ldrh lr, [r0, #0x14]
	ldr r3, _02016114 ; =_020AFC70
	bic lr, lr, #0x38
	orr ip, lr, ip, lsr #26
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	bic ip, ip, #0xc0
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	bic ip, ip, #0x700
	orr ip, ip, #0x300
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	bic ip, ip, #0x1800
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	bic ip, ip, #0x6000
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	orr ip, ip, #0x8000
	strh ip, [r0, #0x14]
	ldr r1, [r1]
	ldr r3, [r3]
	ldrsh r1, [r1, #0x30]
	ldr r3, [r3, #0xe0]
	add r1, r2, r1
	mov r1, r1, lsl #0x14
	mov r1, r1, asr #0x10
	add r1, r1, #0x1000
	add r1, r3, r1, lsl #1
	str r1, [r0, #0x24]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02016110: .word _020AF710
_02016114: .word _020AFC70
	arm_func_end sub_0201604C

	arm_func_start sub_02016118
sub_02016118: ; 0x02016118
	ldr r2, _02016140 ; =_020AF720
	ldr r3, _02016144 ; =_020AF721
	ldrb ip, [r2, r1, lsl #2]
	ldr r2, _02016148 ; =_020AF722
	strb ip, [r0, #0x2c]
	ldrb r3, [r3, r1, lsl #2]
	strb r3, [r0, #0x2d]
	ldrb r1, [r2, r1, lsl #2]
	strb r1, [r0, #0x2e]
	bx lr
	.align 2, 0
_02016140: .word _020AF720
_02016144: .word _020AF721
_02016148: .word _020AF722
	arm_func_end sub_02016118

	arm_func_start sub_0201614C
sub_0201614C: ; 0x0201614C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldr r0, [r6, #8]
	mov r5, r1
	mov r4, r2
	cmp r0, #0
	mov r7, #0
	beq _0201619C
_0201616C:
	add r0, r7, r5, lsl #4
	mov r1, r0, lsl #0x10
	ldr r0, [r6, #8]
	mov r1, r1, lsr #0x10
	add r2, r4, r7, lsl #2
	bl sub_0200A29C
	add r7, r7, #1
	cmp r7, #0x10
	blt _0201616C
	ldr r0, [r6, #8]
	bl sub_0200A174
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0201619C:
	add r0, r7, r5, lsl #4
	mov r1, r0, lsl #0x10
	ldr r0, [r6, #0xc]
	mov r1, r1, lsr #0x10
	add r2, r4, r7, lsl #2
	bl sub_0200A590
	add r7, r7, #1
	cmp r7, #0x10
	blt _0201619C
	ldr r0, [r6, #0xc]
	bl sub_0200A504
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0201614C

	arm_func_start sub_020161CC
sub_020161CC: ; 0x020161CC
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
#ifdef JAPAN
	mov r5, r0
	mov r4, #0
	b _02016294
_020161DC:
	ldrb r0, [r5], #1
	cmp r0, #0x23
	addeq r4, r4, #8
	beq _02016294
	cmp r0, #0x20
	addeq r4, r4, #0xc
	beq _02016294
	cmp r0, #0x5b
	bne _02016258
	str r5, [sp]
	mov r2, #1
	add r0, sp, #0
_0201620C:
	ldrb r1, [r5], #1
	cmp r1, #0x5d
	beq _02016228
	cmp r1, #0x3a
	streq r5, [r0, r2, lsl #2]
	addeq r2, r2, #1
	b _0201620C
_02016228:
	ldr r0, [sp]
	ldr r1, _02016288 ; =_02098FC0_JP
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02016294
	ldr r0, [sp, #4]
	bl AtoiTagVeneer
	ldr r0, [sp, #8]
	bl AtoiTagVeneer
	mov r0, r0, lsl #0x10
	add r4, r4, r0, asr #16
	b _02016294
_02016258:
	tst r0, #0x80
	beq _02016280
	ldrb r1, [r5]
	cmp r1, #0
	orrne r0, r1, r0, lsl #8
	ldr r1, _020162B0_JP ; =0x00008140
	addne r5, r5, #1
	cmp r0, r1
	addeq r4, r4, #0xc
	beq _02016294
_02016280:
	bl sub_02025480
	bl sub_0201628C
	cmp r0, #0
	ldrneb r0, [r0, #6]
	addne r4, r4, r0
_02016294:
	ldrb r0, [r5]
	cmp r0, #0
	bne _020161DC
	mov r0, r4
#else
	mov r4, r0
	mov r5, #0
	b _02016270
_020161E0:
	ldrb r0, [r4], #1
	cmp r0, #0x23
	addeq r5, r5, #8
	beq _02016270
	cmp r0, #0x20
	addeq r5, r5, #6
	beq _02016270
	cmp r0, #0x5b
	bne _0201625C
	str r4, [sp]
	mov r2, #1
	add r0, sp, #0
_02016210:
	ldrb r1, [r4], #1
	cmp r1, #0x5d
	beq _0201622C
	cmp r1, #0x3a
	streq r4, [r0, r2, lsl #2]
	addeq r2, r2, #1
	b _02016210
_0201622C:
	ldr r0, [sp]
	ldr r1, _02016288 ; =_02098FC0
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02016270
	ldr r0, [sp, #4]
	bl AtoiTagVeneer
	ldr r0, [sp, #8]
	bl AtoiTagVeneer
	mov r0, r0, lsl #0x10
	add r5, r5, r0, asr #16
	b _02016270
_0201625C:
	bl sub_02025480
	bl sub_0201628C
	cmp r0, #0
	ldrneb r0, [r0, #6]
	addne r5, r5, r0
_02016270:
	ldrb r0, [r4]
	cmp r0, #0
	bne _020161E0
	mov r0, r5
#endif
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02016288: .word _02098FC0
#ifdef JAPAN
_020162B0_JP: .word 0x00008140
#endif
	arm_func_end sub_020161CC

	arm_func_start sub_0201628C
sub_0201628C: ; 0x0201628C
	stmdb sp!, {r3, lr}
	ldr r1, _020162FC ; =_020AF710
	mov lr, #0
	ldr r1, [r1]
	ldr r2, [r1, #0x10]
	ldr r1, [r1, #0x2c]
	ldr r3, [r2]
	sub ip, r1, #1
	b _020162DC
_020162B0:
	add r1, lr, ip
	add r1, r1, r1, lsr #31
	mov r2, r1, asr #1
	add r1, r3, r2, lsl #3
	ldrh r1, [r1, #4]
	cmp r0, r1
	moveq lr, r2
	beq _020162E4
	cmp r1, r0
	addlt lr, r2, #1
	movge ip, r2
_020162DC:
	cmp lr, ip
	blt _020162B0
_020162E4:
	add r2, r3, lr, lsl #3
	ldrh r1, [r2, #4]
	cmp r1, r0
	addne r2, r3, #8
	mov r0, r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_020162FC: .word _020AF710
	arm_func_end sub_0201628C

	arm_func_start sub_02016300
sub_02016300: ; 0x02016300
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r4, [sp, #0x20]
	ldr lr, _0201636C ; =_020AF760
	ldrsh ip, [sp, #0x18]
	str r4, [lr]
	ldrsh r4, [sp, #0x1c]
	str ip, [sp]
	mov ip, #0x14
	str r4, [sp, #4]
	ldr r4, [lr]
	ldr lr, _02016370 ; =_0209901C
	mul ip, r4, ip
	ldr ip, [lr, ip]
	str ip, [sp, #8]
	bl sub_02015328
	ldr r1, _0201636C ; =_020AF760
	mov r0, #0x14
	ldr r2, [r1]
	ldr r1, _02016374 ; =_02099020
	mul r0, r2, r0
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02016364
	blx r0
_02016364:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201636C: .word _020AF760
_02016370: .word _0209901C
_02016374: .word _02099020
	arm_func_end sub_02016300

	arm_func_start sub_02016378
sub_02016378: ; 0x02016378
	stmdb sp!, {r3, lr}
	ldr ip, _020163A4 ; =_020AF760
	mov r3, #0x14
	ldr lr, [ip]
	ldr ip, _020163A8 ; =_02099024
	mul r3, lr, r3
	ldr r3, [ip, r3]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	blx r3
	ldmia sp!, {r3, pc}
	.align 2, 0
_020163A4: .word _020AF760
_020163A8: .word _02099024
	arm_func_end sub_02016378

	arm_func_start sub_020163AC
sub_020163AC: ; 0x020163AC
	stmdb sp!, {r3, lr}
	ldr r1, _020163DC ; =_020AF760
	mov r0, #0x14
	ldr r2, [r1]
	ldr r1, _020163E0 ; =_02099028
	mul r0, r2, r0
	ldr r0, [r1, r0]
	cmp r0, #0
	moveq r0, #2
	ldmeqia sp!, {r3, pc}
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020163DC: .word _020AF760
_020163E0: .word _02099028
	arm_func_end sub_020163AC

	arm_func_start sub_020163E4
sub_020163E4: ; 0x020163E4
	stmdb sp!, {r3, lr}
	ldr r1, _02016414 ; =_020AF760
	mov r0, #0x14
	ldr r2, [r1]
	ldr r1, _02016418 ; =_0209902C
	mul r0, r2, r0
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0201640C
	blx r0
_0201640C:
	bl sub_0201551C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02016414: .word _020AF760
_02016418: .word _0209902C
	arm_func_end sub_020163E4

	arm_func_start sub_0201641C
sub_0201641C: ; 0x0201641C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02015588
	mov r1, r4
	mov r0, #3
	mov r2, #0
	bl sub_0204F6F8
	mov r4, r0
	bl sub_02015570
	mov r0, r4
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	rsb r0, r1, #0xc0
	mov r1, r4
	mov r0, r0, asr #1
	bl sub_02015E44
	bl sub_02015E6C
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201641C

	arm_func_start sub_02016468
sub_02016468: ; 0x02016468
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x100
	mov r4, r1
	mov r5, r0
	bl sub_02015588
	bl sub_02015570
	add r0, sp, #0
	mov r1, r4
	bl strcpy
	mov r1, r5
	mov r0, #0
	add r2, sp, #0
	mov r3, #2
	bl sub_02015D18
	bl sub_02015E6C
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02016468

	arm_func_start sub_020164AC
sub_020164AC: ; 0x020164AC
	stmdb sp!, {r3, lr}
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x90
	add r0, r0, #0xb000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x30c0
	add r0, r0, #0x8000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0xf0
	add r0, r0, #0xb000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x60
	add r0, r0, #0xb000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x30
	add r0, r0, #0xb000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x120
	add r0, r0, #0xb000
	bl MemZero
	ldmia sp!, {r3, pc}
	.align 2, 0
_02016544: .word _020AF760
	arm_func_end sub_020164AC

	arm_func_start sub_02016548
sub_02016548: ; 0x02016548
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x104
	ldrb r4, [sp, #0x118]
	mov ip, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp r4, #0
	add r0, sp, #4
	mov r1, ip
	beq _020165C8
	mov r2, r5
	bl sub_020175F8
	bl sub_02015570
	add r2, sp, #4
	mov r0, #0
	mov r1, #0x20
	mov r3, #2
	bl sub_02015D18
	mov r1, r6
	mov r0, #0x3b
	bl sub_020156AC
	mov r1, r7
	add r0, sp, #4
	bl strcpy
	mov r0, #0
	mov r1, #0x52
	add r2, sp, #4
	mov r3, #2
	bl sub_02015D18
	bl sub_02015E6C
	b _02016768
_020165C8:
	mov r2, r5
	bl sub_020175F8
	mov r2, #2
	ldr r0, _02016770 ; =_020AF760
	str r2, [sp]
	ldr r0, [r0, #4]
	add r3, sp, #4
	mov r1, r7
	bl sub_0201770C
	bl sub_020164AC
	ldr r0, _02016770 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x150]
	bl sub_0201F36C
	ldr r1, _02016770 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x90]
	bl sub_0201F36C
	ldr r2, _02016770 ; =_020AF760
	ldr r1, [r2, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0xc0]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldrsh r0, [r0, #0x90]
	bl sub_0201F324
	mov r1, #0
	mov r4, r0
	strb r1, [r4, #0x3c]
	mov r2, r1
	mov r3, #2
	bl sub_0201604C
	ldrsh r0, [r4, #0x1a]
	mov r2, #0x20
	mov r1, #0xa
	add r0, r0, r0, lsr #31
	mov r0, r0, lsl #0xf
	mov r0, r0, asr #0x10
	strh r0, [r4]
	strh r2, [r4, #2]
	strb r1, [r4, #0x3e]
	strh r0, [r4, #8]
	mov r0, #0
	strh r0, [r4, #0xa]
	mov r0, #0x21
	strh r0, [r4, #0x2a]
	ldr r0, _02016770 ; =_020AF760
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	ldrsh r0, [r0, #0xc0]
	bl sub_0201F324
	mov r4, r0
	mov r1, #0x1000
	mov r2, #0
	mov r3, #4
	bl sub_0201604C
	ldrsh r0, [r4, #0x1a]
	mov r3, #0
	mov r1, #0x52
	add r0, r0, r0, lsr #31
	mov r0, r0, lsl #0xf
	mov r2, r0, asr #0x10
	strb r3, [r4, #0x3c]
	strh r2, [r4]
	strh r1, [r4, #2]
	mov r0, #0xa
	strb r0, [r4, #0x3e]
	strh r2, [r4, #8]
	strh r3, [r4, #0xa]
	mov r0, #0x21
	cmp r5, #0
	strh r0, [r4, #0x2a]
	beq _02016760
	bl sub_0201F36C
	ldr r2, _02016770 ; =_020AF760
	ldr r1, [r2, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x60]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldrsh r0, [r0, #0x60]
	bl sub_0201F324
	mov r1, #2
	strb r1, [r0, #0x3c]
	mov r1, #0
	strh r1, [r0]
	mov r1, #0x3b
	strh r1, [r0, #2]
	mov r1, #0x100
	strh r1, [r0, #4]
	mov r1, #1
	strh r1, [r0, #6]
	mov r2, #0xa
	mov r1, r6
	strb r2, [r0, #0x3e]
	mov r2, #0x21
	strh r2, [r0, #0x2a]
	bl sub_02016118
	b _02016768
_02016760:
	mov r0, #0x80
	bl sub_02015EE8
_02016768:
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_02016770: .word _020AF760
	arm_func_end sub_02016548

	arm_func_start sub_02016774
sub_02016774: ; 0x02016774
	stmdb sp!, {r3, lr}
	mov r3, #0
	str r3, [sp]
	bl sub_02016548
	ldmia sp!, {r3, pc}
	arm_func_end sub_02016774

	arm_func_start sub_02016788
sub_02016788: ; 0x02016788
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x100
	mov r3, r0
	mov r5, r1
	mov r4, r2
	add r0, sp, #0
	mov r1, r3
	mov r2, #0
	bl sub_020175F8
	bl sub_02015570
	add r2, sp, #0
	mov r0, #0
	mov r1, #0x20
	mov r3, #2
	bl sub_02015D18
	mov r1, r4
	mov r0, #0x3b
	bl sub_020156AC
	mov r1, r5
	add r0, sp, #0
	bl strcpy
	mov r0, #0
	mov r1, #0x52
	add r2, sp, #0
	mov r3, #2
	bl sub_02015D18
	bl sub_02015E6C
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02016788

	arm_func_start sub_020167FC
sub_020167FC: ; 0x020167FC
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r3, #1
	str ip, [sp]
	bl sub_02016548
	ldmia sp!, {r3, pc}
	arm_func_end sub_020167FC

	arm_func_start sub_02016814
sub_02016814: ; 0x02016814
	stmdb sp!, {r4, lr}
	ldr r0, _02016880 ; =0x0000B160
	mov r1, #0
	bl MemAlloc
	ldr r2, _02016884 ; =_020AF760
	ldr r1, _02016880 ; =0x0000B160
	str r0, [r2, #4]
	bl MemZero
	bl sub_0201F2E4
	ldr r0, _02016884 ; =_020AF760
	mov r1, #0x1000
	ldr r4, [r0, #4]
	add r0, r4, #0x6000
	bl MemZero
	add r0, r4, #0x7000
	mov r1, #0x4000
	bl MemZero
	add r0, r4, #0xb000
	mov r1, #0x20
	bl MemZero
	bl sub_02015F18
	ldr r0, _02016884 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x20]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02016880: .word 0x0000B160
_02016884: .word _020AF760
	arm_func_end sub_02016814

	arm_func_start sub_02016888
sub_02016888: ; 0x02016888
	stmdb sp!, {r3, lr}
	ldr r0, _020168C4 ; =_020AF760
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x100
	bl sub_02015EE8
	bl sub_0201F2E4
	ldr r0, _020168C4 ; =_020AF760
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _020168C4 ; =_020AF760
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020168C4: .word _020AF760
	arm_func_end sub_02016888

	arm_func_start sub_020168C8
sub_020168C8: ; 0x020168C8
	stmdb sp!, {r4, lr}
	ldr r0, _02016934 ; =0x0000B160
	mov r1, #0
	bl MemAlloc
	ldr r2, _02016938 ; =_020AF760
	ldr r1, _02016934 ; =0x0000B160
	str r0, [r2, #4]
	bl MemZero
	bl sub_0201F2E4
	ldr r0, _02016938 ; =_020AF760
	mov r1, #0x1000
	ldr r4, [r0, #4]
	add r0, r4, #0x6000
	bl MemZero
	add r0, r4, #0x7000
	mov r1, #0x4000
	bl MemZero
	add r0, r4, #0xb000
	mov r1, #0x20
	bl MemZero
	bl sub_02015F18
	ldr r0, _02016938 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x20]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02016934: .word 0x0000B160
_02016938: .word _020AF760
	arm_func_end sub_020168C8

	arm_func_start sub_0201693C
sub_0201693C: ; 0x0201693C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x104
	mov r3, r0
	mov r4, r1
	mov r6, r2
	add r0, sp, #4
	mov r1, r3
	mov r2, #1
	bl sub_020175F8
	mov r2, #2
	ldr r0, _02016BB4 ; =_020AF760
	str r2, [sp]
	ldr r0, [r0, #4]
	add r3, sp, #4
	mov r1, r4
	bl sub_0201770C
	bl sub_020164AC
	ldr r0, _02016BB4 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x150]
	bl sub_0201F36C
	ldr r1, _02016BB4 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x90]
	bl sub_0201F36C
	ldr r1, _02016BB4 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0xc0]
	bl sub_0201F36C
	ldr r2, _02016BB4 ; =_020AF760
	ldr r1, [r2, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x60]
	ldr r1, [r2, #4]
	add r0, r1, #0x90
	add r5, r0, #0xb000
	add r0, r1, #0xb000
	ldrsh r0, [r0, #0x90]
	bl sub_0201F324
	mov r1, #0
	mov r4, r0
	strb r1, [r4, #0x3c]
	mov r2, r1
	mov r3, #2
	bl sub_0201604C
	ldrsh r0, [r4, #0x1a]
	mov r2, #0x20
	mov r1, #1
	add r0, r0, r0, lsr #31
	mov r3, r0, asr #1
	rsb r0, r3, #0
	strh r0, [r4]
	strh r2, [r4, #2]
	strb r1, [r4, #0x3e]
	strh r3, [r4, #8]
	mov r0, #0
	strh r0, [r4, #0xa]
	mov r0, #0x21
	strh r0, [r4, #0x2a]
	ldrsh r0, [r4]
	mov r2, #0x6000
	mov r1, #0xff00
	mov r0, r0, lsl #8
	str r0, [r5, #4]
	ldrsh r3, [r4, #2]
	ldr r0, _02016BB4 ; =_020AF760
	mov r3, r3, lsl #8
	str r3, [r5, #8]
	str r2, [r5, #0xc]
	ldr r2, [r5, #8]
	str r2, [r5, #0x10]
	str r1, [r5, #0x24]
	ldr r1, [r0, #4]
	add r0, r1, #0x30c0
	add r5, r0, #0x8000
	add r0, r1, #0xb000
	ldrsh r0, [r0, #0xc0]
	bl sub_0201F324
	mov r1, #0x1000
	mov r2, #0
	mov r3, #2
	mov r4, r0
	bl sub_0201604C
	ldrsh r0, [r4, #0x1a]
	mov r2, #0
	mov r1, #0x52
	add r0, r0, r0, lsr #31
	mov r3, r0, asr #1
	strb r2, [r4, #0x3c]
	add r0, r3, #0x100
	strh r0, [r4]
	strh r1, [r4, #2]
	mov r0, #1
	strb r0, [r4, #0x3e]
	strh r3, [r4, #8]
	strh r2, [r4, #0xa]
	mov r0, #0x21
	strh r0, [r4, #0x2a]
	ldrsh r0, [r4]
	mov r2, #0xa000
	mov r1, #0xff00
	mov r0, r0, lsl #8
	str r0, [r5, #4]
	ldrsh r3, [r4, #2]
	ldr r0, _02016BB4 ; =_020AF760
	mov r3, r3, lsl #8
	str r3, [r5, #8]
	str r2, [r5, #0xc]
	ldr r2, [r5, #8]
	str r2, [r5, #0x10]
	str r1, [r5, #0x24]
	ldr r1, [r0, #4]
	add r0, r1, #0xb000
	add r1, r1, #0x60
	ldrsh r0, [r0, #0x60]
	add r5, r1, #0xb000
	bl sub_0201F324
	mov r4, r0
	mov r1, #2
	strb r1, [r4, #0x3c]
	mvn r1, #0xff
	strh r1, [r4]
	mov r1, #0x3b
	strh r1, [r4, #2]
	mov r1, #0x100
	strh r1, [r4, #4]
	mov r1, #1
	strh r1, [r4, #6]
	strb r1, [r4, #0x3e]
	mov r2, #0x21
	mov r1, r6
	strh r2, [r4, #0x2a]
	bl sub_02016118
	ldrsh r1, [r4]
	mov r2, #0x1800
	mov r0, #0xff00
	mov r1, r1, lsl #8
	str r1, [r5, #4]
	ldrsh r4, [r4, #2]
	ldr r1, _02016BB4 ; =_020AF760
	mov r3, #0x100
	mov r4, r4, lsl #8
	str r4, [r5, #8]
	str r2, [r5, #0x14]
	str r0, [r5, #0x24]
	ldr r0, [r1, #4]
	mov r2, #0x10
	add r0, r0, #0xb000
	str r3, [r0, #0x154]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	str r2, [r0, #0x20]
	add sp, sp, #0x104
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02016BB4: .word _020AF760
	arm_func_end sub_0201693C

	arm_func_start sub_02016BB8
sub_02016BB8: ; 0x02016BB8
	stmdb sp!, {r3, lr}
	ldr r0, _02016BEC ; =_020AF760
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0201F2E4
	ldr r0, _02016BEC ; =_020AF760
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02016BEC ; =_020AF760
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02016BEC: .word _020AF760
	arm_func_end sub_02016BB8

	arm_func_start sub_02016BF0
sub_02016BF0: ; 0x02016BF0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02016EA8 ; =_020AF760
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _02016EA0
	add r2, r1, #0xb000
	ldrsh r0, [r2, #0x60]
	add r1, r1, #0x60
	add r6, r1, #0xb000
	ldr r5, [r2, #0x154]
	bl sub_0201F324
	ldrb r1, [r6, #0x28]
	mov r4, r0
	cmp r1, #1
	beq _02016C44
	cmp r1, #2
	beq _02016C78
	cmp r1, #3
	moveq r0, #0
	streqb r0, [r6, #0x28]
	b _02016C94
_02016C44:
	ldr r1, [r6, #4]
	ldr r0, [r6, #0x14]
	adds r0, r1, r0
	str r0, [r6, #4]
	bmi _02016C94
	ldrb r2, [r6, #0x28]
	mov r1, #0
	mov r0, #0x2d
	add r2, r2, #1
	strb r2, [r6, #0x28]
	str r1, [r6, #4]
	str r0, [r6, #0x2c]
	b _02016C94
_02016C78:
	ldr r1, [r6, #0x2c]
	sub r0, r1, #1
	str r0, [r6, #0x2c]
	cmp r1, #0
	ldreqb r0, [r6, #0x28]
	addeq r0, r0, #1
	streqb r0, [r6, #0x28]
_02016C94:
	ldr r2, [r6, #4]
	mov r1, r5
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	mov r0, r0, asr #8
	strh r0, [r4]
	ldr r2, [r6, #0x24]
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	mov r0, r0, asr #8
	bl MultiplyByFixedPoint
	ldr r1, _02016EA8 ; =_020AF760
	strb r0, [r4, #0x2f]
	ldr r0, [r1, #4]
	mov r2, #0
	add r1, r0, #0xb000
	add r0, r0, #0x90
	ldr r1, [r1, #0x154]
	add r0, r0, #0xb000
	bl sub_020177AC
	ldr r2, _02016EA8 ; =_020AF760
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldr r3, [r0, #0x94]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	mov r1, r1, asr #8
	cmp r1, #0x80
	blt _02016D48
	mov r1, #0
	str r1, [r0, #0xa4]
	ldr r0, [r2, #4]
	mov r1, #0x8000
	add r0, r0, #0xb000
	str r1, [r0, #0x94]
	ldr r4, [r2, #4]
	add r0, r4, #0xb000
	ldrsh r0, [r0, #0x90]
	bl sub_0201F324
	add r1, r4, #0xb000
	ldr r2, [r1, #0x94]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0]
_02016D48:
	ldr r0, _02016EA8 ; =_020AF760
	ldr r2, [r0, #4]
	add r0, r2, #0xb000
	ldrsh r0, [r0, #0xc0]
	add r1, r2, #0x90
	add r2, r2, #0x30c0
	add r5, r1, #0xb000
	add r4, r2, #0x8000
	bl sub_0201F324
	ldr r1, [r5, #4]
	ldr r2, _02016EA8 ; =_020AF760
	rsb r3, r1, #0x10000
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	str r3, [r4, #4]
	mov r1, r1, asr #8
	strh r1, [r0]
	ldr r0, [r2, #4]
	add r1, r0, #0xb000
	ldr r3, [r1, #0x20]
	cmp r3, #0x14
	bhi _02016DCC
	subs r0, r3, #0x10
	addpl pc, pc, r0, lsl #2
	b _02016DC0
_02016DAC: ; jump table
	b _02016DE0 ; case 0
	b _02016E00 ; case 1
	b _02016E38 ; case 2
	b _02016E64 ; case 3
	b _02016E84 ; case 4
_02016DC0:
	cmp r3, #0
	beq _02016DD8
	b _02016E98
_02016DCC:
	cmp r3, #0xff
	beq _02016E90
	b _02016E98
_02016DD8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02016DE0:
	mov r0, #1
	strb r0, [r1, #0x88]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x20]
	add r1, r1, #1
	str r1, [r0, #0x20]
	b _02016E98
_02016E00:
	ldrb r0, [r1, #0x88]
	cmp r0, #0
	bne _02016E98
	mov r3, #1
	strb r3, [r1, #0xb8]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	strb r3, [r0, #0xe8]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x20]
	add r1, r1, #1
	str r1, [r0, #0x20]
	b _02016E98
_02016E38:
	ldrb r0, [r1, #0xb8]
	cmp r0, #2
	bne _02016E98
	mov r0, #0x3c
	str r0, [r1, #0x150]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x20]
	add r1, r1, #1
	str r1, [r0, #0x20]
	b _02016E98
_02016E64:
	ldr r2, [r1, #0x94]
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	mov r0, r0, asr #8
	cmp r0, #0x80
	addge r0, r3, #1
	strge r0, [r1, #0x20]
	b _02016E98
_02016E84:
	mov r0, #0xff
	str r0, [r1, #0x20]
	b _02016E98
_02016E90:
	mov r0, #2
	ldmia sp!, {r4, r5, r6, pc}
_02016E98:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_02016EA0:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02016EA8: .word _020AF760
	arm_func_end sub_02016BF0

	arm_func_start sub_02016EAC
sub_02016EAC: ; 0x02016EAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	bl sub_020168C8
	ldr r0, _02017128 ; =0x00000A7C
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201712C ; =_020AF760
	ldr r1, _02017128 ; =0x00000A7C
	str r0, [r2, #8]
	bl MemZero
	ldr r0, _02017130 ; =WAN_TABLE
	ldr r1, _02017134 ; =_02099110
	ldr r0, [r0]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _0201712C ; =_020AF760
	ldr r2, _02017130 ; =WAN_TABLE
	ldr r3, [r1, #8]
	ldr r1, _02017138 ; =_02099124
	strh r0, [r3, #0x94]
	ldr r0, [r2]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _0201712C ; =_020AF760
	ldr r1, [r1, #8]
	strh r0, [r1, #0x96]
	bl sub_02015F18
	ldr r0, _0201712C ; =_020AF760
	ldr r0, [r0, #8]
	add r0, r0, #0x98
	bl InitAnimationControlWithSet__0201C0B0
	ldr r0, _0201712C ; =_020AF760
	ldr r1, [r0, #8]
	add r0, r1, #0x98
	ldrsh r1, [r1, #0x94]
	bl SetSpriteIdForAnimationControl
	mov r0, #1
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	ldr r0, _0201712C ; =_020AF760
	str r2, [sp, #0xc]
	ldr r0, [r0, #8]
	mov r1, #0xc
	mov r3, #0x100
	add r0, r0, #0x98
	bl SetAnimationForAnimationControl
	ldr r0, _0201712C ; =_020AF760
	mov r4, #0xd0
	ldr r2, [r0, #8]
	mov r3, #0x6a
	strh r4, [r2, #0xb4]
	ldr r2, [r0, #8]
	mov r1, #0
	strh r3, [r2, #0xb6]
	ldr r0, [r0, #8]
	add r0, r0, #0x98
	bl sub_0201D12C
	ldr r0, _0201712C ; =_020AF760
	ldr r5, _0201713C ; =_02098FC8
	ldr r7, [r0, #8]
	mov sb, #0
	add r6, r7, #0x114
	mov fp, #1
_02016FB0:
	mov r0, #0x7c
	mla r8, sb, r0, r6
	mov r0, r8
	bl InitAnimationControlWithSet__0201C0B0
	ldrsh r1, [r7, #0x94]
	mov r0, r8
	bl SetSpriteIdForAnimationControl
	mov r0, #0xc
	mul r4, sb, r0
	add sl, r5, r4
	bl Rand16Bit
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #25
	str fp, [sp]
	add r0, r1, r0, ror #25
	stmib sp, {r0, fp}
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [r5, r4]
	mov r0, r8
	mov r2, #0
	mov r3, #0x100
	bl SetAnimationForAnimationControl
	ldr r1, [sl, #4]
	mov r0, r8
	strh r1, [r8, #0x1c]
	ldr r2, [sl, #8]
	mov r1, #0
	strh r2, [r8, #0x1e]
	bl sub_0201D12C
	add sb, sb, #1
	cmp sb, #7
	blt _02016FB0
	ldr r0, _0201712C ; =_020AF760
	ldr r4, _02017140 ; =_02099080
	ldr r7, [r0, #8]
	mov sb, #0
	add r0, r7, #0x7c
	add r6, r0, #0x400
	mov r5, #0x40
	mov fp, #0xc
_02017054:
	mov r0, #0x7c
	mla r8, sb, r0, r6
	mov r0, r8
	bl InitAnimationControlWithSet__0201C0B0
	ldrsh r1, [r7, #0x96]
	mov r0, r8
	bl SetSpriteIdForAnimationControl
	strh r5, [r8, #0x38]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mul r0, sb, fp
	mov r2, #0
	ldr r1, [r4, r0]
	add sl, r4, r0
	mov r0, r8
	mov r3, r2
	bl SetAnimationForAnimationControl
	ldr r0, [sl, #4]
	cmp sb, #6
	strh r0, [r8, #0x1c]
	ldr r0, [sl, #8]
	strh r0, [r8, #0x1e]
	blt _020170D8
	add r3, r7, sb, lsl #2
	ldr r2, [r3, #0xa34]
	mov r0, r8
	mov r1, #0
	str r2, [r3, #0xa4c]
	bl sub_0201D12C
	b _020170FC
_020170D8:
	bl Rand16Bit
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #28
	add r2, r1, r0, ror #28
	add r1, r7, sb, lsl #2
	str r2, [r1, #0xa4c]
	mov r0, r8
	mov r1, #1
	bl sub_0201D12C
_020170FC:
	add sb, sb, #1
	cmp sb, #0xc
	blt _02017054
	mov r0, #2
	bl sub_0206AA5C
	bl sub_0206AB98
	bl sub_0206ABB0
	mov r0, #0x2d
	bl sub_0206ADA0
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02017128: .word 0x00000A7C
_0201712C: .word _020AF760
_02017130: .word WAN_TABLE
_02017134: .word _02099110
_02017138: .word _02099124
_0201713C: .word _02098FC8
_02017140: .word _02099080
	arm_func_end sub_02016EAC

	arm_func_start sub_02017144
sub_02017144: ; 0x02017144
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x104
	mov r2, r0
	mov r4, r1
	mov r1, r2
	add r0, sp, #4
	mov r2, #1
	bl sub_020175F8
	mov r1, #0
	str r1, [sp]
	ldr r0, _02017310 ; =_020AF760
	add r3, sp, #4
	ldr r0, [r0, #4]
	mov r1, r4
	mov r2, #2
	bl sub_0201770C
	bl sub_020164AC
	ldr r0, _02017310 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x150]
	bl sub_0201F36C
	ldr r1, _02017310 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x90]
	bl sub_0201F36C
	ldr r1, _02017310 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0xc0]
	bl sub_0201F36C
	ldr r2, _02017310 ; =_020AF760
	ldr r1, [r2, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x60]
	ldr r1, [r2, #4]
	add r0, r1, #0x90
	add r5, r0, #0xb000
	add r0, r1, #0xb000
	ldrsh r0, [r0, #0x90]
	bl sub_0201F324
	mov r1, #0
	mov r4, r0
	strb r1, [r4, #0x3c]
	sub r2, r1, #0x100
	strh r2, [r4]
	mov r2, #0x20
	strh r2, [r4, #2]
	mov r2, #1
	strb r2, [r4, #0x3e]
	mov r3, #0x21
	strh r3, [r4, #0x2a]
	mov r3, #2
	bl sub_0201604C
	ldrsh r0, [r4]
	mov r2, #0x2000
	mov r1, #0xff00
	mov r0, r0, lsl #8
	str r0, [r5, #4]
	ldrsh r3, [r4, #2]
	ldr r0, _02017310 ; =_020AF760
	mov r3, r3, lsl #8
	str r3, [r5, #8]
	str r2, [r5, #0xc]
	ldr r2, [r5, #8]
	str r2, [r5, #0x10]
	str r1, [r5, #0x24]
	ldr r1, [r0, #4]
	add r0, r1, #0x30c0
	add r5, r0, #0x8000
	add r0, r1, #0xb000
	ldrsh r0, [r0, #0xc0]
	bl sub_0201F324
	mov r4, r0
	mov r2, #0
	strb r2, [r4, #0x3c]
	mov r1, #0x180
	strh r1, [r4]
	mov r1, #0x52
	strh r1, [r4, #2]
	mov r1, #0x80
	strh r1, [r4, #8]
	strh r2, [r4, #0xa]
	mov r1, #0x21
	strh r1, [r4, #0x2a]
	mov r1, #1
	strb r1, [r4, #0x3e]
	mov r1, #0x1000
	mov r3, #2
	bl sub_0201604C
	ldrsh r1, [r4]
	mov r2, #0x8000
	mov r0, #0xff00
	mov r1, r1, lsl #8
	str r1, [r5, #4]
	ldrsh r4, [r4, #2]
	ldr r1, _02017310 ; =_020AF760
	mov r3, #0x100
	mov r4, r4, lsl #8
	str r4, [r5, #8]
	str r2, [r5, #0xc]
	ldr r4, [r5, #8]
	mov r2, #0x10
	str r4, [r5, #0x10]
	str r0, [r5, #0x24]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	str r3, [r0, #0x154]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	str r2, [r0, #0x20]
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02017310: .word _020AF760
	arm_func_end sub_02017144

	arm_func_start sub_02017314
sub_02017314: ; 0x02017314
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r0, _02017588 ; =_020AF760
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0201757C
	bl sub_0206ADB8
	bl sub_0206AD4C
	cmp r0, #0
	bne _0201757C
	ldr r0, _02017588 ; =_020AF760
	mov r2, #1
	ldmib r0, {r3, r4}
	add r1, r3, #0xb000
	add r0, r3, #0x90
	ldr r1, [r1, #0x154]
	add r0, r0, #0xb000
	bl sub_020177AC
	ldr r0, _02017588 ; =_020AF760
	mov r2, #1
	ldr r0, [r0, #4]
	add r1, r0, #0xb000
	add r0, r0, #0x30c0
	ldr r1, [r1, #0x154]
	add r0, r0, #0x8000
	bl sub_020177AC
	ldr r1, _02017588 ; =_020AF760
	ldr r5, [r1, #4]
	add r0, r5, #0xb000
	ldr r3, [r0, #0x20]
	cmp r3, #0x13
	bhi _020173BC
	subs r2, r3, #0x10
	addpl pc, pc, r2, lsl #2
	b _020173B0
_020173A0: ; jump table
	b _020173D0 ; case 0
	b _020173FC ; case 1
	b _02017438 ; case 2
	b _02017464 ; case 3
_020173B0:
	cmp r3, #0
	beq _020173C8
	b _020174A8
_020173BC:
	cmp r3, #0xff
	beq _020174A0
	b _020174A8
_020173C8:
	mov r0, #0
	b _02017580
_020173D0:
	mov r2, #1
	strb r2, [r0, #0xb8]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	strb r2, [r0, #0xe8]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x20]
	add r1, r1, #1
	str r1, [r0, #0x20]
	b _020174A8
_020173FC:
	ldr r1, [r0, #0xd4]
	cmp r1, #0
	ldrne r0, [r0, #0xa4]
	cmpne r0, #0
	bne _020174A8
	add r0, r5, #0xb000
	ldr r2, [r0, #0x20]
	ldr r1, _02017588 ; =_020AF760
	add r2, r2, #1
	str r2, [r0, #0x20]
	ldr r0, [r1, #4]
	mov r1, #0x14
	add r0, r0, #0xb000
	str r1, [r0, #0x150]
	b _020174A8
_02017438:
	ldr r2, [r0, #0x150]
	sub r2, r2, #1
	str r2, [r0, #0x150]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x150]
	cmp r1, #0
	ldreq r1, [r0, #0x20]
	addeq r1, r1, #1
	streq r1, [r0, #0x20]
	b _020174A8
_02017464:
	add r0, r4, #0x98
	bl sub_0201CF5C
	add r0, r4, #0x98
	bl sub_0201D1B0
	cmp r0, #0
	bne _020174A8
	ldr r0, _02017588 ; =_020AF760
	mov r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	ldr r2, [r0, #0x20]
	add r2, r2, #1
	str r2, [r0, #0x20]
	strb r1, [r4, #0x478]
	b _020174A8
_020174A0:
	mov r0, #2
	b _02017580
_020174A8:
	ldrb r0, [r4, #0x478]
	cmp r0, #0
	beq _020174D4
	mov r7, #0
	add r6, r4, #0x114
	mov r5, #0x7c
_020174C0:
	mla r0, r7, r5, r6
	bl sub_0201CF5C
	add r7, r7, #1
	cmp r7, #7
	blt _020174C0
_020174D4:
	mov r8, #0
	add r0, r4, #0x7c
	add r7, r0, #0x400
	mov fp, r8
	mov r6, #1
	mov r5, #0x7c
_020174EC:
	add r1, r4, r8, lsl #2
	ldr r0, [r1, #0xa4c]
	cmp r0, #0
	bne _02017560
	mla sb, r8, r5, r7
	mov r0, sb
	bl sub_0201D1B0
	cmp r0, #0
	bne _02017554
	ldrsh sl, [sb, #0x78]
	cmp sl, #0
	beq _02017554
	and r0, sl, #1
	cmp r0, #1
	mov r0, sb
	addeq sl, sl, #1
	bl sub_0201C108
	str fp, [sp]
	str fp, [sp, #4]
	str r6, [sp, #8]
	mov r0, sb
	mov r1, sl
	mov r2, fp
	mov r3, fp
	str fp, [sp, #0xc]
	bl SetAnimationForAnimationControl
_02017554:
	mov r0, sb
	bl sub_0201CF5C
	b _02017568
_02017560:
	sub r0, r0, #1
	str r0, [r1, #0xa4c]
_02017568:
	add r8, r8, #1
	cmp r8, #0xc
	blt _020174EC
	mov r0, #1
	b _02017580
_0201757C:
	mov r0, #0
_02017580:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02017588: .word _020AF760
	arm_func_end sub_02017A00

	arm_func_start sub_0201758C
sub_0201758C: ; 0x0201758C
	stmdb sp!, {r3, lr}
	ldr r0, _020175F0 ; =_020AF760
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _020175E4
	ldr r0, _020175F4 ; =WAN_TABLE
	ldrsh r1, [r1, #0x94]
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
	ldr r0, _020175F0 ; =_020AF760
	ldr r1, _020175F4 ; =WAN_TABLE
	ldr r2, [r0, #8]
	ldr r0, [r1]
	ldrsh r1, [r2, #0x96]
	bl DeleteWanTableEntryVeneer
	ldr r0, _020175F0 ; =_020AF760
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, _020175F0 ; =_020AF760
	mov r1, #0
	str r1, [r0, #8]
	bl ov10_022BDADC
_020175E4:
	bl sub_0206BA5C
	bl sub_02016BB8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020175F0: .word _020AF760
_020175F4: .word WAN_TABLE
	arm_func_end sub_0201758C

	arm_func_start sub_020175F8
sub_020175F8: ; 0x020175F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x80
#ifdef JAPAN
	mov r8, r0
	cmp r2, #0
	movne r7, #0x3a
	mov sb, r1
	mvn r0, #0
	moveq r7, #0x38
	cmp sb, r0
	beq _02017708
	mov r0, sb
	mov r1, #0x64
	add r4, sp, #0
	bl _u32_div_f
	and r6, r0, #0xff
	mov r0, sb
	mov r1, #0xa
	bl _u32_div_f
	and r5, r0, #0xff
	mov r0, sb
	mov r1, #0xa
	bl _u32_div_f
	cmp r6, #0
	and r2, r1, #0xff
	addne r0, r6, #0x4f
	movne r1, #0x82
	strneb r1, [r4]
	strneb r0, [r4, #1]
	addne r4, r4, #2
	cmp r5, #0
	beq _020176B4
	mov r0, #0x82
	strb r0, [r4]
	add r0, r5, #0x4f
	strb r0, [r4, #1]
	add r4, r4, #2
	b _020176CC_JP
_020176B4:
	cmp r6, #0
	movne r0, #0x82
	strneb r0, [r4]
	addne r0, r5, #0x4f
	strneb r0, [r4, #1]
	addne r4, r4, #2
_020176CC_JP:
	mov r0, #0x82
	strb r0, [r4]
	add r2, r2, #0x4f
	strb r2, [r4, #1]
	mov r2, #0
	add r0, sp, #0x40
	mov r1, r7
	strb r2, [r4, #2]
	bl GetStringFromFileVeneer
	ldr r1, _020176DC ; =_02099138
	add r2, sp, #0x40
	add r3, sp, #0
	mov r0, r8
	bl SprintfStatic__020176E4
	b _020176CC
_02017708:
	add r0, sp, #0
	mov r1, #0x39
	bl GetStringFromFileVeneer
	add r0, sp, #0x40
	mov r1, r7
	bl GetStringFromFileVeneer
	ldr r1, _020176DC ; =_02099138
	add r2, sp, #0x40
	add r3, sp, #0
	mov r0, r8
#else
	cmp r2, #0
	ldrne r5, _020176D4 ; =0x00000171
	mov r6, r0
	mov sb, r1
	mvn r0, #0
	ldreq r5, _020176D8 ; =0x0000016F
	cmp sb, r0
	beq _020176B0
	mov r0, sb
	mov r1, #0x64
	add r4, sp, #0
	bl _u32_div_f
	and r8, r0, #0xff
	mov r0, sb
	mov r1, #0xa
	bl _u32_div_f
	and r7, r0, #0xff
	mov r0, sb
	mov r1, #0xa
	bl _u32_div_f
	cmp r8, #0
	addne r0, r8, #0x30
	strneb r0, [r4], #1
	cmp r7, #0
	addne r0, r7, #0x30
	and r1, r1, #0xff
	strneb r0, [r4], #1
	bne _0201767C
	cmp r8, #0
	addne r0, r7, #0x30
	strneb r0, [r4], #1
_0201767C:
	add r2, r1, #0x30
	strb r2, [r4]
	mov r2, #0
	add r0, sp, #0x40
	mov r1, r5
	strb r2, [r4, #1]
	bl GetStringFromFileVeneer
	ldr r1, _020176DC ; =_02099138
	add r2, sp, #0x40
	add r3, sp, #0
	mov r0, r6
	bl SprintfStatic__020176E4
	b _020176CC
_020176B0:
	add r0, sp, #0x40
	mov r1, #0x170
	bl GetStringFromFileVeneer
	ldr r1, _020176E0 ; =_02099140
	add r2, sp, #0x40
	mov r0, r6
#endif
	bl SprintfStatic__020176E4
_020176CC:
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_020176DC: .word _02099138
#else
_020176D4: .word 0x00000171
_020176D8: .word 0x0000016F
_020176DC: .word _02099138
_020176E0: .word _02099140
#endif
	arm_func_end sub_020175F8

	arm_func_start SprintfStatic__020176E4
SprintfStatic__020176E4: ; 0x020176E4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__020176E4

	arm_func_start sub_0201770C
sub_0201770C: ; 0x0201770C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r1, #0x6000
	mov r7, r0
	mov r5, r2
	mov r4, r3
	bl MemZero
	ldr r2, [sp, #0x18]
	mov r1, #0
	mov r0, r7
	str r2, [sp]
	mov r2, r1
	mov r3, r4
	bl sub_0201578C
	add r0, r7, #0x6000
	mov r1, r7
	mov r2, #0x20
	bl sub_02015FDC
	add r0, r7, #0x6000
	mov r1, #0
	mov r2, #0x1000
	bl sub_02016038
	mov r0, r7
	mov r1, #0x6000
	bl MemZero
	str r5, [sp]
	mov r3, r6
	mov r0, r7
	mov r1, #0
	mov r2, r1
	bl sub_0201578C
	add r0, r7, #0x7000
	mov r1, r7
	mov r2, #0x80
	bl sub_02015FDC
	add r0, r7, #0x7000
	mov r1, #0x1000
	mov r2, #0x4000
	bl sub_02016038
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0201770C

	arm_func_start sub_020177AC
sub_020177AC: ; 0x020177AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldrsh r0, [r6]
	mov r5, r1
	mov r7, r2
	bl sub_0201F324
	ldrb r1, [r6, #0x28]
	mov r4, r0
	cmp r1, #1
	beq _020177E8
	cmp r1, #2
	beq _02017848
	cmp r1, #3
	beq _02017858
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020177E8:
	cmp r7, #0
	mov r3, #0x80
	beq _02017820
	mov r0, #0
	str r0, [sp]
	ldr r1, [r6, #4]
	ldr r2, [r6, #0xc]
	add r0, r6, #0x14
	bl ov10_022C2528
	cmp r0, #0
	ldrneb r0, [r6, #0x28]
	addne r0, r0, #1
	strneb r0, [r6, #0x28]
	b _02017868
_02017820:
	str r3, [sp]
	ldr r1, [r6, #4]
	ldr r2, [r6, #0xc]
	add r0, r6, #0x14
	bl ov10_022C2528
	cmp r0, #0
	ldrneb r0, [r6, #0x28]
	addne r0, r0, #1
	strneb r0, [r6, #0x28]
	b _02017868
_02017848:
	cmp r5, #0
	addeq r0, r1, #1
	streqb r0, [r6, #0x28]
	b _02017868
_02017858:
	mov r0, #0xff
	strb r0, [r6, #0x28]
	mov r0, #0
	str r0, [r6, #0x14]
_02017868:
	ldr r2, [r6, #4]
	ldr r0, [r6, #0x14]
	mov r1, r5
	add r2, r2, r0
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	str r2, [r6, #4]
	mov r0, r0, asr #8
	strh r0, [r4]
	ldr r2, [r6, #0x24]
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	mov r0, r0, asr #8
	bl MultiplyByFixedPoint
	strb r0, [r4, #0x2f]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020177AC

	arm_func_start sub_020178A8
sub_020178A8: ; 0x020178A8
	stmdb sp!, {r4, r5, r6, r7, lr}
#ifdef EUROPE
	sub sp, sp, #0x254
	mov r4, r1
	and r1, r4, #0xff
	mov r7, r0
	bl sub_0204F77C
	mov r5, r0
	cmp r5, r7
	and r6, r4, #0xff
	beq _020179BC
	bl GetNbFloors
	cmp r0, #1
	moveq r6, #0
_020179BC:
	mov r1, r7
	and r2, r4, #0xff
	mov r0, #2
	bl sub_0204F6F8
	mov r4, r0
	add r0, sp, #4
	bl InitPreprocessorArgs
	mov r0, r5
	bl DungeonGoesUp
	cmp r0, #0
	movne r2, r6
	rsbeq r2, r6, #0
	ldr r1, _020179FC ; =_020AF76C
	add r0, sp, #0x54
	str r2, [sp, #0x28]
	bl SprintfStatic__02017A40
	add r5, sp, #4
	add r0, sp, #0x154
	add r2, sp, #0x54
	mov r1, #0x100
	mov r3, #0
	str r5, [sp]
	bl PreprocessString
	bl sub_02015570
	cmp r6, #0
	mov r0, r4
	beq _02017A70
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	add r0, r1, #0x38
	rsb r5, r0, #0xc0
	mov r0, r5, asr #1
	mov r1, r4
	bl sub_02015E44
	sub r1, r0, #1
	mov r0, #0x18
	mul r0, r1, r0
	add r0, r0, r5, asr #1
	add r1, r0, #0x20
	add r2, sp, #0x154
	mov r0, #0
	mov r3, #2
	bl sub_02015D18
	b _02017A8C
_02017A70:
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	rsb r0, r1, #0xc0
	mov r1, r4
	mov r0, r0, asr #1
	bl sub_02015E44
_02017A8C:
	bl sub_02015E6C
	add sp, sp, #0x254
#else
	sub sp, sp, #0x104
	mov r5, r1
	and r1, r5, #0xff
	mov r7, r0
	bl sub_0204F77C
	mov r6, r0
	cmp r6, r7
	and r4, r5, #0xff
	beq _020178DC
	bl GetNbFloors
	cmp r0, #1
	moveq r4, #0
_020178DC:
	mov r1, r7
	and r2, r5, #0xff
	mov r0, #2
	bl sub_0204F6F8
	mov r5, r0
	mov r0, r6
	bl DungeonGoesUp
	cmp r0, #0
	ldrne r0, _020179FC ; =_020AF76C
	ldrne r7, [r0]
	ldreq r0, _020179FC ; =_020AF76C
	ldreq r7, [r0, #4]
	cmp r4, #0xa
	blo _02017954
	mov r0, r4
	mov r1, #0xa
	bl _s32_div_f
	mov r6, r0
	mov r0, r4
	mov r1, #0xa
	bl _s32_div_f
	add r1, r1, #0x30
	ldr r0, _020179FC ; =_020AF76C
	str r1, [sp]
	ldr r1, [r0, #8]
	add r0, sp, #4
	mov r2, r7
	add r3, r6, #0x30
	bl SprintfStatic__02017A40
	b _0201797C
_02017954:
	cmp r4, #0
	moveq r0, #0
	streqb r0, [sp, #4]
	beq _0201797C
	ldr r1, _020179FC ; =_020AF76C
	add r0, sp, #4
	ldr r1, [r1, #0xc]
	mov r2, r7
	add r3, r4, #0x30
	bl SprintfStatic__02017A40
_0201797C:
	bl sub_02015570
	cmp r4, #0
	mov r0, r5
	beq _020179D4
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	add r0, r1, #0x38
	rsb r4, r0, #0xc0
	mov r0, r4, asr #1
	mov r1, r5
	bl sub_02015E44
	sub r1, r0, #1
	mov r0, #0x18
	mul r0, r1, r0
	add r0, r0, r4, asr #1
	add r1, r0, #0x20
	add r2, sp, #4
	mov r0, #0
	mov r3, #2
	bl sub_02015D18
	b _020179F0
_020179D4:
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	rsb r0, r1, #0xc0
	mov r1, r5
	mov r0, r0, asr #1
	bl sub_02015E44
_020179F0:
	bl sub_02015E6C
	add sp, sp, #0x104
#endif
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef EUROPE
_020179FC: .word _0209958C
#else
_020179FC: .word _020AF76C
#endif
	arm_func_end sub_020178A8

	arm_func_start sub_02017A00
sub_02017A00: ; 0x02017A00
	stmdb sp!, {r3, lr}
	bl sub_02015570
	ldr r1, _02017A1C ; =0x000044BD
	mov r0, #0x3e
	bl sub_02015E44
	bl sub_02015E6C
	ldmia sp!, {r3, pc}
	.align 2, 0
#if defined(EUROPE)
_02017A1C: .word 0x000044BF
#elif defined(JAPAN)
_02017A1C: .word 0x0000076D
#else
_02017A1C: .word 0x000044BD
#endif
	arm_func_end sub_02017A00

	arm_func_start sub_02017A20
sub_02017A20: ; 0x02017A20
	stmdb sp!, {r3, lr}
	bl sub_02015570
#ifdef JAPAN
	mov r0, #0x3e
	add r1, r0, #0x730
#else
	ldr r1, _02017A3C ; =0x000044BE
	mov r0, #0x3e
#endif
	bl sub_02015E44
	bl sub_02015E6C
	ldmia sp!, {r3, pc}
	.align 2, 0
#if defined(EUROPE)
_02017A3C: .word 0x000044C0
#elif !defined(JAPAN)
_02017A3C: .word 0x000044BE
#endif
	arm_func_end sub_02017A20

	arm_func_start SprintfStatic__02017A40
SprintfStatic__02017A40: ; 0x02017A40
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__02017A40

	arm_func_start sub_02017A68
sub_02017A68: ; 0x02017A68
	ldr r0, _02017A7C ; =_022A4BE8
	mov r1, #0
	strh r1, [r0, #2]
	strh r1, [r0]
	bx lr
	.align 2, 0
_02017A7C: .word _022A4BE8
	arm_func_end sub_02017A68

	arm_func_start sub_02017A80
sub_02017A80: ; 0x02017A80
	ldr r0, _02017AAC ; =_022A4BE8
	ldrsh r1, [r0, #2]
	cmp r1, #0
	subgt r1, r1, #1
	strgth r1, [r0, #2]
	ldr r0, _02017AAC ; =_022A4BE8
	ldrsh r1, [r0]
	cmp r1, #0
	subgt r1, r1, #1
	strgth r1, [r0]
	bx lr
	.align 2, 0
_02017AAC: .word _022A4BE8
	arm_func_end sub_02017A80

	arm_func_start sub_02017AB0
sub_02017AB0: ; 0x02017AB0
	stmdb sp!, {r3, lr}
	bl StopBgmCommand
	bl sub_02018118
	bl sub_02018278
	mov r0, #0x3f00
	bl sub_02018428
	ldmia sp!, {r3, pc}
	arm_func_end sub_02017AB0

	arm_func_start sub_02017ACC
sub_02017ACC: ; 0x02017ACC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02017F28
	mov r0, r4
	bl sub_02018158
	ldr r0, _02017AFC ; =0x000003E6
	mov r1, r4
	bl sub_02018460
	mov r1, r4
	mov r0, #0x3f00
	bl sub_02018460
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017AFC: .word 0x000003E6
	arm_func_end sub_02017ACC

	arm_func_start sub_02017B00
sub_02017B00: ; 0x02017B00
	ldr ip, _02017B08 ; =sub_02017D80
	bx ip
	.align 2, 0
_02017B08: .word sub_02017D80
	arm_func_end sub_02017B00

	arm_func_start sub_02017B0C
sub_02017B0C: ; 0x02017B0C
	ldr ip, _02017B14 ; =sub_02017DE8
	bx ip
	.align 2, 0
_02017B14: .word sub_02017DE8
	arm_func_end sub_02017B0C

	arm_func_start sub_02017B18
sub_02017B18: ; 0x02017B18
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02017D80
	ldr r1, _02017B54 ; =0x000003E7
	cmp r4, r1
	bne _02017B40
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	b _02017B4C
_02017B40:
	cmp r0, r4
	moveq r0, #1
	movne r0, #0
_02017B4C:
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017B54: .word 0x000003E7
	arm_func_end sub_02017B18

	arm_func_start PlayBgmByIdVeneer
PlayBgmByIdVeneer: ; 0x02017B58
	ldr ip, _02017B60 ; =PlayBgmById
	bx ip
	.align 2, 0
_02017B60: .word PlayBgmById
	arm_func_end PlayBgmByIdVeneer

	arm_func_start PlayBgmByIdVolumeVeneer
PlayBgmByIdVolumeVeneer: ; 0x02017B64
	ldr ip, _02017B6C ; =PlayBgmByIdVolume
	bx ip
	.align 2, 0
_02017B6C: .word PlayBgmByIdVolume
	arm_func_end PlayBgmByIdVolumeVeneer

	arm_func_start sub_02017B70
sub_02017B70: ; 0x02017B70
	ldr ip, _02017B78 ; =StopBgmCommand
	bx ip
	.align 2, 0
_02017B78: .word StopBgmCommand
	arm_func_end sub_02017B70

	arm_func_start sub_02017B7C
sub_02017B7C: ; 0x02017B7C
	ldr ip, _02017B84 ; =sub_02017F28
	bx ip
	.align 2, 0
_02017B84: .word sub_02017F28
	arm_func_end sub_02017B7C

	arm_func_start sub_02017B88
sub_02017B88: ; 0x02017B88
	ldr ip, _02017B90 ; =sub_02017F64
	bx ip
	.align 2, 0
_02017B90: .word sub_02017F64
	arm_func_end sub_02017B88

	arm_func_start sub_02017B94
sub_02017B94: ; 0x02017B94
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02017FBC
	ldr r1, _02017BD0 ; =0x000003E7
	cmp r4, r1
	bne _02017BBC
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	b _02017BC8
_02017BBC:
	cmp r0, r4
	moveq r0, #1
	movne r0, #0
_02017BC8:
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017BD0: .word 0x000003E7
	arm_func_end sub_02017B94

	arm_func_start sub_02017BD4
sub_02017BD4: ; 0x02017BD4
	ldr ip, _02017BDC ; =sub_02018024
	bx ip
	.align 2, 0
_02017BDC: .word sub_02018024
	arm_func_end sub_02017BD4

	arm_func_start sub_02017BE0
sub_02017BE0: ; 0x02017BE0
	ldr ip, _02017BE8 ; =sub_020180A0
	bx ip
	.align 2, 0
_02017BE8: .word sub_020180A0
	arm_func_end sub_02017BE0

	arm_func_start sub_02017BEC
sub_02017BEC: ; 0x02017BEC
	ldr ip, _02017BF4 ; =sub_02018118
	bx ip
	.align 2, 0
_02017BF4: .word sub_02018118
	arm_func_end sub_02017BEC

	arm_func_start sub_02017BF8
sub_02017BF8: ; 0x02017BF8
	ldr ip, _02017C00 ; =sub_02018158
	bx ip
	.align 2, 0
_02017C00: .word sub_02018158
	arm_func_end sub_02017BF8

	arm_func_start sub_02017C04
sub_02017C04: ; 0x02017C04
	ldr ip, _02017C0C ; =sub_02018194
	bx ip
	.align 2, 0
_02017C0C: .word sub_02018194
	arm_func_end sub_02017C04

	arm_func_start sub_02017C10
sub_02017C10: ; 0x02017C10
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020181E0
	ldr r1, _02017C4C ; =0x000003E6
	cmp r4, r1
	bne _02017C38
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	b _02017C44
_02017C38:
	cmp r0, r4
	moveq r0, #1
	movne r0, #0
_02017C44:
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017C4C: .word 0x000003E6
	arm_func_end sub_02017C10

	arm_func_start sub_02017C50
sub_02017C50: ; 0x02017C50
	ldr ip, _02017C58 ; =sub_0201820C
	bx ip
	.align 2, 0
_02017C58: .word sub_0201820C
	arm_func_end sub_02017C50

	arm_func_start sub_02017C5C
sub_02017C5C: ; 0x02017C5C
	ldr ip, _02017C64 ; =sub_02018278
	bx ip
	.align 2, 0
_02017C64: .word sub_02018278
	arm_func_end sub_02017C5C

	arm_func_start sub_02017C68
sub_02017C68: ; 0x02017C68
	ldr ip, _02017C70 ; =sub_020182AC
	bx ip
	.align 2, 0
_02017C70: .word sub_020182AC
	arm_func_end sub_02017C68

	arm_func_start sub_02017C74
sub_02017C74: ; 0x02017C74
	ldr ip, _02017C7C ; =PlaySeByIdVolume
	bx ip
	.align 2, 0
_02017C7C: .word PlaySeByIdVolume
	arm_func_end sub_02017C74

	arm_func_start sub_02017C80
sub_02017C80: ; 0x02017C80
	ldr ip, _02017C8C ; =PlaySeByIdVolume
	mov r1, #0x100
	bx ip
	.align 2, 0
_02017C8C: .word PlaySeByIdVolume
	arm_func_end sub_02017C80

	arm_func_start sub_02017C90
sub_02017C90: ; 0x02017C90
	ldr ip, _02017C98 ; =sub_0201831C
	bx ip
	.align 2, 0
_02017C98: .word sub_0201831C
	arm_func_end sub_02017C90

	arm_func_start sub_02017C9C
sub_02017C9C: ; 0x02017C9C
	ldr ip, _02017CA4 ; =sub_020183A0
	bx ip
	.align 2, 0
_02017CA4: .word sub_020183A0
	arm_func_end sub_02017C9C

	arm_func_start sub_02017CA8
sub_02017CA8: ; 0x02017CA8
	ldr ip, _02017CB0 ; =sub_020183E4
	bx ip
	.align 2, 0
_02017CB0: .word sub_020183E4
	arm_func_end sub_02017CA8

	arm_func_start sub_02017CB4
sub_02017CB4: ; 0x02017CB4
	ldr ip, _02017CBC ; =sub_02018428
	bx ip
	.align 2, 0
_02017CBC: .word sub_02018428
	arm_func_end sub_02017CB4

	arm_func_start sub_02017CC0
sub_02017CC0: ; 0x02017CC0
	ldr ip, _02017CC8 ; =sub_02018460
	bx ip
	.align 2, 0
_02017CC8: .word sub_02018460
	arm_func_end sub_02017CC0

	arm_func_start PlaySeVolumeWrapper
PlaySeVolumeWrapper: ; 0x02017CCC
	ldr r1, _02017CE4 ; =_0209915C
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	ldr ip, _02017CE8 ; =PlaySeByIdVolume
	mov r1, #0x100
	bx ip
	.align 2, 0
_02017CE4: .word _0209915C
_02017CE8: .word PlaySeByIdVolume
	arm_func_end PlaySeVolumeWrapper

	arm_func_start sub_02017CEC
sub_02017CEC: ; 0x02017CEC
	stmdb sp!, {r3, lr}
	ldr r2, _02017D18 ; =_022A4BE8
	ldrsh r0, [r2]
	cmp r0, #0
	ldmgtia sp!, {r3, pc}
	ldr r0, _02017D1C ; =0x00003F05
	mov r3, #3
	mov r1, #0x100
	strh r3, [r2]
	bl PlaySeByIdVolume
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017D18: .word _022A4BE8
_02017D1C: .word 0x00003F05
	arm_func_end sub_02017CEC

	arm_func_start sub_02017D20
sub_02017D20: ; 0x02017D20
	stmdb sp!, {r3, lr}
	bl sub_020184CC
	bl sub_02018B50
	ldr r2, _02017D74 ; =0x000003E7
	ldr r0, _02017D78 ; =_022A4BEC
	mov r1, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	sub r1, r2, #1
	strh r1, [r0, #0xc]
	mov r1, #0x3f00
	strh r1, [r0, #0x10]
	bl sub_02018C0C
	ldr r0, _02017D7C ; =_020AF77C
	mov r1, #1
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017D74: .word 0x000003E7
_02017D78: .word _022A4BEC
_02017D7C: .word _020AF77C
	arm_func_end sub_02017D20

	arm_func_start sub_02017D80
sub_02017D80: ; 0x02017D80
	stmdb sp!, {r3, lr}
	bl sub_02019824
	ldr r2, _02017DAC ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02017DB0 ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1]
	ldrne r0, _02017DB0 ; =_022A4BEC
	streqh r2, [r1, #2]
	ldrneh r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017DAC: .word 0x000003E7
_02017DB0: .word _022A4BEC
	arm_func_end sub_02017D80

	arm_func_start sub_02017DB4
sub_02017DB4: ; 0x02017DB4
	stmdb sp!, {r3, lr}
	bl sub_02019824
	ldr r2, _02017DE0 ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02017DE4 ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1]
	ldrne r0, _02017DE4 ; =_022A4BEC
	streqh r2, [r1, #2]
	ldrneh r0, [r0, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017DE0: .word 0x000003E7
_02017DE4: .word _022A4BEC
	arm_func_end sub_02017DB4

	arm_func_start sub_02017DE8
sub_02017DE8: ; 0x02017DE8
	ldr ip, _02017DF0 ; =IsSongOver
	bx ip
	.align 2, 0
_02017DF0: .word IsSongOver
	arm_func_end sub_02017DE8

	arm_func_start PlayBgmById
PlayBgmById: ; 0x02017DF4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02017E68 ; =0x000003E7
	mov r5, r0
	cmp r5, r1
	ldrne r0, _02017E6C ; =_022A4BEC
	ldrneh r0, [r0, #2]
	cmpne r5, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _02017E6C ; =_022A4BEC
	mov r2, #0x100
	strh r5, [r1]
	strh r5, [r1, #2]
	mov r0, #3
	strh r2, [r1, #4]
	bl AllocAudioCommand
	mov r4, r0
	mov r0, #3
	strh r5, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r1, #0
	moveq r1, #0x100
	strh r1, [r4, #6]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02017E68: .word 0x000003E7
_02017E6C: .word _022A4BEC
	arm_func_end PlayBgmById

	arm_func_start PlayBgmByIdVolume
PlayBgmByIdVolume: ; 0x02017E70
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02017EE0 ; =0x000003E7
	mov r6, r0
	cmp r6, r3
	ldrne r0, _02017EE4 ; =_022A4BEC
	mov r5, r1
	ldrneh r0, [r0, #2]
	mov r4, r2
	cmpne r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_02018B50
	ldr r1, _02017EE4 ; =_022A4BEC
	mov r0, #3
	strh r6, [r1]
	strh r6, [r1, #2]
	strh r4, [r1, #4]
	bl AllocAudioCommand
	mov r7, r0
	mov r0, #3
	strh r6, [r7, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r4, #0
	strh r4, [r7, #6]
	mov r0, r7
	strh r5, [r7, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02017EE0: .word 0x000003E7
_02017EE4: .word _022A4BEC
	arm_func_end PlayBgmByIdVolume

	arm_func_start StopBgmCommand
StopBgmCommand: ; 0x02017EE8
	stmdb sp!, {r3, lr}
	bl sub_02018B50
	ldr r0, _02017F20 ; =0x000003E7
	ldr r1, _02017F24 ; =_022A4BEC
	mov r2, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	mov r0, #5
	strh r2, [r1, #4]
	bl AllocAudioCommand
	mov r1, #0
	strh r1, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017F20: .word 0x000003E7
_02017F24: .word _022A4BEC
	arm_func_end StopBgmCommand

	arm_func_start sub_02017F28
sub_02017F28: ; 0x02017F28
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02018B50
	ldr r2, _02017F5C ; =0x000003E7
	ldr r0, _02017F60 ; =_022A4BEC
	mov r1, #0
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	mov r0, #5
	bl AllocAudioCommand
	strh r4, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017F5C: .word 0x000003E7
_02017F60: .word _022A4BEC
	arm_func_end sub_02017F28

	arm_func_start sub_02017F64
sub_02017F64: ; 0x02017F64
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02017FA8 ; =_022A4BEC
	ldr r2, _02017FAC ; =0x000003E7
	ldrh r3, [r3, #2]
	mov r5, r0
	mov r4, r1
	cmp r3, r2
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _02017FA8 ; =_022A4BEC
	mov r0, #6
	strh r4, [r1, #4]
	bl AllocAudioCommand
	strh r4, [r0, #6]
	strh r5, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02017FA8: .word _022A4BEC
_02017FAC: .word 0x000003E7
	arm_func_end sub_02017F64

	arm_func_start sub_02017FB0
sub_02017FB0: ; 0x02017FB0
	ldr ip, _02017FB8 ; =sub_02019D04
	bx ip
	.align 2, 0
_02017FB8: .word sub_02019D04
	arm_func_end sub_02017FB0

	arm_func_start sub_02017FBC
sub_02017FBC: ; 0x02017FBC
	stmdb sp!, {r3, lr}
	bl sub_02019D58
	ldr r2, _02017FE8 ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02017FEC ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1, #6]
	ldrne r0, _02017FEC ; =_022A4BEC
	streqh r2, [r1, #8]
	ldrneh r0, [r0, #6]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017FE8: .word 0x000003E7
_02017FEC: .word _022A4BEC
	arm_func_end sub_02017FBC

	arm_func_start sub_02017FF0
sub_02017FF0: ; 0x02017FF0
	stmdb sp!, {r3, lr}
	bl sub_02019D58
	ldr r2, _0201801C ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02018020 ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1, #6]
	ldrne r0, _02018020 ; =_022A4BEC
	streqh r2, [r1, #8]
	ldrneh r0, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201801C: .word 0x000003E7
_02018020: .word _022A4BEC
	arm_func_end sub_02017FF0

	arm_func_start sub_02018024
sub_02018024: ; 0x02018024
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02018098 ; =0x000003E7
	mov r5, r0
	cmp r5, r1
	ldrne r0, _0201809C ; =_022A4BEC
	ldrneh r0, [r0, #8]
	cmpne r5, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _0201809C ; =_022A4BEC
	mov r2, #0x100
	strh r5, [r1, #6]
	strh r5, [r1, #8]
	mov r0, #7
	strh r2, [r1, #0xa]
	bl AllocAudioCommand
	mov r4, r0
	mov r0, #3
	strh r5, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r1, #0
	moveq r1, #0x100
	strh r1, [r4, #6]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018098: .word 0x000003E7
_0201809C: .word _022A4BEC
	arm_func_end sub_02018024

	arm_func_start sub_020180A0
sub_020180A0: ; 0x020180A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02018110 ; =0x000003E7
	mov r6, r0
	cmp r6, r3
	ldrne r0, _02018114 ; =_022A4BEC
	mov r5, r1
	ldrneh r0, [r0, #8]
	mov r4, r2
	cmpne r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_02018B50
	ldr r1, _02018114 ; =_022A4BEC
	mov r0, #7
	strh r6, [r1, #6]
	strh r6, [r1, #8]
	strh r4, [r1, #0xa]
	bl AllocAudioCommand
	mov r7, r0
	mov r0, #3
	strh r6, [r7, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r4, #0
	strh r4, [r7, #6]
	mov r0, r7
	strh r5, [r7, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02018110: .word 0x000003E7
_02018114: .word _022A4BEC
	arm_func_end sub_020180A0

	arm_func_start sub_02018118
sub_02018118: ; 0x02018118
	stmdb sp!, {r3, lr}
	bl sub_02018B50
	ldr r0, _02018150 ; =0x000003E7
	ldr r1, _02018154 ; =_022A4BEC
	mov r2, #0
	strh r0, [r1, #6]
	strh r0, [r1, #8]
	mov r0, #9
	strh r2, [r1, #0xa]
	bl AllocAudioCommand
	mov r1, #0
	strh r1, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, pc}
	.align 2, 0
_02018150: .word 0x000003E7
_02018154: .word _022A4BEC
	arm_func_end sub_02018118

	arm_func_start sub_02018158
sub_02018158: ; 0x02018158
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02018B50
	ldr r2, _0201818C ; =0x000003E7
	ldr r0, _02018190 ; =_022A4BEC
	mov r1, #0
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	mov r0, #9
	bl AllocAudioCommand
	strh r4, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201818C: .word 0x000003E7
_02018190: .word _022A4BEC
	arm_func_end sub_02018158

	arm_func_start sub_02018194
sub_02018194: ; 0x02018194
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _020181D8 ; =_022A4BEC
	ldr r2, _020181DC ; =0x000003E7
	ldrh r3, [r3, #8]
	mov r5, r0
	mov r4, r1
	cmp r3, r2
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _020181D8 ; =_022A4BEC
	mov r0, #0xa
	strh r4, [r1, #0xa]
	bl AllocAudioCommand
	strh r4, [r0, #6]
	strh r5, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020181D8: .word _022A4BEC
_020181DC: .word 0x000003E7
	arm_func_end sub_02018194

	arm_func_start sub_020181E0
sub_020181E0: ; 0x020181E0
	stmdb sp!, {r3, lr}
	bl sub_0201A19C
	ldr r1, _02018204 ; =0x000003E6
	cmp r0, r1
	ldreq r0, _02018208 ; =_022A4BEC
	streqh r1, [r0, #0xc]
	ldrne r0, _02018208 ; =_022A4BEC
	ldrh r0, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02018204: .word 0x000003E6
_02018208: .word _022A4BEC
	arm_func_end sub_020181E0

	arm_func_start sub_0201820C
sub_0201820C: ; 0x0201820C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02018270 ; =0x000003E6
	mov r5, r0
	cmp r5, r1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r5, #0xd
	ldmhiia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _02018274 ; =_022A4BEC
	mov r0, #0xb
	strh r5, [r1, #0xc]
	bl AllocAudioCommand
	mov r4, r0
	mov r0, #3
	strh r5, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r1, #0
	moveq r1, #0x100
	strh r1, [r4, #6]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018270: .word 0x000003E6
_02018274: .word _022A4BEC
	arm_func_end sub_0201820C

	arm_func_start sub_02018278
sub_02018278: ; 0x02018278
	stmdb sp!, {r3, lr}
	bl sub_02018B50
	ldr r2, _020182A4 ; =0x000003E6
	ldr r1, _020182A8 ; =_022A4BEC
	mov r0, #0xc
	strh r2, [r1, #0xc]
	bl AllocAudioCommand
	mov r1, #0
	strh r1, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, pc}
	.align 2, 0
_020182A4: .word 0x000003E6
_020182A8: .word _022A4BEC
	arm_func_end sub_02018278

	arm_func_start sub_020182AC
sub_020182AC: ; 0x020182AC
	ldr ip, _020182B4 ; =sub_0201A480
	bx ip
	.align 2, 0
_020182B4: .word sub_0201A480
	arm_func_end sub_020182AC

	arm_func_start PlaySeByIdVolume
PlaySeByIdVolume: ; 0x020182B8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldr r1, _02018318 ; =_0209916C
	mov r2, r6
	mov r3, r5
	mov r0, #8
	bl Debug_Print
	cmp r6, #0x3f00
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0xd
	cmp r5, #0x100
	movhi r5, #0x100
	bl sub_02018A78
	mov r4, r0
	mov r0, #4
	strh r6, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r5, #0
	mov r0, r4
	strh r5, [r4, #8]
	bl SendAudioCommand2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02018318: .word _0209916C
	arm_func_end PlaySeByIdVolume

	arm_func_start sub_0201831C
sub_0201831C: ; 0x0201831C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	mov r6, r2
	mov r7, r1
	mov r5, r3
	str r6, [sp]
	ldr r1, _0201839C ; =_0209918C
	mov r2, r8
	mov r3, r7
	mov r0, #8
	str r5, [sp, #4]
	bl Debug_Print
	cmp r8, #0x3f00
	beq _02018394
	mov r0, #0xe
	cmp r6, #0x100
	movhi r6, #0x100
	bl sub_02018A78
	mov r4, r0
	strh r8, [r4, #4]
	mov r0, #4
	strh r7, [r4, #6]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r6, #0
	strh r6, [r4, #8]
	mov r0, r4
	strh r5, [r4, #0xa]
	bl SendAudioCommand2
_02018394:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201839C: .word _0209918C
	arm_func_end sub_0201831C

	arm_func_start sub_020183A0
sub_020183A0: ; 0x020183A0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r2
	mov r5, r1
	ldr r1, _020183E0 ; =_020991C8
	mov r2, r6
	mov r3, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0x10
	bl sub_02018A78
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	strh r4, [r0, #8]
	bl SendAudioCommand2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020183E0: .word _020991C8
	arm_func_end sub_020183A0

	arm_func_start sub_020183E4
sub_020183E4: ; 0x020183E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r2
	mov r5, r1
	ldr r1, _02018424 ; =_020991F0
	mov r2, r6
	mov r3, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0x11
	bl sub_02018A78
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	strh r4, [r0, #0xa]
	bl SendAudioCommand2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02018424: .word _020991F0
	arm_func_end sub_020183E4

	arm_func_start sub_02018428
sub_02018428: ; 0x02018428
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _0201845C ; =_02099210
	mov r2, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0xf
	bl sub_02018A78
	strh r4, [r0, #4]
	mov r1, #0
	strh r1, [r0, #6]
	bl SendAudioCommand2
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201845C: .word _02099210
	arm_func_end sub_02018428

	arm_func_start sub_02018460
sub_02018460: ; 0x02018460
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r1, _02018498 ; =_02099224
	mov r2, r5
	mov r3, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0xf
	bl sub_02018A78
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl SendAudioCommand2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018498: .word _02099224
	arm_func_end sub_02018460

	arm_func_start sub_0201849C
sub_0201849C: ; 0x0201849C
	ldr ip, _020184A4 ; =sub_0201906C
	bx ip
	.align 2, 0
_020184A4: .word sub_0201906C
	arm_func_end sub_0201849C

	arm_func_start sub_020184A8
sub_020184A8: ; 0x020184A8
	ldr ip, _020184B0 ; =sub_02019260
	bx ip
	.align 2, 0
_020184B0: .word sub_02019260
	arm_func_end sub_020184A8

	arm_func_start sub_020184B4
sub_020184B4: ; 0x020184B4
	ldr ip, _020184BC ; =sub_0201929C
	bx ip
	.align 2, 0
_020184BC: .word sub_0201929C
	arm_func_end sub_020184B4

	arm_func_start sub_020184C0
sub_020184C0: ; 0x020184C0
	ldr ip, _020184C8 ; =sub_020192D0
	bx ip
	.align 2, 0
_020184C8: .word sub_020192D0
	arm_func_end sub_020184C0

	arm_func_start sub_020184CC
sub_020184CC: ; 0x020184CC
	stmdb sp!, {r3, lr}
	bl InitSoundSystem
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002C40
	ldr r0, _020185D0 ; =_022A4C00
	mov r1, #0x11
	bl sub_02002F34
	ldr r0, _020185D4 ; =_022A4C28
	mov r1, #0x11
	bl sub_02002F34
	mov r1, #0x10
	ldr r0, _020185D8 ; =_020AF7E4
	mov r2, r1
	bl sub_02002A9C
	mov r2, #0
	ldr r1, _020185DC ; =AUDIO_COMMANDS_BUFFER
	mov r0, r2
_02018510:
	add r2, r2, #1
	cmp r2, #0x10
	str r0, [r1], #0x20
	blt _02018510
	ldr r0, _020185E0 ; =_020AF780
	ldr r1, _020185E4 ; =0x00000701
	ldr r0, [r0, #0x34]
	bl MemAlloc
	ldr r2, _020185E0 ; =_020AF780
	ldr r1, _020185E4 ; =0x00000701
	str r0, [r2, #0x30]
	ldr r0, [r2, #0xc]
	bl MemAlloc
	ldr r2, _020185E0 ; =_020AF780
	ldr r1, _020185E4 ; =0x00000701
	str r0, [r2, #8]
	ldr r0, [r2, #0x20]
	bl MemAlloc
	ldr r2, _020185E0 ; =_020AF780
	ldr r1, _020185E8 ; =_020AF7AC
	str r0, [r2, #0x1c]
	ldr r0, _020185EC ; =_020AF96C
	mov r2, #0
	bl sub_02002778
	ldr r0, _020185F0 ; =_020AFA48
	ldr r1, _020185F4 ; =_020AF784
	mov r2, #0
	bl sub_02002778
	ldr r0, _020185F8 ; =_020AF890
	ldr r1, _020185FC ; =_020AF798
	mov r2, #0
	bl sub_02002778
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002E98
	ldr r0, _020185EC ; =_020AF96C
	bl sub_020027E8
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002CB4
	ldr r0, _020185CC ; =_020AF7C0
	mov r1, #8
	bl sub_02002CAC
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002E98
	mov r1, #1
	ldr r0, _020185E0 ; =_020AF780
	strb r1, [r0, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020185CC: .word _020AF7C0
_020185D0: .word _022A4C00
_020185D4: .word _022A4C28
_020185D8: .word _020AF7E4
_020185DC: .word AUDIO_COMMANDS_BUFFER
_020185E0: .word _020AF780
_020185E4: .word 0x00000701
_020185E8: .word _020AF7AC
_020185EC: .word _020AF96C
_020185F0: .word _020AFA48
_020185F4: .word _020AF784
_020185F8: .word _020AF890
_020185FC: .word _020AF798
	arm_func_end sub_020184CC

	arm_func_start sub_02018600
sub_02018600: ; 0x02018600
	stmdb sp!, {r3, lr}
	bl ManipBgmPlayback
	ldr r0, _02018624 ; =_020AFA48
	bl sub_020027E8
	ldr r0, _02018628 ; =_020AF890
	bl sub_020027E8
_02018618:
	bl sub_02003AB0
	bl ManipBgmPlayback
	b _02018618
	.align 2, 0
_02018624: .word _020AFA48
_02018628: .word _020AF890
	arm_func_end sub_02018600

	arm_func_start sub_0201862C
sub_0201862C: ; 0x0201862C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, #1
	ldr sl, _020187F0 ; =_022A4C28
	ldr sb, _020187F4 ; =_022A4C00
	ldr r4, _020187F8 ; =_020AF780
	mov r6, #2
	mov r5, #0
	add r8, sp, #0
	mov r7, fp
_02018650:
	mov r0, sb
	mov r1, r8
	mov r2, r7
	bl sub_02002F98
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #1
	ldreqb r0, [r4, #1]
	beq _02018650
	mov r0, r6
	bl Debug_GetDebugFlag
	cmp r0, #0
	bne _020187D0
	ldr r1, [sp]
	ldr r0, [r1]
	cmp r0, #0x11
	addls pc, pc, r0, lsl #2
	b _020187D0
_02018698: ; jump table
	b _020187D0 ; case 0
	b _020187D0 ; case 1
	b _020186E0 ; case 2
	b _020186E0 ; case 3
	b _020186E0 ; case 4
	b _020186E0 ; case 5
	b _020186E0 ; case 6
	b _020186E0 ; case 7
	b _020186E0 ; case 8
	b _020186E0 ; case 9
	b _020186E0 ; case 10
	b _020186E0 ; case 11
	b _020186E0 ; case 12
	b _020186F0 ; case 13
	b _020186F0 ; case 14
	b _02018790 ; case 15
	b _020186F0 ; case 16
	b _020186F0 ; case 17
_020186E0:
	mov r0, sl
	mov r2, fp
	bl sub_02002F7C
	b _02018650
_020186F0:
	ldrh r0, [r1, #4]
	bl sub_0201AAA0
	cmp r0, #0
	bne _02018714
	ldr r1, [sp]
	mov r0, sl
	mov r2, #1
	bl sub_02002F7C
	b _02018650
_02018714:
	ldr r3, [sp]
	ldr r0, [r3]
	sub r0, r0, #0xd
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020187D0
_0201872C: ; jump table
	b _02018740 ; case 0
	b _02018750 ; case 1
	b _020187D0 ; case 2
	b _02018768 ; case 3
	b _0201877C ; case 4
_02018740:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #8]
	bl PlaySe
	b _020187D0
_02018750:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	ldrsh r3, [r3, #0xa]
	bl PlaySeFullSpec
	b _020187D0
_02018768:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	bl SeChangeVolume
	b _020187D0
_0201877C:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrsh r2, [r3, #0xa]
	bl SeChangePan
	b _020187D0
_02018790:
	ldrh r0, [r1, #4]
	cmp r0, #0x3f00
	beq _020187BC
	bl sub_0201AAA0
	cmp r0, #0
	beq _020187BC
	ldr r1, [sp]
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	bl StopSe
	b _020187D0
_020187BC:
	ldr r1, [sp]
	mov r0, sl
	mov r2, #1
	bl sub_02002F7C
	b _02018650
_020187D0:
	ldr r0, _020187FC ; =_020AF7C0
	bl sub_02002CB4
	ldr r1, [sp]
	ldr r0, _020187FC ; =_020AF7C0
	str r5, [r1]
	ldr r1, _02018800 ; =_020AF7E4
	bl sub_02002ECC
	b _02018650
	.align 2, 0
_020187F0: .word _022A4C28
_020187F4: .word _022A4C00
_020187F8: .word _020AF780
_020187FC: .word _020AF7C0
_02018800: .word _020AF7E4
	arm_func_end sub_0201862C

	arm_func_start sub_02018804
sub_02018804: ; 0x02018804
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
_0201880C:
	ldr r0, _02018A64 ; =_022A4C28
	add r1, sp, #0
	mov r2, #1
	bl sub_02002F98
	ldr r3, [sp]
	ldr r0, [r3]
	cmp r0, #0x11
	addls pc, pc, r0, lsl #2
	b _02018A40
_02018830: ; jump table
	b _02018A40 ; case 0
	b _02018A40 ; case 1
	b _02018878 ; case 2
	b _02018880 ; case 3
	b _020188B4 ; case 4
	b _02018900 ; case 5
	b _0201890C ; case 6
	b _0201891C ; case 7
	b _02018950 ; case 8
	b _0201899C ; case 9
	b _020189A8 ; case 10
	b _020189B8 ; case 11
	b _020189D0 ; case 12
	b _020189DC ; case 13
	b _020189F0 ; case 14
	b _02018A0C ; case 15
	b _02018A1C ; case 16
	b _02018A30 ; case 17
_02018878:
	bl SoundDriverReset
	b _02018A40
_02018880:
	ldr r4, _02018A68 ; =0x000003E6
	b _0201888C
_02018888:
	bl sub_02003AB0
_0201888C:
	bl sub_0201A19C
	cmp r0, r4
	bne _02018888
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm
	bl sub_02003AB0
	b _02018A40
_020188B4:
	ldr r4, _02018A68 ; =0x000003E6
	b _020188C0
_020188BC:
	bl sub_02003AB0
_020188C0:
	bl sub_0201A19C
	cmp r0, r4
	bne _020188BC
	ldr r4, _02018A6C ; =0x000003E7
	b _020188D8
_020188D4:
	bl sub_02003AB0
_020188D8:
	bl sub_02019824
	cmp r0, r4
	bne _020188D4
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm
	bl sub_02003AB0
	b _02018A40
_02018900:
	ldrh r0, [r3, #8]
	bl StopBgm
	b _02018A40
_0201890C:
	ldrh r0, [r3, #8]
	ldrh r1, [r3, #6]
	bl ChangeBgm
	b _02018A40
_0201891C:
	ldr r4, _02018A68 ; =0x000003E6
	b _02018928
_02018924:
	bl sub_02003AB0
_02018928:
	bl sub_0201A19C
	cmp r0, r4
	bne _02018924
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm2
	bl sub_02003AB0
	b _02018A40
_02018950:
	ldr r4, _02018A68 ; =0x000003E6
	b _0201895C
_02018958:
	bl sub_02003AB0
_0201895C:
	bl sub_0201A19C
	cmp r0, r4
	bne _02018958
	ldr r4, _02018A6C ; =0x000003E7
	b _02018974
_02018970:
	bl sub_02003AB0
_02018974:
	bl sub_02019D58
	cmp r0, r4
	bne _02018970
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm2
	bl sub_02003AB0
	b _02018A40
_0201899C:
	ldrh r0, [r3, #8]
	bl StopBgm2
	b _02018A40
_020189A8:
	ldrh r0, [r3, #8]
	ldrh r1, [r3, #6]
	bl ChangeBgm2
	b _02018A40
_020189B8:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #8]
	ldrh r2, [r3, #6]
	bl PlayME
	bl sub_02003AB0
	b _02018A40
_020189D0:
	ldrh r0, [r3, #8]
	bl StopME
	b _02018A40
_020189DC:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #8]
	bl PlaySe
	bl sub_02003AB0
	b _02018A40
_020189F0:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	ldrsh r3, [r3, #0xa]
	bl PlaySeFullSpec
	bl sub_02003AB0
	b _02018A40
_02018A0C:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	bl StopSe
	b _02018A40
_02018A1C:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	bl SeChangeVolume
	b _02018A40
_02018A30:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrsh r2, [r3, #0xa]
	bl SeChangePan
_02018A40:
	ldr r0, _02018A70 ; =_020AF7C0
	bl sub_02002CB4
	ldr r2, [sp]
	mov r3, #0
	ldr r0, _02018A70 ; =_020AF7C0
	ldr r1, _02018A74 ; =_020AF7E4
	str r3, [r2]
	bl sub_02002ECC
	b _0201880C
	.align 2, 0
_02018A64: .word _022A4C28
_02018A68: .word 0x000003E6
_02018A6C: .word 0x000003E7
_02018A70: .word _020AF7C0
_02018A74: .word _020AF7E4
	arm_func_end sub_02018804

	arm_func_start sub_02018A78
sub_02018A78: ; 0x02018A78
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02018AD8 ; =_020AF7C0
	ldr r1, _02018ADC ; =_020AF7E4
	bl sub_02002D14
	mov r1, #0
	ldr r4, _02018AE0 ; =AUDIO_COMMANDS_BUFFER
	b _02018AC0
_02018A98:
	ldr r0, [r4]
	cmp r0, #0
	bne _02018AB8
	ldr r0, _02018AD8 ; =_020AF7C0
	str r5, [r4]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
_02018AB8:
	add r1, r1, #1
	add r4, r4, #0x20
_02018AC0:
	cmp r1, #0x10
	blt _02018A98
	ldr r0, _02018AD8 ; =_020AF7C0
	bl sub_02002E98
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018AD8: .word _020AF7C0
_02018ADC: .word _020AF7E4
_02018AE0: .word AUDIO_COMMANDS_BUFFER
	arm_func_end sub_02018A78

	arm_func_start SendAudioCommand2
SendAudioCommand2: ; 0x02018AE4
	stmdb sp!, {r4, lr}
	ldr r1, _02018B3C ; =_022A4C00
	mov r4, r0
	ldr r2, [r1, #0x24]
	ldr r0, [r1, #0x14]
	cmp r2, r0
	bne _02018B0C
	ldr r0, _02018B40 ; =_022A4C00
	ldr r1, _02018B44 ; =_02099240
	bl sub_02002FB4
_02018B0C:
	ldr r0, _02018B48 ; =_020AF7C0
	bl sub_02002CB4
	ldr r1, _02018B4C ; =_020AF780
	mov r2, #1
	ldr r0, _02018B48 ; =_020AF7C0
	strb r2, [r1]
	bl sub_02002E98
	ldr r0, _02018B40 ; =_022A4C00
	mov r1, r4
	mov r2, #1
	bl sub_02002F7C
	ldmia sp!, {r4, pc}
	.align 2, 0
_02018B3C: .word _022A4C00
_02018B40: .word _022A4C00
_02018B44: .word _02099240
_02018B48: .word _020AF7C0
_02018B4C: .word _020AF780
	arm_func_end SendAudioCommand2

	arm_func_start sub_02018B50
sub_02018B50: ; 0x02018B50
	ldr ip, _02018B60 ; =sub_02002D14
	ldr r0, _02018B64 ; =_020AF7C0
	ldr r1, _02018B68 ; =_020AF7E4
	bx ip
	.align 2, 0
_02018B60: .word sub_02002D14
_02018B64: .word _020AF7C0
_02018B68: .word _020AF7E4
	arm_func_end sub_02018B50

	arm_func_start AllocAudioCommand
AllocAudioCommand: ; 0x02018B6C
	mov r3, #0
	ldr r2, _02018BA4 ; =AUDIO_COMMANDS_BUFFER
	b _02018B94
_02018B78:
	ldr r1, [r2]
	cmp r1, #0
	streq r0, [r2]
	moveq r0, r2
	bxeq lr
	add r3, r3, #1
	add r2, r2, #0x20
_02018B94:
	cmp r3, #0x10
	blt _02018B78
	mov r0, #0
	bx lr
	.align 2, 0
_02018BA4: .word AUDIO_COMMANDS_BUFFER
	arm_func_end AllocAudioCommand

	arm_func_start SendAudioCommand
SendAudioCommand: ; 0x02018BA8
	stmdb sp!, {r4, lr}
	ldr r1, _02018BF8 ; =_022A4C00
	mov r4, r0
	ldr r2, [r1, #0x24]
	ldr r0, [r1, #0x14]
	cmp r2, r0
	bne _02018BD0
	ldr r0, _02018BFC ; =_022A4C00
	ldr r1, _02018C00 ; =_02099240
	bl sub_02002FB4
_02018BD0:
	ldr r1, _02018C04 ; =_020AF780
	mov r2, #1
	ldr r0, _02018C08 ; =_020AF7C0
	strb r2, [r1]
	bl sub_02002E98
	ldr r0, _02018BFC ; =_022A4C00
	mov r1, r4
	mov r2, #1
	bl sub_02002F7C
	ldmia sp!, {r4, pc}
	.align 2, 0
_02018BF8: .word _022A4C00
_02018BFC: .word _022A4C00
_02018C00: .word _02099240
_02018C04: .word _020AF780
_02018C08: .word _020AF7C0
	arm_func_end SendAudioCommand

	arm_func_start sub_02018C0C
sub_02018C0C: ; 0x02018C0C
	ldr ip, _02018C1C ; =sub_02002ECC
	ldr r0, _02018C20 ; =_020AF7C0
	ldr r1, _02018C24 ; =_020AF7E4
	bx ip
	.align 2, 0
_02018C1C: .word sub_02002ECC
_02018C20: .word _020AF7C0
_02018C24: .word _020AF7E4
	arm_func_end sub_02018C0C

	arm_func_start InitSoundSystem
InitSoundSystem: ; 0x02018C28
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x50
	ldr r0, _02018E44 ; =_020AFB28
	bl sub_02002C40
	ldr r0, _02018E44 ; =_020AFB28
	mov r1, #4
	bl sub_02002CAC
	bl sub_0207CC10
	ldr r0, _02018E48 ; =0x0000FFFF
	mov r1, #0
	bl sub_0207C9C4
	add r0, sp, #0x10
	bl DseDriver_LoadDefaultSettings
	mov r0, #0x10000
	mov r1, #2
	bl MemAlloc
	ldr r2, _02018E4C ; =_022A4E50
	mov r1, #0x3c000
	str r0, [r2]
	mov r0, #0
	mov r2, #0x14
	mov r3, #2
	bl MemArenaAlloc
	ldr r1, _02018E4C ; =_022A4E50
	mov r2, #0x10000
	str r0, [r1, #4]
	ldr r1, [r1]
	add r0, sp, #0x10
	bl DseDriver_ConfigureHeap
	add r0, sp, #0x10
	mov r1, #0
	mov r2, #4
	bl sub_0206C36C
	add r0, sp, #0x10
	mov r1, #0
	mov r2, #0xf
	bl sub_0206C39C
	add r0, sp, #0x10
	bl DseDriver_Init
	ldr r1, _02018E50 ; =_0209939C
	add r0, sp, #8
	bl sub_02019314
	mov r1, #0
	ldr r0, [sp, #8]
	mov r2, r1
	bl DseSwd_LoadBank
	mov r1, r0
	ldr r2, _02018E54 ; =_022A4E58
	ldr r0, _02018E58 ; =_020993B4
	str r1, [r2, #0x80]
	bl Debug_Print0
	ldr r1, _02018E5C ; =_020993D0
	add r0, sp, #8
	bl sub_02019314
	ldr r0, [sp, #8]
	bl DseSe_Load
	mov r1, r0
	ldr r0, _02018E54 ; =_022A4E58
	str r1, [r0, #0x7c]
	ldr r0, _02018E60 ; =_020993E8
	bl Debug_Print0
	ldr r1, _02018E64 ; =_02099404
	add r0, sp, #0
	bl sub_02019314
	mov r1, #0
	ldr r0, [sp]
	mov r2, r1
	bl DseSwd_LoadBank
	mov r1, r0
	ldr r2, _02018E54 ; =_022A4E58
	ldr r0, _02018E68 ; =_02099418
	str r1, [r2, #0x8c]
	bl Debug_Print0
	ldr r1, _02018E6C ; =_02099434
	add r0, sp, #0
	bl sub_02019314
	ldr r0, [sp]
	bl DseSe_Load
	mov r1, r0
	ldr r2, _02018E54 ; =_022A4E58
	ldr r0, _02018E70 ; =_02099448
	str r1, [r2, #0x88]
	bl Debug_Print0
	ldr r0, _02018E54 ; =_022A4E58
	mov r2, #0
	str r2, [r0, #0xc4]
	str r2, [r0, #0x18]
	str r2, [r0, #0x1c]
	str r2, [r0, #0x44]
	ldr r1, _02018E74 ; =0x000003E7
	str r2, [r0, #0x64]
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x48]
	sub r1, r1, #1
	strh r1, [r0, #0x68]
	str r2, [r0, #0x94]
	mov r1, #0x3f00
	strh r1, [r0, #0x98]
	strh r1, [r0, #0x9a]
	ldr r0, _02018E78 ; =_022A4E7C
	bl ZInit8
	ldr r0, _02018E7C ; =_022A4E84
	bl ZInit8
	ldr r0, _02018E80 ; =_022A4E8C
	bl ZInit8
	ldr r0, _02018E84 ; =_022A4EA4
	bl ZInit8
	ldr r0, _02018E88 ; =_022A4EAC
	bl ZInit8
	ldr r0, _02018E8C ; =_022A4EB4
	bl ZInit8
	ldr r0, _02018E90 ; =_022A4EC4
	bl ZInit8
	ldr r0, _02018E94 ; =_022A4ECC
	bl ZInit8
	ldr r0, _02018E98 ; =_022A4EF4
	bl ZInit8
	ldr r4, _02018E9C ; =_022A4EFC
	mov r5, #0
_02018E04:
	add r0, r4, r5, lsl #3
	bl ZInit8
	add r5, r5, #1
	cmp r5, #4
	blt _02018E04
	mov r1, #0
	ldr r0, _02018EA0 ; =_020AFB4C
	mov r2, r1
	mov r3, r1
	bl DseSwd_LoadMainBank
	ldr r1, _02018E54 ; =_022A4E58
	str r0, [r1, #4]
	ldr r0, _02018E44 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018E44: .word _020AFB28
_02018E48: .word 0x0000FFFF
_02018E4C: .word _022A4E50
_02018E50: .word _0209939C
_02018E54: .word _022A4E58
_02018E58: .word _020993B4
_02018E5C: .word _020993D0
_02018E60: .word _020993E8
_02018E64: .word _02099404
_02018E68: .word _02099418
_02018E6C: .word _02099434
_02018E70: .word _02099448
_02018E74: .word 0x000003E7
_02018E78: .word _022A4E7C
_02018E7C: .word _022A4E84
_02018E80: .word _022A4E8C
_02018E84: .word _022A4EA4
_02018E88: .word _022A4EAC
_02018E8C: .word _022A4EB4
_02018E90: .word _022A4EC4
_02018E94: .word _022A4ECC
_02018E98: .word _022A4EF4
_02018E9C: .word _022A4EFC
_02018EA0: .word _020AFB4C
	arm_func_end InitSoundSystem

	arm_func_start ManipBgmPlayback
ManipBgmPlayback: ; 0x02018EA4
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r0, _0201904C ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, [r0, #0x18]
	cmp r1, #0
	bne _02018F5C
	ldr r1, [r0, #0x1c]
	cmp r1, #2
	bne _02018F0C
	ldr r0, [r0]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02018F0C
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, _02019054 ; =_02099464
	ldrh r2, [r0, #0x20]
	mov r0, #7
	bl Debug_Print
	bl sub_02019408
	ldr r0, _02019050 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019058 ; =0x000003E7
	str r2, [r0, #0x1c]
	strh r1, [r0, #0x20]
_02018F0C:
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, [r0, #0x44]
	cmp r1, #2
	bne _0201903C
	ldr r0, [r0, #8]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201903C
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, _0201905C ; =_02099470
	ldrh r2, [r0, #0x48]
	mov r0, #7
	bl Debug_Print
	bl sub_02019488
	ldr r0, _02019050 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019058 ; =0x000003E7
	str r2, [r0, #0x44]
	strh r1, [r0, #0x48]
	b _0201903C
_02018F5C:
	cmp r1, #1
	ldreq r1, [r0, #0x64]
	cmpeq r1, #2
	bne _0201903C
	ldr r0, [r0, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201903C
	bl sub_02019508
	ldr r0, _02019050 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019060 ; =0x000003E6
	str r2, [r0, #0x64]
	strh r1, [r0, #0x68]
	ldr r1, [r0, #0x1c]
	cmp r1, #2
	bne _02018FE0
	ldrh r2, [r0, #0x20]
	ldr r1, _02019064 ; =_0209947C
	mov r0, #7
	bl Debug_Print
	ldr r0, _02019050 ; =_022A4E58
	mov ip, #4
	ldrh r2, [r0, #0x22]
	ldr r0, [r0]
	add r1, sp, #0
	rsb r2, r2, r2, lsl #7
	mov r2, r2, asr #8
	add r3, r2, #0x3e80000
	mov r2, #0
	str r3, [sp, #0xc]
	str ip, [sp]
	bl ResumeBgm
_02018FE0:
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, [r0, #0x44]
	cmp r1, #2
	bne _02019030
	ldrh r2, [r0, #0x48]
	ldr r1, _02019068 ; =_0209948C
	mov r0, #7
	bl Debug_Print
	ldr r0, _02019050 ; =_022A4E58
	mov ip, #4
	ldrh r2, [r0, #0x4a]
	ldr r0, [r0, #8]
	add r1, sp, #0
	rsb r2, r2, r2, lsl #7
	mov r2, r2, asr #8
	add r3, r2, #0x3e80000
	mov r2, #0
	str r3, [sp, #0xc]
	str ip, [sp]
	bl ResumeBgm
_02019030:
	ldr r0, _02019050 ; =_022A4E58
	mov r1, #0
	str r1, [r0, #0x18]
_0201903C:
	ldr r0, _0201904C ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_0201904C: .word _020AFB28
_02019050: .word _022A4E58
_02019054: .word _02099464
_02019058: .word 0x000003E7
_0201905C: .word _02099470
_02019060: .word 0x000003E6
_02019064: .word _0209947C
_02019068: .word _0209948C
	arm_func_end ManipBgmPlayback

	arm_func_start sub_0201906C
sub_0201906C: ; 0x0201906C
	stmdb sp!, {r3, lr}
	ldr r0, _020190C0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _020190C4 ; =_022A4E58
	ldr r1, [r0, #0x94]
	cmp r1, #2
	bne _020190B4
	ldr r0, [r0, #0xdc]
	mov r1, #0
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	bne _020190B4
	bl sub_02019790
	ldr r0, _020190C4 ; =_022A4E58
	mov r1, #0x3f00
	strh r1, [r0, #0x98]
	mov r1, #0
	str r1, [r0, #0x94]
_020190B4:
	ldr r0, _020190C0 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_020190C0: .word _020AFB28
_020190C4: .word _022A4E58
	arm_func_end sub_0201906C

	arm_func_start SoundDriverReset
SoundDriverReset: ; 0x020190C8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _0201924C ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _02019250 ; =_0209949C
	mov r0, #6
	bl Debug_Print
	ldr r4, _02019254 ; =_022A4E58
	ldr r0, [r4, #0x18]
	cmp r0, #1
	bne _02019184
	ldr r5, _0201924C ; =_020AFB28
	b _0201910C
_020190F8:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_0201910C:
	ldr r0, [r4, #0x64]
	cmp r0, #1
	beq _020190F8
	cmp r0, #2
	bne _02019174
	ldr r0, _02019254 ; =_022A4E58
	ldr r0, [r0, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	ble _02019174
	ldr r0, _02019254 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x10]
	bl DseBgm_Stop
	ldr r5, _0201924C ; =_020AFB28
	ldr r4, _02019254 ; =_022A4E58
	b _02019164
_02019150:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_02019164:
	ldr r0, [r4, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02019150
_02019174:
	bl sub_02019508
	ldr r1, _02019258 ; =0x000003E6
	ldr r0, _02019254 ; =_022A4E58
	strh r1, [r0, #0x68]
_02019184:
	mov r7, #0
	ldr r6, _0201925C ; =0x000003E7
	ldr sl, _0201924C ; =_020AFB28
	ldr sb, _02019254 ; =_022A4E58
	mov r8, r7
	mov r4, r7
	mov r5, r7
_020191A0:
	ldr r0, [sb, #0x1c]
	cmp r0, #2
	bne _020191D4
	ldr r0, [sb]
	mov r1, r8
	bl DseBgm_Stop
	ldr r0, [sb]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _020191D4
	bl sub_02019408
	str r7, [sb, #0x1c]
	strh r6, [sb, #0x20]
_020191D4:
	ldr r0, [sb, #0x44]
	cmp r0, #2
	bne _02019208
	ldr r0, [sb, #8]
	mov r1, r5
	bl DseBgm_Stop
	ldr r0, [sb, #8]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02019208
	bl sub_02019488
	str r4, [sb, #0x44]
	strh r6, [sb, #0x48]
_02019208:
	ldr r0, [sb, #0x1c]
	cmp r0, #0
	ldrne r0, [sb, #0x44]
	cmpne r0, #0
	beq _02019234
	mov r0, sl
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, sl
	bl sub_02002CB4
	b _020191A0
_02019234:
	mov r0, #0x3f00
	mov r1, #0
	bl StopSe
	ldr r0, _0201924C ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0201924C: .word _020AFB28
_02019250: .word _0209949C
_02019254: .word _022A4E58
_02019258: .word 0x000003E6
_0201925C: .word 0x000003E7
	arm_func_end SoundDriverReset

	arm_func_start sub_02019260
sub_02019260: ; 0x02019260
	stmdb sp!, {r3, lr}
	ldr r0, _02019294 ; =_020AFB24
	ldrb r0, [r0]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02019298 ; =_020AFB28
	bl sub_02002CB4
	mov r0, #1
	bl sub_0206C620
	ldr r0, _02019294 ; =_020AFB24
	mov r1, #1
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02019294: .word _020AFB24
_02019298: .word _020AFB28
	arm_func_end sub_02019260

	arm_func_start sub_0201929C
sub_0201929C: ; 0x0201929C
	stmdb sp!, {r3, lr}
	ldr r0, _020192C8 ; =_020AFB28
	bl sub_02002CB4
	mov r0, #0
	bl sub_0206C6BC
	ldr r0, _020192CC ; =0x0000FFFF
	mov r1, #0
	bl sub_0207C9E4
	ldr r0, _020192C8 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_020192C8: .word _020AFB28
_020192CC: .word 0x0000FFFF
	arm_func_end sub_0201929C

	arm_func_start sub_020192D0
sub_020192D0: ; 0x020192D0
	stmdb sp!, {r3, lr}
	ldr r0, _020192FC ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019300 ; =0x0000FFFF
	mov r1, #0
	bl sub_0207C9C4
	mov r0, #0
	bl sub_0206C754
	ldr r0, _020192FC ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_020192FC: .word _020AFB28
_02019300: .word 0x0000FFFF
	arm_func_end sub_020192D0

	arm_func_start sub_02019304
sub_02019304: ; 0x02019304
	ldr r0, _02019310 ; =_022A4E50
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_02019310: .word _022A4E50
	arm_func_end sub_02019304

	arm_func_start sub_02019314
sub_02019314: ; 0x02019314
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x48
	mov r5, r0
	mov r4, r1
	bl FileRom_InitDataTransfer
	add r0, sp, #0
	bl FileRom_Veneer_FileInit
	add r0, sp, #0
	mov r1, r4
	bl FileRom_HandleOpen
	add r0, sp, #0
	bl FileGetSize
	str r0, [r5, #4]
	ldr r0, _02019388 ; =_022A4E50
	ldr r1, [r5, #4]
	ldr r0, [r0, #4]
	mov r2, #2
	bl MemLocateSet
	str r0, [r5]
	add r0, sp, #0
	ldmia r5, {r1, r2}
	bl FileRom_HandleRead
	mov r4, r0
	add r0, sp, #0
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, r4
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02019388: .word _022A4E50
	arm_func_end sub_02019314

	arm_func_start LoadDseFile
LoadDseFile: ; 0x0201938C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x48
	mov r5, r0
	mov r4, r1
	bl FileRom_InitDataTransfer
	add r0, sp, #0
	bl FileRom_Veneer_FileInit
	add r0, sp, #0
	mov r1, r4
	bl FileRom_HandleOpen
	add r0, sp, #0
	bl FileGetSize
	str r0, [r5, #4]
	ldr r0, _02019400 ; =_022A4E50
	ldr r1, [r5, #4]
	ldr r0, [r0, #4]
	ldr r2, _02019404 ; =0x00000302
	bl MemLocateSet
	str r0, [r5]
	add r0, sp, #0
	ldmia r5, {r1, r2}
	bl FileRom_HandleRead
	mov r4, r0
	add r0, sp, #0
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, r4
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02019400: .word _022A4E50
_02019404: .word 0x00000302
	arm_func_end LoadDseFile

	arm_func_start sub_02019408
sub_02019408: ; 0x02019408
	stmdb sp!, {r3, lr}
	ldr r0, _0201947C ; =_022A4E8C
	bl PointsToZero
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02019480 ; =_022A4E58
	ldr r0, [r0]
	bl DseBgm_Unload
	ldr r0, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	ldr r0, _02019484 ; =_022A4E50
	ldr r1, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x34]
	bl MemLocateUnset
	ldr r0, _02019484 ; =_022A4E50
	ldr r1, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x24]
	bl MemLocateUnset
	ldr r0, _02019484 ; =_022A4E50
	ldr r1, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x2c]
	bl MemLocateUnset
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201947C: .word _022A4E8C
_02019480: .word _022A4E58
_02019484: .word _022A4E50
	arm_func_end sub_02019408

	arm_func_start sub_02019488
sub_02019488: ; 0x02019488
	stmdb sp!, {r3, lr}
	ldr r0, _020194FC ; =_022A4EB4
	bl PointsToZero
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02019500 ; =_022A4E58
	ldr r0, [r0, #8]
	bl DseBgm_Unload
	ldr r0, _02019500 ; =_022A4E58
	ldr r0, [r0, #0xc]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	ldr r0, _02019504 ; =_022A4E50
	ldr r1, _02019500 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x5c]
	bl MemLocateUnset
	ldr r0, _02019504 ; =_022A4E50
	ldr r1, _02019500 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x4c]
	bl MemLocateUnset
	ldr r0, _02019504 ; =_022A4E50
	ldr r1, _02019500 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x54]
	bl MemLocateUnset
	ldmia sp!, {r3, pc}
	.align 2, 0
_020194FC: .word _022A4EB4
_02019500: .word _022A4E58
_02019504: .word _022A4E50
	arm_func_end sub_02019488

	arm_func_start sub_02019508
sub_02019508: ; 0x02019508
	stmdb sp!, {r3, lr}
	ldr r0, _02019568 ; =_022A4ECC
	bl PointsToZero
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0201956C ; =_022A4E58
	ldr r0, [r0, #0x10]
	bl DseBgm_Unload
	ldr r0, _0201956C ; =_022A4E58
	ldr r0, [r0, #0x14]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	ldr r0, _02019570 ; =_022A4E50
	ldr r1, _0201956C ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x74]
	bl MemLocateUnset
	ldr r0, _02019570 ; =_022A4E50
	ldr r1, _0201956C ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x6c]
	bl MemLocateUnset
	ldmia sp!, {r3, pc}
	.align 2, 0
_02019568: .word _022A4ECC
_0201956C: .word _022A4E58
_02019570: .word _022A4E50
	arm_func_end sub_02019508

	arm_func_start PlaySeLoad
PlaySeLoad: ; 0x02019574
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10c
	mov r6, r0
	mov r1, r6, asr #8
	and r4, r1, #0xff
	and r5, r6, #0xff
	bl sub_0201AAA0
	cmp r0, #0
	movne r0, #0
	bne _02019758
	cmp r5, #0
	moveq r0, #0
	beq _02019758
	ldr r0, _02019760 ; =_022A4E58
	ldrh r0, [r0, #0x9a]
	cmp r0, r6
	moveq r0, #1
	beq _02019758
	cmp r0, #0x3f00
	beq _020195C8
	bl sub_02019790
_020195C8:
	ldr r0, _02019760 ; =_022A4E58
	mov r1, #1
	str r1, [r0, #0x94]
	ldr r1, _02019764 ; =_020AFB6C
	strh r6, [r0, #0x9a]
	mov r2, #0
	str r2, [r0, #0xc4]
	ldr r2, [r1, r4, lsl #2]
	ldr r1, _02019768 ; =_020994B0
	add r0, sp, #0xc
	bl sprintf
	ldr r1, _0201976C ; =_020994C0
	add r3, sp, #0xc
	mov r2, r6
	mov r0, #8
	bl Debug_Print
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002E98
	ldr r0, _02019774 ; =_022A4EF4
	add r1, sp, #0xc
	bl LoadDseFile
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019760 ; =_022A4E58
	ldr r0, [r0, #0x9c]
	bl DseSe_Load
	ldr r2, _02019760 ; =_022A4E58
	add r1, sp, #4
	str r0, [r2, #0xc8]
	add r0, r0, r5, lsl #16
	str r0, [r2, #0xdc]
	mov r2, #4
	bl DseSe_GetUsedBankIDs
	mov r7, r0
	ldr r1, _02019778 ; =_020994D8
	mov r2, r6
	mov r3, r5
	mov r8, #0
	mov r0, #8
	str r7, [sp]
	bl Debug_Print
	mov sb, r8
	add r6, sp, #4
	mov fp, #8
	ldr r5, _0201977C ; =_022A4EFC
	ldr r4, _02019760 ; =_022A4E58
	b _0201970C
_02019684:
	mov r0, sb, lsl #1
	ldrh r2, [r6, r0]
	ldr r1, _02019780 ; =_02099500
	mov r0, fp
	and sl, r2, #0xff
	str r2, [sp]
	mov r2, sb
	mov r3, sl
	bl Debug_Print
	ldr r1, _02019784 ; =_02099514
	mov r2, sl
	add r0, sp, #0xc
	bl sprintf
	ldr r1, _02019788 ; =_02099528
	mov r0, #8
	mov r2, r8
	add r3, sp, #0xc
	bl Debug_Print
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002E98
	add r0, r5, r8, lsl #3
	add r1, sp, #0xc
	bl LoadDseFile
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002CB4
	add r0, r4, r8, lsl #3
	mov r1, #0
	ldr r0, [r0, #0xa4]
	mov r2, r1
	bl DseSwd_LoadBank
	add r1, r4, r8, lsl #2
	str r0, [r1, #0xcc]
	add r8, r8, #1
	add sb, sb, #1
_0201970C:
	cmp sb, r7
	blt _02019684
	ldr r0, _02019760 ; =_022A4E58
	cmp r8, #0
	str r8, [r0, #0xc4]
	movne r0, #1
	bne _02019758
	mov r1, #0x3f00
	strh r1, [r0, #0x9a]
	ldr r0, [r0, #0xc8]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSe_Unload
	ldr r0, _0201978C ; =_022A4E50
	ldr r1, _02019760 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x9c]
	bl MemLocateUnset
	mov r0, #0
_02019758:
	add sp, sp, #0x10c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02019760: .word _022A4E58
_02019764: .word _020AFB6C
_02019768: .word _020994B0
_0201976C: .word _020994C0
_02019770: .word _020AFB28
_02019774: .word _022A4EF4
_02019778: .word _020994D8
_0201977C: .word _022A4EFC
_02019780: .word _02099500
_02019784: .word _02099514
_02019788: .word _02099528
_0201978C: .word _022A4E50
	arm_func_end PlaySeLoad

	arm_func_start sub_02019790
sub_02019790: ; 0x02019790
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _0201981C ; =_022A4E58
	ldr r5, [r4, #0xc4]
	cmp r5, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, pc}
	mov r6, #0
	str r6, [r4, #0xc4]
	ldr r7, _02019820 ; =_022A4E50
	b _020197DC
_020197B4:
	add r0, r4, r6, lsl #2
	ldr r0, [r0, #0xcc]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	add r1, r4, r6, lsl #3
	ldr r0, [r7, #4]
	ldr r1, [r1, #0xa4]
	bl MemLocateUnset
	add r6, r6, #1
_020197DC:
	cmp r6, r5
	blt _020197B4
	ldr r0, _0201981C ; =_022A4E58
	ldr r0, [r0, #0xc8]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSe_Unload
	ldr r0, _02019820 ; =_022A4E50
	ldr r1, _0201981C ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x9c]
	bl MemLocateUnset
	ldr r0, _0201981C ; =_022A4E58
	mov r1, #0x3f00
	strh r1, [r0, #0x9a]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201981C: .word _022A4E58
_02019820: .word _022A4E50
	arm_func_end sub_02019790

	arm_func_start sub_02019824
sub_02019824: ; 0x02019824
	stmdb sp!, {r4, lr}
	ldr r0, _02019848 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201984C ; =_022A4E58
	ldr r0, _02019848 ; =_020AFB28
	ldrh r4, [r1, #0x20]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02019848: .word _020AFB28
_0201984C: .word _022A4E58
	arm_func_end sub_02019824

	arm_func_start IsSongOver
IsSongOver: ; 0x02019850
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _020198B0 ; =_020AFB28
	mov r4, #0
	bl sub_02002CB4
	ldr r0, _020198B4 ; =_022A4E58
	ldr r1, [r0, #0x1c]
	cmp r1, #2
	bne _0201989C
	ldr r0, [r0]
	add r2, sp, #0
	mov r1, #0xa
	bl DseSequence_GetParameter
	ldr r0, _020198B4 ; =_022A4E58
	ldr r2, [sp]
	ldr r1, [r0, #0x40]
	cmp r2, r1
	strgt r2, [r0, #0x40]
	movgt r4, #1
_0201989C:
	ldr r0, _020198B0 ; =_020AFB28
	bl sub_02002E98
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020198B0: .word _020AFB28
_020198B4: .word _022A4E58
	arm_func_end IsSongOver

	arm_func_start PlayBgm
PlayBgm: ; 0x020198B8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x98
	mov r6, r0
	ldr r0, _02019B00 ; =_020AFB28
	mov r5, r1
	mov r4, r2
	bl sub_02002CB4
	ldr r1, _02019B04 ; =_0209953C
	mov r2, r6
	mov r3, r4
	mov r0, #7
	str r5, [sp]
	bl Debug_Print
	ldr r0, _02019B08 ; =_022A4E58
	ldrh r0, [r0, #0x48]
	cmp r6, r0
	bne _02019914
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm2
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
_02019914:
	ldr r1, _02019B08 ; =_022A4E58
	ldr r0, _02019B0C ; =0x000003E7
	ldrh r1, [r1, #0x20]
	cmp r1, r0
	beq _02019940
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
_02019940:
	cmp r6, #1
	blo _02019950
	cmp r6, #0xc9
	bls _02019970
_02019950:
	ldr r1, _02019B08 ; =_022A4E58
	mov r0, #0
	ldr r2, _02019B0C ; =0x000003E7
	str r0, [r1, #0x1c]
	ldr r0, _02019B00 ; =_020AFB28
	strh r2, [r1, #0x20]
	bl sub_02002E98
	b _02019AF8
_02019970:
	ldr r0, _02019B08 ; =_022A4E58
	mov r1, #1
	str r1, [r0, #0x1c]
	strh r6, [r0, #0x20]
	strh r4, [r0, #0x22]
	mov r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x40]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _02019AE4
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	ldr r1, _02019B10 ; =_02099554
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019B14 ; =_022A4E8C
	add r1, sp, #0x18
	bl sub_02019314
	ldr r1, _02019B18 ; =_0209956C
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019B1C ; =_022A4E7C
	add r1, sp, #0x18
	bl sub_02019314
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019B08 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x24]
	mov r2, r1
	bl DseSwd_LoadBank
	ldr r2, _02019B08 ; =_022A4E58
	mov r1, r0, lsl #0x10
	str r0, [r2, #4]
	mov r0, r1, lsr #0x10
	mov r1, #0
	bl DseSwd_LoadWaves
	mov r1, r0
	ldr r0, _02019B20 ; =_022A4E50
	ldr r2, _02019B08 ; =_022A4E58
	ldr r0, [r0, #4]
	str r1, [r2, #0x30]
	mov r2, #2
	bl MemLocateSet
	ldr r1, _02019B08 ; =_022A4E58
	str r0, [r1, #0x2c]
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	bl FileRom_InitDataTransfer
	bl sub_02003AB0
	ldr r0, _02019B08 ; =_022A4E58
	ldr r2, [r0, #4]
	ldr r1, [r0, #0x2c]
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_LoadWaves
_02019A5C:
	bl sub_02003AB0
	bl DseSwd_IsBankLoading
	cmp r0, #0
	bne _02019A5C
	bl FileRom_StopDataTransfer
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019B08 ; =_022A4E58
	ldr r0, [r0, #0x34]
	bl DseBgm_Load
	ldr r3, _02019B08 ; =_022A4E58
	ldr r1, _02019B24 ; =sub_0201AABC
	mov r2, #0
	str r0, [r3]
	bl DseBgm_SetSignalCallback
	mov r0, #0x3e8
	mov r1, #4
	str r1, [sp, #4]
	mul r0, r5, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	rsb r1, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r0, r0, r1, asr #8
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02019B08 ; =_022A4E58
	add r1, sp, #4
	ldr r0, [r0]
	mov r2, #1
	bl ResumeBgm
_02019AE4:
	ldr r1, _02019B08 ; =_022A4E58
	mov r2, #2
	ldr r0, _02019B00 ; =_020AFB28
	str r2, [r1, #0x1c]
	bl sub_02002E98
_02019AF8:
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02019B00: .word _020AFB28
_02019B04: .word _0209953C
_02019B08: .word _022A4E58
_02019B0C: .word 0x000003E7
_02019B10: .word _02099554
_02019B14: .word _022A4E8C
_02019B18: .word _0209956C
_02019B1C: .word _022A4E7C
_02019B20: .word _022A4E50
_02019B24: .word sub_0201AABC
	arm_func_end PlayBgm

	arm_func_start StopBgm
StopBgm: ; 0x02019B28
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, _02019C3C ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _02019C40 ; =_02099584
	mov r2, r4
	mov r0, #7
	bl Debug_Print
	ldr r5, _02019C44 ; =_022A4E58
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _02019C2C
	ldr r6, _02019C3C ; =_020AFB28
	b _02019B78
_02019B64:
	mov r0, r6
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r6
	bl sub_02002CB4
_02019B78:
	ldr r0, [r5, #0x1c]
	cmp r0, #1
	beq _02019B64
	cmp r0, #2
	bne _02019C2C
	mov r0, #0x3e8
	mul r0, r4, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	ldr r2, _02019C44 ; =_022A4E58
	mov r1, r1, lsr #0x10
	ldr r0, [r2]
	bl DseBgm_Stop
	ldr r0, _02019C44 ; =_022A4E58
	str r4, [sp]
	ldrh r3, [r0, #0x20]
	ldr r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	ldr r0, _02019C48 ; =_02099594
	bl Debug_Print0
	cmp r4, #0
	beq _02019BE4
	ldr r0, _02019C44 ; =_022A4E58
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _02019C2C
_02019BE4:
	ldr r5, _02019C3C ; =_020AFB28
	ldr r4, _02019C44 ; =_022A4E58
	b _02019C04
_02019BF0:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_02019C04:
	ldr r0, [r4]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02019BF0
	bl sub_02019408
	ldr r0, _02019C44 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019C4C ; =0x000003E7
	str r2, [r0, #0x1c]
	strh r1, [r0, #0x20]
_02019C2C:
	ldr r0, _02019C3C ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02019C3C: .word _020AFB28
_02019C40: .word _02099584
_02019C44: .word _022A4E58
_02019C48: .word _02099594
_02019C4C: .word 0x000003E7
	arm_func_end StopBgm

	arm_func_start ChangeBgm
ChangeBgm: ; 0x02019C50
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	ldr r0, _02019CF8 ; =_020AFB28
	mov r4, r1
	bl sub_02002CB4
	ldr r1, _02019CFC ; =_020995BC
	mov r2, r4
	mov r3, r5
	mov r0, #7
	bl Debug_Print
	ldr r0, _02019D00 ; =_022A4E58
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _02019CE8
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _02019CE0
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r2, #4
	mov r1, #0x3c
	str r2, [sp]
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r2, #4
	ldr r1, _02019D00 ; =_022A4E58
	rsb r3, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r3, r0, r3, asr #8
	ldr r0, [r1]
	add r1, sp, #0
	str r3, [sp, #0xc]
	str r2, [sp]
	bl DseBgm_SetFades
_02019CE0:
	ldr r0, _02019D00 ; =_022A4E58
	strh r4, [r0, #0x22]
_02019CE8:
	ldr r0, _02019CF8 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02019CF8: .word _020AFB28
_02019CFC: .word _020995BC
_02019D00: .word _022A4E58
	arm_func_end ChangeBgm

	arm_func_start sub_02019D04
sub_02019D04: ; 0x02019D04
	stmdb sp!, {r4, lr}
	ldr r0, _02019D50 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019D54 ; =_022A4E58
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _02019D3C
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	subgt r1, r1, #1
	movgt r4, #1
	strgt r1, [r0, #0x3c]
	movle r4, #0
	b _02019D40
_02019D3C:
	mov r4, #1
_02019D40:
	ldr r0, _02019D50 ; =_020AFB28
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02019D50: .word _020AFB28
_02019D54: .word _022A4E58
	arm_func_end sub_02019D04

	arm_func_start sub_02019D58
sub_02019D58: ; 0x02019D58
	stmdb sp!, {r4, lr}
	ldr r0, _02019D7C ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _02019D80 ; =_022A4E58
	ldr r0, _02019D7C ; =_020AFB28
	ldrh r4, [r1, #0x48]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02019D7C: .word _020AFB28
_02019D80: .word _022A4E58
	arm_func_end sub_02019D58

	arm_func_start PlayBgm2
PlayBgm2: ; 0x02019D84
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x98
	mov r6, r0
	ldr r0, _02019FC0 ; =_020AFB28
	mov r5, r1
	mov r4, r2
	bl sub_02002CB4
	ldr r1, _02019FC4 ; =_020995D0
	mov r2, r6
	mov r3, r4
	mov r0, #7
	str r5, [sp]
	bl Debug_Print
	ldr r0, _02019FC8 ; =_022A4E58
	ldrh r0, [r0, #0x20]
	cmp r6, r0
	bne _02019DE0
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
_02019DE0:
	ldr r1, _02019FC8 ; =_022A4E58
	ldr r0, _02019FCC ; =0x000003E7
	ldrh r1, [r1, #0x48]
	cmp r1, r0
	beq _02019E0C
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm2
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
_02019E0C:
	cmp r6, #1
	blo _02019E1C
	cmp r6, #0xc9
	bls _02019E3C
_02019E1C:
	ldr r1, _02019FC8 ; =_022A4E58
	mov r0, #0
	ldr r2, _02019FCC ; =0x000003E7
	str r0, [r1, #0x44]
	ldr r0, _02019FC0 ; =_020AFB28
	strh r2, [r1, #0x48]
	bl sub_02002E98
	b _02019FB8
_02019E3C:
	ldr r0, _02019FC8 ; =_022A4E58
	mov r1, #1
	str r1, [r0, #0x44]
	strh r6, [r0, #0x48]
	strh r4, [r0, #0x4a]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _02019FA4
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	ldr r1, _02019FD0 ; =_02099554
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019FD4 ; =_022A4EB4
	add r1, sp, #0x18
	bl LoadDseFile
	ldr r1, _02019FD8 ; =_0209956C
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019FDC ; =_022A4EA4
	add r1, sp, #0x18
	bl LoadDseFile
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019FC8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x4c]
	mov r2, r1
	bl DseSwd_LoadBank
	ldr r2, _02019FC8 ; =_022A4E58
	mov r1, r0, lsl #0x10
	str r0, [r2, #0xc]
	mov r0, r1, lsr #0x10
	mov r1, #0
	bl DseSwd_LoadWaves
	mov r1, r0
	ldr r0, _02019FE0 ; =_022A4E50
	ldr r2, _02019FC8 ; =_022A4E58
	ldr r0, [r0, #4]
	str r1, [r2, #0x58]
	mov r2, #2
	bl MemLocateSet
	ldr r1, _02019FC8 ; =_022A4E58
	str r0, [r1, #0x54]
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	bl FileRom_InitDataTransfer
	bl sub_02003AB0
	ldr r0, _02019FC8 ; =_022A4E58
	ldr r2, [r0, #0xc]
	ldr r1, [r0, #0x54]
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_LoadWaves
_02019F1C:
	bl sub_02003AB0
	bl DseSwd_IsBankLoading
	cmp r0, #0
	bne _02019F1C
	bl FileRom_StopDataTransfer
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019FC8 ; =_022A4E58
	ldr r0, [r0, #0x5c]
	bl DseBgm_Load
	ldr r3, _02019FC8 ; =_022A4E58
	ldr r1, _02019FE4 ; =sub_0201AABC
	mov r2, #0
	str r0, [r3, #8]
	bl DseBgm_SetSignalCallback
	mov r0, #0x3e8
	mov r1, #4
	str r1, [sp, #4]
	mul r0, r5, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	rsb r1, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r0, r0, r1, asr #8
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02019FC8 ; =_022A4E58
	add r1, sp, #4
	ldr r0, [r0, #8]
	mov r2, #1
	bl ResumeBgm
_02019FA4:
	ldr r1, _02019FC8 ; =_022A4E58
	mov r2, #2
	ldr r0, _02019FC0 ; =_020AFB28
	str r2, [r1, #0x44]
	bl sub_02002E98
_02019FB8:
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02019FC0: .word _020AFB28
_02019FC4: .word _020995D0
_02019FC8: .word _022A4E58
_02019FCC: .word 0x000003E7
_02019FD0: .word _02099554
_02019FD4: .word _022A4EB4
_02019FD8: .word _0209956C
_02019FDC: .word _022A4EA4
_02019FE0: .word _022A4E50
_02019FE4: .word sub_0201AABC
	arm_func_end PlayBgm2

	arm_func_start StopBgm2
StopBgm2: ; 0x02019FE8
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r0, _0201A0D8 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201A0DC ; =_020995E8
	mov r2, r4
	mov r0, #7
	bl Debug_Print
	ldr r5, _0201A0E0 ; =_022A4E58
	ldr r0, [r5, #0x44]
	cmp r0, #0
	beq _0201A0CC
	ldr r6, _0201A0D8 ; =_020AFB28
	b _0201A034
_0201A020:
	mov r0, r6
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r6
	bl sub_02002CB4
_0201A034:
	ldr r0, [r5, #0x44]
	cmp r0, #1
	beq _0201A020
	cmp r0, #2
	bne _0201A0CC
	mov r0, #0x3e8
	mul r0, r4, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	ldr r2, _0201A0E0 ; =_022A4E58
	mov r1, r1, lsr #0x10
	ldr r0, [r2, #8]
	bl DseBgm_Stop
	cmp r4, #0
	beq _0201A084
	ldr r0, _0201A0E0 ; =_022A4E58
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0201A0CC
_0201A084:
	ldr r5, _0201A0D8 ; =_020AFB28
	ldr r4, _0201A0E0 ; =_022A4E58
	b _0201A0A4
_0201A090:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_0201A0A4:
	ldr r0, [r4, #8]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201A090
	bl sub_02019488
	ldr r0, _0201A0E0 ; =_022A4E58
	mov r2, #0
	ldr r1, _0201A0E4 ; =0x000003E7
	str r2, [r0, #0x44]
	strh r1, [r0, #0x48]
_0201A0CC:
	ldr r0, _0201A0D8 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201A0D8: .word _020AFB28
_0201A0DC: .word _020995E8
_0201A0E0: .word _022A4E58
_0201A0E4: .word 0x000003E7
	arm_func_end StopBgm2

	arm_func_start ChangeBgm2
ChangeBgm2: ; 0x0201A0E8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	ldr r0, _0201A190 ; =_020AFB28
	mov r4, r1
	bl sub_02002CB4
	ldr r1, _0201A194 ; =_020995F8
	mov r2, r4
	mov r3, r5
	mov r0, #7
	bl Debug_Print
	ldr r0, _0201A198 ; =_022A4E58
	ldr r1, [r0, #0x44]
	cmp r1, #0
	beq _0201A180
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _0201A178
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r2, #4
	mov r1, #0x3c
	str r2, [sp]
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r2, #4
	ldr r1, _0201A198 ; =_022A4E58
	rsb r3, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r3, r0, r3, asr #8
	ldr r0, [r1, #8]
	add r1, sp, #0
	str r3, [sp, #0xc]
	str r2, [sp]
	bl DseBgm_SetFades
_0201A178:
	ldr r0, _0201A198 ; =_022A4E58
	strh r4, [r0, #0x4a]
_0201A180:
	ldr r0, _0201A190 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0201A190: .word _020AFB28
_0201A194: .word _020995F8
_0201A198: .word _022A4E58
	arm_func_end ChangeBgm2

	arm_func_start sub_0201A19C
sub_0201A19C: ; 0x0201A19C
	stmdb sp!, {r4, lr}
	ldr r0, _0201A1C0 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201A1C4 ; =_022A4E58
	ldr r0, _0201A1C0 ; =_020AFB28
	ldrh r4, [r1, #0x68]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201A1C0: .word _020AFB28
_0201A1C4: .word _022A4E58
	arm_func_end sub_0201A19C

	arm_func_start PlayME
PlayME: ; 0x0201A1C8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x98
	mov r6, r0
	ldr r0, _0201A3F0 ; =_020AFB28
	mov r5, r1
	mov r4, r2
	bl sub_02002CB4
	ldr r1, _0201A3F4 ; =_0209960C
	mov r2, r6
	mov r3, r4
	mov r0, #7
	str r5, [sp]
	bl Debug_Print
	ldr r7, _0201A3F8 ; =_022A4E58
	cmp r6, #0xd
	ldr r0, [r7, #0x18]
	movhi r6, #0
	cmp r0, #0
	bne _0201A2B0
	mov r0, #1
	str r0, [r7, #0x18]
	str r0, [r7, #0x64]
	ldr r8, _0201A3F0 ; =_020AFB28
	strh r6, [r7, #0x68]
_0201A228:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	beq _0201A268
	cmp r0, #2
	bne _0201A250
	ldr r0, _0201A3F8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0]
	bl DseBgm_Stop
	b _0201A268
_0201A250:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
	b _0201A228
_0201A268:
	ldr r8, _0201A3F0 ; =_020AFB28
	ldr r7, _0201A3F8 ; =_022A4E58
_0201A270:
	ldr r0, [r7, #0x44]
	cmp r0, #0
	beq _0201A304
	cmp r0, #2
	bne _0201A298
	ldr r0, _0201A3F8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #8]
	bl DseBgm_Stop
	b _0201A304
_0201A298:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
	b _0201A270
_0201A2B0:
	ldr r0, [r7, #0x64]
	cmp r0, #2
	bne _0201A304
	ldr r0, _0201A3F0 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopME
	ldr r0, _0201A3F0 ; =_020AFB28
	bl sub_02002CB4
	ldr r8, _0201A3F0 ; =_020AFB28
	b _0201A2F0
_0201A2DC:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
_0201A2F0:
	ldr r0, [r7, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201A2DC
	bl sub_02019508
_0201A304:
	ldr r1, _0201A3F8 ; =_022A4E58
	mov r0, #1
	str r0, [r1, #0x18]
	str r0, [r1, #0x64]
	ldr r0, _0201A3F0 ; =_020AFB28
	strh r6, [r1, #0x68]
	bl sub_02002E98
	ldr r1, _0201A3FC ; =_02099620
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _0201A400 ; =_022A4ECC
	add r1, sp, #0x18
	bl sub_02019314
	ldr r1, _0201A404 ; =_02099634
	add r0, sp, #0x18
	bl sprintf
	ldr r0, _0201A408 ; =_022A4EC4
	add r1, sp, #0x18
	bl sub_02019314
	ldr r0, _0201A3F0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _0201A3F8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x6c]
	mov r2, r1
	bl DseSwd_LoadBank
	ldr r1, _0201A3F8 ; =_022A4E58
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x74]
	bl DseBgm_Load
	ldr r1, _0201A3F8 ; =_022A4E58
	mov r2, #4
	str r0, [r1, #0x10]
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r1, #0x3c
	str r2, [sp, #4]
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	rsb r1, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r0, r0, r1, asr #8
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _0201A3F8 ; =_022A4E58
	add r1, sp, #4
	ldr r0, [r0, #0x10]
	mov r2, #1
	bl ResumeBgm
	ldr r1, _0201A3F8 ; =_022A4E58
	mov r2, #2
	ldr r0, _0201A3F0 ; =_020AFB28
	str r2, [r1, #0x64]
	bl sub_02002E98
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A3F0: .word _020AFB28
_0201A3F4: .word _0209960C
_0201A3F8: .word _022A4E58
_0201A3FC: .word _02099620
_0201A400: .word _022A4ECC
_0201A404: .word _02099634
_0201A408: .word _022A4EC4
	arm_func_end PlayME

	arm_func_start StopME
StopME: ; 0x0201A40C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0201A474 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201A478 ; =_02099644
	mov r2, r4
	mov r0, #7
	bl Debug_Print
	ldr r0, _0201A47C ; =_022A4E58
	ldr r1, [r0, #0x18]
	cmp r1, #1
	ldreq r0, [r0, #0x64]
	cmpeq r0, #2
	bne _0201A468
	mov r0, #0x3e8
	mul r0, r4, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	ldr r2, _0201A47C ; =_022A4E58
	mov r1, r1, lsr #0x10
	ldr r0, [r2, #0x10]
	bl DseBgm_Stop
_0201A468:
	ldr r0, _0201A474 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201A474: .word _020AFB28
_0201A478: .word _02099644
_0201A47C: .word _022A4E58
	arm_func_end StopME

	arm_func_start sub_0201A480
sub_0201A480: ; 0x0201A480
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r1, r7, asr #8
	ldr r0, _0201A4F4 ; =_020AFB28
	and r5, r7, #0xff
	and r4, r1, #0xff
	mov r6, #0
	bl sub_02002CB4
	cmp r5, #0
	cmpne r4, #0x3f
	beq _0201A4E4
	cmp r4, #1
	bne _0201A4D4
	ldr r0, _0201A4F8 ; =_022A4E58
	mov r1, r5, lsl #0x10
	ldr r0, [r0, #0x88]
	mov r1, r1, lsr #0x10
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	movgt r6, #1
	b _0201A4E4
_0201A4D4:
	ldr r0, _0201A4F8 ; =_022A4E58
	ldrh r0, [r0, #0x98]
	cmp r0, r7
	moveq r6, #1
_0201A4E4:
	ldr r0, _0201A4F4 ; =_020AFB28
	bl sub_02002E98
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201A4F4: .word _020AFB28
_0201A4F8: .word _022A4E58
	arm_func_end sub_0201A480

	arm_func_start PlaySe
PlaySe: ; 0x0201A4FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov r5, r0
	mov r2, r5, asr #8
	ldr r0, _0201A660 ; =_020AFB28
	mov r7, r1
	and r6, r2, #0xff
	and r4, r5, #0xff
	bl sub_02002CB4
	ldr r1, _0201A664 ; =_02099650
	mov r2, r5
	mov r3, r7
	mov r0, #8
	bl Debug_Print
	rsb r0, r7, r7, lsl #7
	mov r0, r0, asr #8
	mov r1, #4
	str r0, [sp, #0xc]
	str r1, [sp]
	cmp r4, #0
	beq _0201A650
	cmp r6, #0x3f
	bne _0201A578
	ldr r3, _0201A668 ; =_022A4E58
	add r2, sp, #0
	ldr r0, [r3, #0x7c]
	mov r1, #0
	add r0, r0, r4, lsl #16
	str r0, [r3, #0x84]
	bl DseSe_Play
	b _0201A650
_0201A578:
	cmp r6, #1
	bne _0201A5A0
	ldr r3, _0201A668 ; =_022A4E58
	add r2, sp, #0
	ldr r0, [r3, #0x88]
	mov r1, #0
	add r0, r0, r4, lsl #16
	str r0, [r3, #0x90]
	bl DseSe_Play
	b _0201A650
_0201A5A0:
	ldr r0, _0201A668 ; =_022A4E58
	mov r1, #1
	ldrh r2, [r0, #0x98]
	ldr r3, [r0, #0x94]
	str r1, [r0, #0x94]
	cmp r3, #0
	strh r5, [r0, #0x98]
	cmpne r2, #0x3f00
	beq _0201A60C
	mov r1, #0
	ldr r0, [r0, #0xdc]
	mov r2, r1
	bl DseSe_Stop
	ldr r8, _0201A660 ; =_020AFB28
	mov r7, #0
	ldr r6, _0201A668 ; =_022A4E58
	b _0201A5F8
_0201A5E4:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
_0201A5F8:
	ldr r0, [r6, #0xdc]
	mov r1, r7
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	bgt _0201A5E4
_0201A60C:
	mov r0, r5
	bl PlaySeLoad
	cmp r0, #0
	ldreq r0, _0201A668 ; =_022A4E58
	mov r1, #0
	streq r1, [r0, #0x94]
	moveq r1, #0x3f00
	streqh r1, [r0, #0x98]
	beq _0201A650
	ldr r3, _0201A668 ; =_022A4E58
	mov r0, #2
	str r0, [r3, #0x94]
	ldr r0, [r3, #0xc8]
	add r2, sp, #0
	add r0, r0, r4, lsl #16
	str r0, [r3, #0xdc]
	bl DseSe_Play
_0201A650:
	ldr r0, _0201A660 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A660: .word _020AFB28
_0201A664: .word _02099650
_0201A668: .word _022A4E58
	arm_func_end PlaySe

	arm_func_start PlaySeFullSpec
PlaySeFullSpec: ; 0x0201A66C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x1c
	mov sb, r0
	mov r4, sb, asr #8
	ldr r0, _0201A81C ; =_020AFB28
	mov r8, r1
	mov r7, r2
	mov r6, r3
	and r4, r4, #0xff
	and r5, sb, #0xff
	bl sub_02002CB4
	str r7, [sp]
	str r6, [sp, #4]
	mov r0, #8
	ldr r1, _0201A820 ; =_02099660
	mov r2, sb
	mov r3, r8
	bl Debug_Print
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x3e8
	mul r0, r8, r0
	mov r1, #0x3c
	bl _s32_div_f
	rsb r2, r7, r7, lsl #7
	rsb r1, r6, r6, lsl #6
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, lsl #0x10
	add r0, r0, r2, asr #8
	str r0, [sp, #0x14]
	cmp r5, #0
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	mov r0, r0, asr #8
	add r0, r0, #0x40
	str r0, [sp, #0x18]
	mov r0, #0xc
	str r0, [sp, #8]
	beq _0201A80C
	cmp r4, #0x3f
	bne _0201A734
	ldr r3, _0201A824 ; =_022A4E58
	add r2, sp, #8
	ldr r0, [r3, #0x7c]
	mov r1, #0
	add r0, r0, r5, lsl #16
	str r0, [r3, #0x84]
	bl DseSe_Play
	b _0201A80C
_0201A734:
	cmp r4, #1
	bne _0201A75C
	ldr r3, _0201A824 ; =_022A4E58
	add r2, sp, #8
	ldr r0, [r3, #0x88]
	mov r1, #0
	add r0, r0, r5, lsl #16
	str r0, [r3, #0x90]
	bl DseSe_Play
	b _0201A80C
_0201A75C:
	ldr r0, _0201A824 ; =_022A4E58
	mov r1, #1
	ldrh r2, [r0, #0x98]
	ldr r3, [r0, #0x94]
	str r1, [r0, #0x94]
	cmp r3, #0
	strh sb, [r0, #0x98]
	cmpne r2, #0x3f00
	beq _0201A7C8
	mov r1, #0
	ldr r0, [r0, #0xdc]
	mov r2, r1
	bl DseSe_Stop
	ldr r7, _0201A81C ; =_020AFB28
	mov r6, #0
	ldr r4, _0201A824 ; =_022A4E58
	b _0201A7B4
_0201A7A0:
	mov r0, r7
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r7
	bl sub_02002CB4
_0201A7B4:
	ldr r0, [r4, #0xdc]
	mov r1, r6
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	bgt _0201A7A0
_0201A7C8:
	mov r0, sb
	bl PlaySeLoad
	cmp r0, #0
	ldreq r0, _0201A824 ; =_022A4E58
	mov r1, #0
	streq r1, [r0, #0x94]
	moveq r1, #0x3f00
	streqh r1, [r0, #0x98]
	beq _0201A80C
	ldr r3, _0201A824 ; =_022A4E58
	mov r0, #2
	str r0, [r3, #0x94]
	ldr r0, [r3, #0xc8]
	add r2, sp, #8
	add r0, r0, r5, lsl #16
	str r0, [r3, #0xdc]
	bl DseSe_Play
_0201A80C:
	ldr r0, _0201A81C ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0201A81C: .word _020AFB28
_0201A820: .word _02099660
_0201A824: .word _022A4E58
	arm_func_end PlaySeFullSpec

	arm_func_start SeChangeVolume
SeChangeVolume: ; 0x0201A828
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r8, r0
	mov r3, r8, asr #8
	ldr r0, _0201A8F4 ; =_020AFB28
	mov r7, r1
	mov r6, r2
	and r4, r3, #0xff
	and r5, r8, #0xff
	bl sub_02002CB4
	ldr r1, _0201A8F8 ; =_02099684
	mov r2, r8
	mov r3, r7
	str r6, [sp]
	mov r0, #8
	bl Debug_Print
	mov r0, #0x3e8
	mul r0, r7, r0
	mov r1, #4
	str r1, [sp, #4]
	mov r1, #0x3c
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #4
	rsb r2, r6, r6, lsl #7
	str r0, [sp, #4]
	mov r0, r1, lsl #0x10
	add r0, r0, r2, asr #8
	str r0, [sp, #0x10]
	cmp r5, #0
	beq _0201A8E4
	cmp r4, #0x3f
	ldreq r0, _0201A8FC ; =_022A4E58
	ldreq r0, [r0, #0x7c]
	addeq r0, r0, r5, lsl #16
	beq _0201A8D8
	cmp r4, #1
	ldreq r0, _0201A8FC ; =_022A4E58
	ldreq r0, [r0, #0x88]
	addeq r0, r0, r5, lsl #16
	ldrne r0, _0201A8FC ; =_022A4E58
	ldrne r0, [r0, #0xc8]
	addne r0, r0, r5, lsl #16
_0201A8D8:
	add r2, sp, #4
	mov r1, #0
	bl sub_0206F5C8
_0201A8E4:
	ldr r0, _0201A8F4 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A8F4: .word _020AFB28
_0201A8F8: .word _02099684
_0201A8FC: .word _022A4E58
	arm_func_end SeChangeVolume

	arm_func_start SeChangePan
SeChangePan: ; 0x0201A900
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r8, r0
	mov r3, r8, asr #8
	ldr r0, _0201A9D8 ; =_020AFB28
	mov r7, r1
	mov r6, r2
	and r4, r3, #0xff
	and r5, r8, #0xff
	bl sub_02002CB4
	ldr r1, _0201A9DC ; =_020996A4
	mov r2, r8
	mov r3, r7
	str r6, [sp]
	mov r0, #8
	bl Debug_Print
	mov r0, #0x3e8
	mul r0, r7, r0
	mov r1, #4
	str r1, [sp, #4]
	mov r1, #0x3c
	bl _s32_div_f
	rsb r2, r6, r6, lsl #6
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r2, r1, asr #8
	mov r0, r0, lsl #0x10
	mov r1, #8
	str r1, [sp, #4]
	add r1, r2, #0x40
	mov r0, r0, lsr #0x10
	add r0, r1, r0, lsl #16
	str r0, [sp, #0x14]
	cmp r5, #0
	beq _0201A9C8
	cmp r4, #0x3f
	ldreq r0, _0201A9E0 ; =_022A4E58
	ldreq r0, [r0, #0x7c]
	addeq r0, r0, r5, lsl #16
	beq _0201A9BC
	cmp r4, #1
	ldreq r0, _0201A9E0 ; =_022A4E58
	ldreq r0, [r0, #0x88]
	addeq r0, r0, r5, lsl #16
	ldrne r0, _0201A9E0 ; =_022A4E58
	ldrne r0, [r0, #0xc8]
	addne r0, r0, r5, lsl #16
_0201A9BC:
	add r2, sp, #4
	mov r1, #0
	bl sub_0206F5C8
_0201A9C8:
	ldr r0, _0201A9D8 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A9D8: .word _020AFB28
_0201A9DC: .word _020996A4
_0201A9E0: .word _022A4E58
	arm_func_end SeChangePan

	arm_func_start StopSe
StopSe: ; 0x0201A9E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r2, r7, asr #8
	ldr r0, _0201AA94 ; =_020AFB28
	mov r5, r1
	and r6, r2, #0xff
	and r4, r7, #0xff
	bl sub_02002CB4
	ldr r1, _0201AA98 ; =_020996C0
	mov r2, r7
	mov r3, r5
	mov r0, #8
	bl Debug_Print
	cmp r7, #0x3f00
	bne _0201AA2C
	mov r0, #0
	bl DseSe_StopAll
	b _0201AA88
_0201AA2C:
	cmp r4, #0
	beq _0201AA88
	cmp r6, #0x3f
	ldreq r0, _0201AA9C ; =_022A4E58
	ldreq r0, [r0, #0x7c]
	addeq r4, r0, r4, lsl #16
	beq _0201AA64
	cmp r6, #1
	ldreq r0, _0201AA9C ; =_022A4E58
	ldreq r0, [r0, #0x88]
	addeq r4, r0, r4, lsl #16
	ldrne r0, _0201AA9C ; =_022A4E58
	ldrne r0, [r0, #0xc8]
	addne r4, r0, r4, lsl #16
_0201AA64:
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	mov r2, r1, lsr #0x10
	mov r0, r4
	mov r1, #0
	bl DseSe_Stop
_0201AA88:
	ldr r0, _0201AA94 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201AA94: .word _020AFB28
_0201AA98: .word _020996C0
_0201AA9C: .word _022A4E58
	arm_func_end StopSe

	arm_func_start sub_0201AAA0
sub_0201AAA0: ; 0x0201AAA0
	mov r0, r0, asr #8
	and r0, r0, #0xff
	cmp r0, #0x3f
	cmpne r0, #1
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_0201AAA0

	arm_func_start sub_0201AABC
sub_0201AABC: ; 0x0201AABC
	ldr r1, _0201AAD4 ; =_022A4E58
	mov r0, #0
	ldr r2, [r1, #0x3c]
	add r2, r2, #1
	str r2, [r1, #0x3c]
	bx lr
	.align 2, 0
_0201AAD4: .word _022A4E58
	arm_func_end sub_0201AABC

	arm_func_start sub_0201AAD8
sub_0201AAD8: ; 0x0201AAD8
	ldrb ip, [sp]
	cmp ip, #1
	cmpne ip, #2
	moveq r3, r3, lsl #1
	str r3, [r0]
	str r2, [r0, #4]
	str r1, [r0, #8]
	ldrb r2, [sp]
	ldrh r1, [sp, #4]
	strb r2, [r0, #0xe]
	strh r1, [r0, #0xc]
	mov r0, r3
	bx lr
	arm_func_end sub_0201AAD8

	arm_func_start ExecuteCopyToFlatVramCommand
ExecuteCopyToFlatVramCommand: ; 0x0201AB0C
	stmdb sp!, {r3, lr}
	mov ip, r0
	ldr r1, [ip, #4]
	cmp r1, #0
	beq _0201AB7C
	ldrb r0, [ip, #0xe]
	cmp r0, #0
	bne _0201AB40
	mov r0, r1
	ldr r1, [ip, #8]
	ldr r2, [ip]
	bl ArrayCopy32
	ldmia sp!, {r3, pc}
_0201AB40:
	cmp r0, #1
	bne _0201AB60
	ldr r2, [ip]
	ldrh r3, [ip, #0xc]
	ldr r0, [ip, #8]
	mov r2, r2, asr #1
	bl CopyAndInterleave
	ldmia sp!, {r3, pc}
_0201AB60:
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	ldr r2, [ip]
	ldr r0, [ip, #8]
	mov r2, r2, asr #1
	bl CopyAndInterleave0
	ldmia sp!, {r3, pc}
_0201AB7C:
	ldr r1, [ip, #8]
	ldr r2, [ip]
	mov r0, #0
	bl ArrayFill32
	ldmia sp!, {r3, pc}
	arm_func_end ExecuteCopyToFlatVramCommand

	arm_func_start sub_0201AB90
sub_0201AB90: ; 0x0201AB90
	ldr ip, _0201ABA8 ; =MemZero
	add r2, r0, #0xe00
	mov r3, #0
	mov r1, #0xe00
	strh r3, [r2]
	bx ip
	.align 2, 0
_0201ABA8: .word MemZero
	arm_func_end sub_0201AB90

	arm_func_start DecodeFragmentByteAssemblyTable
DecodeFragmentByteAssemblyTable: ; 0x0201ABAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x18
	mov r7, #0
	mov sb, r0
	mov r8, r1
	mov r6, r7
	add r5, sp, #8
	b _0201ABF8
_0201ABCC:
	str r6, [sp]
	str r6, [sp, #4]
	ldr r2, [sb], #0xc
	mov r0, r5
	mov r1, r8
	bl sub_0201AAD8
	mov r4, r0
	mov r0, r5
	bl ExecuteCopyToFlatVramCommand
	add r8, r8, r4
	add r7, r7, r4
_0201ABF8:
	ldr r3, [sb, #4]
	cmp r3, #0
	bne _0201ABCC
	mov r0, r7
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DecodeFragmentByteAssemblyTable

	arm_func_start sub_0201AC10
sub_0201AC10: ; 0x0201AC10
	add r0, r0, #0xe00
	mov r1, #0
	strh r1, [r0]
	bx lr
	arm_func_end sub_0201AC10

	arm_func_start sub_0201AC20
sub_0201AC20: ; 0x0201AC20
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldrb lr, [sp, #0x10]
	ldrh ip, [sp, #0x14]
	mov r4, r0
	str lr, [sp]
	str ip, [sp, #4]
	add r0, r4, #0xe00
	ldrsh r0, [r0]
	add r0, r4, r0, lsl #4
	bl sub_0201AAD8
	add r0, r4, #0xe00
	ldrsh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201AC20

	arm_func_start sub_0201AC64
sub_0201AC64: ; 0x0201AC64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x30]
	add r4, sl, #0xe00
	mov fp, #1
	mov r5, #0
	b _0201AD30
_0201AC90:
	ldrsh r0, [r4]
	cmp r0, #0xe0
	bge _0201AD3C
	cmp r7, #0
	beq _0201ACB8
	cmp r7, #1
	beq _0201ACD8
	cmp r7, #2
	beq _0201ACF8
	b _0201AD1C
_0201ACB8:
	str r5, [sp]
	str r5, [sp, #4]
	ldr r2, [sb]
	mov r1, r8
	add r0, sl, r0, lsl #4
	bl sub_0201AAD8
	mov r3, r0
	b _0201AD1C
_0201ACD8:
	str fp, [sp]
	str r6, [sp, #4]
	ldr r2, [sb]
	mov r1, r8
	add r0, sl, r0, lsl #4
	bl sub_0201AAD8
	mov r3, r0
	b _0201AD1C
_0201ACF8:
	mov r1, #2
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldr r2, [sb]
	mov r1, r8
	add r0, sl, r0, lsl #4
	bl sub_0201AAD8
	mov r3, r0
_0201AD1C:
	ldrsh r0, [r4]
	add r8, r8, r3
	add sb, sb, #0xc
	add r0, r0, #1
	strh r0, [r4]
_0201AD30:
	ldr r3, [sb, #4]
	cmp r3, #0
	bne _0201AC90
_0201AD3C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0201AC64

	arm_func_start sub_0201AD44
sub_0201AD44: ; 0x0201AD44
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	add r0, r6, #0xe00
	ldrsh r5, [r0]
	mov r4, #0
	b _0201AD70
_0201AD5C:
	add r0, r6, r4, lsl #4
	bl ExecuteCopyToFlatVramCommand
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_0201AD70:
	cmp r4, r5
	blt _0201AD5C
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201AD44

	arm_func_start sub_0201AD7C
sub_0201AD7C: ; 0x0201AD7C
	add r0, r0, #0x14
	bx lr
	arm_func_end sub_0201AD7C

	arm_func_start sub_0201AD84
sub_0201AD84: ; 0x0201AD84
	add r0, r0, #0x50
	bx lr
	arm_func_end sub_0201AD84

	arm_func_start sub_0201AD8C
sub_0201AD8C: ; 0x0201AD8C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, r2
	mov r5, #0
	mov ip, #1
	b _0201ADC0
_0201ADA4:
	add r2, r1, r5
	and r2, r2, #0xff
	ldrh lr, [r4, #0x7a]
	mov r2, r2, asr #4
	add r5, r5, #0x10
	orr r2, lr, ip, lsl r2
	strh r2, [r4, #0x7a]
_0201ADC0:
	cmp r5, r0
	blt _0201ADA4
	mov ip, r0, lsr #0x1f
	rsb r2, ip, r0, lsl #28
	adds r2, ip, r2, ror #28
	beq _0201ADF8
	add r2, r1, r0
	sub r2, r2, #1
	and r2, r2, #0xff
	ldrh lr, [r4, #0x7a]
	mov r2, r2, asr #4
	mov ip, #1
	orr r2, lr, ip, lsl r2
	strh r2, [r4, #0x7a]
_0201ADF8:
	mov r1, r1, lsl #0x10
	mov r2, r3
	mov r3, r0
	add r0, r4, #0x14
	mov r1, r1, lsr #0x10
	bl sub_0200A5B0
	add r0, r4, #0x14
	bl sub_0200A504
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0201AD8C

	arm_func_start sub_0201AE1C
sub_0201AE1C: ; 0x0201AE1C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov lr, #0
	add ip, r4, r1, lsl #1
	mov r5, #1
	b _0201AE50
_0201AE34:
	add r0, r2, lr
	and r0, r0, #0xff
	ldrh r6, [ip, #0x7c]
	mov r0, r0, asr #4
	add lr, lr, #0x10
	orr r0, r6, r5, lsl r0
	strh r0, [ip, #0x7c]
_0201AE50:
	cmp lr, r3
	blt _0201AE34
	mov ip, r3, lsr #0x1f
	rsb r0, ip, r3, lsl #28
	adds r0, ip, r0, ror #28
	beq _0201AE90
	add r0, r2, r3
	sub r0, r0, #1
	and r0, r0, #0xff
	add r6, r4, #0x7c
	mov r5, r1, lsl #1
	ldrh lr, [r6, r5]
	mov r0, r0, asr #4
	mov ip, #1
	orr r0, lr, ip, lsl r0
	strh r0, [r6, r5]
_0201AE90:
	add r0, r2, r1, lsl #8
	mov r1, r0, lsl #0x10
	ldr r2, [sp, #0x10]
	add r0, r4, #0x50
	mov r1, r1, lsr #0x10
	bl sub_0200A5B0
	add r0, r4, #0x50
	bl sub_0200A504
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201AE1C

	arm_func_start sub_0201AEB4
sub_0201AEB4: ; 0x0201AEB4
	ldrh r3, [r0, #0x7a]
	mov r1, r1, asr #4
	mov r2, #1
	orr r1, r3, r2, lsl r1
	strh r1, [r0, #0x7a]
	bx lr
	arm_func_end sub_0201AEB4

	arm_func_start sub_0201AECC
sub_0201AECC: ; 0x0201AECC
	stmdb sp!, {r3, lr}
	add lr, r0, #0x7c
	mov ip, r1, lsl #1
	ldrh r3, [lr, ip]
	mov r0, r2, asr #4
	mov r1, #1
	orr r0, r3, r1, lsl r0
	strh r0, [lr, ip]
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201AECC

	arm_func_start sub_0201AEF0
sub_0201AEF0: ; 0x0201AEF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r1, #0x9c
	bl MemZero
	strb r4, [r5, #0x79]
	ldrb r0, [r5, #0x78]
	orr r0, r0, #2
	strb r0, [r5, #0x78]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0201AEF0

	arm_func_start sub_0201AF18
sub_0201AF18: ; 0x0201AF18
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r3, r1
	mov r1, #0
	mov r2, #0x100
	mov r4, r0
	str r1, [sp]
	bl sub_0200A124
	mov r2, #0
	mov r1, r4
	str r2, [sp]
	add r0, r4, #0x14
	mov r3, #0x100
	bl sub_0200A478
	ldrb r0, [r4, #0x78]
	orr r0, r0, #4
	strb r0, [r4, #0x78]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0201AF18

	arm_func_start sub_0201AF64
sub_0201AF64: ; 0x0201AF64
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r3, r1
	mov ip, #0
	add r0, r4, #0x3c
	mov r1, #2
	mov r2, #0x1000
	str ip, [sp]
	bl sub_0200A124
	mov r2, #0
	str r2, [sp]
	add r0, r4, #0x50
	add r1, r4, #0x3c
	mov r3, #0x1000
	bl sub_0200A478
	ldrb r0, [r4, #0x78]
	orr r0, r0, #8
	strb r0, [r4, #0x78]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0201AF64

	arm_func_start sub_0201AFB8
sub_0201AFB8: ; 0x0201AFB8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x78]
	mov r0, r0, lsl #0x1d
	movs r0, r0, lsr #0x1f
	beq _0201AFE0
	add r0, r4, #0x14
	bl sub_0200A510
	mov r0, r4
	bl sub_0200A180
_0201AFE0:
	ldrb r0, [r4, #0x78]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x50
	bl sub_0200A510
	add r0, r4, #0x3c
	bl sub_0200A180
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201AFB8

	arm_func_start sub_0201B004
sub_0201B004: ; 0x0201B004
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrb r1, [r7, #0x78]
	mov r2, r1, lsl #0x1d
	movs r2, r2, lsr #0x1f
	beq _0201B158
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	beq _0201B14C
	ldrb r0, [r7, #8]
	cmp r0, #0
	beq _0201B150
	mov r4, #0
_0201B038:
	mov r2, r4, lsl #4
	and r0, r2, #0xff
	ldrh r1, [r7, #0x7a]
	mov r0, r0, asr #4
	mov r3, #1
	tst r1, r3, lsl r0
	moveq r3, #0
	tst r3, #0xff
	beq _0201B12C
	mov r0, r2, lsl #0x10
	ldr r1, [r7, #0x10]
	mov r3, r0, asr #0x10
	add r5, r1, r3, lsl #1
	ldr r2, [r7, #0xc]
	mov r0, r5
	mov r1, #0x20
	add r6, r2, r3, lsl #1
	bl sub_0207A2DC
	ldr r0, [r7]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0201B0A4
_0201B090: ; jump table
	b _0201B0A4 ; case 0
	b _0201B0C0 ; case 1
	b _0201B0DC ; case 2
	b _0201B0F8 ; case 3
	b _0201B114 ; case 4
_0201B0A4:
	mov r1, #0
_0201B0A8:
	ldrh r0, [r5], #2
	add r1, r1, #1
	cmp r1, #0x10
	strh r0, [r6], #2
	blt _0201B0A8
	b _0201B12C
_0201B0C0:
	bl GX_BeginLoadBGExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GX_EndLoadBGExtPltt
	b _0201B12C
_0201B0DC:
	bl GX_BeginLoadOBJExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GX_EndLoadOBJExtPltt
	b _0201B12C
_0201B0F8:
	bl GXS_BeginLoadBGExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GXS_EndLoadBGExtPltt
	b _0201B12C
_0201B114:
	bl GXS_BeginLoadOBJExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GXS_EndLoadOBJExtPltt
_0201B12C:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x10
	blt _0201B038
	mov r0, #0
	strb r0, [r7, #8]
	b _0201B150
_0201B14C:
	bl sub_0200A184
_0201B150:
	mov r0, #0
	strh r0, [r7, #0x7a]
_0201B158:
	ldrb r0, [r7, #0x78]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r7, #0x3c
	bl sub_0200A184
	mov r3, #0
	mov r2, r3
_0201B178:
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	add r1, r7, r3, lsl #1
	mov r3, r0, asr #0x10
	strh r2, [r1, #0x7c]
	cmp r3, #0x10
	blt _0201B178
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0201B004

	arm_func_start sub_0201B198
sub_0201B198: ; 0x0201B198
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r5, [sp, #0x20]
	mov r8, r1
	mov r4, r0
	mov r1, #0x70
	mov r7, r2
	mov r6, r3
	bl MemZero
	strb r5, [r4, #0xe]
	strb r6, [r4]
	stmib r4, {r7, r8}
	ldr r0, [r4, #4]
	bl sub_0201AC10
	mov r0, #2
	strh r0, [r4, #0xc]
	cmp r6, #0
	moveq r0, #0x6400000
	movne r0, #0x6600000
	str r0, [r4, #0x64]
	cmp r5, #0
	bne _0201B210
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x70
	mov r2, #0x140
	mov r3, #0x7000000
	str ip, [sp]
	bl sub_0200B508
	b _0201B284
_0201B210:
	cmp r5, #1
	bne _0201B238
	ldr r3, _0201B294 ; =0x07000400
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x70
	mov r2, #0x140
	str ip, [sp]
	bl sub_0200B508
	b _0201B284
_0201B238:
	cmp r5, #2
	bne _0201B260
	ldr r3, _0201B298 ; =0x07000380
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x10
	mov r2, #0x140
	str ip, [sp]
	bl sub_0200B508
	b _0201B284
_0201B260:
	cmp r5, #3
	bne _0201B284
	ldr r3, _0201B29C ; =0x07000780
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x10
	mov r2, #0x140
	str ip, [sp]
	bl sub_0200B508
_0201B284:
	mov r0, r4
	bl sub_0201B2A0
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201B294: .word 0x07000400
_0201B298: .word 0x07000380
_0201B29C: .word 0x07000780
	arm_func_end sub_0201B198

	arm_func_start sub_0201B2A0
sub_0201B2A0: ; 0x0201B2A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x40]
	add r0, r4, #0x20
	bl sub_0200B67C
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x10
	mov r1, #0xc
	bl MemZero
	mov r0, #0
	strb r0, [r4, #0x1c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201B2A0

	arm_func_start sub_0201B2DC
sub_0201B2DC: ; 0x0201B2DC
	stmdb sp!, {r4, r5, r6, lr}
	mov ip, #0
	cmp r1, #0
	moveq r0, ip
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrh r6, [r0, #0xc]
	ldrh r4, [r3, #4]
	ldr r5, _0201B384 ; =_020AFC28
	mov lr, r6, lsr #0x1f
	rsb r3, lr, r6, lsl #30
	add r3, lr, r3, ror #30
	mov r3, r3, lsl #1
	ldrsh r3, [r5, r3]
	cmp r4, #0
	ldr lr, [r0, #0x64]
	mul r5, r2, r3
	bne _0201B35C
	ldrh r3, [sp, #0x10]
	mov r0, r1
	cmp r3, #0x10
	bhs _0201B344
	mov r2, ip
	add r1, r5, lr
	bl DecodeFragmentByteAssemblyTable
	mov ip, r0
	b _0201B37C
_0201B344:
	mov r3, ip
	add r1, r5, lr
	mov r2, #2
	bl DecodeFragmentByteAssemblyTable
	mov ip, r0
	b _0201B37C
_0201B35C:
	cmp r4, #1
	bne _0201B37C
	ldrh r3, [sp, #0x10]
	mov r0, r1
	mov r2, ip
	add r1, r5, lr
	bl DecodeFragmentByteAssemblyTable
	mov ip, r0
_0201B37C:
	mov r0, ip
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201B384: .word _020AFC28
	arm_func_end sub_0201B2DC

	arm_func_start sub_0201B388
sub_0201B388: ; 0x0201B388
	stmdb sp!, {r3, r4, r5, lr}
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh lr, [r0, #0xc]
	ldrb ip, [r3, #0xa]
	ldr r5, _0201B438 ; =_020AFC28
	mov r4, lr, lsr #0x1f
	rsb lr, r4, lr, lsl #30
	add r4, r4, lr, ror #30
	mov r4, r4, lsl #1
	ldrsh lr, [r5, r4]
	cmp ip, #0xff
	ldr r4, [r0, #0x64]
	mul r5, r2, lr
	ldreqh r2, [sp, #0x10]
	andeq ip, r2, #0xff
	ldrh r2, [r3, #4]
	cmp r2, #0
	bne _0201B414
	cmp ip, #0x10
	bhs _0201B3F8
	mov r3, #0
	str r3, [sp]
	ldr r0, [r0, #4]
	add r2, r5, r4
	bl sub_0201AC64
	b _0201B430
_0201B3F8:
	mov r2, #0
	str r2, [sp]
	ldr r0, [r0, #4]
	add r2, r5, r4
	mov r3, #2
	bl sub_0201AC64
	b _0201B430
_0201B414:
	cmp r2, #1
	bne _0201B430
	mov r3, #0
	str r3, [sp]
	ldr r0, [r0, #4]
	add r2, r5, r4
	bl sub_0201AC64
_0201B430:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201B438: .word _020AFC28
	arm_func_end sub_0201B388

	arm_func_start sub_0201B43C
sub_0201B43C: ; 0x0201B43C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r1
	ldrb r1, [r6, #0xa]
	mov r7, r0
	ldrh r0, [r6, #4]
	mov r5, r2
	cmp r1, #0xff
	movne r5, r1
	cmp r0, #0
	bne _0201B4B8
	cmp r5, #0x10
	bhs _0201B48C
	ldrsh r2, [r6, #6]
	mov r1, r5, lsl #4
	ldr r0, [r7, #8]
	ldr r3, [r6]
	and r1, r1, #0xff
	and r2, r2, #0xff
	bl sub_0201AD8C
	b _0201B534
_0201B48C:
	ldr r1, [r6]
	sub r0, r5, #0x10
	str r1, [sp]
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	ldr r0, [r7, #8]
	and r1, r1, #0xff
	mov r2, #0
	mov r3, #0x10
	bl sub_0201AE1C
	b _0201B534
_0201B4B8:
	cmp r0, #1
	bne _0201B534
	ldrb r0, [r6, #0xb]
	cmp r0, #0
	beq _0201B518
	ldrsh r1, [r6, #6]
	mov r4, #0
	mov sb, #0x10
	mov r0, r1, asr #3
	add r8, r1, r0, lsr #28
	b _0201B50C
_0201B4E4:
	ldr r0, [r6]
	add r1, r5, r4
	add r0, r0, r4, lsl #6
	str r0, [sp]
	ldrh r2, [r6, #8]
	ldr r0, [r7, #8]
	mov r3, sb
	and r1, r1, #0xff
	bl sub_0201AE1C
	add r4, r4, #1
_0201B50C:
	cmp r4, r8, asr #4
	blt _0201B4E4
	b _0201B534
_0201B518:
	ldr r0, [r6]
	and r1, r5, #0xff
	str r0, [sp]
	ldrh r2, [r6, #8]
	ldrh r3, [r6, #6]
	ldr r0, [r7, #8]
	bl sub_0201AE1C
_0201B534:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_0201B43C

	arm_func_start sub_0201B53C
sub_0201B53C: ; 0x0201B53C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x18]
	mov r5, r3
	ldrh ip, [r4, #4]
	ldr r3, _0201B5F4 ; =_020AFC30
	mov r6, r0
	mov r0, ip, lsl #1
	ldrh r7, [r3, r0]
	mov r3, #0
	cmp r7, #0
	bne _0201B57C
	ldrh r0, [sp, #0x1c]
	cmp r0, #0x10
	movhs r0, #1
	movlo r0, r7
	b _0201B580
_0201B57C:
	mov r0, r7
_0201B580:
	mov ip, r2, lsl #0x10
	ldrsh r2, [r6, #0xc]
	cmp r7, #0
	cmpeq r0, #1
	mov r0, r1
	moveq r3, #1
	mov r1, ip, asr #0x10
	bl sub_0201B5F8
	ldrb r1, [sp, #0x24]
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	cmp r1, #0
	bne _0201B5D0
	ldrh ip, [sp, #0x1c]
	mov r0, r6
	mov r1, r5
	mov r2, r7
	mov r3, r4
	str ip, [sp]
	bl sub_0201B388
_0201B5D0:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	bne _0201B5EC
	ldrh r2, [sp, #0x1c]
	mov r0, r6
	mov r1, r4
	bl sub_0201B43C
_0201B5EC:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201B5F4: .word _020AFC30
	arm_func_end sub_0201B53C

	arm_func_start sub_0201B5F8
sub_0201B5F8: ; 0x0201B5F8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r5, r1
	mov r1, r4
	add r0, sp, #0
	mov r6, r2
	mov r4, r3
	bl sub_0201B678
	ldrh r3, [sp, #8]
	ldr r0, _0201B670 ; =0x000003FF
	ldr r1, _0201B674 ; =_020996D8
	mov r2, r6, lsl #1
	and r0, r3, r0
	mov r0, r0, lsl #0x10
	ldrsh r1, [r1, r2]
	mov r0, r0, asr #0x10
	cmp r4, #0
	mov r0, r0, lsl r1
	mov r0, r0, lsl #0x10
	movne r1, #1
	mov r0, r0, asr #0x10
	moveq r1, #0
	mov r0, r0, lsl r1
	mov r0, r0, lsl #0x10
	add r0, r5, r0, asr #16
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0201B670: .word 0x000003FF
_0201B674: .word _020996D8
	arm_func_end sub_0201B5F8

	arm_func_start sub_0201B678
sub_0201B678: ; 0x0201B678
	ldrh r3, [r1]
	ldr r2, _0201B6D0 ; =0x0000FCFF
	strh r3, [r0]
	ldrh ip, [r1, #2]
	sub r3, r2, #0xb00
	strh ip, [r0, #2]
	ldrh ip, [r1, #4]
	and r2, ip, r2
	strh r2, [r0, #4]
	ldrh r2, [r1, #6]
	and r2, r2, r3
	strh r2, [r0, #6]
	ldrh r2, [r1, #8]
	strh r2, [r0, #8]
	ldrh r2, [r1, #4]
	ldrh r3, [r1, #6]
	mov r1, r2, lsl #0x16
	and r2, r3, #0xe00
	mov r1, r1, lsr #0x12
	orr r1, r1, r2, asr #9
	strh r1, [r0, #0xa]
	bx lr
	.align 2, 0
_0201B6D0: .word 0x0000FCFF
	arm_func_end sub_0201B678

	arm_func_start sub_0201B6D4
sub_0201B6D4: ; 0x0201B6D4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r5, r0
	mov r6, r2
	mov r7, r1
	mov r4, r3
	ldrsh r1, [r6, #4]
	ldrsh r2, [r5, #0xc]
	ldrb r3, [r6, #0xe]
	mov r0, r7
	bl sub_0201B5F8
	ldr r1, [r5, #0x40]
	str r0, [sp, #4]
	cmp r1, #0x80
	mvnge r0, #0
	bge _0201B9A4
	ldrh r2, [r6, #0xa]
	ldrh r3, [r6, #8]
	ldrb sl, [r6, #0xf]
	and r8, r2, #0xff
	ldrh r2, [r6, #0xc]
	add r0, sp, #0x16
	mov r1, r7
	str r2, [sp]
	and sb, r3, #0xff
	ldrh r7, [r6, #6]
	ldrsh fp, [r6, #2]
	ldrsh r6, [r6]
	bl sub_0201B678
	ldrsb r0, [sp, #0x19]
	adds r7, r7, r0
	movmi r7, #0
	cmp r7, #0x140
	ldrge r7, _0201B9AC ; =0x0000013F
	cmp r4, #0
	bne _0201B790
	add r3, sp, #0x1a
	ldrh r0, [r3]
	add r4, sp, #0xe
	ldrh r2, [r3, #2]
	ldrh r1, [r3, #4]
	strh r0, [r4]
	ldrh r0, [r3, #6]
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	strh r0, [r4, #6]
	b _0201B7E8
_0201B790:
	add lr, sp, #0x1a
	ldrh r1, [r4]
	ldrh r2, [lr]
	ldrh r0, [r4, #6]
	add ip, sp, #0xe
	and r1, r2, r1
	orr r0, r0, r1
	strh r0, [ip]
	ldrh r2, [lr, #2]
	ldrh r1, [r4, #2]
	ldrh r3, [r4, #8]
	ldrh r0, [lr, #4]
	and r1, r2, r1
	orr r1, r3, r1
	strh r1, [ip, #2]
	ldrh r1, [r4, #4]
	ldrh r2, [r4, #0xa]
	ldrh r3, [lr, #6]
	and r0, r0, r1
	orr r0, r2, r0
	strh r0, [ip, #4]
	strh r3, [ip, #6]
_0201B7E8:
	ldrh r1, [sp, #0x12]
	mov r2, #0x400
	rsb r2, r2, #0
	and r1, r1, r2
	ldrh r0, [sp, #0x10]
	strh r1, [sp, #0x12]
	and r1, r0, r2, lsr #23
	sub r0, r6, #0x100
	add r4, r1, r0
	ldr r1, [sp, #4]
	ldrh r0, [sp, #0x12]
	mov r1, r1, lsl #0x10
	mov r2, r2, lsr #0x16
	and r1, r2, r1, lsr #16
	orr r1, r0, r1
	mov r3, r4, lsl #0x10
	mov r0, r3, asr #0x10
	strh r1, [sp, #0x12]
	bl sub_0201B9B0
	cmp r0, #0
	mvnne r7, #0
	bne _0201B950
	ldrh r1, [sp, #0x10]
	mov r0, #0x200
	rsb r0, r0, #0
	and r1, r1, r0
	strh r1, [sp, #0x10]
	ldrh r3, [sp, #0x14]
	mov r1, r0, lsr #0x14
	sub r2, fp, #0x200
	and r1, r1, r3, asr #4
	add r6, r1, r2
	ldrh r3, [sp, #0x10]
	mov r1, r6, lsl #0x10
	and r2, r4, r0, lsr #23
	mov r0, r1, asr #0x10
	orr r1, r3, r2
	strh r1, [sp, #0x10]
	bl sub_0201B9D4
	cmp r0, #0
	mvnne r7, #0
	bne _0201B950
	ldrh r1, [sp, #0xe]
	ldrh r0, [sp, #0x14]
	and r2, r6, #0xff
	bic r1, r1, #0xff
	strh r1, [sp, #0xe]
	ldrh r3, [sp, #0xe]
	mov r1, r0, asr #1
	ldr r0, [sp]
	orr r2, r3, r2
	bic r2, r2, #0x2000
	strh r2, [sp, #0xe]
	ldrh r2, [sp, #0xe]
	mov r0, r0, lsl #0x1f
	tst r1, #1
	orr r0, r2, r0, lsr #18
	strh r0, [sp, #0xe]
	bne _0201B928
	cmp sl, #0
	beq _0201B8FC
	ldrh r1, [sp, #0x12]
	mov r0, sb, lsl #0x1c
	bic r1, r1, #0xf000
	strh r1, [sp, #0x12]
	ldrh r1, [sp, #0x12]
	orr r0, r1, r0, lsr #16
	strh r0, [sp, #0x12]
	b _0201B928
_0201B8FC:
	ldrh r2, [sp, #0x12]
	and r1, sb, #0xf
	bic r0, r2, #0xf000
	strh r0, [sp, #0x12]
	mov r0, r2, asr #0xc
	and r0, r0, #0xf
	add r0, r0, r1
	ldrh r1, [sp, #0x12]
	mov r0, r0, lsl #0x1c
	orr r0, r1, r0, lsr #16
	strh r0, [sp, #0x12]
_0201B928:
	ldrh r1, [sp, #0x12]
	bic r0, r1, #0xf000
	strh r0, [sp, #0x12]
	mov r0, r1, asr #0xc
	and r0, r0, #0xf
	add r0, r0, r8
	ldrh r1, [sp, #0x12]
	mov r0, r0, lsl #0x1c
	orr r0, r1, r0, lsr #16
	strh r0, [sp, #0x12]
_0201B950:
	cmp r7, #0
	mvnlt r0, #1
	blt _0201B9A4
	ldr r1, [r5, #0x40]
	ldr r0, [r5, #0x20]
	cmp r1, r0
	bge _0201B9A0
	ldrh r4, [sp, #0xe]
	ldrh r3, [sp, #0x10]
	ldrh r0, [sp, #0x12]
	add r1, sp, #8
	mov r2, r7
	strh r0, [sp, #0xc]
	strh r4, [sp, #8]
	strh r3, [sp, #0xa]
	add r0, r5, #0x20
	bl sub_0200B6F0
	ldr r0, [r5, #0x40]
	add r0, r0, #1
	str r0, [r5, #0x40]
_0201B9A0:
	mov r0, #0
_0201B9A4:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201B9AC: .word 0x0000013F
	arm_func_end sub_0201B6D4

	arm_func_start sub_0201B9B0
sub_0201B9B0: ; 0x0201B9B0
	mvn r1, #0x3f
	cmp r0, r1
	blt _0201B9C4
	cmp r0, #0x100
	blt _0201B9CC
_0201B9C4:
	mov r0, #1
	bx lr
_0201B9CC:
	mov r0, #0
	bx lr
	arm_func_end sub_0201B9B0

	arm_func_start sub_0201B9D4
sub_0201B9D4: ; 0x0201B9D4
	mvn r1, #0x3f
	cmp r0, r1
	blt _0201B9E8
	cmp r0, #0xc0
	blt _0201B9F0
_0201B9E8:
	mov r0, #1
	bx lr
_0201B9F0:
	mov r0, #0
	bx lr
	arm_func_end sub_0201B9D4

	arm_func_start sub_0201B9F8
sub_0201B9F8: ; 0x0201B9F8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	ldr r3, [r4, #0x40]
	cmp r3, #0x80
	mvnge r0, #0
	bge _0201BA90
	cmp r2, #0
	blt _0201BA24
	cmp r2, #0x140
	blt _0201BA2C
_0201BA24:
	mvn r0, #1
	b _0201BA90
_0201BA2C:
	ldr r0, [r4, #0x20]
	cmp r3, r0
	bge _0201BA8C
	ldrh lr, [r1]
	ldr r3, _0201BA98 ; =0x00000FFF
	add r0, r4, #0x20
	strh lr, [sp]
	ldrh ip, [r1, #2]
	and lr, lr, #0xff00
	strh ip, [sp, #2]
	ldrh ip, [r1, #4]
	strh ip, [sp, #4]
	ldrh ip, [r1, #6]
	add r1, sp, #0
	and r3, r3, ip, asr #4
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	and r3, r3, #0xff
	orr r3, lr, r3
	strh r3, [sp]
	bl sub_0200B6F0
	ldr r0, [r4, #0x40]
	add r0, r0, #1
	str r0, [r4, #0x40]
_0201BA8C:
	mov r0, #0
_0201BA90:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201BA98: .word 0x00000FFF
	arm_func_end sub_0201B9F8

	arm_func_start sub_0201BA9C
sub_0201BA9C: ; 0x0201BA9C
	ldr ip, _0201BAA8 ; =sub_0200B57C
	add r0, r0, #0x20
	bx ip
	.align 2, 0
_0201BAA8: .word sub_0200B57C
	arm_func_end sub_0201BA9C

	arm_func_start sub_0201BAAC
sub_0201BAAC: ; 0x0201BAAC
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x20
	bl sub_0200B570
	add r0, r4, #0x20
	bl sub_0200B630
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201BAAC

	arm_func_start sub_0201BAC8
sub_0201BAC8: ; 0x0201BAC8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldrb r5, [sp, #0x18]
	ldrb r4, [sp, #0x1c]
	str r5, [sp]
	str r4, [sp, #4]
	ldrh ip, [r0, #0xc]
	ldr r4, [r0, #0x64]
	ldr r5, _0201BB1C ; =_020AFC28
	mov lr, ip, lsr #0x1f
	rsb ip, lr, ip, lsl #30
	add ip, lr, ip, ror #30
	mov ip, ip, lsl #1
	ldrsh ip, [r5, ip]
	mov r5, r1
	ldr r0, [r0, #4]
	smlabb r1, r2, ip, r4
	mov r2, r5
	bl sub_0201AC20
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201BB1C: .word _020AFC28
	arm_func_end sub_0201BAC8

	arm_func_start sub_0201BB20
sub_0201BB20: ; 0x0201BB20
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #4]
	bl sub_0201AD44
	ldr r0, [r4, #4]
	bl sub_0201AC10
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201BB20

	arm_func_start sub_0201BB3C
sub_0201BB3C: ; 0x0201BB3C
	stmdb sp!, {r3, lr}
	mov r0, #0x1f00
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201BCBC ; =_020AFC4C
	mov r1, #0x1f00
	str r0, [r2]
	bl MemZero
	ldr r0, _0201BCBC ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x1c0
	bl sub_0201AB90
	ldr r0, _0201BCBC ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x3c4
	add r0, r0, #0xc00
	bl sub_0201AB90
	ldr r0, _0201BCBC ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x1c0
	bl sub_0201AC10
	ldr r0, _0201BCBC ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x3c4
	add r0, r0, #0xc00
	bl sub_0201AC10
	ldr r0, _0201BCBC ; =_020AFC4C
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AEF0
	ldr r0, _0201BCBC ; =_020AFC4C
	ldr r1, _0201BCC0 ; =0x05000200
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AF18
	ldr r0, _0201BCBC ; =_020AFC4C
	ldr r1, _0201BCC4 ; =0x06894000
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AF64
	ldr r0, _0201BCBC ; =_020AFC4C
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201AEF0
	ldr r0, _0201BCBC ; =_020AFC4C
	ldr r1, _0201BCC8 ; =0x05000600
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201AF18
	ldr r0, _0201BCBC ; =_020AFC4C
	mov r3, #0
	ldr r0, [r0]
	str r3, [sp]
	add r1, r0, #0x1c8
	add r1, r1, #0x1c00
	add r2, r0, #0x1c0
	bl sub_0201B198
	ldr r0, _0201BCBC ; =_020AFC4C
	mov r3, #1
	ldr r2, [r0]
	str r3, [sp]
	add r0, r2, #0x70
	add r1, r2, #0x264
	add r1, r1, #0x1c00
	add r2, r2, #0x3c4
	add r2, r2, #0xc00
	bl sub_0201B198
	ldr r0, _0201BCBC ; =_020AFC4C
	mov r1, #2
	ldr r2, [r0]
	mov r3, #0
	str r1, [sp]
	add r0, r2, #0xe0
	add r1, r2, #0x1c8
	add r1, r1, #0x1c00
	add r2, r2, #0x1c0
	bl sub_0201B198
	ldr r0, _0201BCBC ; =_020AFC4C
	mov r1, #3
	ldr r2, [r0]
	mov r3, #1
	str r1, [sp]
	add r0, r2, #0x150
	add r1, r2, #0x264
	add r1, r1, #0x1c00
	add r2, r2, #0x3c4
	add r2, r2, #0xc00
	bl sub_0201B198
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BCBC: .word _020AFC4C
_0201BCC0: .word 0x05000200
_0201BCC4: .word 0x06894000
_0201BCC8: .word 0x05000600
	arm_func_end sub_0201BB3C

	arm_func_start sub_0201BCCC
sub_0201BCCC: ; 0x0201BCCC
	ldr r1, _0201BCEC ; =_020AFC4C
	mov r2, #0x9c
	ldr r1, [r1]
	ldr ip, _0201BCF0 ; =sub_0201AD7C
	add r1, r1, #0x1c8
	add r1, r1, #0x1c00
	mla r0, r2, r0, r1
	bx ip
	.align 2, 0
_0201BCEC: .word _020AFC4C
_0201BCF0: .word sub_0201AD7C
	arm_func_end sub_0201BCCC

	arm_func_start sub_0201BCF4
sub_0201BCF4: ; 0x0201BCF4
	ldr r1, _0201BD14 ; =_020AFC4C
	mov r2, #0x9c
	ldr r1, [r1]
	ldr ip, _0201BD18 ; =sub_0201AD84
	add r1, r1, #0x1c8
	add r1, r1, #0x1c00
	mla r0, r2, r0, r1
	bx ip
	.align 2, 0
_0201BD14: .word _020AFC4C
_0201BD18: .word sub_0201AD84
	arm_func_end sub_0201BCF4

	arm_func_start sub_0201BD1C
sub_0201BD1C: ; 0x0201BD1C
	ldr r3, _0201BD4C ; =_020AFC4C
	mov r2, #0x9c
	ldr ip, [r3]
	and r3, r0, #1
	add r0, ip, #0x1c8
	add r0, r0, #0x1c00
	mla r2, r1, r2, r0
	ldrb r0, [r2, #0x78]
	bic r0, r0, #1
	orr r0, r0, r3
	strb r0, [r2, #0x78]
	bx lr
	.align 2, 0
_0201BD4C: .word _020AFC4C
	arm_func_end sub_0201BD1C

	arm_func_start sub_0201BD50
sub_0201BD50: ; 0x0201BD50
	stmdb sp!, {r3, lr}
	ldr r3, _0201BD7C ; =_020AFC4C
	mov r2, #0x9c
	ldr r3, [r3]
	mov ip, r0
	add r0, r3, #0x1c8
	add r0, r0, #0x1c00
	mla r0, r1, r2, r0
	mov r1, ip
	bl sub_0201AEB4
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BD7C: .word _020AFC4C
	arm_func_end sub_0201BD50

	arm_func_start sub_0201BD80
sub_0201BD80: ; 0x0201BD80
	stmdb sp!, {r3, lr}
	ldr ip, _0201BDB0 ; =_020AFC4C
	mov lr, r0
	ldr ip, [ip]
	mov r3, #0x9c
	add r0, ip, #0x1c8
	add r0, r0, #0x1c00
	mla r0, r2, r3, r0
	mov r2, r1
	mov r1, lr
	bl sub_0201AECC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BDB0: .word _020AFC4C
	arm_func_end sub_0201BD80

	arm_func_start sub_0201BDB4
sub_0201BDB4: ; 0x0201BDB4
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BDE8 ; =_020AFC4C
	ldr r0, [r0]
	bl sub_0201BAAC
	ldr r0, _0201BDE8 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0201BAAC
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BDE8: .word _020AFC4C
	arm_func_end sub_0201BDB4

	arm_func_start sub_0201BDEC
sub_0201BDEC: ; 0x0201BDEC
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BE24 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl sub_0201BAAC
	ldr r0, _0201BE24 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x150
	bl sub_0201BAAC
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BE24: .word _020AFC4C
	arm_func_end sub_0201BDEC

	arm_func_start sub_0201BE28
sub_0201BE28: ; 0x0201BE28
	stmdb sp!, {r3, lr}
	ldr r0, _0201BE58 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AFB8
	ldr r0, _0201BE58 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201AFB8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BE58: .word _020AFC4C
	arm_func_end sub_0201BE28

	arm_func_start sub_0201BE5C
sub_0201BE5C: ; 0x0201BE5C
	stmdb sp!, {r3, lr}
	ldr r0, _0201BE80 ; =_020AFC4C
	ldr r0, [r0]
	bl sub_0201BA9C
	ldr r0, _0201BE80 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0201BA9C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BE80: .word _020AFC4C
	arm_func_end sub_0201BE5C

	arm_func_start sub_0201BE84
sub_0201BE84: ; 0x0201BE84
	stmdb sp!, {r3, lr}
	ldr r0, _0201BEAC ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl sub_0201BA9C
	ldr r0, _0201BEAC ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x150
	bl sub_0201BA9C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BEAC: .word _020AFC4C
	arm_func_end sub_0201BE84

	arm_func_start sub_0201BEB0
sub_0201BEB0: ; 0x0201BEB0
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BF0C ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201B004
	ldr r0, _0201BF0C ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201B004
	ldr r0, _0201BF0C ; =_020AFC4C
	ldr r0, [r0]
	bl sub_0201BB20
	ldr r0, _0201BF0C ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0201BB20
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BF0C: .word _020AFC4C
	arm_func_end sub_0201BEB0

	arm_func_start sub_0201BF10
sub_0201BF10: ; 0x0201BF10
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BF48 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl sub_0201BB20
	ldr r0, _0201BF48 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x150
	bl sub_0201BB20
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BF48: .word _020AFC4C
	arm_func_end sub_0201BF10

	arm_func_start sub_0201BF4C
sub_0201BF4C: ; 0x0201BF4C
	stmdb sp!, {r3, lr}
	bl sub_0201BEB0
	bl sub_0201BF10
	bl sub_0201BDB4
	bl sub_0201BDEC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201BF4C

	arm_func_start sub_0201BF64
sub_0201BF64: ; 0x0201BF64
	stmdb sp!, {r3, lr}
	ldr r0, _0201BFA8 ; =_020AFC4C
	ldr r0, [r0]
	bl sub_0201B2A0
	ldr r0, _0201BFA8 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0201B2A0
	ldr r0, _0201BFA8 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl sub_0201B2A0
	ldr r0, _0201BFA8 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x150
	bl sub_0201B2A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BFA8: .word _020AFC4C
	arm_func_end sub_0201BF64

	arm_func_start sub_0201BFAC
sub_0201BFAC: ; 0x0201BFAC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, _0201BFEC ; =_020AFC4C
	str r3, [sp]
	ldr lr, [ip]
	ldr ip, [sp, #0x10]
	mov r3, #0x70
	mov r4, r0
	mla r0, ip, r3, lr
	mov ip, r1
	mov r3, r2
	mov r1, r4
	mov r2, ip
	bl sub_0201B2DC
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201BFEC: .word _020AFC4C
	arm_func_end sub_0201BFAC

	arm_func_start CopyAndInterleaveWrapper
CopyAndInterleaveWrapper: ; 0x0201BFF0
	ldr ip, _0201BFFC ; =CopyAndInterleave
	mov r2, r2, asr #1
	bx ip
	.align 2, 0
_0201BFFC: .word CopyAndInterleave
	arm_func_end CopyAndInterleaveWrapper

	arm_func_start sub_0201C000
sub_0201C000: ; 0x0201C000
	ldr r2, _0201C024 ; =0x0000FFFF
	mov r1, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	.align 2, 0
_0201C024: .word 0x0000FFFF
	arm_func_end sub_0201C000

	arm_func_start sub_0201C028
sub_0201C028: ; 0x0201C028
	strh r1, [r0]
	strh r2, [r0, #2]
	ldrh r1, [sp]
	strh r3, [r0, #4]
	ldrh r2, [sp, #4]
	strh r1, [r0, #6]
	ldrh r1, [sp, #8]
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	arm_func_end sub_0201C028

	arm_func_start InitAnimationControl
InitAnimationControl: ; 0x0201C050
	stmdb sp!, {r4, lr}
	mov r1, #0x7c
	mov r4, r0
	bl MemZero
	mov r1, #0
	str r1, [r4, #0x68]
	str r1, [r4, #0x6c]
	strh r1, [r4, #0x70]
	mov r0, #0xff
	strh r1, [r4, #0x72]
	strb r0, [r4, #0x43]
	add r0, r0, #0xff00
	strh r0, [r4, #0x36]
	mov r0, #9
	strb r0, [r4, #0x40]
	add r0, r4, #0x10
	bl sub_0201C000
	ldrh r0, [r4, #2]
	bic r0, r0, #0x8000
	strh r0, [r4, #2]
	ldrh r0, [r4, #2]
	orr r0, r0, #0x200
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	arm_func_end InitAnimationControl

	arm_func_start InitAnimationControlWithSet__0201C0B0
InitAnimationControlWithSet__0201C0B0: ; 0x0201C0B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl InitAnimationControl
	ldrh r0, [r4, #2]
	orr r0, r0, #1
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	arm_func_end InitAnimationControlWithSet__0201C0B0

	arm_func_start InitAnimationControlWithSet__0201C0CC
InitAnimationControlWithSet__0201C0CC: ; 0x0201C0CC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl InitAnimationControl
	ldrh r0, [r4, #2]
	orr r0, r0, #1
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	arm_func_end InitAnimationControlWithSet__0201C0CC

	arm_func_start SetSpriteIdForAnimationControl
SetSpriteIdForAnimationControl: ; 0x0201C0E8
	strh r1, [r0, #0x70]
	ldrsh r2, [r0, #0x70]
	ldrsh r1, [r0, #0x72]
	cmp r2, r1
	strneh r2, [r0, #0x72]
	movne r1, #0xff
	strneb r1, [r0, #0x43]
	bx lr
	arm_func_end SetSpriteIdForAnimationControl

	arm_func_start sub_0201C108
sub_0201C108: ; 0x0201C108
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r0, [r4, #0x70]
	cmp r0, #0
	bne _0201C124
	ldr r0, _0201C134 ; =_020996E0
	bl Debug_Print0
_0201C124:
	ldrh r0, [r4, #2]
	orr r0, r0, #0x8000
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201C134: .word _020996E0
	arm_func_end sub_0201C108

	arm_func_start sub_0201C138
sub_0201C138: ; 0x0201C138
	ldr ip, _0201C140 ; =InitAnimationControl
	bx ip
	.align 2, 0
_0201C140: .word InitAnimationControl
	arm_func_end sub_0201C138

	arm_func_start sub_0201C144
sub_0201C144: ; 0x0201C144
	stmdb sp!, {r3, lr}
	ldr r1, _0201C178 ; =_020AFC3C
	ldr r1, [r1, r2, lsl #2]
	mov r1, r1, lsl #0x10
	add r0, r0, r1, asr #16
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #0x10
	mov r0, r0, asr #0x10
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201C178: .word _020AFC3C
	arm_func_end sub_0201C144

	arm_func_start SetAnimationForAnimationControlInternal
SetAnimationForAnimationControlInternal: ; 0x0201C17C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [sp, #0x18]
	ldmia r1, {ip, lr}
	mov r5, #0
	mov r4, r4, lsl #0x10
	strh r5, [r0]
	strh r5, [r0, #6]
	mov r4, r4, asr #0x10
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	mov r5, #1
	ldrb r4, [sp, #0x1c]
	strh r5, [r0, #4]
	ldrh r5, [r0]
	cmp r4, #0
	orr r4, r5, #0x8000
	strh r4, [r0]
	ldrneh r4, [r0]
	mov r5, #0
	orrne r4, r4, #0x1000
	strneh r4, [r0]
	ldr r4, [ip, #8]
	add r4, r4, r2, lsl #3
	ldrh r4, [r4, #4]
	cmp r3, r4
	strh r5, [r0, #0x20]
	movge r3, #0
	ldr r4, [sp, #0x10]
	strh r5, [r0, #0x22]
	strh r4, [r0, #0x32]
	sub r4, r5, #1
	strh r4, [r0, #0x3a]
	strh r4, [r0, #0x3c]
	str r5, [r0, #0x28]
	str r5, [r0, #0x2c]
	strh r5, [r0, #0xc]
	strh r2, [r0, #0x76]
	strh r3, [r0, #0x78]
	ldr r4, [ip]
	cmp lr, #0
	str r4, [r0, #0x54]
	ldrne r5, [lr]
	cmp lr, #0
	str r5, [r0, #0x58]
	ldrne r4, [lr, #4]
	moveq r4, #0
	str r4, [r0, #0x5c]
	cmp lr, #0
	ldrnesh r4, [lr, #0xa]
	ldrb lr, [sp, #0x14]
	ldreqsh r4, [ip, #0x14]
	and r4, r4, #1
	strh r4, [r0, #0x60]
	ldr r4, [ip, #4]
	str r4, [r0, #0x50]
	ldrb r4, [sp, #0x20]
	strb lr, [r0, #0x41]
	strb r4, [r0, #0x7a]
	ldrb r1, [r1, #8]
	cmp r1, #1
	beq _0201C29C
	ldr r1, [ip, #8]
	ldr r1, [r1]
	ldr r1, [r1, r3, lsl #2]
	str r1, [r0, #0x48]
	str r1, [r0, #0x4c]
	ldr r1, [ip, #8]
	ldrh r1, [r1, #4]
	strh r1, [r0, #0x30]
	ldr r1, [ip, #8]
	b _0201C2C0
_0201C29C:
	ldrsh r1, [ip, #0xc]
	strh r1, [r0, #0x30]
	ldr r1, [ip, #8]
	ldr r1, [r1, r2, lsl #3]
	ldr r1, [r1, r3, lsl #2]
	str r1, [r0, #0x48]
	str r1, [r0, #0x4c]
	ldr r1, [ip, #8]
	add r1, r1, r2, lsl #3
_0201C2C0:
	ldrh r1, [r1, #6]
	strh r1, [r0, #0x62]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SetAnimationForAnimationControlInternal

	arm_func_start SetAnimationForAnimationControl
SetAnimationForAnimationControl: ; 0x0201C2CC
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	ldrsh r0, [r7, #0x70]
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl SpriteTypeInWanTable
	cmp r0, #0
	beq _0201C304
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	bhi _0201C348
_0201C304:
	mov r0, r7
	bl GetWanForAnimationControl
	ldrb r3, [sp, #0x28]
	str r4, [sp]
	mov r1, r0
	ldr r2, [sp, #0x2c]
	str r3, [sp, #4]
	ldrb r0, [sp, #0x30]
	str r2, [sp, #8]
	ldrb r4, [sp, #0x34]
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r6
	mov r2, #0
	str r4, [sp, #0x10]
	bl SetAnimationForAnimationControlInternal
	b _0201C3E0
_0201C348:
	ldrsh r0, [r7, #0x70]
	mov r1, r6, lsl #0x10
	mov r1, r1, asr #0x10
	bl WanTableSpriteHasAnimationGroup
	cmp r0, #0
	mov r0, r7
	beq _0201C3A4
	bl GetWanForAnimationControl
	str r4, [sp]
	ldrb r3, [sp, #0x28]
	mov r1, r0
	ldr r2, [sp, #0x2c]
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldrb r0, [sp, #0x30]
	ldrb r4, [sp, #0x34]
	mov r2, r6
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r5
	str r4, [sp, #0x10]
	bl SetAnimationForAnimationControlInternal
	b _0201C3E0
_0201C3A4:
	bl GetWanForAnimationControl
	str r4, [sp]
	ldrb r3, [sp, #0x28]
	mov r1, r0
	ldr r2, [sp, #0x2c]
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldrb r0, [sp, #0x30]
	ldrb r4, [sp, #0x34]
	mov r3, r5
	str r0, [sp, #0xc]
	mov r0, r7
	mov r2, #0
	str r4, [sp, #0x10]
	bl SetAnimationForAnimationControlInternal
_0201C3E0:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end SetAnimationForAnimationControl

	arm_func_start GetWanForAnimationControl
GetWanForAnimationControl: ; 0x0201C3E8
	ldr r1, [r0, #0x68]
	cmp r1, #0
	ldrne r0, [r1, #4]
	bxne lr
	ldr r1, _0201C414 ; =WAN_TABLE
	ldrsh r2, [r0, #0x70]
	ldr r1, [r1]
	mov r0, #0x38
	smlabb r0, r2, r0, r1
	ldr r0, [r0, #0x30]
	bx lr
	.align 2, 0
_0201C414: .word WAN_TABLE
	arm_func_end GetWanForAnimationControl

	arm_func_start SetAndPlayAnimationForAnimationControl
SetAndPlayAnimationForAnimationControl: ; 0x0201C418
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldrb r4, [sp, #0x18]
	ldr ip, [sp, #0x1c]
	ldrb lr, [sp, #0x20]
	stmia sp, {r4, ip}
	ldrb ip, [sp, #0x24]
	str lr, [sp, #8]
	mov r4, r0
	str ip, [sp, #0xc]
	bl SetAnimationForAnimationControl
	ldr r1, [r4, #0x4c]
	mov r0, r4
	bl LoadAnimationFrameAndIncrementInAnimationControl
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end SetAndPlayAnimationForAnimationControl

	arm_func_start SwitchAnimationControlToNextFrame
SwitchAnimationControlToNextFrame: ; 0x0201C458
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0201D1B0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0x3a]
	cmp r0, #0
	blt _0201C4F4
	ldrh r0, [r4]
	tst r0, #0x4000
	ldmneia sp!, {r4, pc}
	ldrh r1, [r4, #0xc]
	ldrsh r0, [r4, #4]
	add r0, r1, r0
	strh r0, [r4, #0xc]
	ldrsh r1, [r4, #0xa]
	cmp r1, #0
	beq _0201C4C0
	ldrsh r0, [r4, #4]
	sub r0, r1, r0
	strh r0, [r4, #0xa]
	ldrsh r0, [r4, #0xa]
	cmp r0, #0
	movlt r0, #0
	strlth r0, [r4, #0xa]
	ldmia sp!, {r4, pc}
_0201C4C0:
	ldrsh r1, [r4, #6]
	cmp r1, #0
	beq _0201C4E8
	ldrsh r0, [r4, #4]
	sub r0, r1, r0
	strh r0, [r4, #6]
	ldrsh r0, [r4, #6]
	cmp r0, #0
	movlt r0, #0
	strlth r0, [r4, #6]
_0201C4E8:
	ldrsh r0, [r4, #6]
	cmp r0, #0
	ldmgtia sp!, {r4, pc}
_0201C4F4:
	ldr r0, [r4, #0x4c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0201C550
	ldrh r0, [r4]
	tst r0, #0x1000
	beq _0201C544
	ldrh r1, [r4, #0x62]
	ldr r2, [r4, #0x48]
	mov r0, #0xc
	mla r0, r1, r0, r2
	str r0, [r4, #0x4c]
	ldrsh r0, [r4, #8]
	cmp r0, #0
	beq _0201C550
	bl Rand16Bit
	ldrsh r1, [r4, #8]
	and r0, r1, r0
	strh r0, [r4, #0xa]
	b _0201C550
_0201C544:
	orr r0, r0, #0x2000
	strh r0, [r4]
	ldmia sp!, {r4, pc}
_0201C550:
	ldr r1, [r4, #0x4c]
	mov r0, r4
	bl LoadAnimationFrameAndIncrementInAnimationControl
	ldmia sp!, {r4, pc}
	arm_func_end SwitchAnimationControlToNextFrame

	arm_func_start LoadAnimationFrameAndIncrementInAnimationControl
LoadAnimationFrameAndIncrementInAnimationControl: ; 0x0201C560
	ldrh r2, [r0]
	orr r2, r2, #0x800
	strh r2, [r0]
	ldrb r2, [r1]
	strh r2, [r0, #6]
	ldrsh r2, [r1, #2]
	strh r2, [r0, #0x3a]
	ldrsh r2, [r1, #4]
	strh r2, [r0, #0x20]
	ldrsh r2, [r1, #6]
	strh r2, [r0, #0x22]
	ldrsh r2, [r1, #8]
	strh r2, [r0, #0x24]
	ldrsh r2, [r1, #0xa]
	strh r2, [r0, #0x26]
	ldrb r2, [r1, #1]
	str r2, [r0, #0x28]
	ldrb r1, [r1, #1]
	ldr r2, [r0, #0x2c]
	orr r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r1, [r0, #0x4c]
	add r1, r1, #0xc
	str r1, [r0, #0x4c]
	bx lr
	arm_func_end LoadAnimationFrameAndIncrementInAnimationControl

	arm_func_start sub_0201C5C4
sub_0201C5C4: ; 0x0201C5C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x90
	mov r8, r0
	ldrh r0, [r8]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0201CF40
	ldrsh r0, [r8, #0x3a]
	mov fp, #0
	cmp r0, #0
	bge _0201C618
	mov r0, r8
	bl SwitchAnimationControlToNextFrame
	ldrh r0, [r8]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, fp
	tst r0, #0xff
	beq _0201CF40
_0201C618:
	ldrsh r1, [r8, #0x3c]
	ldrsh r0, [r8, #0x3a]
	cmp r1, r0
	ldrh r0, [r8, #2]
	movne fp, #1
	bicne r0, r0, #0x100
	strneh r0, [r8, #2]
	bne _0201C640
	tst r0, #0x100
	movne fp, #1
_0201C640:
	ldrb r0, [r8, #0x7a]
	cmp r0, #4
	bhs _0201CEC8
	ldrsh r0, [r8, #0x70]
	bl SpriteTypeInWanTable
	cmp r0, #3
	bne _0201C928
	mov r0, r8
	bl GetWanForAnimationControl
	ldr r6, [r0]
	ldr r5, [r0, #4]
	ldr sl, [r6, #0x10]
	mov r0, #0
	ldr r3, [r5]
	mov r7, r0
	str r0, [sp, #0x44]
	ldr r0, [r5, #4]
	ldrsh r1, [r8, #0x3a]
	ldr r2, [r6]
	cmp sl, #0
	str r0, [sp, #0x48]
	ldr r4, [r3]
	ldr sb, [r2, r1, lsl #2]
	beq _0201C6CC
	ldrsh r0, [r8, #0x78]
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x20]
	ldrh r0, [r8, #0xc]
	add r1, sl, r1, lsl #3
	ldr r1, [r1, #4]
	bl _s32_div_f
	ldr r0, [sp, #0x20]
	ldr r0, [sl, r0, lsl #3]
	ldrb r0, [r0, r1]
	str r0, [sp, #0x44]
_0201C6CC:
	cmp r5, #0
	cmpne fp, #0
	beq _0201C7D8
	ldrh r0, [r8, #2]
	tst r0, #0x8000
	bne _0201C7D8
	ldr r0, [sp, #0x48]
	ldr r0, [r0]
	str r0, [sp, #0x84]
	ldr r0, [sp, #0x48]
	ldrsh r0, [r0, #6]
	strh r0, [sp, #0x8a]
	ldrsh r0, [r5, #0xa]
	cmp r0, #2
	bne _0201C72C
	ldrsh r2, [r4, #4]
	ldrsh r0, [r4, #6]
	mov r1, #2
	smulbb r2, r2, r0
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	strh r1, [sp, #0x88]
	mov r5, r0, asr #2
	b _0201C79C
_0201C72C:
	cmp r0, #0
	bne _0201C754
	ldrsh r2, [r4, #4]
	ldrsh r0, [r4, #6]
	mov r1, #0
	smulbb r0, r2, r0
	add r0, r0, r0, lsr #31
	strh r1, [sp, #0x88]
	mov r5, r0, asr #1
	b _0201C79C
_0201C754:
	cmp r0, #3
	bne _0201C774
	ldrsh r2, [r4, #4]
	ldrsh r1, [r4, #6]
	mov r0, #3
	strh r0, [sp, #0x88]
	smulbb r5, r2, r1
	b _0201C79C
_0201C774:
	cmp r0, #4
	ldrsh r2, [r4, #4]
	ldreqsh r1, [r4, #6]
	moveq r0, #4
	streqh r0, [sp, #0x88]
	smulbbeq r5, r2, r1
	ldrnesh r1, [r4, #6]
	movne r0, #1
	smulbbne r5, r2, r1
	strneh r0, [sp, #0x88]
_0201C79C:
	ldr r0, _0201CF48 ; =_020AFC70
	ldrb r2, [r8, #0x40]
	ldr r0, [r0]
	ldrb r3, [r8, #0x41]
	add r1, sp, #0x84
	add r0, r0, #0xcc
	bl sub_0201E408
	ldrh r1, [r8, #0x32]
	ldr r0, [r4]
	mov r2, r5
	mov r3, #0
	bl sub_0201E050
	ldrh r0, [r8, #2]
	orr r0, r0, #0x8000
	strh r0, [r8, #2]
_0201C7D8:
	ldr r0, [sp, #0x44]
	and r0, r0, #0xf8
	mov r0, r0, asr #3
	str r0, [sp, #0x24]
_0201C7E8:
	ldr r0, _0201CF48 ; =_020AFC70
	ldrsh r2, [r8, #0x1c]
	ldr r5, [r0]
	ldrsh r0, [r8, #0x20]
	ldrh sl, [sb, #0x20]
	ldrsh ip, [r8, #0x1e]
	ldrsh r3, [r8, #0x22]
	add r2, r2, r0
	ldrb r4, [r8, #0x41]
	ldrb r1, [r8, #0x40]
	add r3, ip, r3
	add ip, sl, #0x39
	ldrh r0, [r8, #0x32]
	ldr r5, [r5, #0xe0]
	mov sl, #3
	add r1, r4, r1, lsl #8
	strh sl, [sp, #0x5c]
	add r4, r5, r1, lsl #1
	str r0, [sp, #0x60]
	strh ip, [sp, #0x5e]
	mov r0, r4, lsl #0x10
	ldr r1, [sb]
	mov r4, r7
	add r0, r1, r0, lsr #16
	add r1, r7, #1
	and r7, r1, #0xff
	add r5, sp, #0x68
	str r0, [sp, #0x64]
	add sl, sb, #0x10
	mov r1, #4
_0201C860:
	ldrh r0, [sl], #2
	subs r1, r1, #1
	strh r0, [r5], #2
	bne _0201C860
	ldrh r5, [sb, #0x18]
	add r0, sp, #0x7e
	add r1, sb, #0x1a
	strh r5, [sp, #0x70]
	ldrsh r5, [sb, #4]
	strh r5, [sp, #0x72]
	ldrsh sl, [sb, #6]
	add r5, r5, r2
	add r2, sl, r3
	strh r5, [sp, #0x72]
	strh r2, [sp, #0x74]
	ldrsh r2, [sb, #8]
	strh r2, [sp, #0x76]
	ldrsh r2, [sb, #0xa]
	strh r2, [sp, #0x78]
	ldrh r2, [sb, #0xc]
	strh r2, [sp, #0x7a]
	ldrh r2, [sb, #0xe]
	strh r2, [sp, #0x7c]
	ldrh r2, [sb, #0x1e]
	strb r4, [sp, #0x82]
	strh r2, [sp, #0x80]
	ldrb r2, [sb, #0x1d]
	and r2, r2, #0xf8
	mov r2, r2, asr #3
	strb r2, [sp, #0x83]
	bl Rgb8ToRgb5
	ldr r0, [r6, #0x10]
	mov r1, #0x3f
	cmp r0, #0
	ldrne r0, [sp, #0x24]
	strneb r0, [sp, #0x83]
	mov r0, r7
	bl _s32_div_f
	ldrh r0, [r8, #2]
	and r7, r1, #0xff
	tst r0, #2
	bne _0201C910
	add r0, sp, #0x5c
	bl EnqueueRender3dTexture
_0201C910:
	ldrb r0, [sb, #0x22]
	cmp r0, #0
	addeq sb, sb, #0x28
	beq _0201C7E8
	mov r4, #1
	b _0201CF04
_0201C928:
	ldrb r2, [r8, #0x7a]
	ldr r1, _0201CF4C ; =_020AFC50
	mov r0, r8
	ldr r1, [r1, r2, lsl #2]
	str r1, [sp, #0x40]
	bl GetWanForAnimationControl
	mov r1, #0
	ldrh r3, [r8, #0x60]
	str r1, [sp, #0x2c]
	ldr r2, _0201CF50 ; =_020AFC30
	mov r1, r3, lsl #1
	ldrh r1, [r2, r1]
	str r1, [sp, #0x28]
	ldrsh r2, [r8, #0x3a]
	ldr r3, [r8, #0x54]
	ldr r1, [sp, #0x2c]
	str r1, [sp, #0x34]
	str r1, [sp, #0x38]
	ldr r7, [r0, #4]
	ldr r1, [sp, #0x28]
	ldrb r0, [r8, #0x41]
	ldr r6, [r3, r2, lsl #2]
	cmp r1, #0
	str r0, [sp, #0x30]
	bne _0201C9B4
	ldr r0, [sp, #0x30]
	cmp r0, #0x10
	blo _0201C9B4
	sub r0, r0, #0x10
	mov r1, r0, lsl #0x10
	mov r0, #1
	str r0, [sp, #0x28]
	str r0, [sp, #0x38]
	mov r0, r1, lsr #0x10
	str r0, [sp, #0x30]
_0201C9B4:
	ldrh r2, [r8, #2]
	tst r2, #0x20
	addne r0, r8, #0x10
	strne r0, [sp, #0x2c]
	cmp r7, #0
	cmpne fp, #0
	beq _0201CCFC
	ldrh r0, [r7, #8]
	tst r0, #1
	beq _0201CCFC
	tst r2, #0x8000
	bne _0201CCFC
	ldr r0, [sp, #0x40]
	mov r1, #0
	ldrh r5, [r7, #0xe]
	ldrh sb, [r8, #0x32]
	mov r4, r1
	tst r2, #0x80
	movne r1, #1
	tst r2, #0x40
	and r0, r0, #0xff
	movne r4, #1
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0201CCE0
_0201CA18: ; jump table
	b _0201CA28 ; case 0
	b _0201CAD0 ; case 1
	b _0201CB80 ; case 2
	b _0201CC30 ; case 3
_0201CA28:
	cmp r1, #0
	bne _0201CAB0
	mov sl, #0
	b _0201CAA8
_0201CA38:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x3c]
	str r1, [sp]
	ldr r0, _0201CF54 ; =_020AFC4C
	ldr r1, [sp, #0x3c]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	bl sub_0201B388
	ldr r2, [r8, #0x5c]
	ldr r1, _0201CF54 ; =_020AFC4C
	ldrh r3, [r2, #4]
	ldr r1, [r1]
	ldr r0, [sp, #0x3c]
	ldrh r2, [r1, #0xc]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CAA8:
	cmp sl, r5
	blo _0201CA38
_0201CAB0:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =_020AFC4C
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	bl sub_0201B43C
	b _0201CCE0
_0201CAD0:
	cmp r1, #0
	bne _0201CB5C
	mov sl, #0
	b _0201CB54
_0201CAE0:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x14]
	str r1, [sp]
	ldr r0, _0201CF54 ; =_020AFC4C
	ldr r1, [sp, #0x14]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	add r0, r0, #0x70
	bl sub_0201B388
	ldr r2, [r8, #0x5c]
	ldr r1, _0201CF54 ; =_020AFC4C
	ldrh r3, [r2, #4]
	ldr r1, [r1]
	ldr r0, [sp, #0x14]
	ldrh r2, [r1, #0x7c]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CB54:
	cmp sl, r5
	blo _0201CAE0
_0201CB5C:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =_020AFC4C
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	add r0, r0, #0x70
	bl sub_0201B43C
	b _0201CCE0
_0201CB80:
	cmp r1, #0
	bne _0201CC0C
	mov sl, #0
	b _0201CC04
_0201CB90:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x18]
	str r1, [sp]
	ldr r0, _0201CF54 ; =_020AFC4C
	ldr r1, [sp, #0x18]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	add r0, r0, #0xe0
	bl sub_0201B388
	ldr r2, [r8, #0x5c]
	ldr r1, _0201CF54 ; =_020AFC4C
	ldrh r3, [r2, #4]
	ldr r1, [r1]
	ldr r0, [sp, #0x18]
	ldrh r2, [r1, #0xec]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CC04:
	cmp sl, r5
	blo _0201CB90
_0201CC0C:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =_020AFC4C
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	add r0, r0, #0xe0
	bl sub_0201B43C
	b _0201CCE0
_0201CC30:
	cmp r1, #0
	bne _0201CCC0
	mov sl, #0
	b _0201CCB8
_0201CC40:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x1c]
	str r1, [sp]
	ldr r0, _0201CF54 ; =_020AFC4C
	ldr r1, [sp, #0x1c]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	add r0, r0, #0x150
	bl sub_0201B388
	ldr r1, _0201CF54 ; =_020AFC4C
	ldr r2, [r8, #0x5c]
	ldr r1, [r1]
	ldrh r3, [r2, #4]
	add r1, r1, #0x100
	ldrh r2, [r1, #0x5c]
	ldr r0, [sp, #0x1c]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CCB8:
	cmp sl, r5
	blo _0201CC40
_0201CCC0:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =_020AFC4C
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	add r0, r0, #0x150
	bl sub_0201B43C
_0201CCE0:
	ldrh r1, [r8, #2]
	ldr r0, _0201CF58 ; =0x0000FFFF
	orr r1, r1, #0x8000
	strh r1, [r8, #2]
	ldrb r1, [r8, #0x41]
	strb r1, [r8, #0x43]
	strh r0, [r8, #0x36]
_0201CCFC:
	ldr r0, [sp, #0x40]
	mov r1, #0x70
	mul r5, r0, r1
	cmp fp, #0
	moveq sb, #1
	ldr sl, _0201CF58 ; =0x0000FFFF
	movne sb, #0
_0201CD18:
	cmp sb, #0
	mov r4, #0
	bne _0201CD34
	ldrsh r0, [r6]
	cmp r0, #0
	strgeh r0, [r8, #0x36]
	bge _0201CD38
_0201CD34:
	strh sl, [r8, #0x36]
_0201CD38:
	ldrsh r3, [r8, #0x1e]
	ldrsh r2, [r8, #0x22]
	ldrsh r1, [r8, #0x1c]
	ldrsh r0, [r8, #0x20]
	add r2, r3, r2
	add r0, r1, r0
	strh r2, [sp, #0x4e]
	strh r0, [sp, #0x4c]
	ldrh r0, [r8, #0x32]
	strh r0, [sp, #0x50]
	ldrh r0, [r8, #0x38]
	strh r0, [sp, #0x52]
	ldr r0, [sp, #0x30]
	strh r0, [sp, #0x54]
	ldrb r0, [r8, #0x42]
	strh r0, [sp, #0x56]
	ldr r0, [sp, #0x28]
	strh r0, [sp, #0x58]
	ldr r0, [sp, #0x38]
	strb r0, [sp, #0x5a]
	ldrh r0, [r8, #2]
	tst r0, #0x1000
	movne r0, #1
	moveq r0, #0
	strb r0, [sp, #0x5b]
	ldrh r0, [r8, #2]
	tst r0, #2
	bne _0201CDD4
	ldr r0, _0201CF54 ; =_020AFC4C
	ldr r3, [sp, #0x2c]
	ldr r0, [r0]
	mov r1, r6
	add r0, r0, r5
	add r2, sp, #0x4c
	bl sub_0201B6D4
	cmp r0, #0
	movne r0, #1
	moveq r4, #1
	strne r0, [sp, #0x34]
_0201CDD4:
	ldrh r2, [r8, #2]
	tst r2, #0x200
	movne r4, #1
	cmp r4, #0
	cmpne r7, #0
	beq _0201CE80
	ldrh r0, [r7, #8]
	tst r0, #1
	bne _0201CE80
	ldrh r0, [r8, #0x36]
	cmp r0, sl
	beq _0201CE80
	ldrb r3, [r8, #0x41]
	ldrb r1, [r8, #0x43]
	mov r0, #1
	cmp r3, r1
	beq _0201CE24
	tst r2, #0x40
	moveq r0, #0
	strb r3, [r8, #0x43]
_0201CE24:
	ldrh r2, [r8, #0x36]
	ldr r3, [r8, #0x58]
	ldrh r1, [r8, #2]
	ldr r3, [r3, r2, lsl #2]
	ldr r2, [r8, #0x5c]
	tst r1, #0x80
	str r2, [sp]
	ldrb r2, [r8, #0x41]
	movne r1, #1
	moveq r1, #0
	str r2, [sp, #4]
	mov r2, #0
	and r4, r1, #0xff
	str r2, [sp, #8]
	str r4, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0201CF54 ; =_020AFC4C
	ldrh r2, [r8, #0x32]
	ldr r0, [r0]
	mov r1, r6
	add r0, r0, r5
	bl sub_0201B53C
	strh sl, [r8, #0x36]
_0201CE80:
	ldrh r0, [r6, #6]
	mov r0, r0, asr #0xb
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addeq r6, r6, #0xa
	beq _0201CD18
	ldrh r0, [r8, #2]
	tst r0, #0x200
	movne r0, #0
	strne r0, [sp, #0x34]
	ldr r0, [sp, #0x34]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r4, r0, #0xff
	b _0201CF04
_0201CEC8:
	bne _0201CF04
	ldrsh r0, [r8, #0x3a]
	ldr r1, [r8, #0x54]
	ldr r3, [r1, r0, lsl #2]
	mov r0, #0
	mov r1, #1
_0201CEE0:
	ldrh r2, [r3, #6]
	mov r2, r2, asr #0xb
	tst r2, #1
	movne r2, r1
	moveq r2, r0
	tst r2, #0xff
	addeq r3, r3, #0xa
	beq _0201CEE0
	mov r4, #1
_0201CF04:
	cmp r4, #0
	ldrneh r0, [r8, #2]
	bicne r0, r0, #0x100
	strneh r0, [r8, #2]
	bne _0201CF28
	cmp fp, #0
	ldrneh r0, [r8, #2]
	orrne r0, r0, #0x100
	strneh r0, [r8, #2]
_0201CF28:
	ldrsh r0, [r8, #0x3a]
	strh r0, [r8, #0x3c]
	ldrh r0, [r8]
	tst r0, #0x800
	bicne r0, r0, #0x800
	strneh r0, [r8]
_0201CF40:
	add sp, sp, #0x90
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201CF48: .word _020AFC70
_0201CF4C: .word _020AFC50
_0201CF50: .word _020AFC30
_0201CF54: .word _020AFC4C
_0201CF58: .word 0x0000FFFF
	arm_func_end sub_0201C5C4

	arm_func_start sub_0201CF5C
sub_0201CF5C: ; 0x0201CF5C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0201C5C4
	ldrh r0, [r4, #2]
	tst r0, #0x10
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl SwitchAnimationControlToNextFrame
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201CF5C

	arm_func_start sub_0201CF80
sub_0201CF80: ; 0x0201CF80
	ldrb r1, [r0, #0x41]
	add r1, r1, #1
	strb r1, [r0, #0x43]
	bx lr
	arm_func_end sub_0201CF80

	arm_func_start sub_0201CF90
sub_0201CF90: ; 0x0201CF90
	stmdb sp!, {r3, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	ldrh r3, [r1]
	tst r3, #0x8000
	movne ip, #1
	tst ip, #0xff
	ldmeqia sp!, {r3, pc}
	cmp r2, #4
	ldmhsia sp!, {r3, pc}
	ldrsh ip, [r1, #0x3a]
	mvn r3, #0
	cmp ip, r3
	ldrne r3, [r1, #0x50]
	cmpne r3, #0
	beq _0201D024
	add ip, r3, ip, lsl #4
	mov r3, r2, lsl #2
	ldrsh lr, [ip, r3]
	cmp lr, #0x63
	addeq r3, ip, r3
	ldreqsh r3, [r3, #2]
	cmpeq r3, #0x63
	moveq r1, #0x63
	streqh r1, [r0]
	streqh r1, [r0, #2]
	ldmeqia sp!, {r3, pc}
	ldrsh r3, [r1, #0x20]
	add r2, ip, r2, lsl #2
	add r3, r3, lr
	strh r3, [r0]
	ldrsh r3, [r1, #0x22]
	ldrsh r1, [r2, #2]
	add r1, r3, r1
	strh r1, [r0, #2]
	ldmia sp!, {r3, pc}
_0201D024:
	mov r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201CF90

	arm_func_start sub_0201D034
sub_0201D034: ; 0x0201D034
	stmdb sp!, {r4, r5, r6, lr}
	ldrh r3, [r2]
	tst r3, #0x8000
	movne r3, #1
	moveq r3, #0
	tst r3, #0xff
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r4, [r2, #0x50]
	cmp r4, #0
	beq _0201D0CC
	ldrsh r3, [r2, #0x3a]
	mov ip, #0
	mov r5, #0x63
	add r3, r4, r3, lsl #4
	b _0201D0C0
_0201D070:
	mov r4, ip, lsl #2
	ldrsh r6, [r3, r4]
	cmp r6, #0x63
	addeq r4, r3, r4
	ldreqsh r4, [r4, #2]
	cmpeq r4, #0x63
	streqh r5, [r0]
	streqh r5, [r0, #2]
	beq _0201D0B4
	ldrsh r4, [r2, #0x20]
	add lr, r3, ip, lsl #2
	add r4, r4, r6
	strh r4, [r0]
	ldrsh r4, [r2, #0x22]
	ldrsh lr, [lr, #2]
	add r4, r4, lr
	strh r4, [r0, #2]
_0201D0B4:
	add ip, ip, #1
	add r0, r0, #4
	and ip, ip, #0xff
_0201D0C0:
	cmp ip, r1
	blo _0201D070
	ldmia sp!, {r4, r5, r6, pc}
_0201D0CC:
	mov r2, #0
	mov r3, r2
	b _0201D0EC
_0201D0D8:
	strh r3, [r0]
	add r2, r2, #1
	strh r3, [r0, #2]
	add r0, r0, #4
	and r2, r2, #0xff
_0201D0EC:
	cmp r2, r1
	blo _0201D0D8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201D034

	arm_func_start sub_0201D0F8
sub_0201D0F8: ; 0x0201D0F8
	strb r1, [r0, #0x40]
	bx lr
	arm_func_end sub_0201D0F8

	arm_func_start sub_0201D100
sub_0201D100: ; 0x0201D100
	ldr ip, _0201D10C ; =sub_0201DC4C
	ldrsh r0, [r0, #0x70]
	bx ip
	.align 2, 0
_0201D10C: .word sub_0201DC4C
	arm_func_end sub_0201D100

	arm_func_start sub_0201D110
sub_0201D110: ; 0x0201D110
	add r3, r0, #0x10
	mov r2, #6
_0201D118:
	ldrh r0, [r1], #2
	subs r2, r2, #1
	strh r0, [r3], #2
	bne _0201D118
	bx lr
	arm_func_end sub_0201D110

	arm_func_start sub_0201D12C
sub_0201D12C: ; 0x0201D12C
	ldrh r3, [r0, #2]
	and r2, r1, #3
	ldr r1, _0201D16C ; =0x0000F3FF
	orr r3, r3, #0x20
	strh r3, [r0, #2]
	ldrh r3, [r0, #0x14]
	mov r2, r2, lsl #0x10
	and r3, r3, r1
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x1a]
	and r1, r3, r1
	strh r1, [r0, #0x1a]
	ldrh r1, [r0, #0x1a]
	orr r1, r1, r2, lsr #6
	strh r1, [r0, #0x1a]
	bx lr
	.align 2, 0
_0201D16C: .word 0x0000F3FF
	arm_func_end sub_0201D12C

	arm_func_start AnimationControlGetAllocForMaxFrame
AnimationControlGetAllocForMaxFrame: ; 0x0201D170
	stmdb sp!, {r3, lr}
	bl GetWanForAnimationControl
	cmp r0, #0
	ldrne r0, [r0]
	ldrnesh r0, [r0, #0xe]
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end AnimationControlGetAllocForMaxFrame

	arm_func_start sub_0201D18C
sub_0201D18C: ; 0x0201D18C
	mov r1, #0
	strh r1, [r0]
	bx lr
	arm_func_end sub_0201D18C

	arm_func_start sub_0201D198
sub_0201D198: ; 0x0201D198
	cmp r1, #0
	ldrh r1, [r0]
	orrne r1, r1, #0x4000
	biceq r1, r1, #0x4000
	strh r1, [r0]
	bx lr
	arm_func_end sub_0201D198

	arm_func_start sub_0201D1B0
sub_0201D1B0: ; 0x0201D1B0
	ldrh r0, [r0]
	tst r0, #0x2000
	movne r0, #0
	bxne lr
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0201D1B0

	arm_func_start sub_0201D1D4
sub_0201D1D4: ; 0x0201D1D4
	ldr r0, [r0, #0x2c]
	bx lr
	arm_func_end sub_0201D1D4

	arm_func_start DeleteWanTableEntry
DeleteWanTableEntry: ; 0x0201D1DC
	stmdb sp!, {r4, lr}
	mov r2, #0x38
	smlabb r4, r1, r2, r0
	ldrb r0, [r4, #0x20]
	cmp r0, #0
	beq _0201D204
	mov r0, r4
	mov r1, r2
	bl MemZero
	ldmia sp!, {r4, pc}
_0201D204:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	ldrnesh r0, [r4, #0x2c]
	cmpne r0, #0
	ldmeqia sp!, {r4, pc}
	sub r0, r0, #1
	strh r0, [r4, #0x2c]
	ldrsh r0, [r4, #0x2c]
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #0x34]
	bl MemFree
	mov r0, r4
	mov r1, #0x38
	bl MemZero
	ldmia sp!, {r4, pc}
	arm_func_end DeleteWanTableEntry

	arm_func_start AllocateWanTableEntry
AllocateWanTableEntry: ; 0x0201D244
	stmdb sp!, {r3, r4, r5, lr}
	add r1, r0, #0x1500
	mov lr, #1
	ldrsh r4, [r1, #0xa]
	ldrsh r5, [r1, #8]
	mov ip, lr
	mov r3, #0x38
	b _0201D2C4
_0201D264:
	cmp r4, r5
	movge r4, ip
	smlabb r1, r4, r3, r0
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _0201D2AC
	add r2, r4, #1
	add r1, r0, #0x1500
	strh r2, [r1, #0xa]
	ldrsh r3, [r1, #0xa]
	ldrsh r2, [r1, #8]
	cmp r3, r2
	movge r2, #1
	strgeh r2, [r1, #0xa]
	mov r1, #0x38
	bl MemZero
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
_0201D2AC:
	add r1, lr, #1
	add r2, r4, #1
	mov r1, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	mov lr, r1, asr #0x10
	mov r4, r2, asr #0x10
_0201D2C4:
	cmp lr, r5
	blt _0201D264
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end AllocateWanTableEntry

	arm_func_start FindWanTableEntry
FindWanTableEntry: ; 0x0201D2D4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	add r0, r6, #0x1500
	mov r5, r1
	ldrsh r4, [r0, #8]
	mov r8, #1
	mov r7, #0x38
	b _0201D324
_0201D2F4:
	smlabb r0, r8, r7, r6
	ldrb r1, [r0, #0x21]
	cmp r1, #1
	bne _0201D318
	mov r1, r5
	bl strcmp
	cmp r0, #0
	moveq r0, r8
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_0201D318:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_0201D324:
	cmp r8, r4
	blt _0201D2F4
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end FindWanTableEntry

	arm_func_start GetLoadedWanTableEntry
GetLoadedWanTableEntry: ; 0x0201D334
	stmdb sp!, {r3, r4, r5, lr}
	add r3, r0, #0x1500
	ldrsh r5, [r3, #8]
	mov r4, #1
	mov ip, #0x38
	b _0201D37C
_0201D34C:
	smlabb lr, r4, ip, r0
	ldrb r3, [lr, #0x21]
	cmp r3, #2
	ldreqh r3, [lr, #0x22]
	cmpeq r1, r3
	ldreqh r3, [lr, #0x24]
	cmpeq r2, r3
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	add r3, r4, #1
	mov r3, r3, lsl #0x10
	mov r4, r3, asr #0x10
_0201D37C:
	cmp r4, r5
	blt _0201D34C
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetLoadedWanTableEntry

	arm_func_start sub_0201D38C
sub_0201D38C: ; 0x0201D38C
	stmdb sp!, {r4, lr}
	ldr r1, _0201D3B8 ; =0x00001510
	mov r4, r0
	bl MemZero
	add r1, r4, #0x1500
	mov r2, #1
	strh r2, [r1, #0xa]
	add r0, r4, #0x1000
	strb r2, [r0, #0x50c]
	strh r2, [r1, #0xa]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201D3B8: .word 0x00001510
	arm_func_end sub_0201D38C

	arm_func_start InitWanTable
InitWanTable: ; 0x0201D3BC
	stmdb sp!, {r4, lr}
	mov r1, #0x1500
	mov r4, r0
	bl MemZero
	add r0, r4, #0x1500
	mov r1, #0x60
	strh r1, [r0, #8]
	ldmia sp!, {r4, pc}
	arm_func_end InitWanTable

	arm_func_start LoadWanTableEntry
LoadWanTableEntry: ; 0x0201D3DC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r6, r1
	mov r7, r2
	bl FindWanTableEntry
	mvn r1, #0
	cmp r0, r1
	beq _0201D418
	mov r1, #0x38
	smlabb r2, r0, r1, r5
	ldrsh r1, [r2, #0x2c]
	add r1, r1, #1
	strh r1, [r2, #0x2c]
	b _0201D47C
_0201D418:
	mov r0, r5
	bl AllocateWanTableEntry
	mov r4, r0
	mov r0, #0x38
	smlabb r5, r4, r0, r5
	mov r3, #1
	add r0, sp, #0
	mov r1, r6
	mov r2, r7
	strb r3, [r5, #0x21]
	bl LoadFileFromRom
	ldr r1, [sp]
	mov r0, r5
	str r1, [r5, #0x34]
	ldr r2, [sp, #4]
	mov r1, r6
	str r2, [r5, #0x28]
	bl strcpy
	ldrsh r1, [r5, #0x2c]
	add r0, r5, #0x30
	add r1, r1, #1
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x34]
	bl HandleSir0TranslationVeneer
	mov r0, r4
_0201D47C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LoadWanTableEntry

	arm_func_start LoadWanTableEntryFromPack
LoadWanTableEntryFromPack: ; 0x0201D484
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl GetLoadedWanTableEntry
	mvn r1, #0
	cmp r0, r1
	beq _0201D4C0
	mov r1, #0x38
	smlabb r2, r0, r1, sb
	ldrsh r1, [r2, #0x2c]
	add r1, r1, #1
	strh r1, [r2, #0x2c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0201D4C0:
	mov r0, sb
	bl AllocateWanTableEntry
	mov r5, r0
	mov r0, #0x38
	smlabb r4, r5, r0, sb
	ldrb r0, [sp, #0x20]
	mov r1, #2
	strb r1, [r4, #0x21]
	strh r8, [r4, #0x22]
	strh r7, [r4, #0x24]
	cmp r0, #0
	beq _0201D53C
	add r0, sb, #0x1000
	ldr sb, [r0, #0x500]
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r8
	mov r1, r7
	mov r2, sb
	bl DirectoryFileMngr_LoadDirectoryFile
	mov r0, sb
	bl GetAtSize
	mov r7, r0
	mov r1, r6
	bl MemAlloc
	mov r1, r7
	mov r2, sb
	mov r6, r0
	bl DecompressAtNormalVeneer
	b _0201D56C
_0201D53C:
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r1, r6
	mov sb, r0
	bl MemAlloc
	mov r6, r0
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl DirectoryFileMngr_LoadDirectoryFile
	str sb, [r4, #0x28]
_0201D56C:
	str r6, [r4, #0x34]
	ldrsh r1, [r4, #0x2c]
	add r0, r4, #0x30
	add r1, r1, #1
	strh r1, [r4, #0x2c]
	ldr r1, [r4, #0x34]
	bl HandleSir0TranslationVeneer
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end LoadWanTableEntryFromPack

	arm_func_start LoadWanTableEntryFromPackUseProvidedMemory
LoadWanTableEntryFromPackUseProvidedMemory: ; 0x0201D590
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl GetLoadedWanTableEntry
	mvn r1, #0
	cmp r0, r1
	beq _0201D5CC
	mov r1, #0x38
	smlabb r2, r0, r1, sb
	ldrsh r1, [r2, #0x2c]
	add r1, r1, #1
	strh r1, [r2, #0x2c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0201D5CC:
	mov r0, sb
	bl AllocateWanTableEntry
	ldrb r1, [sp, #0x20]
	mov r5, r0
	mov r0, #0x38
	smlabb r4, r5, r0, sb
	cmp r1, #0
	beq _0201D62C
	add r0, sb, #0x1000
	ldr sb, [r0, #0x500]
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r8
	mov r1, r7
	mov r2, sb
	bl DirectoryFileMngr_LoadDirectoryFile
	mov r0, sb
	bl GetAtSize
	mov r2, sb
	mov r1, r0
	mov r0, r6
	bl DecompressAtNormalVeneer
	b _0201D648
_0201D62C:
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl DirectoryFileMngr_LoadDirectoryFile
_0201D648:
	mov r0, #2
	strb r0, [r4, #0x21]
	strh r8, [r4, #0x22]
	strh r7, [r4, #0x24]
	str r6, [r4, #0x34]
	ldrsh r1, [r4, #0x2c]
	add r0, r4, #0x30
	add r1, r1, #1
	strh r1, [r4, #0x2c]
	ldr r1, [r4, #0x34]
	bl HandleSir0TranslationVeneer
	mov r1, #1
	mov r0, r5
	strb r1, [r4, #0x20]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end LoadWanTableEntryFromPackUseProvidedMemory

	arm_func_start ReplaceWanFromBinFile
ReplaceWanFromBinFile: ; 0x0201D684
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldrb ip, [sp, #0x18]
	mov r4, #0x38
	smlabb r6, r1, r4, r0
	mov r5, r2
	mov r4, r3
	cmp ip, #0
	beq _0201D6E8
	add r0, r0, #0x1000
	ldr r7, [r0, #0x500]
	mov r0, r5
	mov r1, r4
	ldr r8, [r6, #0x34]
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r5
	mov r1, r4
	mov r2, r7
	bl DirectoryFileMngr_LoadDirectoryFile
	mov r0, r7
	bl GetAtSize
	mov r2, r7
	mov r1, r0
	mov r0, r8
	bl DecompressAtNormalVeneer
	b _0201D708
_0201D6E8:
	ldr r7, [r6, #0x34]
	mov r0, r5
	mov r1, r4
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r5
	mov r1, r4
	mov r2, r7
	bl DirectoryFileMngr_LoadDirectoryFile
_0201D708:
	ldr r1, [r6, #0x34]
	add r0, r6, #0x30
	bl HandleSir0TranslationVeneer
	mov r0, #2
	strb r0, [r6, #0x21]
	strh r5, [r6, #0x22]
	strh r4, [r6, #0x24]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ReplaceWanFromBinFile

	arm_func_start DeleteWanTableEntryVeneer
DeleteWanTableEntryVeneer: ; 0x0201D72C
	ldr ip, _0201D734 ; =DeleteWanTableEntry
	bx ip
	.align 2, 0
_0201D734: .word DeleteWanTableEntry
	arm_func_end DeleteWanTableEntryVeneer

	arm_func_start sub_0201D738
sub_0201D738: ; 0x0201D738
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	add r3, r6, #0x1000
	ldr r3, [r3, #0x500]
	mov r5, r1
	mov r4, r2
	cmp r3, #0
	beq _0201D75C
	bl sub_0201D778
_0201D75C:
	mov r0, r5
	mov r1, r4
	bl MemAlloc
	add r1, r6, #0x1000
	str r0, [r1, #0x500]
	str r5, [r1, #0x504]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201D738

	arm_func_start sub_0201D778
sub_0201D778: ; 0x0201D778
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x1000
	ldr r0, [r0, #0x500]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl MemFree
	add r0, r4, #0x1000
	mov r1, #0
	str r1, [r0, #0x500]
	str r1, [r0, #0x504]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201D778

	arm_func_start sub_0201D7A8
sub_0201D7A8: ; 0x0201D7A8
	stmdb sp!, {r3, lr}
	ldr r0, _0201D7D8 ; =0x00001510
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201D7DC ; =_020AFC64
	ldr r1, _0201D7D8 ; =0x00001510
	str r0, [r2, #4]
	bl MemZero
	ldr r0, _0201D7DC ; =_020AFC64
	ldr r0, [r0, #4]
	bl sub_0201D38C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201D7D8: .word 0x00001510
_0201D7DC: .word _020AFC64
	arm_func_end sub_0201D7A8

	arm_func_start sub_0201D7E0
sub_0201D7E0: ; 0x0201D7E0
	ldr r2, _0201D7FC ; =_020AFC64
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _0201D800 ; =sub_0201D738
	mov r1, r3
	bx ip
	.align 2, 0
_0201D7FC: .word _020AFC64
_0201D800: .word sub_0201D738
	arm_func_end sub_0201D7E0

	arm_func_start sub_0201D804
sub_0201D804: ; 0x0201D804
	ldr r0, _0201D814 ; =_020AFC64
	ldr ip, _0201D818 ; =sub_0201D778
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_0201D814: .word _020AFC64
_0201D818: .word sub_0201D778
	arm_func_end sub_0201D804

	arm_func_start sub_0201D81C
sub_0201D81C: ; 0x0201D81C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldrb r4, [sp, #0x2c]
	ldr r5, [r0, #4]
	mov sl, r1
	mov sb, r2
	cmp r4, #0
	ldrh r7, [r5, #0xe]
	beq _0201D848
	cmp r4, #1
	beq _0201D8E4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201D848:
	cmp r3, #0
	beq _0201D8C0
	mov r8, #0
	ldr fp, _0201D988 ; =_020AFC30
	ldr r4, _0201D98C ; =_020AFC4C
	b _0201D8B8
_0201D860:
	ldr r0, [r5]
	mov r2, sl
	ldr r6, [r0, r8, lsl #2]
	str sb, [sp]
	ldr r0, [r4]
	ldr r3, [r5, #4]
	mov r1, r6
	bl sub_0201B388
	ldr r1, [r5, #4]
	ldr r0, [r4]
	ldrh r1, [r1, #4]
	ldrh r2, [r0, #0xc]
	ldr r0, [r6, #4]
	mov r1, r1, lsl #1
	ldrh r1, [fp, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r8, r1, lsr #0x10
_0201D8B8:
	cmp r8, r7
	blo _0201D860
_0201D8C0:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _0201D98C ; =_020AFC4C
	ldr r1, [r5, #4]
	ldr r0, [r0]
	mov r2, sb
	bl sub_0201B43C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201D8E4:
	cmp r3, #0
	beq _0201D960
	mov r6, #0
	ldr fp, _0201D988 ; =_020AFC30
	ldr r4, _0201D98C ; =_020AFC4C
	b _0201D958
_0201D8FC:
	ldr r0, [r5]
	mov r2, sl
	ldr r8, [r0, r6, lsl #2]
	str sb, [sp]
	ldr r0, [r4]
	ldr r3, [r5, #4]
	mov r1, r8
	add r0, r0, #0x70
	bl sub_0201B388
	ldr r1, [r5, #4]
	ldr r0, [r4]
	ldrh r1, [r1, #4]
	ldrh r2, [r0, #0x7c]
	ldr r0, [r8, #4]
	mov r1, r1, lsl #1
	ldrh r1, [fp, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r6, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r6, r1, lsr #0x10
_0201D958:
	cmp r6, r7
	blo _0201D8FC
_0201D960:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _0201D98C ; =_020AFC4C
	ldr r1, [r5, #4]
	ldr r0, [r0]
	mov r2, sb
	add r0, r0, #0x70
	bl sub_0201B43C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201D988: .word _020AFC30
_0201D98C: .word _020AFC4C
	arm_func_end sub_0201D81C

	arm_func_start sub_0201D990
sub_0201D990: ; 0x0201D990
	stmdb sp!, {r3, lr}
	ldr r1, _0201D9C4 ; =_020AFC3C
	ldr r1, [r1, r2, lsl #2]
	mov r1, r1, lsl #0x10
	add r0, r0, r1, asr #16
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #0x10
	mov r0, r0, asr #0x10
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201D9C4: .word _020AFC3C
	arm_func_end sub_0201D990

	arm_func_start sub_0201D9C8
sub_0201D9C8: ; 0x0201D9C8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldrb lr, [sp, #0x14]
	ldr ip, _0201D9FC ; =_020AFC64
	mov r3, #1
	stmia sp, {r3, lr}
	ldr lr, [ip, #4]
	mov ip, #0x38
	smlabb r0, r0, ip, lr
	ldr r0, [r0, #0x30]
	bl sub_0201D81C
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201D9FC: .word _020AFC64
	arm_func_end sub_0201D9C8

	arm_func_start sub_0201DA00
sub_0201DA00: ; 0x0201DA00
	ldrb r1, [r0, #8]
	ldr r0, [r0]
	cmp r1, #0
	cmpne r1, #2
	ldreq r0, [r0, #8]
	ldreqsh r0, [r0, #4]
	ldrnesh r0, [r0, #0xc]
	bx lr
	arm_func_end sub_0201DA00

	arm_func_start sub_0201DA20
sub_0201DA20: ; 0x0201DA20
	ldr r2, _0201DA3C ; =_020AFC64
	mov r1, #0x38
	ldr r2, [r2, #4]
	ldr ip, _0201DA40 ; =sub_0201DA00
	smlabb r0, r0, r1, r2
	ldr r0, [r0, #0x30]
	bx ip
	.align 2, 0
_0201DA3C: .word _020AFC64
_0201DA40: .word sub_0201DA00
	arm_func_end sub_0201DA20

	arm_func_start WanHasAnimationGroup
WanHasAnimationGroup: ; 0x0201DA44
	ldr r2, [r0]
	ldrsh r0, [r2, #0xc]
	cmp r1, r0
	bge _0201DA70
	cmp r1, #0
	blt _0201DA70
	ldr r0, [r2, #8]
	add r0, r0, r1, lsl #3
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _0201DA78
_0201DA70:
	mov r0, #0
	bx lr
_0201DA78:
	mov r0, #1
	bx lr
	arm_func_end WanHasAnimationGroup

	arm_func_start WanTableSpriteHasAnimationGroup
WanTableSpriteHasAnimationGroup: ; 0x0201DA80
	ldr r3, _0201DA9C ; =_020AFC64
	mov r2, #0x38
	ldr r3, [r3, #4]
	ldr ip, _0201DAA0 ; =WanHasAnimationGroup
	smlabb r0, r0, r2, r3
	ldr r0, [r0, #0x30]
	bx ip
	.align 2, 0
_0201DA9C: .word _020AFC64
_0201DAA0: .word WanHasAnimationGroup
	arm_func_end WanTableSpriteHasAnimationGroup

	arm_func_start sub_0201DAA4
sub_0201DAA4: ; 0x0201DAA4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r5, [r0, #4]
	mov sl, r1
	mov sb, r2
	cmp r3, #0
	ldrh r7, [r5, #0xe]
	beq _0201DACC
	cmp r3, #1
	beq _0201DB38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201DACC:
	mov r8, #0
	mov r6, r8
	ldr r4, _0201DBB0 ; =_020AFC30
	ldr fp, _0201DBB4 ; =_020AFC4C
	b _0201DB2C
_0201DAE0:
	str r6, [sp]
	ldmia r5, {r0, r2}
	ldr r0, [r0, r8, lsl #2]
	mov r1, sl
	mov r3, sb
	bl sub_0201BFAC
	ldr r2, [r5, #4]
	ldr r1, [fp]
	ldrh r3, [r2, #4]
	ldrh r2, [r1, #0xc]
	mov r1, r3, lsl #1
	ldrh r1, [r4, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r8, r1, lsr #0x10
_0201DB2C:
	cmp r8, r7
	blo _0201DAE0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201DB38:
	mov r8, #0
	mov r4, #1
	ldr fp, _0201DBB0 ; =_020AFC30
	b _0201DBA4
_0201DB48:
	ldr r0, [r5]
	mov r1, sl
	ldr r6, [r0, r8, lsl #2]
	mov r3, sb
	str r4, [sp]
	ldr r2, [r5, #4]
	mov r0, r6
	bl sub_0201BFAC
	ldr r2, [r5, #4]
	ldr r0, _0201DBB4 ; =_020AFC4C
	ldrh r3, [r2, #4]
	ldr r1, [r0]
	ldr r0, [r6, #4]
	ldrh r2, [r1, #0x7c]
	mov r1, r3, lsl #1
	ldrh r1, [fp, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r8, r1, lsr #0x10
_0201DBA4:
	cmp r8, r7
	blo _0201DB48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201DBB0: .word _020AFC30
_0201DBB4: .word _020AFC4C
	arm_func_end sub_0201DAA4

	arm_func_start sub_0201DBB8
sub_0201DBB8: ; 0x0201DBB8
	stmdb sp!, {r3, lr}
	ldr lr, _0201DBD8 ; =_020AFC64
	mov ip, #0x38
	ldr lr, [lr, #4]
	smlabb r0, r0, ip, lr
	ldr r0, [r0, #0x30]
	bl sub_0201DAA4
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DBD8: .word _020AFC64
	arm_func_end sub_0201DBB8

	arm_func_start sub_0201DBDC
sub_0201DBDC: ; 0x0201DBDC
	ldr r0, [r0, #4]
	ldr r1, [r0, #4]
	cmp r1, #0
	moveq r0, #0
	bxeq lr
	ldrh r0, [r1, #4]
	cmp r0, #1
	bne _0201DC30
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	ldrsh r0, [r1, #6]
	addne r1, r0, #0xf
	movne r0, r1, asr #3
	addne r0, r1, r0, lsr #28
	movne r0, r0, lsl #0xc
	addeq r1, r0, #0xff
	moveq r0, r1, asr #7
	addeq r0, r1, r0, lsr #24
	moveq r0, r0, lsl #8
	mov r0, r0, asr #0x10
	bx lr
_0201DC30:
	ldrsh r0, [r1, #6]
	add r1, r0, #0xf
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	mov r0, r0, lsl #0xc
	mov r0, r0, asr #0x10
	bx lr
	arm_func_end sub_0201DBDC

	arm_func_start sub_0201DC4C
sub_0201DC4C: ; 0x0201DC4C
	ldr r2, _0201DC68 ; =_020AFC64
	mov r1, #0x38
	ldr r2, [r2, #4]
	ldr ip, _0201DC6C ; =sub_0201DBDC
	smlabb r0, r0, r1, r2
	ldr r0, [r0, #0x30]
	bx ip
	.align 2, 0
_0201DC68: .word _020AFC64
_0201DC6C: .word sub_0201DBDC
	arm_func_end sub_0201DC4C

	arm_func_start SpriteTypeInWanTable
SpriteTypeInWanTable: ; 0x0201DC70
	ldr r2, _0201DC8C ; =_020AFC64
	mov r1, #0x38
	ldr r2, [r2, #4]
	smlabb r0, r0, r1, r2
	ldr r0, [r0, #0x30]
	ldrb r0, [r0, #8]
	bx lr
	.align 2, 0
_0201DC8C: .word _020AFC64
	arm_func_end SpriteTypeInWanTable

	arm_func_start sub_0201DC90
sub_0201DC90: ; 0x0201DC90
	stmdb sp!, {r3, lr}
	ldr r0, _0201DCC8 ; =0x000007C4
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201DCCC ; =_020AFC6C
	ldr r1, _0201DCC8 ; =0x000007C4
	str r0, [r2]
	bl MemZero
	ldr r0, _0201DCCC ; =_020AFC6C
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x700
	strh r1, [r0, #0xc0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DCC8: .word 0x000007C4
_0201DCCC: .word _020AFC6C
	arm_func_end sub_0201DC90

	arm_func_start sub_0201DCD0
sub_0201DCD0: ; 0x0201DCD0
	stmdb sp!, {r3, lr}
	ldr r0, _0201DCF0 ; =_020AFC6C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0201DCF0 ; =_020AFC6C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DCF0: .word _020AFC6C
	arm_func_end sub_0201DCD0

	arm_func_start sub_0201DCF4
sub_0201DCF4: ; 0x0201DCF4
	ldr r0, _0201DD44 ; =_020AFC6C
	mov r2, #0
	ldr r1, [r0]
	mov r3, #1
	strb r2, [r1, #0x7c2]
	ldr r2, [r0]
	mov r1, #0x7c
	b _0201DD30
_0201DD14:
	smlabb r0, r3, r1, r2
	ldrh r0, [r0, #2]
	tst r0, #1
	bxeq lr
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
_0201DD30:
	cmp r3, #0x10
	blt _0201DD14
	mov r0, #1
	strb r0, [r2, #0x7c2]
	bx lr
	.align 2, 0
_0201DD44: .word _020AFC6C
	arm_func_end sub_0201DCF4

	arm_func_start sub_0201DD48
sub_0201DD48: ; 0x0201DD48
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _0201DD8C ; =_020AFC6C
	mov r6, #1
	mov r4, #0x7c
_0201DD58:
	ldr r0, [r5]
	smlabb r0, r6, r4, r0
	ldrh r1, [r0, #2]
	tst r1, #1
	beq _0201DD70
	bl sub_0201CF5C
_0201DD70:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	blt _0201DD58
	bl sub_0201DCF4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201DD8C: .word _020AFC6C
	arm_func_end sub_0201DD48

	arm_func_start sub_0201DD90
sub_0201DD90: ; 0x0201DD90
	stmdb sp!, {r3, lr}
	mov r0, #0x2ec
	mov r1, #0
	bl MemAlloc
	ldr r1, _0201DDF0 ; =_020AFC70
	str r0, [r1]
	bl sub_0201E614
	ldr r0, _0201DDF0 ; =_020AFC70
	ldr r1, _0201DDF4 ; =0x06860000
	ldr r0, [r0]
	add r2, r1, #0x30000
	add r0, r0, #0xbc
	mov r3, #0x80
	bl sub_0201E190
	ldr r0, _0201DDF0 ; =_020AFC70
	ldr r2, _0201DDF8 ; =0x06890000
	ldr r1, [r0]
	mov r0, #0x2000
	str r0, [sp]
	add r0, r1, #0xcc
	add r1, r1, #0xbc
	mov r3, #0
	bl sub_0201E314
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DDF0: .word _020AFC70
_0201DDF4: .word 0x06860000
_0201DDF8: .word 0x06890000
	arm_func_end sub_0201DD90

	arm_func_start sub_0201DDFC
sub_0201DDFC: ; 0x0201DDFC
	stmdb sp!, {r3, lr}
	bl sub_0201E5B0
	bl GeomSwapBuffers
	bl sub_0201E544
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201DDFC

	arm_func_start sub_0201DE10
sub_0201DE10: ; 0x0201DE10
	stmdb sp!, {r3, lr}
	ldr r0, _0201DE48 ; =_020AFC70
	ldr r0, [r0]
	add r0, r0, #0xcc
	bl sub_0201E424
	ldr r0, _0201DE48 ; =_020AFC70
	ldr r0, [r0]
	add r0, r0, #0xbc
	bl PerformPlannedTextureVramTransfer
	ldr r0, _0201DE48 ; =_020AFC70
	ldr r0, [r0]
	add r0, r0, #0xbc
	bl ResetPlannedVramTransfer
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DE48: .word _020AFC70
	arm_func_end sub_0201DE10

	arm_func_start LoadWteFromRom
LoadWteFromRom: ; 0x0201DE4C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x10c
	mov r5, r1
	mov r6, r0
	ldr r1, _0201DEBC ; =_02099714
	add r0, sp, #0xc
	mov r4, r2
	bl strcpy
	add r0, sp, #0xc
	mov r1, r5
	bl strcat
	add r0, sp, #4
	add r1, sp, #0xc
	mov r2, r4
	bl LoadFileFromRom
	ldr r1, [sp, #4]
	add r0, sp, #0
	bl HandleSir0Translation
	ldr r0, [sp]
	ldr r1, _0201DEC0 ; =_0209971C
	mov r2, #4
	bl strncmp
	ldr r0, [sp, #4]
	str r0, [r6]
	ldr r0, [sp]
	str r0, [r6, #4]
	add sp, sp, #0x10c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0201DEBC: .word _02099714
_0201DEC0: .word _0209971C
	arm_func_end LoadWteFromRom

	arm_func_start LoadWteFromFileDirectory
LoadWteFromFileDirectory: ; 0x0201DEC4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r0, r1
	mov r1, r2
	add r2, sp, #0
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp]
	add r0, sp, #8
	bl HandleSir0Translation
	ldr r0, [sp, #8]
	ldr r1, _0201DF14 ; =_0209971C
	mov r2, #4
	bl strncmp
	ldr r0, [sp]
	str r0, [r4]
	ldr r0, [sp, #8]
	str r0, [r4, #4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201DF14: .word _0209971C
	arm_func_end LoadWteFromFileDirectory

	arm_func_start UnloadWte
UnloadWte: ; 0x0201DF18
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	arm_func_end UnloadWte

	arm_func_start sub_0201DF38
sub_0201DF38: ; 0x0201DF38
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x108
	mov r6, r0
	mov r0, #8
	mov r5, r1
	bl MemAlloc
	mov r4, r0
	ldr r1, _0201DFAC ; =_02099714
	add r0, sp, #8
	bl strcpy
	add r0, sp, #8
	mov r1, r6
	bl strcat
	add r0, sp, #0
	add r1, sp, #8
	mov r2, r5
	bl LoadFileFromRom
	ldr r5, [sp]
	ldr r1, _0201DFB0 ; =_02099720
	str r5, [r4]
	mov r0, r5
	mov r2, #4
	bl strncmp
	ldr r1, [r5, #0xc]
	mov r0, r4
	add r1, r5, r1
	str r1, [r4, #4]
	add sp, sp, #0x108
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201DFAC: .word _02099714
_0201DFB0: .word _02099720
	arm_func_end sub_0201DF38

	arm_func_start LoadWtuFromBin
LoadWtuFromBin: ; 0x0201DFB4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r2
	mov r7, r0
	mov r6, r1
	mov r1, r5
	mov r0, #8
	bl MemAlloc
	mov r4, r0
	add r2, sp, #0
	mov r0, r7
	mov r1, r6
	mov r3, r5
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r5, [sp]
	ldr r1, _0201E01C ; =_02099720
	str r5, [r4]
	mov r0, r5
	mov r2, #4
	bl strncmp
	ldr r1, [r5, #0xc]
	mov r0, r4
	add r1, r5, r1
	str r1, [r4, #4]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201E01C: .word _02099720
	arm_func_end LoadWtuFromBin

	arm_func_start sub_0201E020
sub_0201E020: ; 0x0201E020
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r0]
	bl MemFree
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E020

	arm_func_start sub_0201E050
sub_0201E050: ; 0x0201E050
	stmdb sp!, {r3, lr}
	ldr ip, _0201E07C ; =_020AFC70
	str r3, [sp]
	ldr ip, [ip]
	mov lr, r1
	mov r3, r2
	mov r1, r0
	mov r2, lr
	add r0, ip, #0xbc
	bl PlanCopyTextureToTextureVram
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E07C: .word _020AFC70
	arm_func_end sub_0201E050

	arm_func_start sub_0201E080
sub_0201E080: ; 0x0201E080
	stmdb sp!, {r3, lr}
	mov r2, #2
	ldr r1, _0201E0AC ; =_020AFC70
	str r2, [sp]
	mov r2, #0
	ldr ip, [r1]
	mov r1, r0
	mov r3, r2
	add r0, ip, #0xbc
	bl PlanCopyTextureToTextureVram
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E0AC: .word _020AFC70
	arm_func_end sub_0201E080

	arm_func_start ProcessWte
ProcessWte: ; 0x0201E0B0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov ip, r1
	ldr r1, [r6, #4]
	mov r5, r2
	mov r4, r3
	cmp r1, #0
	beq _0201E0F4
	mov r0, #0
	str r0, [sp]
	ldr r0, _0201E128 ; =_020AFC70
	ldr r3, [r6, #8]
	ldr r0, [r0]
	mov r2, ip
	add r0, r0, #0xbc
	bl PlanCopyTextureToTextureVram
_0201E0F4:
	ldr r0, [r6, #0x18]
	cmp r0, #0
	beq _0201E120
	ldr r0, _0201E128 ; =_020AFC70
	str r4, [sp]
	ldr r0, [r0]
	ldrsh r2, [r6, #0x1c]
	ldr r1, [r6, #0x18]
	mov r3, r5
	add r0, r0, #0xcc
	bl sub_0201E3AC
_0201E120:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0201E128: .word _020AFC70
	arm_func_end ProcessWte

	arm_func_start sub_0201E12C
sub_0201E12C: ; 0x0201E12C
	ldr ip, _0201E138 ; =ProcessWte
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_0201E138: .word ProcessWte
	arm_func_end sub_0201E12C

	arm_func_start DelayWteFree
DelayWteFree: ; 0x0201E13C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r2, #2
	ldr r1, _0201E180 ; =_020AFC70
	str r2, [sp]
	mov r4, r0
	ldr r0, [r1]
	mov r2, #0
	ldr r1, [r4]
	mov r3, r2
	add r0, r0, #0xbc
	bl PlanCopyTextureToTextureVram
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201E180: .word _020AFC70
	arm_func_end DelayWteFree

	arm_func_start sub_0201E184
sub_0201E184: ; 0x0201E184
	mov r0, r0, lsl #9
	mov r0, r0, asr #0x10
	bx lr
	arm_func_end sub_0201E184

	arm_func_start sub_0201E190
sub_0201E190: ; 0x0201E190
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov ip, #0x1c
	mul r4, r3, ip
	mov r7, r0
	mov r6, r1
	mov r0, r4
	mov r1, #0
	mov r5, r2
	bl MemAlloc
	mov r1, r4
	str r0, [r7]
	bl MemZero
	mov r0, #0
	strh r0, [r7, #0xc]
	str r6, [r7, #4]
	str r5, [r7, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0201E190

	arm_func_start ResetPlannedVramTransfer
ResetPlannedVramTransfer: ; 0x0201E1D4
	mov r1, #0
	strh r1, [r0, #0xc]
	bx lr
	arm_func_end ResetPlannedVramTransfer

	arm_func_start PlanCopyTextureToTextureVram
PlanCopyTextureToTextureVram: ; 0x0201E1E0
	stmdb sp!, {r4, lr}
	ldrsh r4, [r0, #0xc]
	cmp r4, #0x80
	mvnge r0, #0
	ldmgeia sp!, {r4, pc}
	ldr lr, [r0]
	mov ip, #0x1c
	smlabb ip, r4, ip, lr
	str r3, [ip, #4]
	str r1, [ip, #8]
	ldrb r3, [sp, #8]
	str r2, [ip, #0xc]
	mov r1, #0
	str r3, [ip, #0x10]
	strb r1, [ip, #0x14]
	ldrsh r1, [r0, #0xc]
	add r1, r1, #1
	strh r1, [r0, #0xc]
	ldrsh r0, [r0, #0xc]
	ldmia sp!, {r4, pc}
	arm_func_end PlanCopyTextureToTextureVram

	arm_func_start PerformPlannedTextureVramTransfer
PerformPlannedTextureVramTransfer: ; 0x0201E230
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	ldrsh r7, [r4, #0xc]
	mov r6, #0
	ldr fp, _0201E310 ; =_022A4F38
	mov r5, #0x1c
	b _0201E304
_0201E24C:
	ldr r0, [r4]
	smlabb r1, r6, r5, r0
	ldr r0, [r1, #0x10]
	cmp r0, #0
	beq _0201E274
	cmp r0, #1
	beq _0201E2C8
	cmp r0, #2
	beq _0201E2F0
	b _0201E2F8
_0201E274:
	ldr sl, [r1, #8]
	cmp sl, #0
	beq _0201E2A4
	ldr sb, [r1, #4]
	ldr r8, [r1, #0xc]
	bl GX_BeginLoadTex
	mov r0, sl
	mov r1, r8
	mov r2, sb
	bl GX_LoadTex
	bl GX_EndLoadTex
	b _0201E2F8
_0201E2A4:
	ldr r8, [r1, #4]
	ldr sb, [r1, #0xc]
	bl GX_BeginLoadTex
	mov r0, fp
	mov r1, sb
	mov r2, r8
	bl GX_LoadTex
	bl GX_EndLoadTex
	b _0201E2F8
_0201E2C8:
	ldr sl, [r1, #4]
	ldr sb, [r1, #0xc]
	ldr r8, [r1, #8]
	bl GX_BeginLoadTexPltt
	mov r0, r8
	mov r1, sb
	mov r2, sl
	bl GX_LoadTexPltt
	bl GX_EndLoadTexPltt
	b _0201E2F8
_0201E2F0:
	ldr r0, [r1, #8]
	bl MemFree
_0201E2F8:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_0201E304:
	cmp r6, r7
	blt _0201E24C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201E310: .word _022A4F38
	arm_func_end PerformPlannedTextureVramTransfer

	arm_func_start sub_0201E314
sub_0201E314: ; 0x0201E314
	stmdb sp!, {r4, lr}
	ldr ip, [sp, #8]
	mov r4, r0
	mov r0, ip, asr #7
	add r0, ip, r0, lsr #24
	stmia r4, {r1, ip}
	mov r0, r0, asr #8
	str r0, [r4, #8]
	mov r1, #0
	strb r1, [r4, #0xc]
	str r2, [r4, #0x10]
	str r3, [r4, #0x14]
	mov r0, ip, lsl #1
	bl MemAlloc
	str r0, [r4, #0x18]
	ldr r0, [r4, #8]
	mov r1, #0
	bl MemAlloc
	str r0, [r4, #0x1c]
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x18]
	mov r1, r1, lsl #1
	bl MemZero
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #8]
	bl MemZero
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E314

	arm_func_start sub_0201E380
sub_0201E380: ; 0x0201E380
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	ldr r2, [r5, #0x18]
	add r0, r3, r4, lsl #8
	add r0, r2, r0, lsl #1
	bl Rgb8ToRgb5
	ldr r0, [r5, #0x1c]
	mov r1, #1
	strb r1, [r0, r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0201E380

	arm_func_start sub_0201E3AC
sub_0201E3AC: ; 0x0201E3AC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldrsh r4, [sp, #0x20]
	mov r7, r3
	mov sl, r0
	add r6, r4, r7, lsl #8
	mov sb, r1
	mov r8, r2
	mov r5, #0
	mov r4, #1
	b _0201E3FC
_0201E3D4:
	ldr r1, [sl, #0x18]
	add r0, r5, r6
	add r0, r1, r0, lsl #1
	add r1, sb, r5, lsl #2
	bl Rgb8ToRgb5
	add r0, r5, #1
	ldr r1, [sl, #0x1c]
	mov r0, r0, lsl #0x10
	strb r4, [r7, r1]
	mov r5, r0, asr #0x10
_0201E3FC:
	cmp r5, r8
	blt _0201E3D4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_0201E3AC

	arm_func_start sub_0201E408
sub_0201E408: ; 0x0201E408
	stmdb sp!, {r3, lr}
	str r3, [sp]
	mov r3, r2
	ldrsh r2, [r1, #6]
	ldr r1, [r1]
	bl sub_0201E3AC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201E408

	arm_func_start sub_0201E424
sub_0201E424: ; 0x0201E424
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r5, #0
	mov r6, r0
	mov r4, #1
	mov r8, #0x200
	mov r7, r5
	b _0201E480
_0201E444:
	ldr r0, [r6, #0x1c]
	ldrb r0, [r0, r5]
	cmp r0, #0
	beq _0201E47C
	str r4, [sp]
	ldr r1, [r6, #0x18]
	ldr r2, [r6, #0x14]
	ldr r0, [r6]
	mov r3, r8
	add r1, r1, r5, lsl #9
	add r2, r2, r5, lsl #9
	bl PlanCopyTextureToTextureVram
	ldr r0, [r6, #0x1c]
	strb r7, [r0, r5]
_0201E47C:
	add r5, r5, #1
_0201E480:
	ldr r0, [r6, #8]
	cmp r5, r0
	blt _0201E444
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0201E424

	arm_func_start GeomSetTexImageParam
GeomSetTexImageParam: ; 0x0201E494
	ldr ip, [sp, #0xc]
	mov r0, r0, lsl #0x1a
	orr r0, r0, ip, lsr #3
	orr r0, r0, r1, lsl #30
	orr r0, r0, r2, lsl #20
	ldr r1, [sp]
	orr r0, r0, r3, lsl #23
	ldr r2, [sp, #4]
	orr r0, r0, r1, lsl #16
	ldr r3, [sp, #8]
	orr r1, r0, r2, lsl #18
	ldr r0, _0201E4D0 ; =0x040004A8
	orr r1, r1, r3, lsl #29
	str r1, [r0]
	bx lr
	.align 2, 0
_0201E4D0: .word 0x040004A8
	arm_func_end GeomSetTexImageParam

	arm_func_start GeomSetVertexCoord16
GeomSetVertexCoord16: ; 0x0201E4D4
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r3, r1, lsl #0x10
	mov r1, r2, lsl #0x10
	ldr r2, _0201E500 ; =0x0400048C
	orr r0, r3, r0, lsr #16
	str r0, [r2]
	mov r0, r1, lsr #0x10
	str r0, [r2]
	bx lr
	.align 2, 0
_0201E500: .word 0x0400048C
	arm_func_end GeomSetVertexCoord16

	arm_func_start InitRender3dData
InitRender3dData: ; 0x0201E504
	stmdb sp!, {r3, lr}
	ldr r0, _0201E540 ; =RENDER_3D
	ldr r0, [r0, #0x40]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0x1a00
	mov r1, #0
	bl MemAlloc
	ldr r1, _0201E540 ; =RENDER_3D
	mov r2, #0
	str r0, [r1, #0x40]
	strh r2, [r1]
	mov r0, #0x80
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E540: .word RENDER_3D
	arm_func_end InitRender3dData

	arm_func_start sub_0201E544
sub_0201E544: ; 0x0201E544
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #0xc]
	bl GeomSetTexImageParam
	ldr r0, _0201E5A4 ; =RENDER_3D
	mvn r1, #0
	str r1, [r0, #8]
	bl sub_01FF8F04
	ldr r2, _0201E5A8 ; =0x3F1F00C0
	ldr r1, _0201E5AC ; =0x040004A4
	ldr r0, _0201E5A4 ; =RENDER_3D
	str r2, [r1]
	mov r1, #0
	strh r1, [r0]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E5A4: .word RENDER_3D
_0201E5A8: .word 0x3F1F00C0
_0201E5AC: .word 0x040004A4
	arm_func_end sub_0201E544

	arm_func_start sub_0201E5B0
sub_0201E5B0: ; 0x0201E5B0
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	bl Render3dProcessQueue
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #0xc]
	bl GeomSetTexImageParam
	ldr r0, _0201E608 ; =RENDER_3D
	mvn r1, #0
	str r1, [r0, #8]
	bl sub_01FF8F04
	ldr r1, _0201E60C ; =0x3F1F00C0
	ldr r0, _0201E610 ; =0x040004A4
	str r1, [r0]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E608: .word RENDER_3D
_0201E60C: .word 0x3F1F00C0
_0201E610: .word 0x040004A4
	arm_func_end sub_0201E5B0

	arm_func_start sub_0201E614
sub_0201E614: ; 0x0201E614
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #0xbc
	bl MemZero
	bl InitRender3dData
	mov r0, r4
	bl sub_0201E634
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E614

	arm_func_start sub_0201E634
sub_0201E634: ; 0x0201E634
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	mov r4, r0
	mov r2, #0
	str r2, [r4, #0xa0]
	mov r0, #0x100000
	str r0, [r4, #0xa4]
	ldr r0, _0201E70C ; =0x007FFFFF
	str r2, [r4, #0xa8]
	mov r1, #0xc0000
	str r1, [r4, #0xac]
	mov r1, #0x1000
	str r1, [r4, #0xb0]
	str r0, [r4, #0xb4]
	str r2, [r4]
	str r2, [r4, #4]
	str r1, [r4, #8]
	str r2, [r4, #0x18]
	str r2, [r4, #0x1c]
	mov r0, r0, lsl #0xc
	str r0, [r4, #0x20]
	str r2, [r4, #0x24]
	str r1, [r4, #0x28]
	ldr r1, _0201E710 ; =0xBFFF0000
	ldr r0, _0201E714 ; =0x04000580
	str r2, [r4, #0x2c]
	str r1, [r0]
	ldr r0, [r4, #0xb0]
	mov r1, #0x400000
	str r0, [sp]
	ldr r2, [r4, #0xb4]
	mov r0, #1
	str r2, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r4, #0x60
	str r0, [sp, #0x10]
	ldr r0, [r4, #0xa8]
	ldr r1, [r4, #0xac]
	ldr r2, [r4, #0xa0]
	ldr r3, [r4, #0xa4]
	bl G3i_OrthoW_
	ldr r1, _0201E718 ; =0x0400044C
	mov r2, #0
	mov r0, r4
	str r2, [r1]
	add ip, r4, #0x30
	add r1, r4, #0x24
	add r2, r4, #0x18
	mov r3, #1
	str ip, [sp]
	bl G3i_LookAt_
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201E70C: .word 0x007FFFFF
_0201E710: .word 0xBFFF0000
_0201E714: .word 0x04000580
_0201E718: .word 0x0400044C
	arm_func_end sub_0201E634

	arm_func_start GeomSwapBuffers
GeomSwapBuffers: ; 0x0201E71C
	ldr r0, _0201E72C ; =0x04000540
	mov r1, #1
	str r1, [r0]
	bx lr
	.align 2, 0
_0201E72C: .word 0x04000540
	arm_func_end GeomSwapBuffers

	arm_func_start InitRender3dElement64
InitRender3dElement64: ; 0x0201E730
	stmdb sp!, {r4, lr}
	mov r1, #0x40
	mov r4, r0
	bl MemZero
	mov r0, #0xff
	strb r0, [r4, #0x2c]
	strb r0, [r4, #0x2d]
	strb r0, [r4, #0x2e]
	strb r0, [r4, #0x2f]
	mov r0, #0x1000
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	mov r0, #0x40
	strh r0, [r4, #0x2a]
	mov r0, #0
	strb r0, [r4, #0x3e]
	ldmia sp!, {r4, pc}
	arm_func_end InitRender3dElement64

	arm_func_start sub_0201E774
sub_0201E774: ; 0x0201E774
	stmdb sp!, {r4, lr}
	ldrh ip, [r1, #0xc]
	mov r4, r0
	mov r0, r3
	strh ip, [r4, #0x14]
	ldrsh r3, [r1, #0x10]
	strh r3, [r4, #0x16]
	ldrsh r3, [r1, #0x12]
	strh r3, [r4, #0x18]
	ldrsh r3, [r1, #0x14]
	strh r3, [r4, #0x1a]
	ldrsh r3, [r1, #0x16]
	ldrsh r1, [sp, #8]
	strh r3, [r4, #0x1c]
	str r2, [r4, #0x20]
	bl sub_0201E7BC
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E774

	arm_func_start sub_0201E7BC
sub_0201E7BC: ; 0x0201E7BC
	ldr r2, _0201E7D4 ; =_020AFC70
	add r0, r1, r0, lsl #8
	ldr r1, [r2]
	ldr r1, [r1, #0xe0]
	add r0, r1, r0, lsl #1
	bx lr
	.align 2, 0
_0201E7D4: .word _020AFC70
	arm_func_end sub_0201E7BC

	arm_func_start sub_0201E7D8
sub_0201E7D8: ; 0x0201E7D8
	stmdb sp!, {r4, lr}
	ldr ip, [r1]
	mov r4, r0
	ldrh lr, [ip, #8]
	mov ip, r2, lsl #3
	ldrsh r0, [sp, #8]
	strh lr, [r4, #0x14]
	ldr lr, [r1, #4]
	ldrsh ip, [lr, ip]
	strh ip, [r4, #0x16]
	ldr ip, [r1, #4]
	add ip, ip, r2, lsl #3
	ldrsh ip, [ip, #2]
	strh ip, [r4, #0x18]
	ldr ip, [r1, #4]
	add ip, ip, r2, lsl #3
	ldrsh ip, [ip, #4]
	strh ip, [r4, #0x1a]
	ldr ip, [r1, #4]
	ldrsh r1, [sp, #0xc]
	add r2, ip, r2, lsl #3
	ldrsh r2, [r2, #6]
	strh r2, [r4, #0x1c]
	str r3, [r4, #0x20]
	bl sub_0201E7BC
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E7D8

	arm_func_start Render3d64Texture0x7
Render3d64Texture0x7: ; 0x0201E844
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	bl NewRender3dTexture
	ldrsh r1, [r4]
	mov r5, #0
	strh r1, [r0, #0x16]
	ldrsh r1, [r4, #2]
	strh r1, [r0, #0x18]
	ldrsh r1, [r4, #8]
	strh r1, [r0, #0x1a]
	ldrsh r1, [r4, #0xa]
	strh r1, [r0, #0x1c]
	ldrb r2, [r4, #0x2e]
	ldrb r1, [r4, #0x2d]
	ldrb r6, [r4, #0x2c]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, r6, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x22]
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x27]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x1e]
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0x20]
	ldrh r1, [r4, #0x28]
	strh r1, [r0, #0x24]
	ldr r1, [r4, #0x20]
	str r1, [r0, #4]
	ldr r1, [r4, #0x24]
	str r1, [r0, #8]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x26]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	ldrh r1, [r4, #0x14]
	strh r1, [r0, #0x14]
_0201E8F0:
	mov r1, #0x18
	mul r6, r5, r1
	mov r1, r6, lsl #0x10
	mov ip, r1, asr #0x10
	mov r1, #0x1f
	mov r3, #0x18
	and r7, r5, #1
	mov lr, #0
	mov r2, r1
	mov sb, r3
_0201E918:
	mul r8, lr, sb
	ldrsh sl, [r4]
	tst lr, #1
	add sl, sl, r8
	strh sl, [r0, #0x16]
	ldrsh sl, [r4, #2]
	add sl, sl, r6
	strh sl, [r0, #0x18]
	strh r8, [r0, #0xc]
	strh ip, [r0, #0xe]
	strh r3, [r0, #0x10]
	strh r3, [r0, #0x12]
	beq _0201E988
	cmp r7, #0
	streqh r2, [r0, #0x22]
	beq _0201E9C0
	ldrb r8, [r4, #0x2e]
	ldrb sl, [r4, #0x2d]
	ldrb fp, [r4, #0x2c]
	and r8, r8, #0xf8
	mov r8, r8, lsl #0x17
	and fp, fp, #0xf8
	and sl, sl, #0xf8
	mov sl, sl, lsl #2
	orr r8, sl, r8, lsr #16
	orr r8, r8, fp, asr #3
	strh r8, [r0, #0x22]
	b _0201E9C0
_0201E988:
	cmp r7, #0
	strneh r1, [r0, #0x22]
	bne _0201E9C0
	ldrb r8, [r4, #0x2e]
	ldrb sl, [r4, #0x2d]
	ldrb fp, [r4, #0x2c]
	and r8, r8, #0xf8
	mov r8, r8, lsl #0x17
	and fp, fp, #0xf8
	and sl, sl, #0xf8
	mov sl, sl, lsl #2
	orr r8, sl, r8, lsr #16
	orr r8, r8, fp, asr #3
	strh r8, [r0, #0x22]
_0201E9C0:
	add r8, lr, #1
	mov r8, r8, lsl #0x10
	mov lr, r8, asr #0x10
	cmp lr, #0xa
	blt _0201E918
	add r1, r5, #1
	mov r1, r1, lsl #0x10
	mov r5, r1, asr #0x10
	cmp r5, #8
	blt _0201E8F0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Render3d64Texture0x7

	arm_func_start Render3d64WindowFrame
Render3d64WindowFrame: ; 0x0201E9EC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	mov sl, r0
	add r5, sp, #0xc
	mov r6, sl
	mov r4, #4
_0201EA04:
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0201EA04
	mov r0, #5
	strb r0, [sp, #0x48]
	ldrsh r1, [sl, #4]
	ldrsh r2, [sl, #6]
	cmp r1, #0x10
	addle r0, r1, r1, lsr #31
	movgt r3, #8
	movle r0, r0, lsl #0xf
	movle r3, r0, asr #0x10
	cmp r2, #0x10
	addle r0, r2, r2, lsr #31
	movgt r6, #8
	movle r0, r0, lsl #0xf
	movle r6, r0, asr #0x10
	ldrsh r0, [sl]
	str r0, [sp]
	ldrsh r8, [sl, #2]
	ldr r4, [sp]
	add r0, sp, #0xc
	add r4, r4, r3
	add r5, r8, r6
	mov r4, r4, lsl #0x10
	mov r7, r5, lsl #0x10
	mov r5, r4, asr #0x10
	mov r4, r7, asr #0x10
	ldr r7, [sp]
	add sb, r8, r2
	strh r7, [sp, #0xc]
	ldr r7, [sp]
	mov r2, sb, lsl #0x10
	add fp, r7, r1
	sub r1, fp, r3
	mov r3, r1, lsl #0x10
	sub r1, sb, r6
	mov r7, r1, lsl #0x10
	mov r1, fp, lsl #0x10
	mov r6, r3, asr #0x10
	strh r8, [sp, #0xe]
	strh r5, [sp, #0x10]
	strh r4, [sp, #0x12]
	ldrsh ip, [sl, #0x16]
	mov r1, r1, asr #0x10
	mov r3, #8
	strh ip, [sp, #0x22]
	ldrsh ip, [sl, #0x18]
	mov r7, r7, asr #0x10
	str r1, [sp, #8]
	strh ip, [sp, #0x24]
	strh r3, [sp, #0x26]
	strh r3, [sp, #0x28]
	mov r1, r2, asr #0x10
	str r1, [sp, #4]
	bl EnqueueRender3d64Tiling
	strh r5, [sp, #0xc]
	strh r8, [sp, #0xe]
	strh r6, [sp, #0x10]
	strh r4, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	mov r1, #8
	add r2, r2, #8
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	strh r6, [sp, #0xc]
	strh r8, [sp, #0xe]
	strh fp, [sp, #0x10]
	strh r4, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	mov r1, #8
	add r0, sp, #0xc
	add r2, r2, #0x10
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	ldr r0, [sp]
	strh r4, [sp, #0xe]
	strh r5, [sp, #0x10]
	strh r7, [sp, #0x12]
	strh r0, [sp, #0xc]
	ldrsh r0, [sl, #0x16]
	strh r0, [sp, #0x22]
	ldrsh r0, [sl, #0x18]
	add r0, r0, #8
	strh r0, [sp, #0x24]
	mov r1, #8
	add r0, sp, #0xc
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	strh r6, [sp, #0xc]
	strh r4, [sp, #0xe]
	ldr r0, [sp, #8]
	mov r1, #8
	strh r0, [sp, #0x10]
	strh r7, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	add r2, r2, #0x10
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	add r2, r2, #8
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	ldr r0, [sp]
	mov r1, #8
	strh r0, [sp, #0xc]
	strh r7, [sp, #0xe]
	strh r5, [sp, #0x10]
	strh sb, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	add r2, r2, #0x10
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	strh r5, [sp, #0xc]
	strh r7, [sp, #0xe]
	strh r6, [sp, #0x10]
	ldr r0, [sp, #4]
	mov r1, #8
	strh r0, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	add r2, r2, #8
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	add r2, r2, #0x10
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	strh r6, [sp, #0xc]
	strh r7, [sp, #0xe]
	ldr r0, [sp, #8]
	mov r1, #8
	strh r0, [sp, #0x10]
	ldr r0, [sp, #4]
	strh r0, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	add r2, r2, #0x10
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	add r2, r2, #0x10
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Render3d64WindowFrame

	arm_func_start EnqueueRender3d64Tiling
EnqueueRender3d64Tiling: ; 0x0201EC9C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl NewRender3dTiling
	ldrsh r2, [r4]
	mov r1, #0
	strh r2, [r0, #0x16]
	ldrsh r2, [r4, #2]
	strh r2, [r0, #0x18]
	ldrsh r2, [r4, #4]
	strh r2, [r0, #0x1a]
	ldrsh r2, [r4, #2]
	strh r2, [r0, #0x1c]
	ldrsh r2, [r4]
	strh r2, [r0, #0x1e]
	ldrsh r2, [r4, #6]
	strh r2, [r0, #0x20]
	ldrsh r2, [r4, #4]
	strh r2, [r0, #0x22]
	ldrsh r2, [r4, #6]
	strh r2, [r0, #0x24]
_0201ECEC:
	ldrb r3, [r4, #0x2e]
	ldrb r2, [r4, #0x2d]
	ldrb lr, [r4, #0x2c]
	and ip, r3, #0xf8
	and r3, r2, #0xf8
	mov r2, ip, lsl #0x17
	mov ip, r3, lsl #2
	add r3, r0, r1, lsl #1
	add r1, r1, #1
	and lr, lr, #0xf8
	orr r2, ip, r2, lsr #16
	orr r2, r2, lr, asr #3
	strh r2, [r3, #0x26]
	cmp r1, #4
	blt _0201ECEC
	ldrb r1, [r4, #0x2f]
	add r3, r4, #0x16
	add r2, r0, #0xc
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x31]
	ldrh ip, [r4, #0x28]
	mov r1, #4
	strh ip, [r0, #0x2e]
	ldr ip, [r4, #0x20]
	str ip, [r0, #4]
	ldr ip, [r4, #0x24]
	str ip, [r0, #8]
	ldrb ip, [r4, #0x3e]
	strb ip, [r0, #0x30]
	ldrh ip, [r4, #0x2a]
	strh ip, [r0, #2]
	ldrh r4, [r4, #0x14]
	strh r4, [r0, #0x14]
_0201ED74:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0201ED74
	ldmia sp!, {r4, pc}
	arm_func_end EnqueueRender3d64Tiling

	arm_func_start Render3d64Tiling
Render3d64Tiling: ; 0x0201ED88
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl NewRender3dTiling
	mov r1, #0
_0201ED98:
	mov r2, r1, lsl #2
	ldrsh r2, [r4, r2]
	add ip, r0, r1, lsl #2
	add r5, r4, r1, lsl #2
	strh r2, [ip, #0x16]
	ldrsh r2, [r5, #2]
	add r3, r0, r1, lsl #1
	add r1, r1, #1
	strh r2, [ip, #0x18]
	ldrb ip, [r5, #0x2e]
	ldrb r2, [r5, #0x2d]
	ldrb r5, [r5, #0x2c]
	and lr, ip, #0xf8
	and ip, r2, #0xf8
	mov r2, lr, lsl #0x17
	mov ip, ip, lsl #2
	and r5, r5, #0xf8
	orr r2, ip, r2, lsr #16
	orr r2, r2, r5, asr #3
	strh r2, [r3, #0x26]
	cmp r1, #4
	blt _0201ED98
	ldrb r1, [r4, #0x2f]
	add r3, r4, #0x16
	add r2, r0, #0xc
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x31]
	ldrh ip, [r4, #0x28]
	mov r1, #4
	strh ip, [r0, #0x2e]
	ldr ip, [r4, #0x20]
	str ip, [r0, #4]
	ldr ip, [r4, #0x24]
	str ip, [r0, #8]
	ldrb ip, [r4, #0x3e]
	strb ip, [r0, #0x30]
	ldrh ip, [r4, #0x2a]
	strh ip, [r0, #2]
	ldrh r4, [r4, #0x14]
	strh r4, [r0, #0x14]
_0201EE3C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0201EE3C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Render3d64Tiling

	arm_func_start Render3d64Quadrilateral
Render3d64Quadrilateral: ; 0x0201EE50
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl NewRender3dQuadrilateral
	mov r1, #0
_0201EE60:
	mov r2, r1, lsl #2
	ldrsh r2, [r4, r2]
	add ip, r0, r1, lsl #2
	add r5, r4, r1, lsl #2
	strh r2, [ip, #4]
	ldrsh r2, [r5, #2]
	add r3, r0, r1, lsl #1
	add r1, r1, #1
	strh r2, [ip, #6]
	ldrb ip, [r5, #0x2e]
	ldrb r2, [r5, #0x2d]
	ldrb r5, [r5, #0x2c]
	and lr, ip, #0xf8
	and ip, r2, #0xf8
	mov r2, lr, lsl #0x17
	mov ip, ip, lsl #2
	and r5, r5, #0xf8
	orr r2, ip, r2, lsr #16
	orr r2, r2, r5, asr #3
	strh r2, [r3, #0x1a]
	cmp r1, #4
	blt _0201EE60
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x23]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x22]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	ldrb r1, [r4, #0x3d]
	tst r1, #2
	movne r1, #1
	moveq r1, #0
	strb r1, [r0, #0x24]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Render3d64Quadrilateral

	arm_func_start Render3d64RectangleMulticolor
Render3d64RectangleMulticolor: ; 0x0201EEF0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl NewRender3dRectangle
	ldrh r1, [r4]
	strh r1, [r0, #4]
	ldrh r1, [r4, #2]
	strh r1, [r0, #6]
	ldrh r1, [r4, #4]
	strh r1, [r0, #8]
	ldrh r1, [r4, #6]
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #8]
	strh r1, [r0, #0xc]
	ldrh r1, [r4, #0xa]
	strh r1, [r0, #0xe]
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x23]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x14]
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0x16]
	ldrh r1, [r4, #0x28]
	strh r1, [r0, #0x18]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x22]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	ldrb r1, [r4, #0x3d]
	tst r1, #2
	movne r1, #1
	moveq r1, #0
	strb r1, [r0, #0x24]
	tst r1, #0xff
	ldrb r2, [r4, #0x2e]
	ldrb r1, [r4, #0x2d]
	beq _0201F034
	ldrb ip, [r4, #0x2c]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x1a]
	ldrb r2, [r4, #0x32]
	ldrb r1, [r4, #0x31]
	ldrb ip, [r4, #0x30]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x1c]
	ldrb r2, [r4, #0x36]
	ldrb r1, [r4, #0x35]
	ldrb ip, [r4, #0x34]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x1e]
	ldrb r2, [r4, #0x3a]
	ldrb r1, [r4, #0x39]
	ldrb r4, [r4, #0x38]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, r4, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x20]
	ldmia sp!, {r4, pc}
_0201F034:
	ldrb r4, [r4, #0x2c]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, r4, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x1a]
	ldmia sp!, {r4, pc}
	arm_func_end Render3d64RectangleMulticolor

	arm_func_start Render3d64Rectangle
Render3d64Rectangle: ; 0x0201F05C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl NewRender3dRectangle
	ldrh r1, [r4]
	mov r2, #0
	strh r1, [r0, #4]
	ldrh r1, [r4, #2]
	strh r1, [r0, #6]
	ldrh r1, [r4, #4]
	strh r1, [r0, #8]
	ldrh r1, [r4, #6]
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #8]
	strh r1, [r0, #0xc]
	ldrh r1, [r4, #0xa]
	strh r1, [r0, #0xe]
	ldrb r3, [r4, #0x2e]
	ldrb r1, [r4, #0x2d]
	ldrb lr, [r4, #0x2c]
	and ip, r3, #0xf8
	and r3, r1, #0xf8
	mov r1, ip, lsl #0x17
	mov r3, r3, lsl #2
	and ip, lr, #0xf8
	orr r1, r3, r1, lsr #16
	orr r1, r1, ip, asr #3
	strh r1, [r0, #0x1a]
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x23]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x14]
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0x16]
	ldrh r1, [r4, #0x28]
	strh r1, [r0, #0x18]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x22]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	strb r2, [r0, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end Render3d64Rectangle

	arm_func_start Render3d64Nothing
Render3d64Nothing: ; 0x0201F108
	bx lr
	arm_func_end Render3d64Nothing

	arm_func_start Render3d64Texture
Render3d64Texture: ; 0x0201F10C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl NewRender3dTexture
	ldrsh r1, [r4]
	add ip, r4, #0x16
	add r3, r0, #0xc
	strh r1, [r0, #0x16]
	ldrsh r1, [r4, #2]
	mov r2, #4
	strh r1, [r0, #0x18]
	ldrsh r1, [r4, #8]
	strh r1, [r0, #0x1a]
	ldrsh r1, [r4, #0xa]
	strh r1, [r0, #0x1c]
_0201F144:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _0201F144
	ldrb r2, [r4, #0x2e]
	ldrb r1, [r4, #0x2d]
	ldrb ip, [r4, #0x2c]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x22]
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x27]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x1e]
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0x20]
	ldrh r1, [r4, #0x28]
	strh r1, [r0, #0x24]
	ldr r1, [r4, #0x20]
	str r1, [r0, #4]
	ldr r1, [r4, #0x24]
	str r1, [r0, #8]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x26]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	ldrh r1, [r4, #0x14]
	strh r1, [r0, #0x14]
	ldmia sp!, {r4, pc}
	arm_func_end Render3d64Texture

	arm_func_start Render3dElement64
Render3dElement64: ; 0x0201F1D4
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x3d]
	tst r1, #2
	ldmneia sp!, {r3, pc}
	ldrb r1, [r0, #0x2f]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldrb r2, [r0, #0x3c]
	ldr r1, _0201F204 ; =RENDER_3D_FUNCTIONS_64
	ldr r1, [r1, r2, lsl #2]
	blx r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201F204: .word RENDER_3D_FUNCTIONS_64
	arm_func_end Render3dElement64

	arm_func_start sub_0201F208
sub_0201F208: ; 0x0201F208
	stmdb sp!, {r3, lr}
	ldr r0, _0201F240 ; =0x00001544
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201F244 ; =_020AFCE4
	ldr r1, _0201F240 ; =0x00001544
	str r0, [r2]
	bl MemZero
	ldr r0, _0201F244 ; =_020AFCE4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1500
	strh r1, [r0, #0x40]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201F240: .word 0x00001544
_0201F244: .word _020AFCE4
	arm_func_end sub_0201F208

	arm_func_start sub_0201F248
sub_0201F248: ; 0x0201F248
	ldr r1, _0201F29C ; =_020AFCE4
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x1000
	strb r2, [r0, #0x542]
	ldr r3, [r1]
	mov r1, #0x44
	b _0201F284
_0201F268:
	smlabb r0, r2, r1, r3
	ldrb r0, [r0, #0x40]
	cmp r0, #0
	bxeq lr
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
_0201F284:
	cmp r2, #0x50
	blt _0201F268
	add r0, r3, #0x1000
	mov r1, #1
	strb r1, [r0, #0x542]
	bx lr
	.align 2, 0
_0201F29C: .word _020AFCE4
	arm_func_end sub_0201F248

	arm_func_start sub_0201F2A0
sub_0201F2A0: ; 0x0201F2A0
	ldr ip, _0201F2A8 ; =Render3dElement64
	bx ip
	.align 2, 0
_0201F2A8: .word Render3dElement64
	arm_func_end sub_0201F2A0

	arm_func_start sub_0201F2AC
sub_0201F2AC: ; 0x0201F2AC
	stmdb sp!, {r4, lr}
	ldr r2, _0201F2E0 ; =_020AFCE4
	mov r1, #0x44
	smulbb r4, r0, r1
	ldr r0, [r2]
	add r0, r0, r4
	bl InitRender3dElement64
	ldr r0, _0201F2E0 ; =_020AFCE4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, r4
	strb r1, [r0, #0x40]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201F2E0: .word _020AFCE4
	arm_func_end sub_0201F2AC

	arm_func_start sub_0201F2E4
sub_0201F2E4: ; 0x0201F2E4
	stmdb sp!, {r4, lr}
	mov r4, #0
_0201F2EC:
	mov r0, r4
	bl sub_0201F2AC
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x50
	blt _0201F2EC
	ldr r0, _0201F320 ; =_020AFCE4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1500
	strh r1, [r0, #0x40]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201F320: .word _020AFCE4
	arm_func_end sub_0201F2E4

	arm_func_start sub_0201F324
sub_0201F324: ; 0x0201F324
	ldr r2, _0201F344 ; =_020AFCE4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r1, [r0, #0x40]
	cmp r1, #0
	moveq r0, #0
	bx lr
	.align 2, 0
_0201F344: .word _020AFCE4
	arm_func_end sub_0201F324

	arm_func_start sub_0201F348
sub_0201F348: ; 0x0201F348
	ldr r3, _0201F368 ; =_020AFCE4
	mov r2, #0x44
	ldr r3, [r3]
	smlabb r2, r0, r2, r3
	ldrb r0, [r2, #0x40]
	cmp r0, #0
	strneb r1, [r2, #0x41]
	bx lr
	.align 2, 0
_0201F368: .word _020AFCE4
	arm_func_end sub_0201F348

	arm_func_start sub_0201F36C
sub_0201F36C: ; 0x0201F36C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0201F460 ; =_020AFCE4
	mov ip, #0
	ldr lr, [r0]
	mov r5, ip
	add r0, lr, #0x1500
	ldrsh r4, [r0, #0x40]
	mov r2, #0x44
	b _0201F3F8
_0201F390:
	cmp r4, #0x50
	movge r4, r5
	smlabb r3, r4, r2, lr
	ldrb r0, [r3, #0x40]
	cmp r0, #0
	bne _0201F3E0
	ldr r1, _0201F460 ; =_020AFCE4
	mov r0, #1
	strb r0, [r3, #0x40]
	ldr r0, [r1]
	add r2, r4, #1
	add r0, r0, #0x1500
	strh r2, [r0, #0x40]
	ldr r0, [r1]
	add r0, r0, #0x1500
	ldrsh r1, [r0, #0x40]
	cmp r1, #0x50
	movge r1, #0
	strgeh r1, [r0, #0x40]
	b _0201F410
_0201F3E0:
	add r0, ip, #1
	add r1, r4, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov ip, r0, asr #0x10
	mov r4, r1, asr #0x10
_0201F3F8:
	cmp ip, #0x50
	blt _0201F390
	mov r1, #1
	add r0, lr, #0x1000
	strb r1, [r0, #0x542]
	sub r4, r1, #2
_0201F410:
	mvn r0, #0
	cmp r4, r0
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0201F460 ; =_020AFCE4
	mov r0, #0x44
	smulbb r5, r4, r0
	ldr r0, [r1]
	add r0, r0, r5
	bl InitRender3dElement64
	ldr r1, _0201F460 ; =_020AFCE4
	mov r3, #1
	ldr r2, [r1]
	mov r0, r4
	add r2, r2, r5
	strb r3, [r2, #0x40]
	ldr r1, [r1]
	add r1, r1, r5
	strb r3, [r1, #0x41]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201F460: .word _020AFCE4
	arm_func_end sub_0201F36C

	arm_func_start sub_0201F464
sub_0201F464: ; 0x0201F464
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0201F4B0 ; =_020AFCE4
	mov r4, #0
	ldr r5, [r0]
_0201F474:
	ldrb r0, [r5, #0x40]
	cmp r0, #0
	ldrneb r0, [r5, #0x41]
	cmpne r0, #0
	beq _0201F490
	mov r0, r5
	bl Render3dElement64
_0201F490:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x50
	add r5, r5, #0x44
	blt _0201F474
	bl sub_0201F248
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201F4B0: .word _020AFCE4
	arm_func_end sub_0201F464

	arm_func_start HandleSir0Translation
HandleSir0Translation: ; 0x0201F4B4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrb r2, [r4]
	mov r5, r0
	mov r0, #0
	cmp r2, #0x53
	ldreqb r1, [r4, #1]
	cmpeq r1, #0x49
	ldreqb r1, [r4, #2]
	cmpeq r1, #0x52
	ldreqb r1, [r4, #3]
	cmpeq r1, #0x30
	bne _0201F500
	mov r1, #0x4f
	mov r0, r4
	strb r1, [r4, #3]
	bl ConvertPointersSir0
	mov r0, #1
	b _0201F520
_0201F500:
	cmp r2, #0x53
	ldreqb r1, [r4, #1]
	cmpeq r1, #0x49
	ldreqb r1, [r4, #2]
	cmpeq r1, #0x52
	ldreqb r1, [r4, #3]
	cmpeq r1, #0x4f
	moveq r0, #2
_0201F520:
	cmp r0, #0
	ldrne r1, [r4, #4]
	strne r1, [r5]
	streq r4, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end HandleSir0Translation

	arm_func_start ConvertPointersSir0
ConvertPointersSir0: ; 0x0201F534
	stmdb sp!, {r4, r5}
	ldr r1, [r0, #8]
	mov r3, r0
	add r1, r1, r0
_0201F544:
	mov r2, #0
_0201F548:
	ldrb r4, [r1]
	add r1, r1, #1
	mov r2, r2, lsl #7
	and r5, r4, #0x7f
	orr r2, r2, r5
	and r5, r4, #0x80
	cmp r5, #0
	bne _0201F548
	cmp r2, #0
	beq _0201F584
	add r3, r3, r2
	ldr r2, [r3]
	add r2, r2, r0
	str r2, [r3]
	b _0201F544
_0201F584:
	ldmia sp!, {r4, r5}
	bx lr
	arm_func_end ConvertPointersSir0

	arm_func_start HandleSir0TranslationVeneer
HandleSir0TranslationVeneer: ; 0x0201F58C
	ldr ip, _0201F594 ; =HandleSir0Translation
	bx ip
	.align 2, 0
_0201F594: .word HandleSir0Translation
	arm_func_end HandleSir0TranslationVeneer

	arm_func_start sub_0201F598
sub_0201F598: ; 0x0201F598
	str r1, [r0]
	strh r2, [r0, #4]
	ldrsh r1, [sp]
	strh r3, [r0, #6]
	ldrb r2, [sp, #4]
	strh r1, [r0, #8]
	mov r1, #0
	strb r2, [r0, #0xa]
	strb r1, [r0, #0xb]
	bx lr
	arm_func_end sub_0201F598

	arm_func_start DecompressAtNormalVeneer
DecompressAtNormalVeneer: ; 0x0201F5C0
	ldr ip, _0201F5C8 ; =DecompressAtNormal
	bx ip
	.align 2, 0
_0201F5C8: .word DecompressAtNormal
	arm_func_end DecompressAtNormalVeneer

	arm_func_start DecompressAtNormal
DecompressAtNormal: ; 0x0201F5CC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	ldrb r5, [r2]
	mov ip, #0
	ldrb r4, [r2, #5]
	cmp r5, #0x50
	ldreqb r6, [r2, #1]
	ldrb r3, [r2, #6]
	mov lr, ip
	cmpeq r6, #0x4b
	ldreqb r6, [r2, #2]
	add r3, r4, r3, lsl #8
	mov r4, #8
	cmpeq r6, #0x44
	ldreqb r6, [r2, #3]
	cmpeq r6, #0x50
	bne _0201F644
	ldrb r7, [r2, #0x10]
	ldrb r6, [r2, #0x11]
	ldrb r8, [r2, #0x12]
	ldrb r5, [r2, #0x13]
	add r6, r7, r6, lsl #8
	add r6, r6, r8, lsl #16
	add r5, r6, r5, lsl #24
	cmp r1, #0
	cmpne r1, r5
	movne r0, ip
	bne _0201FA08
	mov r5, #0x14
	b _0201F6B4
_0201F644:
	cmp r5, #0x41
	ldreqb r6, [r2, #1]
	cmpeq r6, #0x54
	ldreqb r6, [r2, #2]
	cmpeq r6, #0x34
	ldreqb r6, [r2, #3]
	cmpeq r6, #0x50
	bne _0201F688
	ldrb r6, [r2, #0x10]
	ldrb r5, [r2, #0x11]
	cmp r1, #0
	add r5, r6, r5, lsl #8
	cmpne r1, r5
	movne r0, #0
	bne _0201FA08
	mov r5, #0x12
	b _0201F6B4
_0201F688:
	cmp r5, #0x41
	ldreqb r5, [r2, #1]
	cmpeq r5, #0x54
	ldreqb r5, [r2, #2]
	cmpeq r5, #0x33
	ldreqb r5, [r2, #3]
	cmpeq r5, #0x50
	moveq r5, #0x10
	beq _0201F6B4
	mov r0, #0
	b _0201FA08
_0201F6B4:
	ldrb r6, [r2, #4]
	cmp r6, #0x4e
	bne _0201F6E8
	mov r4, #0
	b _0201F6D8
_0201F6C8:
	add r1, r2, r4
	ldrb r1, [r1, #7]
	strb r1, [r0, r4]
	add r4, r4, #1
_0201F6D8:
	cmp r4, r3
	blt _0201F6C8
	mov r0, r4
	b _0201FA08
_0201F6E8:
	ldrb r6, [r2, #7]
	ldrb sb, [r2, #8]
	ldrb r8, [r2, #9]
	add r6, r6, #3
	str r6, [sp, #0x18]
	add r6, sb, #3
	str r6, [sp, #0x14]
	add r6, r8, #3
	ldrb r7, [r2, #0xa]
	str r6, [sp, #0x10]
	ldrb sl, [r2, #0xb]
	add r6, r7, #3
	str r6, [sp, #0xc]
	add r6, sl, #3
	ldrb r7, [r2, #0xf]
	ldrb fp, [r2, #0xc]
	str r6, [sp, #8]
	ldrb r8, [r2, #0xe]
	add r6, fp, #3
	str r6, [sp, #4]
	ldrb r6, [r2, #0xd]
	add fp, r8, #3
	add sl, r7, #3
	add r6, r6, #3
	str r6, [sp]
	b _0201F9FC
_0201F750:
	cmp r1, #0
	beq _0201F764
	cmp ip, r1
	movge r0, #0
	bge _0201FA08
_0201F764:
	cmp r4, #8
	ldreqb lr, [r2, r5]
	addeq r5, r5, #1
	moveq r4, #0
	tst lr, #0x80
	bne _0201F9E4
	ldrb r8, [r2, r5]
	ldr sb, [sp, #0x18]
	add r7, r2, r5
	and r6, r8, #0xf0
	mov r6, r6, asr #4
	add r6, r6, #3
	cmp r6, sb
	ldr sb, [sp, #0x14]
	moveq r6, #0x1f
	cmp r6, sb
	ldr sb, [sp, #0x10]
	moveq r6, #0x1e
	cmp r6, sb
	ldr sb, [sp, #0xc]
	moveq r6, #0x1d
	cmp r6, sb
	ldr sb, [sp, #8]
	moveq r6, #0x1c
	cmp r6, sb
	ldr sb, [sp, #4]
	moveq r6, #0x1b
	cmp r6, sb
	ldr sb, [sp]
	moveq r6, #0x1a
	cmp r6, sb
	moveq r6, #0x19
	cmp r6, fp
	moveq r6, #0x18
	cmp r6, sl
	moveq r6, #0x17
	sub sb, r6, #0x17
	and r8, r8, #0xf
	cmp sb, #8
	addls pc, pc, sb, lsl #2
	b _0201F9A8
_0201F808: ; jump table
	b _0201F97C ; case 0
	b _0201F950 ; case 1
	b _0201F924 ; case 2
	b _0201F8FC ; case 3
	b _0201F8D0 ; case 4
	b _0201F8A4 ; case 5
	b _0201F878 ; case 6
	b _0201F850 ; case 7
	b _0201F82C ; case 8
_0201F82C:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	and r6, r8, #0xf
	orr r6, r6, r6, lsl #4
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F850:
	add r5, r5, #1
	add r6, r8, #1
	and r6, r6, #0xf
	orr r7, r6, r8, lsl #4
	orr r6, r6, r6, lsl #4
	strb r7, [r0, ip]
	add r7, r0, ip
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F878:
	add r5, r5, #1
	add r6, r0, ip
	sub r7, r8, #1
	and r7, r7, #0xf
	orr r7, r7, r8, lsl #4
	strb r7, [r0, ip]
	and r7, r8, #0xf
	orr r7, r7, r7, lsl #4
	strb r7, [r6, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F8A4:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	sub r6, r8, #1
	mov r6, r6, lsl #0x1c
	and r8, r8, #0xf
	orr r6, r8, r6, lsr #24
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F8D0:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	mov r6, r8, lsl #0x1c
	sub r8, r8, #1
	and r8, r8, #0xf
	orr r6, r8, r6, lsr #24
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F8FC:
	add r5, r5, #1
	sub r6, r8, #1
	and r6, r6, #0xf
	orr r7, r6, r8, lsl #4
	orr r6, r6, r6, lsl #4
	strb r7, [r0, ip]
	add r7, r0, ip
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F924:
	add r5, r5, #1
	add r6, r0, ip
	add r7, r8, #1
	and r7, r7, #0xf
	orr r7, r7, r8, lsl #4
	strb r7, [r0, ip]
	and r7, r8, #0xf
	orr r7, r7, r7, lsl #4
	strb r7, [r6, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F950:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	add r6, r8, #1
	mov r6, r6, lsl #0x1c
	and r8, r8, #0xf
	orr r6, r8, r6, lsr #24
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F97C:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	mov r6, r8, lsl #0x1c
	add r8, r8, #1
	and r8, r8, #0xf
	orr r6, r8, r6, lsr #24
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F9A8:
	ldrb sb, [r7, #1]
	sub r7, ip, #0x1000
	add r5, r5, #2
	add r8, sb, r8, lsl #8
	add sb, r8, r7
	mov r8, #0
	b _0201F9D8
_0201F9C4:
	ldrb r7, [r0, sb]
	add sb, sb, #1
	add r8, r8, #1
	strb r7, [r0, ip]
	add ip, ip, #1
_0201F9D8:
	cmp r8, r6
	blt _0201F9C4
	b _0201F9F4
_0201F9E4:
	ldrb r6, [r2, r5]
	add r5, r5, #1
	strb r6, [r0, ip]
	add ip, ip, #1
_0201F9F4:
	add r4, r4, #1
	mov lr, lr, lsl #1
_0201F9FC:
	cmp r5, r3
	blt _0201F750
	mov r0, ip
_0201FA08:
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end DecompressAtNormal

	arm_func_start DecompressAtHalf
DecompressAtHalf: ; 0x0201FA10
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	ldrb r4, [r2]
	ldrb r6, [r2, #5]
	ldrb r5, [r2, #6]
	cmp r4, #0x50
	mov ip, #0
	add sl, r6, r5, lsl #8
	ldreqb r5, [r2, #1]
	str ip, [sp, #0x30]
	mov lr, #8
	cmpeq r5, #0x4b
	ldreqb r5, [r2, #2]
	cmpeq r5, #0x44
	ldreqb r5, [r2, #3]
	cmpeq r5, #0x50
	bne _0201FA88
	ldrb r6, [r2, #0x10]
	ldrb r5, [r2, #0x11]
	ldrb r7, [r2, #0x12]
	ldrb r4, [r2, #0x13]
	add r5, r6, r5, lsl #8
	add r5, r5, r7, lsl #16
	add r4, r5, r4, lsl #24
	cmp r1, #0
	cmpne r1, r4
	movne r0, ip
	bne _0201FF44
	mov r8, #0x14
	b _0201FB18
_0201FA88:
	cmp r4, #0x41
	ldreqb r5, [r2, #1]
	cmpeq r5, #0x54
	ldreqb r5, [r2, #2]
	cmpeq r5, #0x34
	ldreqb r5, [r2, #3]
	cmpeq r5, #0x50
	bne _0201FAEC
	ldrb r4, [r2, #4]
	ldrb r6, [r2, #0x10]
	ldrb r5, [r2, #0x11]
	cmp r4, #0x4e
	add r4, r6, r5, lsl #8
	bne _0201FAD4
	cmp r1, #0
	cmpne r1, sl
	beq _0201FB18
	mov r0, #0
	b _0201FF44
_0201FAD4:
	cmp r1, #0
	cmpne r1, r4
	movne r0, #0
	bne _0201FF44
	mov r8, #0x12
	b _0201FB18
_0201FAEC:
	cmp r4, #0x41
	ldreqb r4, [r2, #1]
	cmpeq r4, #0x54
	ldreqb r4, [r2, #2]
	cmpeq r4, #0x33
	ldreqb r4, [r2, #3]
	cmpeq r4, #0x50
	moveq r8, #0x10
	beq _0201FB18
	mov r0, #0
	b _0201FF44
_0201FB18:
	ldrb r4, [r2, #4]
	cmp r4, #0x4e
	bne _0201FB78
	mov r5, #0
	b _0201FB68
_0201FB2C:
	add r6, r2, r5
	ldrb r4, [r6, #7]
	add r1, r0, r5, lsl #1
	ands r4, r4, #0xf
	strb r4, [r0, r5, lsl #1]
	orrne r4, r4, r3
	strneb r4, [r1]
	ldrb r4, [r6, #7]
	add r5, r5, #1
	and r4, r4, #0xf0
	mov r4, r4, asr #4
	strb r4, [r1, #1]
	ands r4, r4, #0xff
	orrne r4, r4, r3
	strneb r4, [r1, #1]
_0201FB68:
	cmp r5, sl
	blt _0201FB2C
	mov r0, r5
	b _0201FF44
_0201FB78:
	ldrb r4, [r2, #7]
	ldrb r7, [r2, #8]
	ldrb r6, [r2, #9]
	add r4, r4, #3
	str r4, [sp, #0x24]
	add r4, r7, #3
	str r4, [sp, #0x20]
	add r4, r6, #3
	ldrb r5, [r2, #0xa]
	str r4, [sp, #0x1c]
	ldrb sb, [r2, #0xb]
	add r4, r5, #3
	str r4, [sp, #0x18]
	add r4, sb, #3
	str r4, [sp, #0x14]
	ldrb r4, [r2, #0xc]
	ldrb r6, [r2, #0xd]
	ldrb r5, [r2, #0xe]
	add r4, r4, #3
	str r4, [sp, #0x10]
	add r4, r6, #3
	str r4, [sp, #0xc]
	add r4, r5, #3
	str r4, [sp, #8]
	ldrb r4, [r2, #0xf]
	mov r1, r1, lsl #1
	add r4, r4, #3
	str r4, [sp, #4]
	b _0201FF38
_0201FBEC:
	cmp r1, #0
	beq _0201FC00
	cmp ip, r1
	movge r0, #0
	bge _0201FF44
_0201FC00:
	cmp lr, #8
	ldreqb r4, [r2, r8]
	addeq r8, r8, #1
	moveq lr, #0
	streq r4, [sp, #0x30]
	ldr r4, [sp, #0x30]
	tst r4, #0x80
	bne _0201FEEC
	add r4, r2, r8
	str r4, [sp]
	ldrb r4, [r2, r8]
	ldr sb, [sp, #0x24]
	str r4, [sp, #0x28]
	ldr r5, [sp, #0x28]
	ldr r6, [sp, #0x28]
	ldr r7, [sp, #0x28]
	and r4, r4, #0xf0
	mov r4, r4, asr #4
	ands fp, r5, #0xf
	add r6, r6, #1
	sub r7, r7, #1
	mov r5, fp
	add r4, r4, #3
	and r6, r6, #0xf
	orrne r5, fp, r3
	cmp r6, #0
	and r7, r7, #0xf
	orrne r6, r6, r3
	cmp r7, #0
	orrne r7, r7, r3
	cmp r4, sb
	ldr sb, [sp, #0x20]
	moveq r4, #0x1f
	cmp r4, sb
	ldr sb, [sp, #0x1c]
	moveq r4, #0x1e
	cmp r4, sb
	ldr sb, [sp, #0x18]
	moveq r4, #0x1d
	cmp r4, sb
	ldr sb, [sp, #0x14]
	moveq r4, #0x1c
	cmp r4, sb
	ldr sb, [sp, #0x10]
	moveq r4, #0x1b
	cmp r4, sb
	ldr sb, [sp, #0xc]
	moveq r4, #0x1a
	cmp r4, sb
	ldr sb, [sp, #8]
	moveq r4, #0x19
	cmp r4, sb
	ldr sb, [sp, #4]
	moveq r4, #0x18
	cmp r4, sb
	moveq r4, #0x17
	sub sb, r4, #0x17
	str sb, [sp, #0x2c]
	cmp sb, #8
	addls pc, pc, sb, lsl #2
	b _0201FEAC
_0201FCF4: ; jump table
	b _0201FE80 ; case 0
	b _0201FE54 ; case 1
	b _0201FE28 ; case 2
	b _0201FDFC ; case 3
	b _0201FDC8 ; case 4
	b _0201FD9C ; case 5
	b _0201FD70 ; case 6
	b _0201FD44 ; case 7
	b _0201FD18 ; case 8
_0201FD18:
	and r5, r5, #0xff
	strb r5, [r0, ip]
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r5, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FD44:
	and r4, r6, #0xff
	strb r4, [r0, ip]
	add r8, r8, #1
	add r6, ip, #1
	strb r5, [r0, r6]
	add r5, ip, #2
	strb r4, [r0, r5]
	add r5, ip, #3
	strb r4, [r0, r5]
	add ip, ip, #4
	b _0201FF28
_0201FD70:
	strb r7, [r0, ip]
	and r5, r5, #0xff
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r5, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FD9C:
	and r5, r5, #0xff
	strb r5, [r0, ip]
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r7, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FDC8:
	orr r5, fp, r3
	add r8, r8, #1
	and r4, r5, #0xff
	sub r6, r5, #1
	strb r4, [r0, ip]
	add r5, ip, #1
	strb r4, [r0, r5]
	add r5, ip, #2
	strb r6, [r0, r5]
	add r5, ip, #3
	strb r4, [r0, r5]
	add ip, ip, #4
	b _0201FF28
_0201FDFC:
	and r4, r7, #0xff
	strb r4, [r0, ip]
	add r8, r8, #1
	add r6, ip, #1
	strb r5, [r0, r6]
	add r5, ip, #2
	strb r4, [r0, r5]
	add r5, ip, #3
	strb r4, [r0, r5]
	add ip, ip, #4
	b _0201FF28
_0201FE28:
	strb r6, [r0, ip]
	and r5, r5, #0xff
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r5, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FE54:
	and r5, r5, #0xff
	strb r5, [r0, ip]
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r6, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FE80:
	and r4, r5, #0xff
	strb r4, [r0, ip]
	add r8, r8, #1
	add r5, ip, #1
	strb r4, [r0, r5]
	add r5, ip, #2
	strb r6, [r0, r5]
	add r5, ip, #3
	strb r4, [r0, r5]
	add ip, ip, #4
	b _0201FF28
_0201FEAC:
	ldr r5, [sp]
	add r8, r8, #2
	ldrb r6, [r5, #1]
	sub r5, ip, #0x2000
	add r6, r6, fp, lsl #8
	add r7, r5, r6, lsl #1
	mov r6, #0
	b _0201FEE0
_0201FECC:
	ldrb r5, [r0, r7]
	add r7, r7, #1
	add r6, r6, #1
	strb r5, [r0, ip]
	add ip, ip, #1
_0201FEE0:
	cmp r6, r4, lsl #1
	blt _0201FECC
	b _0201FF28
_0201FEEC:
	ldrb r5, [r2, r8]
	add r4, r0, ip
	ands r5, r5, #0xf
	strb r5, [r0, ip]
	orrne r5, r5, r3
	strneb r5, [r4]
	ldrb r5, [r2, r8]
	add ip, ip, #2
	add r8, r8, #1
	and r5, r5, #0xf0
	mov r5, r5, asr #4
	strb r5, [r4, #1]
	ands r5, r5, #0xff
	orrne r5, r5, r3
	strneb r5, [r4, #1]
_0201FF28:
	ldr r4, [sp, #0x30]
	add lr, lr, #1
	mov r4, r4, lsl #1
	str r4, [sp, #0x30]
_0201FF38:
	cmp r8, sl
	blt _0201FBEC
	mov r0, ip
_0201FF44:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end DecompressAtHalf

	arm_func_start DecompressAtFromMemoryPointerVeneer
DecompressAtFromMemoryPointerVeneer: ; 0x0201FF4C
	ldr ip, _0201FF54 ; =DecompressAtFromMemoryPointer
	bx ip
	.align 2, 0
_0201FF54: .word DecompressAtFromMemoryPointer
	arm_func_end DecompressAtFromMemoryPointerVeneer

	arm_func_start DecompressAtFromMemoryPointer
DecompressAtFromMemoryPointer: ; 0x0201FF58
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov r5, r2
	ldrb r4, [r5, #5]
	ldrb r3, [r5, #6]
	ldr r2, _0202046C ; =_022A5038
	mov r7, #0
	str r0, [r2]
	str r0, [r2, #0xc]
	str r7, [r2, #4]
	str r7, [r2, #8]
	ldrb r0, [r5]
	mov r6, r1
	add r1, r4, r3, lsl #8
	cmp r0, #0x50
	str r1, [sp, #0x28]
	ldreqb r1, [r5, #1]
	str r7, [sp, #0x24]
	mov sl, #8
	cmpeq r1, #0x4b
	ldreqb r1, [r5, #2]
	cmpeq r1, #0x44
	ldreqb r1, [r5, #3]
	cmpeq r1, #0x50
	bne _0201FFF0
	ldrb r1, [r5, #0x10]
	ldrb r0, [r5, #0x11]
	ldrb r2, [r5, #0x12]
	ldrb r3, [r5, #0x13]
	add r0, r1, r0, lsl #8
	add r0, r0, r2, lsl #16
	add r0, r0, r3, lsl #24
	cmp r6, #0
	cmpne r6, r0
	movne r0, r7
	bne _02020464
	mov r4, #0x14
	b _02020060
_0201FFF0:
	cmp r0, #0x41
	ldreqb r1, [r5, #1]
	cmpeq r1, #0x54
	ldreqb r1, [r5, #2]
	cmpeq r1, #0x34
	ldreqb r1, [r5, #3]
	cmpeq r1, #0x50
	bne _02020034
	ldrb r1, [r5, #0x10]
	ldrb r0, [r5, #0x11]
	cmp r6, #0
	add r0, r1, r0, lsl #8
	cmpne r6, r0
	movne r0, #0
	bne _02020464
	mov r4, #0x12
	b _02020060
_02020034:
	cmp r0, #0x41
	ldreqb r0, [r5, #1]
	cmpeq r0, #0x54
	ldreqb r0, [r5, #2]
	cmpeq r0, #0x33
	ldreqb r0, [r5, #3]
	cmpeq r0, #0x50
	moveq r4, #0x10
	beq _02020060
	mov r0, #0
	b _02020464
_02020060:
	ldrb r0, [r5, #4]
	cmp r0, #0x4e
	bne _0202009C
	mov r4, #0
	b _02020084
_02020074:
	add r0, r5, r4
	ldrb r0, [r0, #7]
	bl WriteByteFromMemoryPointer
	add r4, r4, #1
_02020084:
	ldr r0, [sp, #0x28]
	cmp r4, r0
	blt _02020074
	bl sub_020204CC
	mov r0, r4
	b _02020464
_0202009C:
	ldrb r0, [r5, #7]
	ldrb fp, [r5, #8]
	ldrb sb, [r5, #9]
	add r0, r0, #3
	str r0, [sp, #0x20]
	add r0, fp, #3
	str r0, [sp, #0x1c]
	add r0, sb, #3
	ldrb r8, [r5, #0xa]
	str r0, [sp, #0x18]
	ldrb r3, [r5, #0xb]
	add r0, r8, #3
	str r0, [sp, #0x14]
	add r0, r3, #3
	ldrb r2, [r5, #0xc]
	str r0, [sp, #0x10]
	ldrb r1, [r5, #0xd]
	add r0, r2, #3
	str r0, [sp, #0xc]
	add r0, r1, #3
	str r0, [sp, #8]
	ldrb r0, [r5, #0xe]
	ldrb r1, [r5, #0xf]
	add r0, r0, #3
	str r0, [sp, #4]
	add r0, r1, #3
	str r0, [sp]
	b _02020450
_0202010C:
	cmp r6, #0
	beq _02020120
	cmp r7, r6
	movge r0, #0
	bge _02020464
_02020120:
	cmp sl, #8
	ldreqb r0, [r5, r4]
	addeq r4, r4, #1
	moveq sl, #0
	streq r0, [sp, #0x24]
	ldr r0, [sp, #0x24]
	tst r0, #0x80
	bne _02020430
	ldrb r2, [r5, r4]
	add r0, r5, r4
	and r1, r2, #0xf0
	mov r1, r1, asr #4
	add r8, r1, #3
	ldr r1, [sp, #0x20]
	and sb, r2, #0xf
	cmp r8, r1
	ldr r1, [sp, #0x1c]
	moveq r8, #0x1f
	cmp r8, r1
	ldr r1, [sp, #0x18]
	moveq r8, #0x1e
	cmp r8, r1
	ldr r1, [sp, #0x14]
	moveq r8, #0x1d
	cmp r8, r1
	ldr r1, [sp, #0x10]
	moveq r8, #0x1c
	cmp r8, r1
	ldr r1, [sp, #0xc]
	moveq r8, #0x1b
	cmp r8, r1
	ldr r1, [sp, #8]
	moveq r8, #0x1a
	cmp r8, r1
	ldr r1, [sp, #4]
	moveq r8, #0x19
	cmp r8, r1
	ldr r1, [sp]
	moveq r8, #0x18
	cmp r8, r1
	moveq r8, #0x17
	sub r1, r8, #0x17
	cmp r1, #8
	addls pc, pc, r1, lsl #2
	b _02020398
_020201D4: ; jump table
	b _02020368 ; case 0
	b _02020338 ; case 1
	b _02020308 ; case 2
	b _020202DC ; case 3
	b _020202AC ; case 4
	b _0202027C ; case 5
	b _0202024C ; case 6
	b _02020220 ; case 7
	b _020201F8 ; case 8
_020201F8:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	and r0, sb, #0xf
	orr r0, r0, r0, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020220:
	add r4, r4, #1
	add r0, sb, #1
	and r8, r0, #0xf
	orr r0, r8, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	orr r0, r8, r8, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_0202024C:
	add r4, r4, #1
	sub r0, sb, #1
	and r0, r0, #0xf
	orr r0, r0, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	and r0, sb, #0xf
	orr r0, r0, r0, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_0202027C:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	sub r0, sb, #1
	mov r1, r0, lsl #0x1c
	and r0, sb, #0xf
	orr r0, r0, r1, lsr #24
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_020202AC:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	mov r1, sb, lsl #0x1c
	sub r0, sb, #1
	and r0, r0, #0xf
	orr r0, r0, r1, lsr #24
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_020202DC:
	add r4, r4, #1
	sub r0, sb, #1
	and r8, r0, #0xf
	orr r0, r8, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	orr r0, r8, r8, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020308:
	add r4, r4, #1
	add r0, sb, #1
	and r0, r0, #0xf
	orr r0, r0, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	and r0, sb, #0xf
	orr r0, r0, r0, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020338:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r0, sb, #1
	mov r1, r0, lsl #0x1c
	and r0, sb, #0xf
	orr r0, r0, r1, lsr #24
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020368:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	mov r1, sb, lsl #0x1c
	add r0, sb, #1
	and r0, r0, #0xf
	orr r0, r0, r1, lsr #24
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020398:
	ldrb r1, [r0, #1]
	sub r0, r7, #0x1000
	add r4, r4, #2
	add r1, r1, sb, lsl #8
	add sb, r1, r0
	mov fp, #0
	b _02020424
_020203B4:
	ldr r0, _0202046C ; =_022A5038
	ldr r1, [r0, #0xc]
	mov r0, sb, asr #1
	add r0, sb, r0, lsr #30
	mov r0, r0, asr #2
	ldr r1, [r1, r0, lsl #2]
	and r0, sb, #3
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020203EC
_020203DC: ; jump table
	b _020203EC ; case 0
	b _020203F4 ; case 1
	b _02020400 ; case 2
	b _0202040C ; case 3
_020203EC:
	and r0, r1, #0xff
	b _02020414
_020203F4:
	mov r0, r1, lsr #8
	and r0, r0, #0xff
	b _02020414
_02020400:
	mov r0, r1, lsr #0x10
	and r0, r0, #0xff
	b _02020414
_0202040C:
	mov r0, r1, lsr #0x18
	and r0, r0, #0xff
_02020414:
	bl WriteByteFromMemoryPointer
	add r7, r7, #1
	add sb, sb, #1
	add fp, fp, #1
_02020424:
	cmp fp, r8
	blt _020203B4
	b _02020440
_02020430:
	ldrb r0, [r5, r4]
	bl WriteByteFromMemoryPointer
	add r7, r7, #1
	add r4, r4, #1
_02020440:
	ldr r0, [sp, #0x24]
	add sl, sl, #1
	mov r0, r0, lsl #1
	str r0, [sp, #0x24]
_02020450:
	ldr r0, [sp, #0x28]
	cmp r4, r0
	blt _0202010C
	bl sub_020204CC
	mov r0, r7
_02020464:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202046C: .word _022A5038
	arm_func_end DecompressAtFromMemoryPointer

	arm_func_start WriteByteFromMemoryPointer
WriteByteFromMemoryPointer: ; 0x02020470
	ldr r1, _020204C4 ; =_022A5038
	ldr r2, _020204C8 ; =_020997A4
	ldr r3, [r1, #8]
	ldr ip, [r1, #4]
	ldr r2, [r2, r3, lsl #2]
	orr r2, ip, r0, lsl r2
	str r2, [r1, #4]
	ldr r0, [r1]
	str r2, [r0]
	ldr r0, [r1, #8]
	add r0, r0, #1
	str r0, [r1, #8]
	cmp r0, #4
	bxne lr
	ldr r2, [r1]
	mov r0, #0
	add r2, r2, #4
	str r2, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_020204C4: .word _022A5038
_020204C8: .word _020997A4
	arm_func_end WriteByteFromMemoryPointer

	arm_func_start sub_020204CC
sub_020204CC: ; 0x020204CC
	ldr r0, _020204E8 ; =_022A5038
	ldr r1, [r0, #8]
	cmp r1, #0
	ldrne r1, [r0, #4]
	ldrne r0, [r0]
	strne r1, [r0]
	bx lr
	.align 2, 0
_020204E8: .word _022A5038
	arm_func_end sub_020204CC

	arm_func_start GetAtSize
GetAtSize: ; 0x020204EC
	ldrb r2, [r0]
	cmp r2, #0x50
	ldreqb r1, [r0, #1]
	cmpeq r1, #0x4b
	ldreqb r1, [r0, #2]
	cmpeq r1, #0x44
	ldreqb r1, [r0, #3]
	cmpeq r1, #0x50
	bne _02020530
	ldrb r2, [r0, #0x10]
	ldrb r1, [r0, #0x11]
	ldrb r3, [r0, #0x12]
	ldrb ip, [r0, #0x13]
	add r0, r2, r1, lsl #8
	add r0, r0, r3, lsl #16
	add r0, r0, ip, lsl #24
	bx lr
_02020530:
	cmp r2, #0x41
	ldreqb r1, [r0, #1]
	cmpeq r1, #0x54
	ldreqb r1, [r0, #2]
	cmpeq r1, #0x34
	ldreqb r1, [r0, #3]
	cmpeq r1, #0x50
	ldreqb r1, [r0, #0x10]
	ldreqb r0, [r0, #0x11]
	addeq r0, r1, r0, lsl #8
	bxeq lr
	cmp r2, #0x41
	ldreqb r1, [r0, #1]
	cmpeq r1, #0x54
	ldreqb r0, [r0, #2]
	cmpeq r0, #0x33
	moveq r0, #0
	movne r0, #0
	bx lr
	arm_func_end GetAtSize

	arm_func_start sub_0202057C
sub_0202057C: ; 0x0202057C
	stmdb sp!, {lr}
	sub sp, sp, #0x54
	add r0, sp, #0
	bl GetDsFirmwareUserSettingsVeneer
	ldrsb r0, [sp]
	bl sub_020205C0
#ifdef EUROPE
	bl sub_0202059C
#endif
	add sp, sp, #0x54
	ldmia sp!, {pc}
	arm_func_end sub_0202057C

	arm_func_start sub_0202059C
sub_0202059C: ; 0x0202059C
#ifdef EUROPE
	stmdb sp!, {r4, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	ldmeqia sp!, {r4, pc}
	ldr r1, _02020680 ; =LANGUAGE_INFO_DATA
	ldr r0, _02020684 ; =_02099C04_EU
	ldrsb r1, [r1]
	mov r2, r4
	bl Debug_Print0
	ldr r1, _02020680 ; =LANGUAGE_INFO_DATA
	mov r0, r4
	strb r4, [r1]
	bl sub_020206C0_EU
	ldr r1, _02020680 ; =LANGUAGE_INFO_DATA
	strb r0, [r1, #1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02020680: .word LANGUAGE_INFO_DATA
_02020684: .word _02099C04_EU
#else
	bx lr
#endif
	arm_func_end sub_0202059C

	arm_func_start GetLanguageType
GetLanguageType: ; 0x020205A0
	ldr r0, _020205AC ; =LANGUAGE_INFO_DATA
	ldrsb r0, [r0, #1]
	bx lr
	.align 2, 0
_020205AC: .word LANGUAGE_INFO_DATA
	arm_func_end GetLanguageType

#ifdef EUROPE
	arm_func_start sub_02020698_EU
sub_02020698_EU: ; 0x02020698
	and r0, r0, #0xff
	cmp r0, #4
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02020698_EU
#endif

	arm_func_start GetLanguage
GetLanguage: ; 0x020205B0
	ldr r0, _020205BC ; =LANGUAGE_INFO_DATA
	ldrsb r0, [r0]
	bx lr
	.align 2, 0
_020205BC: .word LANGUAGE_INFO_DATA
	arm_func_end GetLanguage

#ifdef EUROPE
	arm_func_start sub_020206C0_EU
sub_020206C0_EU: ; 0x020206C0
	cmp r0, #0
	blt _020206D8_EU
	cmp r0, #5
	ldrlt r1, _020206E0_EU ; =_02099BF0_EU
	ldrltsb r0, [r1, r0]
	bxlt lr
_020206D8_EU:
	mvn r0, #0
	bx lr
	.align 2, 0
_020206E0_EU: .word _02099BF0_EU
	arm_func_end sub_020206C0_EU
#endif

	arm_func_start sub_020205C0
sub_020205C0: ; 0x020205C0
	cmp r0, #0
	blt _020205D8
	cmp r0, #9
	ldrlt r1, _020205E0 ; =_020997B4
	ldrltsb r0, [r1, r0]
	bxlt lr
_020205D8:
	mvn r0, #0
	bx lr
	.align 2, 0
_020205E0: .word _020997B4
	arm_func_end sub_020205C0

	arm_func_start sub_020205E4
sub_020205E4: ; 0x020205E4
	stmdb sp!, {r3, lr}
	bl sub_0202057C
	bl sub_020257FC
	bl sub_02023610
	ldmia sp!, {r3, pc}
	arm_func_end sub_020205E4

	arm_func_start sub_020205F8
sub_020205F8: ; 0x020205F8
	stmdb sp!, {r3, lr}
	bl sub_0200B768
	bl LoadStringFile
#ifndef JAPAN
	bl sub_0202088C
#endif
	ldmia sp!, {r3, pc}
	arm_func_end sub_020205F8

	arm_func_start sub_0202060C
sub_0202060C: ; 0x0202060C
	cmp r0, #0
	mvneq r0, #0
	bxeq lr
	cmp r0, #0x61
	blo _0202062C
	cmp r0, #0x66
	subls r0, r0, #0x57
	bxls lr
_0202062C:
	cmp r0, #0x41
	blo _02020640
	cmp r0, #0x46
	subls r0, r0, #0x37
	bxls lr
_02020640:
	cmp r0, #0x30
	blo _02020654
	cmp r0, #0x39
	subls r0, r0, #0x30
	bxls lr
_02020654:
	mov r0, #0
	bx lr
	arm_func_end sub_0202060C

	arm_func_start sub_0202065C
sub_0202065C: ; 0x0202065C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r6, [r4]
	ldrb r0, [r6]
	cmp r0, #0x7e
	bne _020206C8
	ldrb r0, [r6, #1]
	bl sub_0202060C
	movs r5, r0
	addmi r0, r6, #1
	strmi r0, [r4]
	movmi r0, #0
	ldmmiia sp!, {r4, r5, r6, pc}
	ldrb r0, [r6, #2]
	bl sub_0202060C
	cmp r0, #0
	addlt r1, r6, #2
	movlt r0, r5, lsl #0x10
	strlt r1, [r4]
	movlt r0, r0, lsr #0x10
	ldmltia sp!, {r4, r5, r6, pc}
	add r0, r0, r5, lsl #4
	add r1, r6, #3
	mov r0, r0, lsl #0x10
	str r1, [r4]
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, r5, r6, pc}
_020206C8:
	cmp r0, #0x81
	blo _020206D8
	cmp r0, #0x84
	bls _020206E0
_020206D8:
	cmp r0, #0x87
	bne _020206F0
_020206E0:
	ldrb r1, [r6, #1]!
	orr r0, r1, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
_020206F0:
	add r1, r6, #1
	str r1, [r4]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0202065C

	arm_func_start sub_020206FC
sub_020206FC: ; 0x020206FC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, r1
	ldr r5, [sb]
	mov sl, r0
	ldrb r0, [r5]
	mov r8, r2
	ldr r4, [sl]
	cmp r0, #0x7e
	bne _020207F0
	ldrb r0, [r5, #1]
	mov r6, #0
	bl sub_0202060C
	movs r7, r0
	bpl _02020754
	ldrb r2, [r5]
	add r1, r4, #1
	add r0, r5, #1
	strb r2, [r4]
	str r1, [sl]
	str r0, [sb]
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02020754:
	add r0, r4, #1
	cmp r0, r8
	ldrb r0, [r5, #2]
	moveq r6, #1
	bl sub_0202060C
	cmp r0, #0
	bge _020207A4
	cmp r6, #0
	bne _02020790
	ldrb r1, [r5]
	add r0, r4, #2
	strb r1, [r4]
	ldrb r1, [r5, #1]
	strb r1, [r4, #1]
	str r0, [sl]
_02020790:
	add r1, r5, #2
	mov r0, r7, lsl #0x10
	str r1, [sb]
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020207A4:
	add r1, r4, #2
	cmp r1, r8
	moveq r6, #1
	cmp r6, #0
	bne _020207D8
	ldrb r2, [r5]
	add r1, r4, #3
	strb r2, [r4]
	ldrb r2, [r5, #1]
	strb r2, [r4, #1]
	ldrb r2, [r5, #2]
	strb r2, [r4, #2]
	str r1, [sl]
_020207D8:
	add r0, r0, r7, lsl #4
	add r1, r5, #3
	mov r0, r0, lsl #0x10
	str r1, [sb]
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020207F0:
	cmp r0, #0x81
	blo _02020800
	cmp r0, #0x84
	bls _02020808
_02020800:
	cmp r0, #0x87
	bne _02020850
_02020808:
	ldrb r2, [r5, #1]
	add r1, r4, #1
	cmp r1, r8
	orr r0, r2, r0, lsl #8
	mov r0, r0, lsl #0x10
	addeq r1, r5, #2
	mov r0, r0, lsr #0x10
	streq r1, [sb]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldrb r3, [r5]
	add r2, r5, #2
	add r1, r4, #2
	strb r3, [r4]
	ldrb r3, [r5, #1]
	strb r3, [r4, #1]
	str r2, [sb]
	str r1, [sl]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02020850:
	strb r0, [r4]
	add r1, r5, #1
	str r1, [sb]
	add r1, r4, #1
	str r1, [sl]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_020206FC

	arm_func_start sub_02020868
sub_02020868: ; 0x02020868
	b _02020870
_0202086C:
	add r0, r0, #1
_02020870:
	ldrb r1, [r0]
	cmp r1, #0
	bne _0202086C
	bx lr
	arm_func_end sub_02020868

	arm_func_start sub_02020880
sub_02020880: ; 0x02020880
	ldr ip, _02020888 ; =strstr
	bx ip
	.align 2, 0
_02020888: .word strstr
	arm_func_end sub_02020880

#ifndef JAPAN
	arm_func_start sub_0202088C
sub_0202088C: ; 0x0202088C
#ifdef EUROPE
	stmdb sp!, {r3, lr}
	bl GetLanguage
	ldr r1, _020209E0 ; =_020B05B0_EU
	mov r2, r0, lsl #1
	ldrh r2, [r1, r2]
	ldr r1, _020209E4 ; =_020B05AC_EU
	cmp r0, #2
	strh r2, [r1]
	strh r2, [r1, #2]
	moveq r0, #0x2e
	streqh r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020209E0: .word _020B05B0_EU
_020209E4: .word _020B05AC_EU
#else
	bx lr
#endif
	arm_func_end sub_0202088C
#endif

	arm_func_start sub_02020890
sub_02020890: ; 0x02020890
	cmp r1, #0
	beq _020208C0
	ldr ip, [r0]
_0202089C:
	cmp ip, r2
	moveq r0, #0
	streqb r0, [r2, #-1]
	bxeq lr
	ldrb r3, [r1], #1
	cmp r3, #0
	strneb r3, [ip], #1
	bne _0202089C
	str ip, [r0]
_020208C0:
	mov r0, #1
	bx lr
	arm_func_end sub_02020890

	arm_func_start StrcmpTag
StrcmpTag: ; 0x020208C8
	ldrb r2, [r1], #1
	ldrb r3, [r0], #1
	cmp r2, #0
	bne _020208F0
	cmp r3, #0
	cmpne r3, #0x3a
	cmpne r3, #0x5d
	moveq r0, #1
	movne r0, #0
	bx lr
_020208F0:
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	cmp r3, r2
	beq StrcmpTag
	mov r0, #0
	bx lr
	arm_func_end StrcmpTag

	arm_func_start AtoiTag
AtoiTag: ; 0x0202090C
	mov r3, #0
	mov r1, #0xa
_02020914:
	ldrb r2, [r0], #1
	cmp r2, #0
	cmpne r2, #0x3a
	cmpne r2, #0x5d
	moveq r0, r3
	bxeq lr
	cmp r2, #0x30
	blo _02020914
	cmp r2, #0x39
	mlals r2, r3, r1, r2
	subls r3, r2, #0x30
	b _02020914
	arm_func_end AtoiTag

	arm_func_start sub_02020944
sub_02020944: ; 0x02020944
	bx lr
	arm_func_end sub_02020944

	arm_func_start sub_02020948
sub_02020948: ; 0x02020948
	stmdb sp!, {r4, lr}
	ldrb r4, [r0]
	cmp r4, #0x41
	blo _02020A24
	cmp r4, #0x5a
	bhi _02020A24
	add r0, r0, #1
	bl AtoiTag
	mov r0, r0, lsl #0x10
	cmp r4, #0x49
	mov r0, r0, asr #0x10
	bgt _0202099C
	cmp r4, #0x48
	blt _02020990
	beq _020209DC
	cmp r4, #0x49
	beq _02020A0C
	b _02020A1C
_02020990:
	cmp r4, #0x42
	ldmeqia sp!, {r4, pc}
	b _02020A1C
_0202099C:
	cmp r4, #0x52
	bgt _020209AC
	beq _020209EC
	b _02020A1C
_020209AC:
	cmp r4, #0x54
	bgt _02020A1C
	cmp r4, #0x53
	blt _02020A1C
	beq _020209CC
	cmp r4, #0x54
	beq _020209FC
	b _02020A1C
_020209CC:
	add r0, r0, #0x21
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_020209DC:
	add r0, r0, #0x29
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_020209EC:
	add r0, r0, #0x32
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_020209FC:
	add r0, r0, #0x3c
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_02020A0C:
	add r0, r0, #0x43
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_02020A1C:
	mvn r0, #0
	ldmia sp!, {r4, pc}
_02020A24:
	cmp r4, #0x30
	blo _02020A44
	cmp r4, #0x39
	bhi _02020A44
	bl AtoiTag
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_02020A44:
	mvn r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_02020948

	arm_func_start sub_02020A4C
sub_02020A4C: ; 0x02020A4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetLanguageType
	cmp r0, #3
	ldreq r4, _02020A94 ; =_0209995C
	ldrne r4, _02020A98 ; =_0209990C
	b _02020A80
_02020A68:
	mov r0, r5
	bl StrcmpTag
	cmp r0, #0
	ldrneh r0, [r4, #4]
	ldmneia sp!, {r3, r4, r5, pc}
	add r4, r4, #8
_02020A80:
	ldr r1, [r4]
	cmp r1, #0
	bne _02020A68
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02020A94: .word _0209995C
_02020A98: .word _0209990C
	arm_func_end sub_02020A4C

	arm_func_start sub_02020A9C
sub_02020A9C: ; 0x02020A9C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	mov r5, r2
	mov lr, r4
	mov ip, #5
_02020AB4:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02020AB4
	ldr r0, [r6]
	str r0, [lr]
	str r5, [r4, #0x54]
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _02020AE8
	ldr r0, [r4, #0x54]
	add r1, r4, #8
	blx r2
_02020AE8:
	mov r0, #0
	str r0, [r4, #0x58]
	mov r0, #0x78
	mov r1, #0x3c
	str r0, [r4, #0x6c]
	mov r0, r4
	str r1, [r4, #0x70]
	sub r1, r1, #0x3d
	str r1, [r4, #0x74]
	bl sub_02020B14
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02020A9C

	arm_func_start sub_02020B14
sub_02020B14: ; 0x02020B14
	mov r3, #0
	str r3, [r0, #0x5c]
	strb r3, [r0, #0x9d]
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r2, [r0, #0x90]
	str r1, [r0, #0x94]
	mov r2, r3
_02020B34:
	add r1, r0, r3
	add r3, r3, #1
	strb r2, [r1, #0x99]
	cmp r3, #4
	blt _02020B34
	bx lr
	arm_func_end sub_02020B14

	arm_func_start sub_02020B4C
sub_02020B4C: ; 0x02020B4C
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_02020B4C

	arm_func_start sub_02020B60
sub_02020B60: ; 0x02020B60
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [r0, #0x90]
	str r1, [r0, #0x94]
	bx lr
	arm_func_end sub_02020B60

	arm_func_start sub_02020B74
sub_02020B74: ; 0x02020B74
	stmdb sp!, {r3, lr}
	mov r2, r0
	strb r1, [r2, #0x98]
	ldr r0, [r2, #0x54]
	ldr r2, [r2, #0x30]
	and r1, r1, #0xff
	blx r2
	ldmia sp!, {r3, pc}
	arm_func_end sub_02020B74

	arm_func_start sub_02020B94
sub_02020B94: ; 0x02020B94
	stmdb sp!, {r3, lr}
	mov r2, r0
	strb r1, [r2, #0x98]
	strb r1, [r2, #0x9c]
	ldrb r1, [r2, #0x98]
	ldr r0, [r2, #0x54]
	ldr r2, [r2, #0x30]
	blx r2
	ldmia sp!, {r3, pc}
	arm_func_end sub_02020B94

	arm_func_start sub_02020BB8
sub_02020BB8: ; 0x02020BB8
	str r1, [r0, #0x6c]
	str r2, [r0, #0x70]
	bx lr
	arm_func_end sub_02020BB8

	arm_func_start sub_02020BC4
sub_02020BC4: ; 0x02020BC4
	stmdb sp!, {r4, lr}
	mov r4, r0
	tst r1, #0x400
	movne r0, #1
	moveq r0, #0
	strh r1, [r4, #0x60]
	strb r0, [r4, #0x62]
	tst r1, #2
	movne r0, #3
	strne r0, [r4, #0x5c]
	bne _02020C50
	tst r1, #4
	beq _02020C14
	mov r0, #3
	str r0, [r4, #0x5c]
	ldr r1, [r4]
	ldr r0, [r4, #4]
	str r1, [r4, #0x90]
	str r0, [r4, #0x94]
	b _02020C50
_02020C14:
	ldr r0, [r4, #0x5c]
	cmp r0, #1
	movne r0, #3
	strne r0, [r4, #0x5c]
	bne _02020C40
	ldr r1, [r4, #0x6c]
	mov r0, #0xc
	str r1, [r4, #0x7c]
	str r0, [r4, #0x5c]
	mov r0, #1
	strb r0, [r4, #0x9d]
_02020C40:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	str r1, [r4, #0x90]
	str r0, [r4, #0x94]
_02020C50:
	str r2, [r4, #0x88]
	str r2, [r4, #0x84]
	mov r1, #0
	strh r1, [r4, #0x8c]
	str r1, [r4, #0xa4]
	strb r1, [r4, #0xa8]
	add r2, r4, #0xac
	mov r0, r1
_02020C70:
	add r1, r1, #1
	cmp r1, #4
	strb r0, [r2], #0x18
	blt _02020C70
	mov r1, #0x44
	strb r1, [r4, #0x98]
	str r0, [r4, #0xa0]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r0, #4
	moveq r0, #1
	str r0, [r4, #0x64]
	mov r0, #1
	str r0, [r4, #0x68]
	mov r0, #0
	str r0, [r4, #0x78]
	str r0, [r4, #0x7c]
	str r0, [r4, #0x80]
	ldrb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
	ldmia sp!, {r4, pc}
	arm_func_end sub_02020BC4

	arm_func_start sub_02020CCC
sub_02020CCC: ; 0x02020CCC
	ldr r1, [r0, #0x5c]
	cmp r1, #1
	bne _02020CF4
	ldr r2, [r0, #0x6c]
	mov r1, #0xb
	str r2, [r0, #0x7c]
	str r1, [r0, #0x5c]
	mov r1, #1
	strb r1, [r0, #0x9d]
	bx lr
_02020CF4:
	cmp r1, #0x10
	bxeq lr
	ldr r2, [r0, #0x6c]
	mov r1, #0xe
	str r2, [r0, #0x7c]
	str r1, [r0, #0x5c]
	mov r1, #1
	strb r1, [r0, #0x9d]
	bx lr
	arm_func_end sub_02020CCC

	arm_func_start sub_02020D18
sub_02020D18: ; 0x02020D18
	ldr r1, [r0, #0x5c]
	cmp r1, #1
	bxne lr
	ldr r2, [r0, #0x6c]
	mov r1, #0xd
	str r2, [r0, #0x7c]
	str r1, [r0, #0x5c]
	mov r1, #1
	strb r1, [r0, #0x9d]
	bx lr
	arm_func_end sub_02020D18

	arm_func_start sub_02020D40
sub_02020D40: ; 0x02020D40
	ldr r1, [r0, #0x5c]
	cmp r1, #1
	moveq r1, #2
	streq r1, [r0, #0x5c]
	bx lr
	arm_func_end sub_02020D40

	arm_func_start sub_02020D54
sub_02020D54: ; 0x02020D54
	ldr r0, [r0, #0x5c]
	bx lr
	arm_func_end sub_02020D54

	arm_func_start sub_02020D5C
sub_02020D5C: ; 0x02020D5C
	ldr r0, [r0, #0x5c]
	cmp r0, #0
	cmpne r0, #1
	cmpne r0, #2
	cmpne r0, #0x10
	moveq r0, #0
	movne r0, #1
	bx lr
	arm_func_end sub_02020D5C

	arm_func_start sub_02020D7C
sub_02020D7C: ; 0x02020D7C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r4, #0
	mov ip, #0x18
	b _02020DB8
_02020D94:
	mla r0, r4, ip, r7
	mov r5, r6
	add lr, r0, #0xac
	ldmia lr!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1}
	stmia r5, {r0, r1}
	add r6, r6, #0x18
	add r4, r4, #1
_02020DB8:
	ldr r0, [r7, #0xa4]
	cmp r4, r0
	blt _02020D94
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02020D7C

	arm_func_start AnalyzeText
AnalyzeText: ; 0x02020DC8
#ifdef EUROPE
#define ANALYZE_TEXT_STACK_OFFSET 8
#define ANALYZE_TEXT_LOAD_OFFSET -0x10
#else
#define ANALYZE_TEXT_STACK_OFFSET 0
#define ANALYZE_TEXT_LOAD_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x84 + ANALYZE_TEXT_STACK_OFFSET
	mov r4, r0
	ldr r0, [r4, #0x78]
	add r0, r0, #1
	str r0, [r4, #0x78]
	ldr r0, [r4, #0x5c]
	cmp r0, #0x10
	addls pc, pc, r0, lsl #2
	b _02021EC4
_02020DF0: ; jump table
	b _02021EC4 ; case 0
	b _02021EC4 ; case 1
	b _02021EC4 ; case 2
	b _02020E34 ; case 3
	b _02020EC4 ; case 4
	b _02020E4C ; case 5
	b _02020E4C ; case 6
	b _02021C90 ; case 7
	b _02021CE4 ; case 8
	b _02021CE4 ; case 9
	b _02021CE4 ; case 10
	b _02021CE4 ; case 11
	b _02021CE4 ; case 12
	b _02021CE4 ; case 13
	b _02021E90 ; case 14
	b _02021E9C ; case 15
	b _02021EC4 ; case 16
_02020E34:
	ldrh r0, [r4, #0x60]
	tst r0, #0x8000
	bne _02020E4C
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x28]
	blx r1
_02020E4C:
	ldr r1, [r4, #0x5c]
	sub r0, r1, #5
	cmp r0, #1
	bhi _02020EBC
	cmp r1, #5
	bne _02020E74
	ldrh r0, [r4, #0x60]
	tst r0, #0x1000
	beq _02020E74
	bl sub_02017CEC
_02020E74:
	ldrh r0, [r4, #0x60]
	tst r0, #0x20
	bne _02020EA8
	tst r0, #0x800
	beq _02020EA8
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x18]
	blx r1
	cmp r0, #0
	movne r0, #1
	strneb r0, [r4, #0x62]
	movne r0, #0
	strne r0, [r4, #0x7c]
_02020EA8:
	ldr r0, [r4, #0x7c]
	sub r0, r0, #1
	str r0, [r4, #0x7c]
	cmp r0, #0
	bgt _02021EC4
_02020EBC:
	mov r0, #4
	str r0, [r4, #0x5c]
_02020EC4:
	ldrb r0, [r4, #0x62]
	cmp r0, #0
	movne r0, #0x400
	ldreq r0, [r4, #0x64]
	str r0, [r4, #0x80]
	mov r0, #0
	str r0, [r4, #0x7c]
	b _02021BFC
_02020EE4:
	ldr r0, [r4, #0x88]
	ldrb r0, [r0]
	strh r0, [r4, #0x8c]
	cmp r0, #0x5b
	bne _02021AB4
	ldr r0, [r4, #0x88]
	ldrb r5, [r0]
	strh r5, [r4, #0x8c]
	cmp r5, #0x5b
	bne _02021A70
	ldr r0, [r4, #0x88]
	mov r6, #1
	add r0, r0, #1
	str r0, [r4, #0x88]
	str r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	add r0, sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET
_02020F24:
	ldr r1, [r4, #0x88]
	mov r2, r1
	add r1, r1, #1
	str r1, [r4, #0x88]
	ldrb r1, [r2]
	cmp r1, #0x5d
	beq _02020F54
	cmp r1, #0x3a
	ldreq r1, [r4, #0x88]
	streq r1, [r0, r6, lsl #2]
	addeq r6, r6, #1
	b _02020F24
_02020F54:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldrb r7, [r0]
	cmp r7, #0x41
	blo _02021A38
	cmp r7, #0x5a
	bhi _02021A38
	sub r1, r7, #0x42
	cmp r1, #0x15
	addls pc, pc, r1, lsl #2
	b _02021A10
_02020F7C: ; jump table
	b _02020FD4 ; case 0
	b _02021040 ; case 1
	b _02021A10 ; case 2
	b _02021A10 ; case 3
	b _0202134C ; case 4
#ifdef EUROPE
	b _0202155C ; case 5
#else
	b _02021A10 ; case 5
#endif
	b _020212F0 ; case 6
	b _02021A10 ; case 7
	b _02021A10 ; case 8
	b _02021404 ; case 9
	b _0202145C ; case 10
	b _02021694 ; case 11
	b _02021A10 ; case 12
	b _02021A10 ; case 13
	b _020217C4 ; case 14
	b _02021A10 ; case 15
	b _02021868 ; case 16
	b _020218D8 ; case 17
	b _02021A10 ; case 18
	b _02021A10 ; case 19
	b _02021A10 ; case 20
	b _020219AC ; case 21
_02020FD4:
	ldr r1, _02021ED0 ; =_020999AC
	bl StrcmpTag
	cmp r0, #0
	beq _02021018
	ldr r1, [r4, #8]
	ldr r3, [r4, #0x94]
	ldr r2, [r4, #0x14]
	ldr r0, [r4, #0x54]
	ldr r5, [r4, #0x48]
	add r2, r3, r2
	sub r3, r1, #4
	mov r1, #2
	blx r5
	ldr r0, [r4, #0x94]
	add r0, r0, #3
	str r0, [r4, #0x94]
	b _02021AA0
_02021018:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0xe8]
	ldr r0, [r0, #0xe4]
	str r1, [sp, #0x6c + ANALYZE_TEXT_STACK_OFFSET]
	str r0, [sp, #0x68 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x68 + ANALYZE_TEXT_STACK_OFFSET
	bl Debug_FatalError
_02021040:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EDC ; =_020999C8
	bl StrcmpTag
	cmp r0, #0
	beq _02021104
	cmp r6, #2
	bne _02021098
	ldrb r1, [r4, #0x9c]
	cmp r1, #0
	ldrne r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	strneb r1, [r4, #0x99]
	ldrneb r0, [r0]
	strneb r0, [r4, #0x9c]
	bne _020210F0
	ldrb r0, [r4, #0x98]
	strb r0, [r4, #0x99]
	ldrb r0, [r4, #0xa8]
	cmp r0, #0
	ldreq r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	ldreqb r0, [r0]
	streqb r0, [r4, #0x98]
	b _020210F0
_02021098:
	cmp r6, #3
	bne _020210F0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldrb r2, [r4, #0x9c]
	cmp r2, #0
	cmpne r0, #3
	beq _020210D0
	add r1, r4, r0
	ldr r0, [sp, #0x78 + ANALYZE_TEXT_STACK_OFFSET]
	strb r2, [r1, #0x99]
	ldrb r0, [r0]
	strb r0, [r4, #0x9c]
	b _020210F0
_020210D0:
	ldrb r1, [r4, #0x98]
	add r0, r4, r0
	strb r1, [r0, #0x99]
	ldrb r0, [r4, #0xa8]
	cmp r0, #0
	ldreq r0, [sp, #0x78 + ANALYZE_TEXT_STACK_OFFSET]
	ldreqb r0, [r0]
	streqb r0, [r4, #0x98]
_020210F0:
	ldrb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
	b _02021AA0
_02021104:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EE0 ; =_020999CC
	bl StrcmpTag
	cmp r0, #0
	beq _020211C4
	cmp r6, #1
	bne _02021158
	ldrb r0, [r4, #0x9c]
	cmp r0, #0
	ldrneb r1, [r4, #0x99]
	movne r0, #0
	strneb r1, [r4, #0x9c]
	strneb r0, [r4, #0x99]
	bne _020211B0
	ldrb r0, [r4, #0xa8]
	cmp r0, #0
	ldreqb r0, [r4, #0x99]
	streqb r0, [r4, #0x98]
	mov r0, #0
	strb r0, [r4, #0x99]
	b _020211B0
_02021158:
	cmp r6, #2
	bne _020211B0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldrb r1, [r4, #0x9c]
	cmp r1, #0
	cmpne r0, #3
	beq _02021190
	add r2, r4, r0
	ldrb r1, [r2, #0x99]
	mov r0, #0
	strb r1, [r4, #0x9c]
	strb r0, [r2, #0x99]
	b _020211B0
_02021190:
	ldrb r1, [r4, #0xa8]
	cmp r1, #0
	addeq r1, r4, r0
	ldreqb r1, [r1, #0x99]
	add r0, r4, r0
	streqb r1, [r4, #0x98]
	mov r1, #0
	strb r1, [r0, #0x99]
_020211B0:
	ldrb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
	b _02021AA0
_020211C4:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EE4 ; =_020999D0
	bl StrcmpTag
	cmp r0, #0
	beq _02021200
	ldr r0, [r4, #0x88]
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x3c]
	bl sub_02022118
	ldr r1, [r4, #8]
	sub r0, r1, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x90]
	b _02021AA0
_02021200:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EE8 ; =_020999D4
	bl StrcmpTag
	cmp r0, #0
	beq _02021278
	ldr r0, [r4, #0xc]
	mov r1, #1
	str r0, [r4, #0x94]
	str r1, [r4, #0xa0]
	mov r0, #9
	str r0, [r4, #0x5c]
	strb r1, [r4, #0x9d]
	ldr r0, [r4, #0x88]
	ldrb r0, [r0]
	cmp r0, #0xd
	cmpne r0, #0xa
	bne _02021260
	ldr r0, [r4, #0x88]
	add r0, r0, #1
	str r0, [r4, #0x88]
	ldrh r0, [r4, #0x60]
	tst r0, #0x40
	movne r0, #7
	strne r0, [r4, #0x5c]
_02021260:
	ldrh r0, [r4, #0x60]
	tst r0, #0x80
	movne r0, #7
	strne r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_02021278:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EEC ; =_020999D8
	bl StrcmpTag
	cmp r0, #0
	beq _0202129C
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	str r0, [r4, #0x90]
	b _02021AA0
_0202129C:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EF0 ; =_020999E4
	bl StrcmpTag
	cmp r0, #0
	beq _020212C8
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldr r1, [r4, #0x90]
	add r0, r1, r0
	str r0, [r4, #0x90]
	b _02021AA0
_020212C8:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0xf8 - ANALYZE_TEXT_STACK_OFFSET]
	ldr r0, [r0, #0xf4 - ANALYZE_TEXT_STACK_OFFSET]
	str r1, [sp, #0x64 + ANALYZE_TEXT_STACK_OFFSET]
	str r0, [sp, #0x60 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x60 + ANALYZE_TEXT_STACK_OFFSET
	bl Debug_FatalError
_020212F0:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EF4 ; =_020999F0
	bl StrcmpTag
	cmp r0, #0
	beq _02021324
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x94]
	add r0, r0, r0, lsr #31
	add r0, r1, r0, asr #1
	str r0, [r4, #0x94]
	b _02021AA0
_02021324:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x100]
	ldr r0, [r0, #0xfc]
	str r1, [sp, #0x5c + ANALYZE_TEXT_STACK_OFFSET]
	str r0, [sp, #0x58 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x58 + ANALYZE_TEXT_STACK_OFFSET
	bl Debug_FatalError
_0202134C:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EF8 ; =_020999F4
	bl StrcmpTag
	cmp r0, #0
	beq _020213A8
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl sub_02020A4C
	movs r3, r0
	beq _020213F4
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r5, [r4, #0x40]
	blx r5
	ldr r1, [r4, #0x90]
	add r0, r1, r0
	str r0, [r4, #0x90]
	ldr r0, [r4, #0x68]
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x80]
	sub r0, r0, #1
	str r0, [r4, #0x80]
	b _020213F4
_020213A8:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EFC ; =_020999F8
	bl StrcmpTag
	cmp r0, #0
	beq _020213CC
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	str r0, [r4, #0x58]
	b _020213F4
_020213CC:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
#ifdef EUROPE
	ldr r1, [r0, #0x108]
	ldr r0, [r0, #0x104]
	str r1, [sp, #0x5c]
	str r0, [sp, #0x58]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x58
	bl Debug_FatalError
_020213F4:
	ldr r0, [r4, #0x58]
	ldr r1, [r4, #0x34]
	blx r1
	b _02021AA0
_0202155C:
	ldr r1, _020220C4 ; =_02099E64_EU
	bl StrcmpTag
	cmp r0, #0
	beq _02021598
	ldr r1, _020220C8 ; =_020B05AC_EU
	ldr r0, [r4, #0x54]
	ldrh r3, [r1]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r5, [r4, #0x40]
	blx r5
	ldr r0, [r4, #0x90]
	add r0, r0, #6
	str r0, [r4, #0x90]
	b _02021AA0
_02021598:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x78]
	ldr r1, [r0, #0x90]
	ldr r0, [r0, #0x8c]
	str r1, [sp, #0x54]
	str r0, [sp, #0x50]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x50
	bl Debug_FatalError
_02021404:
	ldr r0, [sp, #0x78]
#else
	ldr r1, [r0, #0xa0]
	ldr r0, [r0, #0x9c]
	str r1, [sp, #0x54]
	str r0, [sp, #0x50]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x50
	bl Debug_FatalError
_020213F4:
	ldr r0, [r4, #0x58]
	ldr r1, [r4, #0x34]
	blx r1
	b _02021AA0
_02021404:
#endif
	ldr r1, _02021F00 ; =_020999FC
	bl StrcmpTag
	cmp r0, #0
	beq _02021434
	ldrh r0, [r4, #0x60]
	tst r0, #1
	bne _02021AA0
	mov r0, #8
	str r0, [r4, #0x5c]
	mov r0, #1
	strb r0, [r4, #0x9d]
	b _02021AA4
_02021434:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x98 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x94 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x4c]
	str r0, [sp, #0x48]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x48
	bl Debug_FatalError
_0202145C:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F04 ; =_02099A00
	bl StrcmpTag
	cmp r0, #0
	beq _020214E8
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldr r2, [r4, #0xa4]
	mov r1, #0x18
	mul r3, r2, r1
	add r2, r4, #0xac
	mov r1, #1
	strb r1, [r2, r3]
	add r3, r2, r3
	strh r0, [r3, #2]
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r2, [r4, #0x94]
	ldr r1, [r4, #0x90]
	sub r0, r0, #1
	str r1, [r3, #0xc]
	str r2, [r3, #0x10]
	ldr r1, [r3, #0xc]
	stmib r3, {r1, r2}
	str r0, [r3, #0x14]
	ldrh r0, [r4, #0x60]
	tst r0, #0x100
	bne _02021AA0
	ldrb r0, [r4, #0x98]
	mov r1, #0x54
	strb r0, [r4, #0xa8]
	strb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
	b _02021AA0
_020214E8:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F08 ; =_02099A04
	bl StrcmpTag
	cmp r0, #0
	beq _02021588
	ldr r3, [r4, #0xa4]
	add r1, r4, #0xac
	mov r0, #0x18
	mla r2, r3, r0, r1
	add r0, r3, #1
	str r0, [r4, #0xa4]
	ldr r1, [r4, #0x90]
	ldr r0, [r4, #0x94]
	str r1, [r2, #0xc]
	str r0, [r2, #0x10]
	ldr r0, [r2, #0xc]
	sub r0, r0, #1
	str r0, [r2, #0xc]
	ldr r0, [r4, #0x14]
	ldr r1, [r2, #0x10]
	sub r0, r0, #1
	add r0, r1, r0
	str r0, [r2, #0x10]
	ldrb r0, [r4, #0xa8]
	cmp r0, #0
	beq _0202156C
	strb r0, [r4, #0x98]
	mov r0, #0
	strb r0, [r4, #0xa8]
	ldrb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
_0202156C:
	ldrh r0, [r4, #0x60]
	tst r0, #0x100
	beq _02021AA0
	mov r0, #7
	str r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_02021588:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F0C ; =_02099A08
	bl StrcmpTag
	cmp r0, #0
	beq _0202166C
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	mov r5, r0
	ldr r0, [sp, #0x78 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	mov r6, r0
	ldr r0, _02021F10 ; =_020997E4
	mov r1, r5, lsl #1
	mov r7, #0
	ldrh sb, [r0, r1]
	mov r5, r7
	b _02021654
_020215CC:
	ldr r1, [r4, #0x38]
	mov r0, sb
	mov r8, r5
	blx r1
	ldr r2, [r4, #0x90]
	ldr r1, [r4, #8]
	add r0, r2, r0
	cmp r0, r1
	ble _02021608
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r4, #0x94]
_02021608:
	ldrb r0, [r4, #0x98]
	cmp r0, #0x54
	beq _02021630
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r8, [r4, #0x40]
	mov r3, sb
	blx r8
	mov r8, r0
_02021630:
	ldr r0, [r4, #0x90]
	add r7, r7, #1
	add r0, r0, r8
	str r0, [r4, #0x90]
	ldr r0, [r4, #0x68]
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x80]
	sub r0, r0, #1
	str r0, [r4, #0x80]
_02021654:
	cmp r7, r6
	blt _020215CC
	ldr r0, [r4, #0x90]
	add r0, r0, #1
	str r0, [r4, #0x90]
	b _02021AA0
_0202166C:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x90 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x8c + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x44]
	str r0, [sp, #0x40]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x40
	bl Debug_FatalError
_02021694:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F14 ; =_02099A10
	bl StrcmpTag
	cmp r0, #0
	beq _020216F8
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl sub_02020948
	mov r3, r0
	mvn r0, #0
	cmp r3, r0
	beq _02021AA0
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r5, [r4, #0x44]
	blx r5
	ldr r1, [r4, #0x90]
	add r0, r1, r0
	str r0, [r4, #0x90]
	ldr r0, [r4, #0x68]
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x80]
	sub r0, r0, #1
	str r0, [r4, #0x80]
	b _02021AA0
_020216F8:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F18 ; =_02099A14
	bl StrcmpTag
	cmp r0, #0
	beq _02021728
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldr r2, [r4, #0x90]
	mov r1, #6
	mla r1, r0, r1, r2
	str r1, [r4, #0x90]
	b _02021AA0
_02021728:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F1C ; =_02099A18
	bl StrcmpTag
	cmp r0, #0
	beq _02021764
#ifdef EUROPE
	ldr r1, _020220C8 ; =_020B05AC_EU
	ldr r0, [r4, #0x54]
	ldrh r3, [r1, #2]
#else
	ldr r0, [r4, #0x54]
#endif
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r5, [r4, #0x40]
#ifndef EUROPE
	mov r3, #0x2c
#endif
	blx r5
	ldr r0, [r4, #0x90]
	add r0, r0, #6
	str r0, [r4, #0x90]
	b _02021AA0
_02021764:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F20 ; =_02099A1C
	bl StrcmpTag
	cmp r0, #0
	beq _0202179C
	ldrh r0, [r4, #0x60]
	tst r0, #1
	bne _02021AA0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017C50
	b _02021AA0
_0202179C:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x88 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x84 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x38]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x38
	bl Debug_FatalError
_020217C4:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F24 ; =_02099A24
	bl StrcmpTag
	cmp r0, #0
	beq _02021840
	ldr r1, [r4, #0xc]
	mov r0, #0
	str r1, [r4, #0x94]
	str r0, [r4, #0xa0]
	mov r0, #9
	str r0, [r4, #0x5c]
	mov r0, #1
	strb r0, [r4, #0x9d]
	ldr r0, [r4, #0x88]
	ldrb r0, [r0]
	cmp r0, #0xd
	cmpne r0, #0xa
	bne _02021828
	ldr r0, [r4, #0x88]
	add r0, r0, #1
	str r0, [r4, #0x88]
	ldrh r0, [r4, #0x60]
	tst r0, #0x40
	movne r0, #7
	strne r0, [r4, #0x5c]
_02021828:
	ldrh r0, [r4, #0x60]
	tst r0, #0x80
	movne r0, #7
	strne r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_02021840:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x80 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x7c + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x34]
	str r0, [sp, #0x30]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x30
	bl Debug_FatalError
_02021868:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F28 ; =_02099A28
	bl StrcmpTag
	cmp r0, #0
	beq _020218B0
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r4, #0x94]
	ldrh r0, [r4, #0x60]
	tst r0, #0x40
	beq _02021AA0
	mov r0, #7
	str r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_020218B0:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x78 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x74 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x2c]
	str r0, [sp, #0x28]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x28
	bl Debug_FatalError
_020218D8:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F2C ; =_02099A2C
	bl StrcmpTag
	cmp r0, #0
	beq _02021904
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldr r1, [r4, #0x90]
	add r0, r1, r0
	str r0, [r4, #0x90]
	b _02021AA0
_02021904:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F30 ; =_02099A30
	bl StrcmpTag
	cmp r0, #0
	movne r0, #0x400
	strne r0, [r4, #0x80]
	bne _02021AA0
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F34 ; =_02099A34
	bl StrcmpTag
	cmp r0, #0
	beq _0202194C
	ldrb r0, [r4, #0x62]
	cmp r0, #0
	movne r0, #0x400
	ldreq r0, [r4, #0x64]
	str r0, [r4, #0x80]
	b _02021AA0
_0202194C:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F38 ; =_02099A38
	bl StrcmpTag
	cmp r0, #0
	beq _02021984
	ldrh r0, [r4, #0x60]
	tst r0, #1
	bne _02021AA0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017C80
	b _02021AA0
_02021984:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x70 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x6c + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x24]
	str r0, [sp, #0x20]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x20
	bl Debug_FatalError
_020219AC:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F3C ; =_02099A40
	bl StrcmpTag
	cmp r0, #0
	beq _020219E8
	ldrh r0, [r4, #0x60]
	tst r0, #1
	bne _02021AA0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	str r0, [r4, #0x7c]
	mov r0, #6
	str r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_020219E8:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x68 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x64 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x1c]
	str r0, [sp, #0x18]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x18
	bl Debug_FatalError
_02021A10:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
#ifdef EUROPE
	ldr r1, [r0, #0x40]
	ldr r0, [r0, #0x3c]
#else
	ldr r1, [r0, #0x60]
	ldr r0, [r0, #0x5c]
#endif
	str r1, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x10
	bl Debug_FatalError
_02021A38:
	cmp r7, #0x61
	blo _02021A48
	cmp r7, #0x7a
	bls _02021AA0
_02021A48:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x58 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x54 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0xc]
	str r0, [sp, #8]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #8
	bl Debug_FatalError
_02021A70:
	cmp r5, #0x5b
	beq _02021AA0
	ldr r1, _02021ED4 ; =_020997E4
	add r0, sp, #0
#ifdef EUROPE
	ldr r2, [r1, #0x98]
	ldr r1, [r1, #0x94]
#else
	ldr r2, [r1, #0x48]
	ldr r1, [r1, #0x44]
#endif
	str r2, [sp, #4]
	str r1, [sp]
	ldr r2, [r4, #0x88]
	ldr r3, [r4, #0x84]
	ldr r1, _02021F40 ; =_02099A44
	bl Debug_FatalError
_02021AA0:
	mov r0, #0
_02021AA4:
	cmp r0, #0
	beq _02021BC4
	ldr r1, [r4, #0x5c]
	b _02021C10
_02021AB4:
	cmp r0, #0
	moveq r1, #7
	streq r1, [r4, #0x5c]
	beq _02021C10
	cmp r0, #0xd
	cmpne r0, #0xa
	bne _02021B0C
	ldrh r0, [r4, #0x60]
	tst r0, #0x40
	movne r1, #7
	strne r1, [r4, #0x5c]
	bne _02021C10
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r4, #0x94]
	ldr r0, [r4, #0x88]
	add r0, r0, #1
	str r0, [r4, #0x88]
	b _02021BC4
_02021B0C:
	ldr r7, [r4, #0x88]
	add r0, r4, #0x88
	bl sub_0202065C
	strh r0, [r4, #0x8c]
	ldr r0, [r4, #0x10]
	ldrh r6, [r4, #0x8c]
	cmp r0, #0
	bne _02021B50
	ldr r8, [r4, #0x90]
	cmp r6, #0x7f
	addeq r5, r8, #6
	beq _02021B58
	ldr r1, [r4, #0x38]
	mov r0, r6
	blx r1
	add r5, r8, r0
	b _02021B58
_02021B50:
	ldr r8, [r4, #0x90]
	add r5, r8, r0
_02021B58:
	ldr r0, [r4, #8]
	cmp r5, r0
	ble _02021B84
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r4, #0x94]
	str r7, [r4, #0x88]
	b _02021BC4
_02021B84:
	ldrb r0, [r4, #0x98]
	cmp r0, #0x54
	beq _02021BA8
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x94]
	ldr r7, [r4, #0x40]
	mov r1, r8
	mov r3, r6
	blx r7
_02021BA8:
	str r5, [r4, #0x90]
	ldr r0, [r4, #0x68]
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x80]
	sub r0, r0, #1
	str r0, [r4, #0x80]
	b _02021BFC
_02021BC4:
	ldrh r0, [r4, #0x60]
	tst r0, #0x400
	bne _02021BFC
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	blt _02021BFC
	mov r0, #0
	str r0, [r4, #0xa0]
	mov r0, #1
	mov r1, #9
	strb r0, [r4, #0x9d]
	str r1, [r4, #0x5c]
	b _02021C10
_02021BFC:
	ldr r0, [r4, #0x80]
	cmp r0, #0
	bgt _02020EE4
	mov r1, #5
	str r1, [r4, #0x5c]
_02021C10:
	sub r0, r1, #7
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _02021C74
_02021C20: ; jump table
	b _02021C54 ; case 0
	b _02021C48 ; case 1
	b _02021C3C ; case 2
	b _02021C74 ; case 3
	b _02021C74 ; case 4
	b _02021C3C ; case 5
	b _02021C3C ; case 6
_02021C3C:
	ldr r0, [r4, #0x6c]
	str r0, [r4, #0x7c]
	b _02021C74
_02021C48:
	ldr r0, [r4, #0x70]
	str r0, [r4, #0x7c]
	b _02021C74
_02021C54:
	ldrh r0, [r4, #0x60]
	tst r0, #0x4000
	bne _02021C6C
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x24]
	blx r1
_02021C6C:
	mov r0, #7
	b _02021EC8
_02021C74:
	ldrh r0, [r4, #0x60]
	tst r0, #0x4000
	bne _02021EC4
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x24]
	blx r1
	b _02021EC4
_02021C90:
	ldrh r0, [r4, #0x60]
	tst r0, #0x10
	beq _02021CCC
	mov r0, #0xa
	str r0, [r4, #0x5c]
	mov r0, #1
	strb r0, [r4, #0x9d]
	ldr r1, [r4, #0x74]
	cmp r1, #0
	ldrge r0, [r4, #0x78]
	subge r0, r1, r0
	strge r0, [r4, #0x7c]
	ldrlt r0, [r4, #0x6c]
	strlt r0, [r4, #0x7c]
	b _02021EC4
_02021CCC:
	tst r0, #0x200
	movne r0, #0x10
	strne r0, [r4, #0x5c]
	moveq r0, #1
	streq r0, [r4, #0x5c]
	b _02021EC4
_02021CE4:
	ldrh r1, [r4, #0x60]
	mov r5, #0
	tst r1, #8
	bne _02021D08
	cmp r0, #0xb
	cmpne r0, #0xc
	cmpne r0, #0xd
	movne r5, #1
	bne _02021D60
_02021D08:
	tst r1, #0x20
	beq _02021D24
	ldr r0, [r4, #0x7c]
	subs r0, r0, #1
	str r0, [r4, #0x7c]
	movmi r5, #1
	b _02021D60
_02021D24:
	ldrb r0, [r4, #0x9d]
	cmp r0, #0
	beq _02021D50
	mov r0, #0
	strb r0, [r4, #0x9d]
	bl sub_02006220
	mov r0, #0
	bl sub_020063A0
	mov r0, #0
	bl sub_020063D4
	b _02021D60
_02021D50:
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x1c]
	blx r1
	mov r5, r0
_02021D60:
	cmp r5, #0
	bne _02021DB0
	ldrh r0, [r4, #0x60]
	tst r0, #0x20
	bne _02021EC4
	ldr r0, [r4, #0x5c]
	cmp r0, #8
	bne _02021D98
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r3, [r4, #0x50]
	blx r3
	b _02021EC4
_02021D98:
	mvn r1, #0
	ldr r0, [r4, #0x54]
	ldr r3, [r4, #0x50]
	mov r2, r1
	blx r3
	b _02021EC4
_02021DB0:
	ldr r2, [r4, #0x88]
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x4c]
	ldrb r5, [r2]
	blx r1
	ldr r0, [r4, #0x5c]
	cmp r0, #0xb
	moveq r0, #0x10
	streq r0, [r4, #0x5c]
	beq _02021EC4
	cmp r0, #0xc
	moveq r0, #3
	streq r0, [r4, #0x5c]
	beq _02021EC4
	cmp r0, #0xd
	moveq r0, #2
	streq r0, [r4, #0x5c]
	beq _02021EC4
	cmp r5, #0
	cmpne r0, #0xa
	bne _02021E20
	ldrh r0, [r4, #0x60]
	tst r0, #0x200
	movne r0, #0x10
	strne r0, [r4, #0x5c]
	moveq r0, #1
	streq r0, [r4, #0x5c]
	b _02021EC4
_02021E20:
	cmp r0, #9
	bne _02021E84
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	blt _02021E78
	ldr r0, [r4, #4]
	str r0, [r4, #0x94]
	ldr r0, [r4, #0xa0]
	cmp r0, #0
	movne r0, #3
	strne r0, [r4, #0x5c]
	bne _02021EC4
	mov r0, #0xf
	str r0, [r4, #0x5c]
	ldr r0, [r4, #0xc]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x7c]
	b _02021EC4
_02021E78:
	mov r0, #4
	str r0, [r4, #0x5c]
	b _02021EC4
_02021E84:
	mov r0, #4
	str r0, [r4, #0x5c]
	b _02021EC4
_02021E90:
	mov r0, #0x10
	str r0, [r4, #0x5c]
	b _02021EC4
_02021E9C:
	ldr r0, [r4, #0x7c]
	sub r0, r0, #1
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x2c]
	blx r1
	ldr r0, [r4, #0x7c]
	cmp r0, #0
	movle r0, #4
	strle r0, [r4, #0x5c]
_02021EC4:
	ldr r0, [r4, #0x5c]
_02021EC8:
	add sp, sp, #0x84 + ANALYZE_TEXT_STACK_OFFSET
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02021ED0: .word _020999AC
_02021ED4: .word _020997E4
_02021ED8: .word _020999B0
_02021EDC: .word _020999C8
_02021EE0: .word _020999CC
_02021EE4: .word _020999D0
_02021EE8: .word _020999D4
_02021EEC: .word _020999D8
_02021EF0: .word _020999E4
_02021EF4: .word _020999F0
_02021EF8: .word _020999F4
_02021EFC: .word _020999F8
#ifdef EUROPE
_020220C4: .word _02099E64_EU
_020220C8: .word _020B05AC_EU
#endif
_02021F00: .word _020999FC
_02021F04: .word _02099A00
_02021F08: .word _02099A04
_02021F0C: .word _02099A08
_02021F10: .word _020997E4
_02021F14: .word _02099A10
_02021F18: .word _02099A14
_02021F1C: .word _02099A18
_02021F20: .word _02099A1C
_02021F24: .word _02099A24
_02021F28: .word _02099A28
_02021F2C: .word _02099A2C
_02021F30: .word _02099A30
_02021F34: .word _02099A34
_02021F38: .word _02099A38
_02021F3C: .word _02099A40
_02021F40: .word _02099A44
	arm_func_end AnalyzeText

	arm_func_start sub_02021F44
sub_02021F44: ; 0x02021F44
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r1
	mov r0, #0
	ldr r6, _02022020 ; =_02099A24
	ldr r5, _02022024 ; =_020999D4
	ldr r4, _02022028 ; =_02099A00
	str r0, [sb]
	add r7, sp, #0x20
_02021F68:
	mov r0, r7
	bl sub_0202065C
	cmp r0, #0
	beq _02022010
	cmp r0, #0x5b
	bne _02021F68
	ldr r8, [sp, #0x20]
	add r1, r8, #1
	str r1, [sp, #0x20]
_02021F8C:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp, #0x20]
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _02021F8C
	mov r0, r8
	mov r1, r6
	bl StrcmpTag
	cmp r0, #0
	bne _02021FCC
	mov r0, r8
	mov r1, r5
	bl StrcmpTag
	cmp r0, #0
	beq _02021FF0
_02021FCC:
	ldr r0, [sp, #0x20]
	ldrb r0, [r0]
	cmp r0, #0xd
	cmpne r0, #0xa
	ldreq r0, [sp, #0x20]
	addeq r0, r0, #1
	streq r0, [sp, #0x20]
	ldr r0, [sp, #0x20]
	b _02022014
_02021FF0:
	mov r0, r8
	mov r1, r4
	bl StrcmpTag
	cmp r0, #0
	ldrne r0, [sb]
	addne r0, r0, #1
	strne r0, [sb]
	b _02021F68
_02022010:
	mov r0, #0
_02022014:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02022020: .word _02099A24
_02022024: .word _020999D4
_02022028: .word _02099A00
	arm_func_end sub_02021F44

	arm_func_start sub_0202202C
sub_0202202C: ; 0x0202202C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, [r1, #0x14]
	str r0, [sp]
_02022040:
	add r0, sp, #0
	ldr r4, [sp]
	bl sub_0202065C
	cmp r0, #0
	beq _020220F4
	cmp r0, #0x5b
	bne _020220DC
	ldr r4, [sp]
	add r1, r4, #1
	str r1, [sp]
_02022068:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp]
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _02022068
	ldr r1, _02022110 ; =_02099A04
	mov r0, r4
	bl StrcmpTag
	cmp r0, #0
	bne _020220F4
	ldr r1, _02022114 ; =_02099A00
	mov r0, r4
	bl StrcmpTag
	cmp r0, #0
	bne _02022040
	ldr r2, [sp, #0x10]
	mov r0, #0x5b
	add r1, r2, #1
	str r1, [sp, #0x10]
	strb r0, [r2]
_020220BC:
	ldr r1, [sp, #0x10]
	add r0, r1, #1
	str r0, [sp, #0x10]
	ldrb r0, [r4], #1
	strb r0, [r1]
	cmp r0, #0x5d
	bne _020220BC
	b _02022040
_020220DC:
	add r0, sp, #0x10
	add r1, sp, #0
	mov r2, #0
	str r4, [sp]
	bl sub_020206FC
	b _02022040
_020220F4:
	ldr r0, [sp, #0x10]
	mov r1, #0
	strb r1, [r0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02022110: .word _02099A04
_02022114: .word _02099A00
	arm_func_end sub_0202202C

	arm_func_start sub_02022118
sub_02022118: ; 0x02022118
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r1
	mov r7, r2
	mov r4, #0
_0202212C:
	add r0, sp, #0x18
	bl sub_0202065C
	cmp r0, #0
	cmpne r0, #0xd
	cmpne r0, #0xa
	cmpne r0, #0x1b
	beq _020223B4
	cmp r0, #0x5b
	bne _020223A8
	ldr r6, [sp, #0x18]
	ldr r1, _020223C4 ; =_02099A10
	add r2, r6, #1
	mov r0, r6
	str r2, [sp, #0x18]
	mov r5, #0
	bl StrcmpTag
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223C8 ; =_020999F4
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223CC ; =_02099A2C
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223D0 ; =_02099A14
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223D4 ; =_02099A18
	mov r0, r6
	bl StrcmpTag
#ifdef EUROPE
	cmp r0, #0
	bne _020221D8
	ldr r1, _020225D0 ; =_02099E64_EU
	mov r0, r6
	bl StrcmpTag
#endif
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223D8 ; =_02099A08
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _02022324
_020221D8:
	ldr r1, [sp, #0x18]
_020221DC:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp, #0x18]
	ldrb r0, [r0]
	cmp r0, #0x3a
	bne _02022214
	mov r5, r1
_020221F8:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp, #0x18]
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _020221F8
	b _0202221C
_02022214:
	cmp r0, #0x5d
	bne _020221DC
_0202221C:
	ldr r1, _020223C4 ; =_02099A10
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _02022250
	mov r0, r5
	bl sub_02020948
	mvn r1, #0
	cmp r0, r1
	beq _0202212C
	blx r7
	add r4, r4, r0
	b _0202212C
_02022250:
	ldr r1, _020223C8 ; =_020999F4
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _02022280
	mov r0, r5
	bl sub_02020A4C
	cmp r0, #0
	beq _0202212C
	blx r8
	add r4, r4, r0
	b _0202212C
_02022280:
	ldr r1, _020223CC ; =_02099A2C
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _020222A4
	mov r0, r5
	bl AtoiTag
	add r4, r4, r0
	b _0202212C
_020222A4:
	ldr r1, _020223D0 ; =_02099A14
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _020222CC
	mov r0, r5
	bl AtoiTag
	mov r1, #6
	mla r4, r0, r1, r4
	b _0202212C
_020222CC:
	ldr r1, _020223D4 ; =_02099A18
#ifdef EUROPE
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	addne r4, r4, #6
	bne _0202212C
	ldr r1, _020225D0 ; =_02099A08
#endif
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	addne r4, r4, #6
	bne _0202212C
	mov r6, r5
_020222E8:
	ldrb r0, [r6], #1
	cmp r0, #0x3a
	bne _020222E8
	mov r0, r5
	bl AtoiTag
	mov r5, r0
	mov r0, r6
	bl AtoiTag
	ldr r1, _020223DC ; =_020997E4
	mov r2, r5, lsl #1
	mov r5, r0
	ldrh r0, [r1, r2]
	blx r8
	mla r4, r5, r0, r4
	b _0202212C
_02022324:
	ldr r1, [sp, #0x18]
_02022328:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp, #0x18]
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _02022328
	ldrb r0, [r6]
	cmp r0, #0x41
	blo _0202212C
	cmp r0, #0x5a
	bhi _0202212C
	ldr r1, _020223E0 ; =_02099A24
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020223B4
	ldr r1, _020223E4 ; =_020999D4
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020223B4
	ldr r1, _020223E8 ; =_02099A28
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020223B4
	ldr r1, _020223EC ; =_020999F0
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020223B4
	b _0202212C
_020223A8:
	blx r8
	add r4, r4, r0
	b _0202212C
_020223B4:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020223C4: .word _02099A10
_020223C8: .word _020999F4
_020223CC: .word _02099A2C
_020223D0: .word _02099A14
_020223D4: .word _02099A18
#ifdef EUROPE
_020225D0: .word _02099E64_EU
#endif
_020223D8: .word _02099A08
_020223DC: .word _020997E4
_020223E0: .word _02099A24
_020223E4: .word _020999D4
_020223E8: .word _02099A28
_020223EC: .word _020999F0
	arm_func_end sub_02022118

; https://decomp.me/scratch/Qhonx
	arm_func_start PreprocessString
PreprocessString: ; 0x020223F0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c8
	sub sp, sp, #0x400
	ldr sl, [sp, #0x5f0]
	mov r0, #1
	str r0, [sp, #0x10]
	mov r0, r0
	str r0, [sp, #0xc]
	and r0, r3, #0x40
	mov sb, r1
	str r0, [sp, #8]
	and r0, r3, #0x100
	ldr r8, [sp, #0x600]
	add r4, sl, sb
	and fp, r3, #0x2000
	str r0, [sp, #4]
_02022434:
	ldr r1, [sp, #0x5f0]
	cmp r1, r4
	moveq r1, #0
	moveq r0, sb
	streqb r1, [r4, #-1]
	beq _0202357C
	ldr r0, [sp, #0x5f8]
	ldrb r5, [r0]
	cmp r5, #0
	moveq r0, #0
	streqb r0, [r1]
	ldreq r0, [sp, #0x5f0]
	subeq r0, r0, sl
	beq _0202357C
	cmp r5, #0xd
	cmpne r5, #0xa
	bne _02022490
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02023574
	mov r0, #1
	str r0, [sp, #0xc]
	b _02022554
_02022490:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0202251C
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	cmp fp, #0
	beq _02022554
	ldr r1, [r8, #0x4c]
	add r0, sp, #0x1c8
	bl sub_02023B68
	movs r6, r0
	beq _02022554
	ldr r1, _0202346C ; =_02099A5C
	add r0, sp, #0x5f0
	mov r2, r4
	bl sub_02020890
	cmp r0, #0
	moveq r0, sb
	beq _0202357C
	add r0, sp, #0x5f0
	mov r1, r6
	mov r2, r4
	bl sub_02020890
	cmp r0, #0
	moveq r0, sb
	beq _0202357C
	ldr r1, _02023470 ; =_02099A64
	add r0, sp, #0x5f0
	mov r2, r4
	bl sub_02020890
	cmp r0, #0
	bne _02022554
	mov r0, sb
	b _0202357C
_0202251C:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02022554
	mov r0, #0
	cmp fp, #0
	str r0, [sp, #0xc]
	beq _02022554
	ldr r1, _02023474 ; =_02099A70
	add r0, sp, #0x5f0
	mov r2, r4
	bl sub_02020890
	cmp r0, #0
	moveq r0, sb
	beq _0202357C
_02022554:
	cmp r5, #0x5b
	bne _02023454
	ldr r5, [sp, #0x5f8]
	mov r7, #0
	add r0, r5, #1
	str r0, [sp, #0x5f8]
	ldrb r2, [r5, #1]
	cmp r2, #0x61
	blo _0202332C
	cmp r2, #0x7a
	bhi _0202332C
	str r0, [sp, #0xb4]
	mov r6, #1
	add r1, sp, #0xb4
_0202258C:
	mov r2, r0
	add r0, r0, #1
	str r0, [sp, #0x5f8]
	ldrb r2, [r2]
	cmp r2, #0x5d
	beq _020225B4
	cmp r2, #0x3a
	streq r0, [r1, r6, lsl #2]
	addeq r6, r6, #1
	b _0202258C
_020225B4:
	ldr r0, [sp, #0xb4]
	ldrb r1, [r0]
	sub r1, r1, #0x61
	cmp r1, #0x16
	addls pc, pc, r1, lsl #2
	b _020232C8
_020225CC: ; jump table
	b _02022628 ; case 0
	b _020226BC ; case 1
	b _0202274C ; case 2
	b _02022838 ; case 3
	b _02022908 ; case 4
	b _02022994 ; case 5
	b _020229F0 ; case 6
	b _02022AD8 ; case 7
	b _02022B28 ; case 8
	b _020232C8 ; case 9
	b _02022B8C ; case 10
	b _020232C8 ; case 11
	b _02022C64 ; case 12
	b _02022BE4 ; case 13
	b _020232C8 ; case 14
	b _02022D5C ; case 15
	b _020232C8 ; case 16
	b _02022E30 ; case 17
	b _02022EC0 ; case 18
	b _02022FA0 ; case 19
	b _020232C8 ; case 20
	b _0202313C ; case 21
	b _0202323C ; case 22
_02022628:
	ldr r1, _02023478 ; =_02099A74
	bl StrcmpTag
	cmp r0, #0
	beq _02022658
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_0202494C
	mov r7, r0
	b _020232F0
_02022658:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202347C ; =_02099A7C
	bl StrcmpTag
	cmp r0, #0
	beq _02022694
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r2, r8, r0, lsl #2
	ldr r1, [r2, #0x10]
	ldr r2, [r2, #0x24]
	add r0, sp, #0x1c8
	mov r3, #0
	bl sub_020241DC
	mov r7, r0
	b _020232F0
_02022694:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0xd8]
	ldr ip, [r1, #0xd4]
#else
	ldr r2, [r1, #0x50]
	ldr ip, [r1, #0x4c]
#endif
	str r2, [sp, #0xb0]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0xac
	mov r2, r5
	str ip, [sp, #0xac]
	bl Debug_FatalError
_020226BC:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023488 ; =_02099A84
	bl StrcmpTag
	cmp r0, #0
	beq _020226F0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_020238F0
	mov r7, r0
	b _020232F0
_020226F0:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202348C ; =_02099A8C
	bl StrcmpTag
	cmp r0, #0
	beq _02022724
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_02023900
	mov r7, r0
	b _020232F0
_02022724:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r2, [r1, #0xb8]
	ldr ip, [r1, #0xb4]
	str r2, [sp, #0xa8]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0xa4
	mov r2, r5
	str ip, [sp, #0xa4]
	bl Debug_FatalError
_0202274C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023490 ; =_02099A98
	bl StrcmpTag
	cmp r0, #0
	beq _02022774
	ldr r1, [sp, #0xb8]
	add r0, sp, #0x1c8
	bl sub_020240B0
	mov r7, r0
	b _020232F0
_02022774:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023494 ; =_02099AA0
	bl StrcmpTag
	cmp r0, #0
	beq _020227A8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024C18
	mov r7, r0
	b _020232F0
_020227A8:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023498 ; =_02099AA4
	bl StrcmpTag
	cmp r0, #0
	beq _020227D0
	ldr r1, [sp, #0xb8]
	add r0, sp, #0x1c8
	bl sub_02024114
	mov r7, r0
	b _020232F0
_020227D0:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202349C ; =_02099AAC
	bl StrcmpTag
	cmp r0, #0
	beq _020227F8
	ldr r1, [sp, #0xb8]
	add r0, sp, #0x1c8
	bl sub_02024178
	mov r7, r0
	b _020232F0
_020227F8:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234A0 ; =_02099AB8
	bl StrcmpTag
	cmp r0, #0
	ldrne r7, _020234A4 ; =_02099AC0
	bne _020232F0
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r2, [r1, #0xc8]
	ldr ip, [r1, #0xc4]
	str r2, [sp, #0xa0]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x9c
	mov r2, r5
	str ip, [sp, #0x9c]
	bl Debug_FatalError
_02022838:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234A8 ; =_02099AC8
	bl StrcmpTag
	cmp r0, #0
	beq _02022870
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r2, [r0, #0x24]
	ldr r1, _020234AC ; =_02099AD0
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_02022870:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234B0 ; =_02099AD4
	bl StrcmpTag
	cmp r0, #0
	beq _020228A8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r2, [r0, #0x24]
	ldr r1, _020234B4 ; =_02099AE0
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_020228A8:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234B8 ; =_02099AF0
	bl StrcmpTag
	cmp r0, #0
	beq _020228E0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	ldr r2, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_020245D0
	mov r7, r0
	b _020232F0
_020228E0:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0xf8]
	ldr ip, [r1, #0xf4]
#else
	ldr r2, [r1, #0xe0]
	ldr ip, [r1, #0xdc]
#endif
	str r2, [sp, #0x98]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x94
	mov r2, r5
	str ip, [sp, #0x94]
	bl Debug_FatalError
_02022908:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234BC ; =_02099AF8
	bl StrcmpTag
	cmp r0, #0
	beq _02022938
	ldr r1, [r8, #0x34]
	add r0, sp, #0x1c8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_02024E34
	mov r7, r0
	b _020232F0
_02022938:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234C0 ; =_02099B04
	bl StrcmpTag
	cmp r0, #0
	beq _0202296C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_02023910
	mov r7, r0
	b _020232F0
_0202296C:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x110]
	ldr ip, [r1, #0x10c]
#else
	ldr r2, [r1, #0x108]
	ldr ip, [r1, #0x104]
#endif
	str r2, [sp, #0x90]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x8c
	mov r2, r5
	str ip, [sp, #0x8c]
	bl Debug_FatalError
_02022994:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234C4 ; =_02099B10
	bl StrcmpTag
	cmp r0, #0
	beq _020229C8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_02024598
	mov r7, r0
	b _020232F0
_020229C8:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #8]
	ldr ip, [r1, #4]
#else
	ldr r2, [r1, #0x20]
	ldr ip, [r1, #0x1c]
#endif
	str r2, [sp, #0x88]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x84
	mov r2, r5
	str ip, [sp, #0x84]
	bl Debug_FatalError
_020229F0:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234C8 ; =_02099B18
	bl StrcmpTag
	cmp r0, #0
	beq _02022A14
	add r0, sp, #0x1c8
	bl GetBagNameString
	mov r7, r0
	b _020232F0
_02022A14:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234CC ; =_02099B24
	bl StrcmpTag
	cmp r0, #0
	beq _02022A48
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024D7C
	mov r7, r0
	b _020232F0
_02022A48:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234D0 ; =_02099B2C
	bl StrcmpTag
	cmp r0, #0
	beq _02022A7C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_020238D0
	mov r7, r0
	b _020232F0
_02022A7C:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234D4 ; =_02099B34
	bl StrcmpTag
	cmp r0, #0
	beq _02022AB0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_020238E0
	mov r7, r0
	b _020232F0
_02022AB0:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x10]
	ldr ip, [r1, #0xc]
#else
	ldr r2, [r1, #0x18]
	ldr ip, [r1, #0x14]
#endif
	str r2, [sp, #0x80]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x7c
	mov r2, r5
	str ip, [sp, #0x7c]
	bl Debug_FatalError
_02022AD8:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234D8 ; =_02099B40
	bl StrcmpTag
	cmp r0, #0
	beq _02022B00
	add r0, sp, #0x1c8
	mov r1, #0x3c
	bl sub_02023DC0
	mov r7, r0
	b _020232F0
_02022B00:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x20]
	ldr ip, [r1, #0x1c]
#else
	ldr r2, [r1, #0x10]
	ldr ip, [r1, #0xc]
#endif
	str r2, [sp, #0x78]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x74
	mov r2, r5
	str ip, [sp, #0x74]
	bl Debug_FatalError
_02022B28:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234DC ; =_02099B48
	bl StrcmpTag
	cmp r0, #0
	beq _02022B64
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r3, r8, r0, lsl #2
	ldr r1, [r3, #0x10]
	ldr r2, [r3, #0x24]
	ldr r3, [r3, #0x28]
	add r0, sp, #0x1c8
	bl sub_020241DC
	mov r7, r0
	b _020232F0
_02022B64:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r2, [r1, #0x28]
	ldr ip, [r1, #0x24]
	str r2, [sp, #0x70]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x6c
	mov r2, r5
	str ip, [sp, #0x6c]
	bl Debug_FatalError
_02022B8C:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234E0 ; =_02099B50
	bl StrcmpTag
	cmp r0, #0
	beq _02022BBC
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	ldr r1, [r8, r0, lsl #2]
	add r0, sp, #0x1c8
	bl sub_02023920
	mov r7, r0
	b _020232F0
_02022BBC:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x50]
	ldr ip, [r1, #0x4c]
#else
	ldr r2, [r1, #0x40]
	ldr ip, [r1, #0x3c]
#endif
	str r2, [sp, #0x68]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x64
	mov r2, r5
	str ip, [sp, #0x64]
	bl Debug_FatalError
_02022BE4:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234E4 ; =_02099B58
	bl StrcmpTag
	cmp r0, #0
	beq _02022C14
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	ldr r1, [r8, r0, lsl #2]
	add r0, sp, #0x1c8
	bl sub_02023B68
	mov r7, r0
	b _020232F0
_02022C14:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234E8 ; =_02099B60
	bl StrcmpTag
	cmp r0, #0
	beq _02022C3C
	add r0, sp, #0x1c8
	mov r1, #2
	bl GetCurrentTeamNameString
	mov r7, r0
	b _020232F0
_02022C3C:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0xe0]
	ldr ip, [r1, #0xdc]
#else
	ldr r2, [r1, #0xa8]
	ldr ip, [r1, #0xa4]
#endif
	str r2, [sp, #0x60]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x5c
	mov r2, r5
	str ip, [sp, #0x5c]
	bl Debug_FatalError
_02022C64:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234EC ; =_02099B6C
	bl StrcmpTag
	cmp r0, #0
	beq _02022C9C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	ldr r2, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_020242F8
	mov r7, r0
	b _020232F0
_02022C9C:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234F0 ; =_02099B74
	bl StrcmpTag
	cmp r0, #0
	beq _02022CD4
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r2, [r0, #0x24]
	ldr r1, _020234F4 ; =_02099B7C
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_02022CD4:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234F8 ; =_02099B8C
	bl StrcmpTag
	cmp r0, #0
	beq _02022D04
	ldr r1, [r8, #0x34]
	add r0, sp, #0x1c8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl SetStringAccuracy
	mov r7, r0
	b _020232F0
_02022D04:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234FC ; =_02099B9C
	bl StrcmpTag
	cmp r0, #0
	beq _02022D34
	ldr r1, [r8, #0x34]
	add r0, sp, #0x1c8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl SetStringPower
	mov r7, r0
	b _020232F0
_02022D34:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0xd0]
	ldr ip, [r1, #0xcc]
#else
	ldr r2, [r1, #0xc0]
	ldr ip, [r1, #0xbc]
#endif
	str r2, [sp, #0x58]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x54
	mov r2, r5
	str ip, [sp, #0x54]
	bl Debug_FatalError
_02022D5C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023500 ; =_02099BA8
	bl StrcmpTag
	cmp r0, #0
	beq _02022D84
	add r0, sp, #0x1c8
	mov r1, #0x3d
	bl sub_02023DC0
	mov r7, r0
	b _020232F0
_02022D84:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023504 ; =_02099BB0
	bl StrcmpTag
	cmp r0, #0
	beq _02022DAC
	add r0, sp, #0x1c8
	mov r1, #0x3e
	bl sub_02023DC0
	mov r7, r0
	b _020232F0
_02022DAC:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023508 ; =_02099BBC
	bl StrcmpTag
	cmp r0, #0
	beq _02022DD4
	add r0, sp, #0x1c8
	mov r1, #0x3f
	bl sub_02023DC0
	mov r7, r0
	b _020232F0
_02022DD4:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202350C ; =_02099BC4
	bl StrcmpTag
	cmp r0, #0
	beq _02022E08
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024A68
	mov r7, r0
	b _020232F0
_02022E08:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x118]
	ldr ip, [r1, #0x114]
#else
	ldr r2, [r1, #0xf0]
	ldr ip, [r1, #0xec]
#endif
	str r2, [sp, #0x50]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x4c
	mov r2, r5
	str ip, [sp, #0x4c]
	bl Debug_FatalError
_02022E30:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023510 ; =_02099BCC
	bl StrcmpTag
	cmp r0, #0
	beq _02022E64
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl GetRankString
	mov r7, r0
	b _020232F0
_02022E64:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023514 ; =_02099BD4
	bl StrcmpTag
	cmp r0, #0
	beq _02022E98
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024B48
	mov r7, r0
	b _020232F0
_02022E98:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x18]
	ldr ip, [r1, #0x14]
#else
	ldr r2, [r1, #8]
	ldr ip, [r1, #4]
#endif
	str r2, [sp, #0x48]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x44
	mov r2, r5
	str ip, [sp, #0x44]
	bl Debug_FatalError
_02022EC0:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023518 ; =_02099BDC
	bl StrcmpTag
	cmp r0, #0
	beq _02022EF8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	mov r2, #0
	orr r1, r0, #0x50000
	add r0, sp, #0x1c8
	mov r3, r2
	bl sub_020241DC
	mov r7, r0
	b _020232F0
_02022EF8:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202351C ; =_02099BE4
	bl StrcmpTag
	cmp r0, #0
	ldrne r7, [r8, #0x38]
	bne _020232F0
	ldr r0, [sp, #0xb4]
	ldr r1, _02023520 ; =_02099BEC
	bl StrcmpTag
	cmp r0, #0
	beq _02022F40
	cmp r6, #2
	bne _020232F0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r7, [r0, #0x38]
	b _020232F0
_02022F40:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023524 ; =_02099BF4
	bl StrcmpTag
	cmp r0, #0
	beq _02022F78
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r2, [r0, #0x24]
	ldr r1, _02023528 ; =_02099BFC
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_02022F78:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r2, [r1, #0x30]
	ldr ip, [r1, #0x2c]
	str r2, [sp, #0x40]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x3c
	mov r2, r5
	str ip, [sp, #0x3c]
	bl Debug_FatalError
_02022FA0:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202352C ; =_02099C0C
	bl StrcmpTag
	cmp r0, #0
	beq _02022FD4
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024B94
	mov r7, r0
	b _020232F0
_02022FD4:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023530 ; =_02099C14
	bl StrcmpTag
	cmp r0, #0
	beq _02023008
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_020244F4
	mov r7, r0
	b _020232F0
_02023008:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023534 ; =_02099C1C
	bl StrcmpTag
	cmp r0, #0
	beq _0202303C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024D48
	mov r7, r0
	b _020232F0
_0202303C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023538 ; =_02099C24
	bl StrcmpTag
	cmp r0, #0
	beq _02023094
	cmp r6, #1
	bne _0202306C
	add r0, sp, #0x1c8
	mov r1, #0
	bl GetCurrentTeamNameString
	mov r7, r0
	b _020232F0
_0202306C:
	cmp r6, #2
	bne _020232F0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl GetCurrentTeamNameString
	mov r7, r0
	b _020232F0
_02023094:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202353C ; =_02099C2C
	bl StrcmpTag
	cmp r0, #0
	beq _02023114
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r5, [r0, #0x24]
	mov r1, #0xe10
	mov r0, r5
	bl _u32_div_f
	mov r6, r0
	mov r0, r5
	mov r1, #0xe10
	bl _u32_div_f
	mov r5, r1
	mov r0, r5
	mov r1, #0x3c
	bl _u32_div_f
	mov r7, r0
	mov r0, r5
	mov r1, #0x3c
	bl _u32_div_f
	str r1, [sp]
	ldr r1, _02023540 ; =_02099C34
	mov r2, r6
	mov r3, r7
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_02023114:
	ldr r0, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r1, [r0, #0xa0]
	ldr r2, [r0, #0x9c]
#else
	ldr r1, [r0, #0xb0]
	ldr r2, [r0, #0xac]
#endif
	str r1, [sp, #0x38]
	str r2, [sp, #0x34]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x34
	mov r2, r5
	bl Debug_FatalError
_0202313C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023544 ; =_02099C44
	bl StrcmpTag
	cmp r0, #0
	beq _02023180
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	mov r5, r0
	ldr r0, [sp, #0xbc]
	bl AtoiTag
	add r1, r8, r5, lsl #2
	mov r2, r0
	ldr r1, [r1, #0x24]
	add r0, sp, #0x1c8
	bl sub_0202372C
	mov r7, r0
	b _020232F0
_02023180:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023548 ; =_02099C4C
	bl StrcmpTag
	cmp r0, #0
	beq _020231D8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	mov r5, r0
	ldr r0, [sp, #0xbc]
	bl AtoiTag
	add r1, r8, r5, lsl #2
	ldr r3, [r1, #0x24]
	mov r2, r0
	ldr r1, _0202354C ; =_02099C54
	add r0, sp, #0xc8
	bl SprintfStatic__02023590
	ldr r1, _02023550 ; =_02099C5C
	add r0, sp, #0x1c8
	add r2, sp, #0xc8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_020231D8:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023554 ; =_02099C68
	bl StrcmpTag
	cmp r0, #0
	beq _02023214
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r2, r8, r0, lsl #2
	ldr r1, [r2, #0x10]
	ldr r2, [r2, #0x24]
	add r0, sp, #0x1c8
	mov r3, #0
	bl sub_020241DC
	mov r7, r0
	b _020232F0
_02023214:
	ldr r0, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r1, [r0, #0xc0]
	ldr r2, [r0, #0xbc]
#else
	ldr r1, [r0, #0xd0]
	ldr r2, [r0, #0xcc]
#endif
	str r1, [sp, #0x30]
	str r2, [sp, #0x2c]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x2c
	mov r2, r5
	bl Debug_FatalError
_0202323C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023558 ; =_02099C70
	bl StrcmpTag
	cmp r0, #0
	beq _0202326C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	ldr r1, [r8, r0, lsl #2]
	add r0, sp, #0x1c8
	bl sub_02024AA8
	mov r7, r0
	b _020232F0
_0202326C:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202355C ; =_02099C78
	bl StrcmpTag
	cmp r0, #0
	beq _020232A0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024BD8
	mov r7, r0
	b _020232F0
_020232A0:
	ldr r0, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r1, [r0, #0x38]
	ldr r2, [r0, #0x34]
	str r1, [sp, #0x28]
	str r2, [sp, #0x24]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x24
	mov r2, r5
	bl Debug_FatalError
_020232C8:
	ldr r0, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r1, [r0, #0xa8]
	ldr r2, [r0, #0xa4]
#else
	ldr r1, [r0, #0xd8]
	ldr r2, [r0, #0xd4]
#endif
	str r1, [sp, #0x20]
	str r2, [sp, #0x1c]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x1c
	mov r2, r5
	bl Debug_FatalError
_020232F0:
	cmp r7, #0
	beq _02022434
_020232F8:
	ldr r2, [sp, #0x5f0]
	cmp r2, r4
	moveq r1, #0
	moveq r0, sb
	streqb r1, [r4, #-1]
	beq _0202357C
	ldrb r1, [r7], #1
	cmp r1, #0
	beq _02022434
	add r0, r2, #1
	str r0, [sp, #0x5f0]
	strb r1, [r2]
	b _020232F8
_0202332C:
	cmp r2, #0x41
	blo _0202342C
	cmp r2, #0x5a
	bhi _0202342C
	ldr r1, _02023560 ; =_02099A24
	add r0, r5, #1
	bl StrcmpTag
	cmp r0, #0
	bne _02023364
	ldr r1, _02023564 ; =_020999D4
	add r0, r5, #1
	bl StrcmpTag
	cmp r0, #0
	beq _02023390
_02023364:
	ldr r0, [sp, #0x5f8]
	ldrb r0, [r0]
	cmp r0, #0xd
	cmpne r0, #0xa
	ldreq r0, [sp, #0x5f8]
	addeq r0, r0, #1
	streq r0, [sp, #0x5f8]
	mov r0, #1
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	b _020233D8
_02023390:
	ldr r1, _02023568 ; =_02099A28
	add r0, r5, #1
	bl StrcmpTag
	cmp r0, #0
	beq _020233BC
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02023574
	mov r0, #1
	str r0, [sp, #0xc]
	b _020233D8
_020233BC:
	ldr r1, _0202356C ; =_02099A04
	add r0, r5, #1
	bl StrcmpTag
	cmp r0, #0
	ldrne r0, [sp, #4]
	cmpne r0, #0
	bne _02023574
_020233D8:
	ldr r2, [sp, #0x5f0]
	mov r0, #0x5b
	add r1, r2, #1
	str r1, [sp, #0x5f0]
	strb r0, [r2]
_020233EC:
	ldr r3, [sp, #0x5f0]
	cmp r3, r4
	moveq r1, #0
	moveq r0, sb
	streqb r1, [r4, #-1]
	beq _0202357C
	ldr r2, [sp, #0x5f8]
	add r0, r3, #1
	add r1, r2, #1
	str r1, [sp, #0x5f8]
	ldrb r1, [r2]
	str r0, [sp, #0x5f0]
	strb r1, [r3]
	cmp r1, #0x5d
	beq _02022434
	b _020233EC
_0202342C:
	ldr r1, _02023480 ; =_020997E4
	add r0, sp, #0x14
#ifdef EUROPE
	ldr r3, [r1, #0xb0]
	ldr r1, [r1, #0xac]
#else
	ldr r3, [r1, #0x110]
	ldr r1, [r1, #0x10c]
#endif
	str r3, [sp, #0x18]
	str r1, [sp, #0x14]
	ldr r1, _02023570 ; =_02099C84
	mov r3, r2
	str r5, [sp]
	bl Debug_FatalError
_02023454:
	add r1, sp, #0x500
	add r0, sp, #0x5f0
	add r1, r1, #0xf8
	mov r2, r4
	bl sub_020206FC
	b _02022434
	.align 2, 0
_0202346C: .word _02099A5C
_02023470: .word _02099A64
_02023474: .word _02099A70
_02023478: .word _02099A74
_0202347C: .word _02099A7C
_02023480: .word _020997E4
_02023484: .word _020999B0
_02023488: .word _02099A84
_0202348C: .word _02099A8C
_02023490: .word _02099A98
_02023494: .word _02099AA0
_02023498: .word _02099AA4
_0202349C: .word _02099AAC
_020234A0: .word _02099AB8
_020234A4: .word _02099AC0
_020234A8: .word _02099AC8
_020234AC: .word _02099AD0
_020234B0: .word _02099AD4
_020234B4: .word _02099AE0
_020234B8: .word _02099AF0
_020234BC: .word _02099AF8
_020234C0: .word _02099B04
_020234C4: .word _02099B10
_020234C8: .word _02099B18
_020234CC: .word _02099B24
_020234D0: .word _02099B2C
_020234D4: .word _02099B34
_020234D8: .word _02099B40
_020234DC: .word _02099B48
_020234E0: .word _02099B50
_020234E4: .word _02099B58
_020234E8: .word _02099B60
_020234EC: .word _02099B6C
_020234F0: .word _02099B74
_020234F4: .word _02099B7C
_020234F8: .word _02099B8C
_020234FC: .word _02099B9C
_02023500: .word _02099BA8
_02023504: .word _02099BB0
_02023508: .word _02099BBC
_0202350C: .word _02099BC4
_02023510: .word _02099BCC
_02023514: .word _02099BD4
_02023518: .word _02099BDC
_0202351C: .word _02099BE4
_02023520: .word _02099BEC
_02023524: .word _02099BF4
_02023528: .word _02099BFC
_0202352C: .word _02099C0C
_02023530: .word _02099C14
_02023534: .word _02099C1C
_02023538: .word _02099C24
_0202353C: .word _02099C2C
_02023540: .word _02099C34
_02023544: .word _02099C44
_02023548: .word _02099C4C
_0202354C: .word _02099C54
_02023550: .word _02099C5C
_02023554: .word _02099C68
_02023558: .word _02099C70
_0202355C: .word _02099C78
_02023560: .word _02099A24
_02023564: .word _020999D4
_02023568: .word _02099A28
_0202356C: .word _02099A04
_02023570: .word _02099C84
_02023574:
	ldr r0, [sp, #0x5f0]
	sub r0, r0, sl
_0202357C:
	add sp, sp, #0x1c8
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end PreprocessString

	arm_func_start SprintfStatic__02023590
SprintfStatic__02023590: ; 0x02023590
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__02023590

	arm_func_start PreprocessStringFromId
PreprocessStringFromId: ; 0x020235B8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov r0, r2
	mov r5, r1
	mov r4, r3
	bl StringFromId
	ldr ip, [sp, #0x18]
	mov r2, r0
	mov r0, r6
	mov r1, r5
	mov r3, r4
	str ip, [sp]
	bl PreprocessString
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end PreprocessStringFromId

	arm_func_start StrcmpTagVeneer
StrcmpTagVeneer: ; 0x020235F8
	ldr ip, _02023600 ; =StrcmpTag
	bx ip
	.align 2, 0
_02023600: .word StrcmpTag
	arm_func_end StrcmpTagVeneer

	arm_func_start AtoiTagVeneer
AtoiTagVeneer: ; 0x02023604
	ldr ip, _0202360C ; =AtoiTag
	bx ip
	.align 2, 0
_0202360C: .word AtoiTag
	arm_func_end AtoiTagVeneer

#ifdef EUROPE
	arm_func_start sub_0202380C_EU
sub_0202380C_EU: ; 0x0202380C
	ldr ip, _02023814 ; =sub_02020A4C
	bx ip
	.align 2, 0
_02023814: .word sub_02020A4C
	arm_func_end sub_0202380C_EU
#endif

	arm_func_start sub_02023610
sub_02023610: ; 0x02023610
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
#ifdef EUROPE
	bl GetLanguageType
	cmp r0, #5
	moveq r1, #1
	ldr r0, _02023864 ; =_020B05BC_EU
	movne r1, #0
#endif
	ldr r6, _02023644 ; =_022A5048
	ldr r5, _02023648 ; =_02099CA0
	mov r7, #0
#ifdef EUROPE
	strb r1, [r0]
#endif
	mov r4, #1
_02023624:
	mov r2, r4
	add r0, r6, r7, lsl #2
	add r1, r5, r7
	bl StrncpySimpleNoPadSafe
	add r7, r7, #1
	cmp r7, #3
	blt _02023624
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef EUROPE
_02023864: .word _020B05BC_EU
#endif
_02023644: .word _022A5048
_02023648: .word _02099CA0
	arm_func_end sub_02023610

	arm_func_start sub_0202364C
sub_0202364C: ; 0x02023610
	ldrb r2, [r1], #1
	ldrb r3, [r0], #1
	cmp r2, #0
	bne _02023674
	cmp r3, #0
	cmpne r3, #0x3a
	cmpne r3, #0x5d
	moveq r0, #1
	movne r0, #0
	bx lr
_02023674:
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	cmp r3, r2
	beq sub_0202364C
	mov r0, #0
	bx lr
	arm_func_end sub_0202364C

	arm_func_start InitPreprocessorArgs
InitPreprocessorArgs: ; 0x02023690
	mov r1, #0x60000
	str r1, [r0, #0x4c]
	mov r1, #0
	mov r3, r1
_020236A0:
	str r3, [r0, r1, lsl #2]
	add r1, r1, #1
	cmp r1, #4
	blt _020236A0
	mov r2, #0
_020236B4:
	add r1, r0, r3, lsl #2
	add r3, r3, #1
	str r2, [r1, #0x10]
	cmp r3, #5
	blt _020236B4
	mov r3, #0
_020236CC:
	add r1, r0, r2, lsl #2
	add r2, r2, #1
	str r3, [r1, #0x24]
	cmp r2, #5
	blt _020236CC
	mov r2, #0
_020236E4:
	add r1, r0, r3, lsl #2
	add r3, r3, #1
	str r2, [r1, #0x38]
	cmp r3, #5
	blt _020236E4
	bx lr
	arm_func_end InitPreprocessorArgs

	arm_func_start sub_020236FC
sub_020236FC: ; 0x020236FC
	stmdb sp!, {r4, lr}
	movs lr, r1
	mov r4, r0
	beq _02023724
	mov ip, #5
_02023710:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02023710
	ldmia sp!, {r4, pc}
_02023724:
	bl InitPreprocessorArgs
	ldmia sp!, {r4, pc}
	arm_func_end sub_020236FC

	arm_func_start sub_0202372C
sub_0202372C: ; 0x0202372C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x100
	mov r3, r1
	mov r5, r0
	mov r4, r2
	ldr r1, _02023784 ; =_02099D0C
	add r0, sp, #0
	mov r2, r3
	bl SprintfStatic__0202378C
	add r0, sp, #0
	bl strlen
	mov r2, r0
	cmp r2, r4
	movgt r4, r2
	ldr r1, _02023788 ; =_02099D10
	add r3, sp, #0
	mov r0, r5
	sub r2, r4, r2
	bl SprintfStatic__0202378C
	mov r0, r5
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef EUROPE
_02023784: .word _0209A230_EU
#else
_02023784: .word _02099D0C
#endif
_02023788: .word _02099D10
	arm_func_end sub_0202372C

	arm_func_start SprintfStatic__0202378C
SprintfStatic__0202378C: ; 0x0202378C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__0202378C

	arm_func_start sub_020237B4
sub_020237B4: ; 0x020237B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x100
#ifdef EUROPE
	mov r4, r1
	mov r8, r0
	mov r7, r2
	ldr r1, _020238C8 ; =_02099D0C
	add r0, sp, #0
	mov r2, r4
	mov r6, r3
	bl SprintfStatic__0202378C
	add r0, sp, #0
	bl strlen
	mov r5, r0
	sub r0, r5, #1
	mov r1, #3
	bl _s32_div_f
	mov r4, r0
	cmp r7, #0
	ble _02023A38
	cmp r5, r7
	movgt r7, r5
	sub r0, r7, #1
	mov r1, #3
	bl _s32_div_f
_02023A38:
	ldr r1, _02023B14 ; =_020B05BC_EU
	ldrb r1, [r1]
	cmp r1, #0
	beq _02023A50
	cmp r5, #4
	movle r4, #0
_02023A50:
	cmp r4, #0
	ble _02023AD0
	add r2, sp, #0
	sub r1, r5, #1
	add sb, r2, r1
	mov lr, #0
	add sl, sb, r4, lsl #2
	mov ip, lr
	strb lr, [sl, #1]
	mov r3, #0x5d
	mov r2, #0x50
	mov fp, #0x5b
	b _02023AC8
_02023A84:
	cmp lr, #3
	blt _02023AB8
	strb r3, [sl]
	cmp r6, #0
	movne r1, #0x47
	strb r2, [sl, #-1]
	moveq r1, #0x4d
	strb r1, [sl, #-2]
	strb fp, [sl, #-3]
	sub sl, sl, #4
	cmp sl, sb
	beq _02023AD0
	mov lr, #0
_02023AB8:
	ldrb r1, [sb], #-1
	add lr, lr, #1
	add ip, ip, #1
	strb r1, [sl], #-1
_02023AC8:
	cmp ip, r5
	blt _02023A84
_02023AD0:
	cmp r7, #0
	ble _02023AF8
	sub r1, r7, r5
	add r2, r0, r1
	ldr r1, _020238CC ; =_02099D10
	add r3, sp, #0
	mov r0, r8
	sub r2, r2, r4
	bl SprintfStatic__0202378C
	b _02023B04
_02023AF8:
	add r1, sp, #0
	mov r0, r8
	bl strcpy
_02023B04:
	mov r0, r8
#else
	mov r3, r1
	mov r7, r0
	mov r6, r2
	ldr r1, _020238C8 ; =_02099D0C
	add r0, sp, #0
	mov r2, r3
	bl SprintfStatic__0202378C
	add r0, sp, #0
	bl strlen
	mov r5, r0
	sub r0, r5, #1
	mov r1, #3
	bl _s32_div_f
	mov r4, r0
	cmp r6, #0
	ble _02023810
	cmp r5, r6
	movgt r6, r5
	sub r0, r6, #1
	mov r1, #3
	bl _s32_div_f
_02023810:
	cmp r4, #0
	ble _02023888
	add r2, sp, #0
	sub r1, r5, #1
	add sb, r2, r1
	mov r8, #0
	add sl, sb, r4, lsl #2
	mov lr, r8
	strb r8, [sl, #1]
	mov ip, #0x5d
	mov r3, #0x50
	mov r2, #0x4d
	mov fp, #0x5b
	b _02023880
_02023848:
	cmp r8, #3
	blt _02023870
	strb ip, [sl]
	strb r3, [sl, #-1]
	strb r2, [sl, #-2]
	strb fp, [sl, #-3]
	sub sl, sl, #4
	cmp sl, sb
	beq _02023888
	mov r8, #0
_02023870:
	ldrb r1, [sb], #-1
	add r8, r8, #1
	add lr, lr, #1
	strb r1, [sl], #-1
_02023880:
	cmp lr, r5
	blt _02023848
_02023888:
	cmp r6, #0
	ble _020238B0
	sub r1, r6, r5
	add r2, r0, r1
	ldr r1, _020238CC ; =_02099D10
	add r3, sp, #0
	mov r0, r7
	sub r2, r2, r4
	bl SprintfStatic__0202378C
	b _020238BC
_020238B0:
	add r1, sp, #0
	mov r0, r7
	bl strcpy
_020238BC:
	mov r0, r7
#endif
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef EUROPE
_020238C8: .word _0209A230_EU
_02023B14: .word _020B05BC_EU
#else
_020238C8: .word _02099D0C
#endif
_020238CC: .word _02099D10
	arm_func_end sub_020237B4

	arm_func_start sub_020238D0
sub_020238D0: ; 0x020238D0
	ldr ip, _020238DC ; =sub_020237B4
	mov r2, #5
#ifdef EUROPE
	mov r3, #1
#endif
	bx ip
	.align 2, 0
_020238DC: .word sub_020237B4
	arm_func_end sub_020238D0

	arm_func_start sub_020238E0
sub_020238E0: ; 0x020238E0
	ldr ip, _020238EC ; =sub_020237B4
	mov r2, #0
#ifdef EUROPE
	mov r3, #1
#endif
	bx ip
	.align 2, 0
_020238EC: .word sub_020237B4
	arm_func_end sub_020238E0

	arm_func_start sub_020238F0
sub_020238F0: ; 0x020238F0
	ldr ip, _020238FC ; =sub_020237B4
	mov r2, #7
#ifdef EUROPE
	mov r3, #1
#endif
	bx ip
	.align 2, 0
_020238FC: .word sub_020237B4
	arm_func_end sub_020238F0

	arm_func_start sub_02023900
sub_02023900: ; 0x02023900
	ldr ip, _0202390C ; =sub_020237B4
	mov r2, #0
#ifdef EUROPE
	mov r3, #1
#endif
	bx ip
	.align 2, 0
_0202390C: .word sub_020237B4
	arm_func_end sub_02023900

	arm_func_start sub_02023910
sub_02023910: ; 0x02023910
	ldr ip, _0202391C ; =sub_020237B4
	mov r2, #0
#ifdef EUROPE
	mov r3, r2
#endif
	bx ip
	.align 2, 0
_0202391C: .word sub_020237B4
	arm_func_end sub_02023910

	arm_func_start sub_02023920
sub_02023920: ; 0x02023920
	stmdb sp!, {r3, r4, r5, lr}
	mov r2, r1, lsl #0x10
	and r1, r1, #0xf0000
	mov r5, r0
	cmp r1, #0x40000
	mov r4, r2, lsr #0x10
	bgt _02023978
	cmp r1, #0x40000
	bge _02023B44
	cmp r1, #0x10000
	bgt _0202395C
	bge _02023A30
	cmp r1, #0
	beq _020239AC
	b _02023B44
_0202395C:
	cmp r1, #0x20000
	bgt _0202396C
	beq _02023A40
	b _02023B44
_0202396C:
	cmp r1, #0x30000
	beq _02023A8C
	b _02023B44
_02023978:
	cmp r1, #0x70000
	bgt _02023990
	bge _02023B3C
	cmp r1, #0x60000
	beq _02023B34
	b _02023B44
_02023990:
	cmp r1, #0x80000
	bgt _020239A0
	beq _020239D0
	b _02023B44
_020239A0:
	cmp r1, #0x90000
	beq _02023AE0
	b _02023B44
_020239AC:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B4C ; =_02099D1C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_020239D0:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B4C ; =_02099D1C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetMonsterGender
	cmp r0, #1
	beq _02023A0C
	cmp r0, #2
	beq _02023A1C
	b _02023A28
_02023A0C:
	ldr r1, _02023B50 ; =_022A5048
	mov r0, r5
	bl strcat
	b _02023A28
_02023A1C:
	ldr r1, _02023B54 ; =_022A504C
	mov r0, r5
	bl strcat
_02023A28:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_02023A30:
	mov r1, r4, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_02023D64
	ldmia sp!, {r3, r4, r5, pc}
_02023A40:
	mov r0, #0x44
	mul r1, r4, r0
	ldr r0, _02023B58 ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r0]
	ldrb r0, [r2, r1]
	add r1, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023B44
	ldrsh r0, [r1, #4]
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B4C ; =_02099D1C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_02023A8C:
	ldr r1, _02023B58 ; =TEAM_MEMBER_TABLE_PTR
	mov r0, #0x68
	ldr r2, [r1]
	mul r1, r4, r0
	add r0, r2, #0x9000
	ldr r2, [r0, #0x84c]
	ldrb r0, [r2, r1]
	add r1, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023B44
	ldrsh r0, [r1, #0xc]
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B4C ; =_02099D1C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_02023AE0:
	mov r0, #0x44
	ldr r1, _02023B58 ; =TEAM_MEMBER_TABLE_PTR
	mul r2, r4, r0
	ldr r0, [r1]
	add r0, r0, #0x98
	add r1, r0, #0x9800
	ldrb r0, [r1, r2]
	add r1, r1, r2
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023B44
	ldrsh r0, [r1, #4]
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B5C ; =_02099D2C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_02023B34:
	ldr r0, _02023B60 ; =_02099D3C
	ldmia sp!, {r3, r4, r5, pc}
_02023B3C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02023B44:
	ldr r0, _02023B64 ; =_02099D50
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02023B4C: .word _02099D1C
_02023B50: .word _022A5048
_02023B54: .word _022A504C
_02023B58: .word TEAM_MEMBER_TABLE_PTR
_02023B5C: .word _02099D2C
_02023B60: .word _02099D3C
_02023B64: .word _02099D50
	arm_func_end sub_02023920

	arm_func_start sub_02023B68
sub_02023B68: ; 0x02023B68
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x40
	mov r2, r1, lsl #0x10
	and r1, r1, #0xf0000
	mov r5, r0
	cmp r1, #0x30000
	mov r4, r2, lsr #0x10
	bgt _02023BB4
	cmp r1, #0x30000
	bge _02023C90
	cmp r1, #0x10000
	bgt _02023BA8
	bge _02023C08
	cmp r1, #0
	beq _02023BE4
	b _02023D40
_02023BA8:
	cmp r1, #0x20000
	beq _02023C18
	b _02023D40
_02023BB4:
	cmp r1, #0x50000
	bgt _02023BC8
	bge _02023D14
	cmp r1, #0x40000
	b _02023D40
_02023BC8:
	cmp r1, #0x60000
	bgt _02023BD8
	beq _02023D30
	b _02023D40
_02023BD8:
	cmp r1, #0x70000
	beq _02023D38
	b _02023D40
_02023BE4:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetNameString
	mov r2, r0
	ldr r1, _02023D4C ; =_02099D2C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	b _02023D44
_02023C08:
	mov r1, r4, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_02023DC0
	b _02023D44
_02023C18:
	mov r0, #0x44
	mul r1, r4, r0
	ldr r0, _02023D50 ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r0]
	ldrb r0, [r2, r1]
	add r1, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023D40
	add r0, sp, #0
	add r1, r1, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_020564B0
	cmp r0, #0
	add r2, sp, #0
	beq _02023C7C
	ldr r1, _02023D54 ; =_02099D54
	mov r0, r5
	bl SprintfStatic__0202378C
	b _02023C88
_02023C7C:
	ldr r1, _02023D58 ; =_02099D64
	mov r0, r5
	bl SprintfStatic__0202378C
_02023C88:
	mov r0, r5
	b _02023D44
_02023C90:
	ldr r1, _02023D50 ; =TEAM_MEMBER_TABLE_PTR
	mov r0, #0x68
	ldr r2, [r1]
	mul r1, r4, r0
	add r0, r2, #0x9000
	ldr r2, [r0, #0x84c]
	ldrb r0, [r2, r1]
	add r4, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023D40
	add r0, sp, #0
	add r1, r4, #0x5e
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	ldrb r0, [r4, #1]
	add r2, sp, #0
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023D00
	ldr r1, _02023D54 ; =_02099D54
	mov r0, r5
	bl SprintfStatic__0202378C
	b _02023D0C
_02023D00:
	ldr r1, _02023D58 ; =_02099D64
	mov r0, r5
	bl SprintfStatic__0202378C
_02023D0C:
	mov r0, r5
	b _02023D44
_02023D14:
	mov r0, r4
	bl sub_02024FB8
	mov r1, r0
	mov r0, r5
	bl strcpy
	mov r0, r5
	b _02023D44
_02023D30:
	ldr r0, _02023D5C ; =_02099D3C
	b _02023D44
_02023D38:
	mov r0, #0
	b _02023D44
_02023D40:
	ldr r0, _02023D60 ; =_02099D50
_02023D44:
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02023D4C: .word _02099D2C
_02023D50: .word TEAM_MEMBER_TABLE_PTR
_02023D54: .word _02099D54
_02023D58: .word _02099D64
_02023D5C: .word _02099D3C
_02023D60: .word _02099D50
	arm_func_end sub_02023B68

	arm_func_start sub_02023D64
sub_02023D64: ; 0x02023D64
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	add r0, sp, #0x14
	add r1, sp, #0
	bl sub_0206549C
	ldrsh r0, [sp]
	cmp r0, #0
	moveq r0, #0
	beq _02023DAC
	ldrsh r0, [sp]
	bl GetNameString
	mov r2, r0
	ldr r1, _02023DBC ; =_02099D1C
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
_02023DAC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02023DBC: .word _02099D1C
	arm_func_end sub_02023D64

	arm_func_start sub_02023DC0
sub_02023DC0: ; 0x02023DC0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x84
	mov r4, r0
	add r0, sp, #0x94
	add r1, sp, #0
	bl sub_0206549C
	ldrsh r0, [sp]
	cmp r0, #0
	moveq r0, #0
	beq _02023F98
	ldrsh r0, [sp, #0x94]
	cmp r0, #0x39
	bne _02023E18
	add r0, sp, #0x42
	bl sub_02065BF0
	ldr r1, _02023FA8 ; =_02099D64
	add r2, sp, #0x42
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
	b _02023F98
_02023E18:
	cmp r0, #0x42
	bne _02023E44
	add r1, sp, #2
	mov r0, #0x3f
	mov r2, #0xa
	bl sub_0204BBB0
	add r0, sp, #0x42
	add r1, sp, #2
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	b _02023F5C
_02023E44:
	cmp r0, #0x43
	bne _02023E70
	add r1, sp, #2
	mov r0, #0x41
	mov r2, #0xa
	bl sub_0204BBB0
	add r0, sp, #0x42
	add r1, sp, #2
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	b _02023F5C
_02023E70:
	bl GetActorMatchingStorageId
	mov r5, r0
	mvn r1, #0
	cmp r5, r1
	beq _02023F2C
	bl GetActiveRosterIndex
	mvn r1, #0
	cmp r0, r1
	beq _02023EB0
	bl GetActiveTeamMember
	mov r1, r0
	add r0, sp, #0x42
	add r1, r1, #0x5e
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	b _02023ECC
_02023EB0:
	mov r0, r5
	bl GetTeamMember
	mov r1, r0
	add r0, sp, #0x42
	add r1, r1, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
_02023ECC:
	ldrsh r0, [sp, #0x94]
	cmp r0, #0
	blt _02023EF4
	cmp r0, #0xa
	bge _02023EF4
	ldr r1, _02023FAC ; =_02099D54
	add r2, sp, #0x42
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02023F24
_02023EF4:
	mov r0, r5
	bl sub_020564B0
	cmp r0, #0
	add r2, sp, #0x42
	beq _02023F18
	ldr r1, _02023FAC ; =_02099D54
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02023F24
_02023F18:
	ldr r1, _02023FA8 ; =_02099D64
	mov r0, r4
	bl SprintfStatic__0202378C
_02023F24:
	mov r0, r4
	b _02023F98
_02023F2C:
	ldrsh r0, [sp, #0x94]
	bl sub_02065B14
	movs r1, r0
	beq _02023F48
	add r0, sp, #0x42
	bl GetStringFromFileVeneer
	b _02023F5C
_02023F48:
	ldrsh r0, [sp]
	bl GetNameString
	mov r1, r0
	add r0, sp, #0x42
	bl strcpy
_02023F5C:
	ldrsh r0, [sp, #0x94]
	cmp r0, #0
	blt _02023F84
	cmp r0, #0xa
	bge _02023F84
	ldr r1, _02023FAC ; =_02099D54
	add r2, sp, #0x42
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02023F94
_02023F84:
	ldr r1, _02023FB0 ; =_02099D2C
	add r2, sp, #0x42
	mov r0, r4
	bl SprintfStatic__0202378C
_02023F94:
	mov r0, r4
_02023F98:
	add sp, sp, #0x84
	ldmia sp!, {r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02023FA8: .word _02099D64
_02023FAC: .word _02099D54
_02023FB0: .word _02099D2C
	arm_func_end sub_02023DC0

	arm_func_start sub_02023FB4
sub_02023FB4: ; 0x02023FB4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x8c
	mov r4, r0
	add r0, sp, #0xa4
	add r1, sp, #0
	bl sub_0206549C
	ldrsh r0, [sp]
	cmp r0, #0
	moveq r0, #0
	beq _02024094
	ldrsh r0, [sp, #0xa4]
	bl GetActorMatchingStorageId
	mov r5, r0
	bl GetTeamMember
	movs r6, r0
	beq _02024014
	add r0, sp, #0x4c
	add r1, r6, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	add r0, sp, #0x4c
	str r0, [sp, #8]
	b _02024020
_02024014:
	ldrsh r0, [sp]
	bl GetNameString
	str r0, [sp, #8]
_02024020:
	add r3, sp, #0xc
	add r0, sp, #4
	add r1, sp, #8
	add r2, sp, #0x4c
	str r3, [sp, #4]
	bl sub_020206FC
	ldr r0, [sp, #4]
	mov r1, #0
	strb r1, [r0]
	cmp r6, #0
	beq _02024080
	mov r0, r5
	bl sub_020564B0
	cmp r0, #0
	add r2, sp, #0xc
	beq _02024070
	ldr r1, _020240A4 ; =_02099D54
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02024090
_02024070:
	ldr r1, _020240A8 ; =_02099D64
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02024090
_02024080:
	ldr r1, _020240AC ; =_02099D2C
	add r2, sp, #0xc
	mov r0, r4
	bl SprintfStatic__0202378C
_02024090:
	mov r0, r4
_02024094:
	add sp, sp, #0x8c
	ldmia sp!, {r3, r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020240A4: .word _02099D54
_020240A8: .word _02099D64
_020240AC: .word _02099D2C
	arm_func_end sub_02023FB4

	arm_func_start sub_020240B0
sub_020240B0: ; 0x020240B0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r5, _0202410C ; =ENTITIES
	mov r6, #0
	ldr r4, _02024110 ; =0x00000182
	b _020240FC
_020240CC:
	ldr r1, [r5, #4]
	mov r0, r7
	bl sub_0202364C
	cmp r0, #0
	beq _020240F4
	mov r1, r6, lsl #0x10
	mov r0, r8
	mov r1, r1, asr #0x10
	bl sub_02023D64
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020240F4:
	add r6, r6, #1
	add r5, r5, #0xc
_020240FC:
	cmp r6, r4
	blt _020240CC
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0202410C: .word ENTITIES
_02024110: .word 0x00000182
	arm_func_end sub_020240B0

	arm_func_start sub_02024114
sub_02024114: ; 0x02024114
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r5, _02024170 ; =ENTITIES
	mov r6, #0
	ldr r4, _02024174 ; =0x00000182
	b _02024160
_02024130:
	ldr r1, [r5, #4]
	mov r0, r7
	bl sub_0202364C
	cmp r0, #0
	beq _02024158
	mov r1, r6, lsl #0x10
	mov r0, r8
	mov r1, r1, asr #0x10
	bl sub_02023DC0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02024158:
	add r6, r6, #1
	add r5, r5, #0xc
_02024160:
	cmp r6, r4
	blt _02024130
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02024170: .word ENTITIES
_02024174: .word 0x00000182
	arm_func_end sub_02024114

	arm_func_start sub_02024178
sub_02024178: ; 0x02024178
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r5, _020241D4 ; =ENTITIES
	mov r6, #0
	ldr r4, _020241D8 ; =0x00000182
	b _020241C4
_02024194:
	ldr r1, [r5, #4]
	mov r0, r7
	bl sub_0202364C
	cmp r0, #0
	beq _020241BC
	mov r1, r6, lsl #0x10
	mov r0, r8
	mov r1, r1, asr #0x10
	bl sub_02023FB4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020241BC:
	add r6, r6, #1
	add r5, r5, #0xc
_020241C4:
	cmp r6, r4
	blt _02024194
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020241D4: .word ENTITIES
_020241D8: .word 0x00000182
	arm_func_end sub_02024178

	arm_func_start sub_020241DC
sub_020241DC: ; 0x020241DC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov ip, r1, lsl #0x10
	and lr, r1, #0x70000
	mov r4, r0
	cmp lr, #0x20000
	mov r5, ip, lsr #0x10
	bgt _02024220
	cmp lr, #0x20000
	bge _020242E0
	cmp lr, #0
	bgt _02024214
	beq _02024240
	b _020242E0
_02024214:
	cmp lr, #0x10000
	beq _0202426C
	b _020242E0
_02024220:
	cmp lr, #0x40000
	bgt _02024234
	bge _0202429C
	cmp lr, #0x30000
	b _020242E0
_02024234:
	cmp lr, #0x50000
	beq _020242AC
	b _020242E0
_02024240:
	tst r1, #0x80000
	movne r2, #1
	moveq r2, #0
	mov r1, r5, lsl #0x10
	and r3, r2, #0xff
	mov r0, r4
	mov r1, r1, asr #0x10
	mov r2, #1
	bl GetItemNameFormatted
	mov r0, r4
	b _020242E4
_0202426C:
	strh r2, [sp, #0xc]
	mov ip, #0
	strb r3, [sp, #0xa]
	ldr r2, _020242EC ; =_02099CAC
	add r1, sp, #0xa
	strb ip, [sp, #0xb]
	strh r5, [sp, #0xe]
	mov r3, #1
	str ip, [sp]
	bl sub_0200D310
	mov r0, r4
	b _020242E4
_0202429C:
	mov r1, r5
	bl sub_0202507C
	mov r0, r4
	b _020242E4
_020242AC:
	mov r0, r5, lsl #0x10
	add r1, sp, #4
	mov r0, r0, asr #0x10
	bl sub_02065CD8
	mov ip, #0
	ldr r2, _020242F0 ; =_02099CB8
	add r1, sp, #4
	mov r0, r4
	mov r3, #1
	str ip, [sp]
	bl sub_0200D310
	mov r0, r4
	b _020242E4
_020242E0:
	ldr r0, _020242F4 ; =_02099D50
_020242E4:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020242EC: .word _02099CAC
_020242F0: .word _02099CB8
_020242F4: .word _02099D50
	arm_func_end sub_020241DC

	arm_func_start sub_020242F8
sub_020242F8: ; 0x020242F8
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	mov r0, r2, lsr #0x10
	ands r1, r1, #0x30000
	beq _0202431C
	cmp r1, #0x10000
	beq _02024338
	b _02024350
_0202431C:
	bl GetMoveName
	mov r2, r0
	ldr r1, _02024358 ; =_02099D74
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024338:
	bl GetDungeonResultString
	mov r1, r0
	mov r0, r4
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024350:
	ldr r0, _0202435C ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024358: .word _02099D74
_0202435C: .word _02099D50
	arm_func_end sub_020242F8

	arm_func_start SetStringAccuracy
SetStringAccuracy: ; 0x02024360
#if defined(EUROPE)
#define SET_STRING_ACCURACY_OFFSET 2
#elif defined(JAPAN)
#define SET_STRING_ACCURACY_OFFSET 0x17FD
#else
#define SET_STRING_ACCURACY_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02024410 ; =0x000027A2
	mov r4, r0
	cmp r1, r2
	blo _02024408
	ldr r0, _02024414 ; =0x000029C1
	cmp r1, r0
	bhs _02024408
	rsb r0, r2, #0
	add r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl GetMoveActualAccuracy
	mov r6, #1
	mov r3, #0
	ldr r2, _02024418 ; =MOVE_ACCURACY_STARS_TABLE
	b _020243B8
_020243A4:
	ldr r1, [r2, r3, lsl #2]
	cmp r0, r1
	blt _020243C0
	add r6, r6, #1
	add r3, r3, #1
_020243B8:
	cmp r3, #8
	blt _020243A4
_020243C0:
	cmp r6, #8
	ble _020243D8
	ldr r1, _0202441C ; =0x000027A0
	mov r0, r4
	bl GetStringFromFileVeneer
	b _02024400
_020243D8:
	mov r7, #0
	strb r7, [r4]
	ldr r5, _02024420 ; =_02099D84
	b _020243F8
_020243E8:
	mov r0, r4
	mov r1, r5
	bl strcat
	add r7, r7, #1
_020243F8:
	cmp r7, r6
	blt _020243E8
_02024400:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02024408:
	ldr r0, _02024424 ; =_02099D50
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02024410: .word 0x000027A2 + SET_STRING_ACCURACY_OFFSET
_02024414: .word 0x000029C1 + SET_STRING_ACCURACY_OFFSET
_02024418: .word MOVE_ACCURACY_STARS_TABLE
_0202441C: .word 0x000027A0 + SET_STRING_ACCURACY_OFFSET
_02024420: .word _02099D84
_02024424: .word _02099D50
	arm_func_end SetStringAccuracy

	arm_func_start SetStringPower
SetStringPower: ; 0x02024428
#if defined(EUROPE)
#define SET_STRING_POWER_OFFSET 2
#elif defined(JAPAN)
#define SET_STRING_POWER_OFFSET 0x17FD
#else
#define SET_STRING_POWER_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020244DC ; =0x000027A2
	mov r4, r0
	cmp r1, r2
	blo _020244D4
	ldr r0, _020244E0 ; =0x000029C1
	cmp r1, r0
	bhs _020244D4
	rsb r0, r2, #0
	add r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl GetMoveBasePowerFromId
	mov r3, #0
	mov r5, r3
	ldr r2, _020244E4 ; =MOVE_POWER_STARS_TABLE
	b _02024480
_0202446C:
	ldr r1, [r2, r5, lsl #2]
	cmp r0, r1
	blt _02024488
	add r3, r3, #1
	add r5, r5, #1
_02024480:
	cmp r5, #6
	blt _0202446C
_02024488:
	cmp r3, #0
	bne _020244A0
	ldr r1, _020244E8 ; =0x000027A1
	mov r0, r4
	bl GetStringFromFileVeneer
	b _020244CC
_020244A0:
	mov r7, #0
	strb r7, [r4]
	add r5, r3, #2
	ldr r6, _020244EC ; =_02099D84
	b _020244C4
_020244B4:
	mov r0, r4
	mov r1, r6
	bl strcat
	add r7, r7, #1
_020244C4:
	cmp r7, r5
	blt _020244B4
_020244CC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020244D4:
	ldr r0, _020244F0 ; =_02099D50
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020244DC: .word 0x000027A2 + SET_STRING_POWER_OFFSET
_020244E0: .word 0x000029C1 + SET_STRING_POWER_OFFSET
_020244E4: .word MOVE_POWER_STARS_TABLE
_020244E8: .word 0x000027A1 + SET_STRING_POWER_OFFSET
_020244EC: .word _02099D84
_020244F0: .word _02099D50
	arm_func_end SetStringPower

	arm_func_start sub_020244F4
sub_020244F4: ; 0x020244F4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x400
	mov r2, r1, lsl #0x10
	mov r5, r0
	mov r4, r2, lsr #0x10
	ands r0, r1, #0x70000
	beq _0202451C
	cmp r0, #0x10000
	beq _02024564
	b _02024580
_0202451C:
#if defined(EUROPE)
	add r0, r1, #0xc3
	add r0, r0, #0x3400
#elif defined(JAPAN)
	add r0, r1, #0x46
	add r0, r0, #0x4700
#else
	add r0, r1, #0xc1
	add r0, r0, #0x3400
#endif
	mov r1, r0, lsl #0x10
	add r0, sp, #0
	mov r1, r1, lsr #0x10
	bl CopyStringFromId
	cmp r4, #0x11
	add r2, sp, #0
	bne _02024550
	ldr r1, _0202458C ; =_02099D8C
	mov r0, r5
	bl SprintfStatic__0202378C
	b _0202455C
_02024550:
	ldr r1, _02024590 ; =_02099D90
	mov r0, r5
	bl SprintfStatic__0202378C
_0202455C:
	mov r0, r5
	b _02024584
_02024564:
	mov r0, r4
	bl sub_02024FC8
	mov r1, r0
	mov r0, r5
	bl strcpy
	mov r0, r5
	b _02024584
_02024580:
	ldr r0, _02024594 ; =_02099D50
_02024584:
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0202458C: .word _02099D8C
_02024590: .word _02099D90
_02024594: .word _02099D50
	arm_func_end sub_020244F4

	arm_func_start sub_02024598
sub_02024598: ; 0x02024598
#ifdef EUROPE
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	bmi _02024828
	bl GetLanguage
	mov r2, r0
	ldr r1, _0202484C ; =_020B05D4_EU
	mov r0, r5
	ldr r1, [r1, r2, lsl #3]
	mov r2, r4
	bl SprintfStatic__0202378C
	b _02024844
_02024828:
	bl GetLanguage
	mov r2, r0
	ldr r1, _02024850 ; =_020B05D8_EU
	mov r0, r5
	ldr r1, [r1, r2, lsl #3]
	rsb r2, r4, #0
	bl SprintfStatic__0202378C
_02024844:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0202484C: .word _020B05D4_EU
_02024850: .word _020B05D8_EU
#else
	stmdb sp!, {r4, lr}
	movs r2, r1
	mov r4, r0
	bmi _020245B4
	ldr r1, _020245C8 ; =_02099DA0
	bl SprintfStatic__0202378C
	b _020245C0
_020245B4:
	ldr r1, _020245CC ; =_02099DB0
	rsb r2, r2, #0
	bl SprintfStatic__0202378C
_020245C0:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020245C8: .word _02099DA0
_020245CC: .word _02099DB0
#endif
	arm_func_end sub_02024598

#ifdef EUROPE
	arm_func_start sub_02024854_EU
sub_02024854_EU: ; 0x02024854
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x40
	ldr ip, [sp, #0x50]
	mov r6, r0
	mov r5, r1
	mov r4, r3
	cmp ip, #2
	bgt _02024884
	ldr r1, _020248DC ; =_02099DC0
	mov r2, r5
	bl SprintfStatic__0202378C
	b _020248D4
_02024884:
	and r0, r2, #0xff
	bl DungeonGoesUp
	cmp r0, #0
	add r0, sp, #0
	beq _020248B8
	mov r1, r4
	bl sub_02024598
	ldr r1, _020248E0 ; =_0209A2D4_EU
	add r3, sp, #0
	mov r0, r6
	mov r2, r5
	bl SprintfStatic__0202378C
	b _020248D4
_020248B8:
	rsb r1, r4, #0
	bl sub_02024598
	ldr r1, _020248E0 ; =_0209A2D4_EU
	add r3, sp, #0
	mov r0, r6
	mov r2, r5
	bl SprintfStatic__0202378C
_020248D4:
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020248DC: .word _02099DC0
_020248E0: .word _0209A2D4_EU
	arm_func_end sub_02024854_EU
#endif

	arm_func_start sub_020245D0
sub_020245D0: ; 0x020245D0
#ifdef EUROPE
#define SUB_020245D0_STACK_OFFSET 4
#else
#define SUB_020245D0_STACK_OFFSET 0
#endif
#ifdef EUROPE
	stmdb sp!, {r4, r5, r6, r7, lr}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
#endif
	sub sp, sp, #0x80 + SUB_020245D0_STACK_OFFSET
	mov r3, r1, lsl #0x10
	and r1, r1, #0xf0000
	mov r7, r0
	mov r6, r2
	cmp r1, #0x20000
	mov r4, r3, lsr #0x10
	bgt _02024618
	cmp r1, #0x20000
	bge _020246A8
	cmp r1, #0
	bgt _0202460C
	beq _02024634
	b _02024918
_0202460C:
	cmp r1, #0x10000
	beq _02024744
	b _02024918
_02024618:
	cmp r1, #0x30000
	bgt _02024628
	beq _02024668
	b _02024918
_02024628:
	cmp r1, #0x40000
	beq _020248E4
	b _02024918
_02024634:
	mov r0, #0
	mov r2, r0
	and r1, r4, #0xff
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	mov r0, r7
	bl SprintfStatic__0202378C
	mov r0, r7
	b _0202491C
_02024668:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl DungeonSwapIdxToId
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	mov r0, r7
	bl SprintfStatic__0202378C
	mov r0, r7
	b _0202491C
_020246A8:
	and r0, r4, #0xff
	and r1, r6, #0xff
	bl sub_0204F77C
	bl GetNbFloorsPlusOne
	mov r5, r0
	mov r0, #0
	mov r2, r0
	and r1, r4, #0xff
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	cmp r6, #0
	mvnlt r0, #0
	mullt r0, r6, r0
	movlt r6, r0
#ifdef EUROPE
	add r1, sp, #0x44
	mov r0, r7
	mov r2, r4
	mov r3, r6
	str r5, [sp]
	bl sub_02024854_EU
#else
	cmp r5, #2
	bhi _02024704
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40
	mov r0, r7
	bl SprintfStatic__0202378C
	b _0202473C
_02024704:
	and r0, r4, #0xff
	bl DungeonGoesUp
	cmp r0, #0
	add r2, sp, #0x40
	beq _0202472C
	ldr r1, _02024928 ; =_02099DD0
	mov r0, r7
	mov r3, r6
	bl SprintfStatic__0202378C
	b _0202473C
_0202472C:
	ldr r1, _0202492C ; =_02099DEC
	mov r0, r7
	mov r3, r6
	bl SprintfStatic__0202378C
_0202473C:
#endif
	mov r0, r7
	b _0202491C
_02024744:
	and r0, r4, #0xff
	and r1, r6, #0xff
	bl sub_0204F77C
	bl GetNbFloorsPlusOne
	mov r5, r0
	and r1, r4, #0xff
	and r2, r6, #0xff
	mov r0, #1
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	mov r1, #0
	add r0, sp, #0 + SUB_020245D0_STACK_OFFSET
	add r3, sp, #0x40 + SUB_020245D0_STACK_OFFSET
_02024780:
	ldrb r2, [r3, r1]
	cmp r2, #0
	beq _02024888
	strb r2, [r0, r1]
	cmp r2, #0xa
	bne _02024880
	add r1, r1, #1
	mov r2, #0x5b
	strb r2, [r0, r1]
	add r2, r1, #1
	mov r3, #0x43
	strb r3, [r0, r2]
	add r2, r1, #2
	mov r3, #0x4c
	strb r3, [r0, r2]
	add r2, r1, #3
	mov r3, #0x55
	strb r3, [r0, r2]
	add r2, r1, #4
	mov r3, #0x4d
	strb r3, [r0, r2]
	add r2, r1, #5
	mov r3, #0x5f
	strb r3, [r0, r2]
	add r2, r1, #6
	mov r3, #0x53
	strb r3, [r0, r2]
	add r2, r1, #7
	mov r3, #0x45
	strb r3, [r0, r2]
	add r2, r1, #8
	mov r3, #0x54
	strb r3, [r0, r2]
	add r2, r1, #9
	mov r3, #0x3a
	strb r3, [r0, r2]
	add r2, r1, #0xa
	mov r3, #0x38
	strb r3, [r0, r2]
	add r2, r1, #0xb
	mov r3, #0x30
	strb r3, [r0, r2]
	add r2, r1, #0xc
	mov r3, #0x5d
	strb r3, [r0, r2]
	add ip, r1, #0xd
	add r3, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	add r0, sp, #0 + SUB_020245D0_STACK_OFFSET
_02024840:
	ldrb r2, [r3, r1]
	add r1, r1, #1
	strb r2, [r0, ip]
	cmp r2, #0
	add ip, ip, #1
	bne _02024840
	mov r3, #0
	add r2, sp, #0 + SUB_020245D0_STACK_OFFSET
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	b _02024874
_02024868:
	ldrb r1, [r2, r3]
	strb r1, [r0, r3]
	add r3, r3, #1
_02024874:
	cmp r3, ip
	bne _02024868
	b _02024888
_02024880:
	add r1, r1, #1
	b _02024780
_02024888:
#ifdef EUROPE
	add r1, sp, #0x44
	mov r0, r7
	mov r2, r4
	mov r3, r6
	str r5, [sp]
	bl sub_02024854_EU
#else
	cmp r5, #2
	bhi _020248A4
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40
	mov r0, r7
	bl SprintfStatic__0202378C
	b _020248DC
_020248A4:
	and r0, r4, #0xff
	bl DungeonGoesUp
	cmp r0, #0
	add r2, sp, #0x40
	beq _020248CC
	ldr r1, _02024928 ; =_02099DD0
	mov r0, r7
	mov r3, r6
	bl SprintfStatic__0202378C
	b _020248DC
_020248CC:
	ldr r1, _0202492C ; =_02099DEC
	mov r0, r7
	mov r3, r6
	bl SprintfStatic__0202378C
_020248DC:
#endif
	mov r0, r7
	b _0202491C
_020248E4:
	and r1, r4, #0xff
	and r2, r6, #0xff
	mov r0, #0
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	mov r0, r7
	bl SprintfStatic__0202378C
	mov r0, r7
	b _0202491C
_02024918:
	ldr r0, _02024930 ; =_02099D50
_0202491C:
	add sp, sp, #0x80 + SUB_020245D0_STACK_OFFSET
#ifdef EUROPE
	ldmia sp!, {r4, r5, r6, r7, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	.align 2, 0
_02024924: .word _02099DC0
#ifndef EUROPE
_02024928: .word _02099DD0
_0202492C: .word _02099DEC
#endif
_02024930: .word _02099D50
	arm_func_end sub_020245D0

	arm_func_start sub_02024934
sub_02024934: ; 0x02024934
	ldr ip, _02024948 ; =sub_0204F6F8
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bx ip
	.align 2, 0
_02024948: .word sub_0204F6F8
	arm_func_end sub_02024934

	arm_func_start sub_0202494C
sub_0202494C: ; 0x0202494C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x400
	mov r2, r1, lsl #0x10
	and r5, r1, #0xf0000
	mov r6, r0
	cmp r5, #0x20000
	mov r4, r2, lsr #0x10
	bgt _02024990
	cmp r5, #0x20000
	bge _020249F8
	cmp r5, #0
	bgt _02024984
	beq _020249F8
	b _02024A4C
_02024984:
	cmp r5, #0x10000
	beq _020249B0
	b _02024A4C
_02024990:
	cmp r5, #0x40000
	bgt _020249A8
	bge _020249B0
	cmp r5, #0x30000
	beq _020249B0
	b _02024A4C
_020249A8:
	cmp r5, #0x50000
	bne _02024A4C
_020249B0:
	cmp r5, #0x40000
	mov r0, #0
	bne _020249D0
	mov r2, r0
	mov r1, #0x25
	bl LoadScriptVariableValueAtIndex
	mov r4, r0
	b _020249F8
_020249D0:
	cmp r5, #0x50000
	bne _020249EC
	mov r1, #0x25
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	mov r4, r0
	b _020249F8
_020249EC:
	mov r1, #0x20
	bl LoadScriptVariableValue
	mov r4, r0
_020249F8:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_0206A90C
	mov r1, r0
	add r0, sp, #0
	bl GetStringFromFileVeneer
	cmp r5, #0x30000
	cmpne r5, #0x20000
	ldrne r0, _02024A58 ; =0x00000133
	add r2, sp, #0
	cmpne r4, r0
	bne _02024A38
	ldr r1, _02024A5C ; =_02099D8C
	mov r0, r6
	bl SprintfStatic__0202378C
	b _02024A44
_02024A38:
	ldr r1, _02024A60 ; =_02099DC0
	mov r0, r6
	bl SprintfStatic__0202378C
_02024A44:
	mov r0, r6
	b _02024A50
_02024A4C:
	ldr r0, _02024A64 ; =_02099D50
_02024A50:
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02024A58: .word 0x00000133
_02024A5C: .word _02099D8C
_02024A60: .word _02099DC0
_02024A64: .word _02099D50
	arm_func_end sub_0202494C

	arm_func_start sub_02024A68
sub_02024A68: ; 0x02024A68
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r1, r2, lsr #0x10
	bne _02024A9C
#ifdef JAPAN
	add r1, r1, #0xc9
	add r1, r1, #0x200
#else
	add r1, r1, #0x79
	add r1, r1, #0xa00
#endif
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl GetStringFromFileVeneer
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024A9C:
	ldr r0, _02024AA4 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024AA4: .word _02099D50
	arm_func_end sub_02024A68

	arm_func_start sub_02024AA8
sub_02024AA8: ; 0x02024AA8
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024AE8
#ifdef JAPAN
	add r0, r0, #0xf5
	add r0, r0, #0x3e00
#else
	add r0, r0, #0x4d
	add r0, r0, #0xa00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r1, r0
	mov r0, r4
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024AE8:
	ldr r0, _02024AF0 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024AF0: .word _02099D50
	arm_func_end sub_02024AA8

	arm_func_start GetRankString
GetRankString: ; 0x02024AF4
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024B38
#ifdef JAPAN
	add r0, r0, #0x7f
	add r0, r0, #0x300
#else
	add r0, r0, #0x77
	add r0, r0, #0x100
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r2, r0
	ldr r1, _02024B40 ; =_02099E08
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024B38:
	ldr r0, _02024B44 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024B40: .word _02099E08
_02024B44: .word _02099D50
	arm_func_end GetRankString

	arm_func_start sub_02024B48
sub_02024B48: ; 0x02024B48
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024B88
#if defined(EUROPE)
	add r0, r0, #0x71
	add r0, r0, #0x2700
#elif defined(JAPAN)
	add r0, r0, #0x79
	add r0, r0, #0x4900
#else
	add r0, r0, #0x6f
	add r0, r0, #0x2700
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r1, r0
	mov r0, r4
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024B88:
	ldr r0, _02024B90 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024B90: .word _02099D50
	arm_func_end sub_02024B48

	arm_func_start sub_02024B94
sub_02024B94: ; 0x02024B94
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024BCC
	and r0, r0, #0xff
	bl GetTypeStringId
	bl StringFromId
	mov r1, r0
	mov r0, r4
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024BCC:
	ldr r0, _02024BD4 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024BD4: .word _02099D50
	arm_func_end sub_02024B94

	arm_func_start sub_02024BD8
sub_02024BD8: ; 0x02024BD8
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024C0C
	and r0, r0, #0xff
	bl GetIqSkillStringId
	mov r1, r0
	mov r0, r4
	bl GetStringFromFileVeneer
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024C0C:
	ldr r0, _02024C14 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024C14: .word _02099D50
	arm_func_end sub_02024BD8

	arm_func_start sub_02024C18
sub_02024C18: ; 0x02024C18
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x400
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r1, r2, lsr #0x10
	bne _02024C58
	add r0, sp, #0
	and r1, r1, #0xff
	bl GetAbilityString
	ldr r1, _02024C64 ; =_02099D8C
	add r2, sp, #0
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
	b _02024C5C
_02024C58:
	ldr r0, _02024C68 ; =_02099D50
_02024C5C:
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024C64: .word _02099D8C
_02024C68: .word _02099D50
	arm_func_end sub_02024C18

	arm_func_start GetCurrentTeamNameString
GetCurrentTeamNameString: ; 0x02024C6C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x40
	mov r4, r1
	mov r5, r0
	bl GetExecuteSpecialEpisodeType
	cmp r4, #2
	bne _02024C98
	mvn r1, #0
	cmp r0, r1
	moveq r4, #0
	movne r4, #1
_02024C98:
	cmp r4, #0
	beq _02024CAC
	cmp r4, #1
	beq _02024CFC
	b _02024D2C
_02024CAC:
	mvn r1, #0
	cmp r0, r1
	bne _02024CC8
	mov r0, #1
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _02024CE8
_02024CC8:
	add r0, sp, #0
	bl GetMainTeamName
	ldr r1, _02024D38 ; =_02099E08
	add r2, sp, #0
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	b _02024D30
_02024CE8:
	ldr r1, _02024D3C ; =0x00000237
	mov r0, r5
	bl GetStringFromFileVeneer
	mov r0, r5
	b _02024D30
_02024CFC:
	cmp r0, #3
	ldrne r0, _02024D40 ; =_02099D50
	bne _02024D30
	ldr r1, _02024D44 ; =0x00000236
	add r0, sp, #0
	bl GetStringFromFileVeneer
	ldr r1, _02024D38 ; =_02099E08
	add r2, sp, #0
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	b _02024D30
_02024D2C:
	ldr r0, _02024D40 ; =_02099D50
_02024D30:
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02024D38: .word _02099E08
#ifdef JAPAN
_02024D3C: .word 0x000004C8
_02024D40: .word _02099D50
_02024D44: .word 0x000004C7
#else
_02024D3C: .word 0x00000237
_02024D40: .word _02099D50
_02024D44: .word 0x00000236
#endif
	arm_func_end GetCurrentTeamNameString

	arm_func_start sub_02024D48
sub_02024D48: ; 0x02024D48
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r1, r2, lsr #0x10
	bne _02024D70
	and r1, r1, #0xff
	bl sub_02058C30
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024D70:
	ldr r0, _02024D78 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024D78: .word _02099D50
	arm_func_end sub_02024D48

#ifdef EUROPE
	arm_func_start sub_02025010_EU
sub_02025010_EU: ; 0x02025010
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl GetLanguage
	ldr r2, _02025040 ; =_020B05C0_EU
	ldr r1, _02025044 ; =_0209A2F4_EU
	ldr r2, [r2, r0, lsl #2]
	mov r0, r5
	mov r3, r4
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02025040: .word _020B05C0_EU
_02025044: .word _0209A2F4_EU
	arm_func_end sub_02025010_EU
#endif

	arm_func_start sub_02024D7C
sub_02024D7C: ; 0x02024D7C
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	mov r2, r2, lsr #0x10
	ands r0, r1, #0xf0000
	beq _02024DD4
	cmp r0, #0x10000
	bne _02024DEC
	mov r0, r2, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetMonsterGenderVeneer
	cmp r0, #1
	beq _02024DC0
	cmp r0, #2
	beq _02024DC8
	cmp r0, #3
	b _02024DD0
_02024DC0:
	mov r2, #0
	b _02024DD4
_02024DC8:
	mov r2, #1
	b _02024DD4
_02024DD0:
	mov r2, #2
_02024DD4:
	ldr r1, _02024DF4 ; =_022A5048
	mov r0, r4
	add r1, r1, r2, lsl #2
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024DEC:
	ldr r0, _02024DF8 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024DF4: .word _022A5048
_02024DF8: .word _02099D50
	arm_func_end sub_02024D7C

	arm_func_start GetBagNameString
GetBagNameString: ; 0x02024DFC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetCurrentBagCapacity
	cmp r0, #2
	ldrlt r0, _02024E2C ; =0x000008E1
	ldrge r0, _02024E30 ; =0x000008E2
	mov r1, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, lsr #0x10
	bl GetStringFromFileVeneer
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_02024E2C: .word 0x00001D39
_02024E30: .word 0x00001D3A
#else
_02024E2C: .word 0x000008E1
_02024E30: .word 0x000008E2
#endif
	arm_func_end GetBagNameString

	arm_func_start sub_02024E34
sub_02024E34: ; 0x02024E34
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	sub sp, sp, #0x400
	mov sl, r0
	ldr r0, _02024F94 ; =0x000001B1
	mov r4, r1
	bl StringFromId
	str r0, [sp]
	ldr r0, _02024F98 ; =0x000001B2
	bl StringFromId
	ldr r1, _02024F9C ; =0x000029D1
	mov fp, r0
	cmp r4, r1
	blo _02024E94
	ldr r0, _02024FA0 ; =0x00002F49
	cmp r4, r0
	bhs _02024E94
	rsb r0, r1, #0
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemMoveId16
	mov r5, r0
	b _02024E98
_02024E94:
	mov r5, #0
_02024E98:
	mov r0, sl
#ifdef JAPAN
	mov r1, #0x3b8
#else
	mov r1, #0x1b0
#endif
	bl GetStringFromFileVeneer
	ldr r1, _02024FA4 ; =_02099E18
	mov r0, sl
	bl strcat
	cmp r5, #0
	beq _02024F78
	bl GetGameMode
	cmp r0, #1
	ldrls sb, _02024FA8 ; =_02099CA4
	mvn r4, #0
	ldrhi sb, _02024FAC ; =_02099CC4
	b _02024F6C
_02024ED0:
	ldrsh r6, [sb], #2
	mov r0, r6
	bl GetActorMatchingStorageId
	mov r7, r0
	cmp r6, #0x16
	bne _02024EF4
	ldr r1, _02024FA4 ; =_02099E18
	mov r0, sl
	bl strcat
_02024EF4:
	cmp r7, r4
	beq _02024F6C
	mov r0, r7
	bl GetTeamMember
	ldrsh r8, [r0, #4]
	bl sub_0204E530
	cmp r0, #0
	bne _02024F2C
	mov r0, r7
	bl GetActiveRosterIndex
	cmp r0, r4
	beq _02024F2C
	bl GetActiveTeamMember
	ldrsh r8, [r0, #0xc]
_02024F2C:
	add r0, sp, #4
	mov r1, r6
	bl sub_02023DC0
	mov r0, r5
	mov r1, r8
	bl sub_02053D1C
	cmp r0, #0
	ldrne r3, [sp]
	ldr r1, _02024FB0 ; =_02099E20
	moveq r3, fp
	add r0, sp, #0x44
	add r2, sp, #4
	bl SprintfStatic__0202378C
	mov r0, sl
	add r1, sp, #0x44
	bl strcat
_02024F6C:
	ldrsh r0, [sb]
	cmp r0, r4
	bne _02024ED0
_02024F78:
	ldr r1, _02024FB4 ; =_02099E40
	mov r0, sl
	bl strcat
	mov r0, sl
	add sp, sp, #0x44
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_02024F94: .word 0x000003B9
_02024F98: .word 0x000003BA
#else
_02024F94: .word 0x000001B1
_02024F98: .word 0x000001B2
#endif
#if defined(EUROPE)
_02024F9C: .word 0x000029D3
_02024FA0: .word 0x00002F4B
#elif defined(JAPAN)
_02024F9C: .word 0x000041CE
_02024FA0: .word 0x00004746
#else
_02024F9C: .word 0x000029D1
_02024FA0: .word 0x00002F49
#endif
_02024FA4: .word _02099E18
_02024FA8: .word _02099CA4
_02024FAC: .word _02099CC4
_02024FB0: .word _02099E20
_02024FB4: .word _02099E40
	arm_func_end sub_02024E34

	arm_func_start sub_02024FB8
sub_02024FB8: ; 0x02024FB8
	ldr r1, _02024FC4 ; =_022A5468
	add r0, r1, r0, lsl #7
	bx lr
	.align 2, 0
_02024FC4: .word _022A5468
	arm_func_end sub_02024FB8

	arm_func_start sub_02024FC8
sub_02024FC8: ; 0x02024FC8
	ldr r1, _02024FD4 ; =_022A5068
	add r0, r1, r0, lsl #7
	bx lr
	.align 2, 0
_02024FD4: .word _022A5068
	arm_func_end sub_02024FC8

	arm_func_start GetDungeonResultString
GetDungeonResultString: ; 0x02024FD8
	ldr r1, _02024FE4 ; =_022A5268
	add r0, r1, r0, lsl #7
	bx lr
	.align 2, 0
_02024FE4: .word _022A5268
	arm_func_end GetDungeonResultString

	arm_func_start sub_02024FE8
sub_02024FE8: ; 0x02024FE8
	stmdb sp!, {r3, r4, r5, lr}
	cmp r1, #0
	beq _02025030
	mov r3, #0x14
	mul r3, r0, r3
	ldr lr, _02025070 ; =_022A596A
	ldrh r0, [r1]
	ldr ip, _02025074 ; =_022A5969
	add r4, lr, r3
	strh r0, [lr, r3]
	ldrh lr, [r1, #2]
	mov r0, #1
	add r5, ip, r3
	strh lr, [r4, #2]
	ldrh r1, [r1, #4]
	strh r1, [r4, #4]
	strb r0, [ip, r3]
	b _02025048
_02025030:
	mov r1, #0x14
	mul r3, r0, r1
	ldr r1, _02025074 ; =_022A5969
	mov r0, #0
	strb r0, [r1, r3]
	add r5, r1, r3
_02025048:
	cmp r2, #0
	moveq r0, #0
	beq _02025068
	ldr ip, _02025078 ; =_022A5970
	ldmia r2, {r0, r1, r2}
	add r3, ip, r3
	stmia r3, {r0, r1, r2}
	mov r0, #1
_02025068:
	strb r0, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02025070: .word _022A596A
_02025074: .word _022A5969
_02025078: .word _022A5970
	arm_func_end sub_02024FE8

	arm_func_start sub_0202507C
sub_0202507C: ; 0x0202507C
	stmdb sp!, {r3, lr}
	mov r2, #0x14
	mul r3, r1, r2
	ldr r1, _020250D8 ; =_022A5969
	ldrb r1, [r1, r3]
	cmp r1, #0
	beq _020250BC
	ldr r1, _020250DC ; =_022A596A
	ldr r2, _020250E0 ; =_022A5970
	mov ip, #0
	add r1, r1, r3
	add r2, r2, r3
	mov r3, #1
	str ip, [sp]
	bl sub_0200D310
	ldmia sp!, {r3, pc}
_020250BC:
	ldr r1, _020250DC ; =_022A596A
	mov r2, #0
	add r1, r1, r3
	mov r3, #1
	str r2, [sp]
	bl sub_0200D310
	ldmia sp!, {r3, pc}
	.align 2, 0
_020250D8: .word _022A5969
_020250DC: .word _022A596A
_020250E0: .word _022A5970
	arm_func_end sub_0202507C
