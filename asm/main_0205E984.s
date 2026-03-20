	.include "asm/macros.inc"
	.include "main_0205E984.inc"

	.text

	arm_func_start sub_0205E984
sub_0205E984: ; 0x0205E984
	ldr r1, _0205E9A4 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	ldrb r0, [r1, r0, lsl #5]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205E9A4: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205E984

	arm_func_start sub_0205E9A8
sub_0205E9A8: ; 0x0205E9A8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r2, [r5, #1]
	mov r4, r1
	cmp r2, #3
	ldreqb r0, [r5, #2]
	cmpeq r0, #3
	bne _0205E9FC
	ldrb r0, [r5, #4]
	bl DungeonSwapIdToIdx
	bl GetDungeonMode
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhs r0, #1
	movlo r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205E9FC:
	ldrb r1, [r4, #1]
	cmp r1, #3
	ldreqb r0, [r4, #2]
	cmpeq r0, #3
	bne _0205EA44
	ldrb r0, [r4, #4]
	bl DungeonSwapIdToIdx
	bl GetDungeonMode
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhi r0, #1
	movls r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205EA44:
	cmp r2, #8
	cmpne r2, #5
	bne _0205EA6C
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhs r0, #1
	movlo r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205EA6C:
	cmp r1, #8
	cmpne r1, #5
	bne _0205EA94
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhi r0, #1
	movls r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205EA94:
	ldrb r1, [r4, #4]
	ldrb r0, [r5, #4]
	mov r2, #1
	cmp r0, r1
	bhi _0205EAC0
	bne _0205EABC
	ldrb r1, [r5, #5]
	ldrb r0, [r4, #5]
	cmp r1, r0
	bhi _0205EAC0
_0205EABC:
	mov r2, #0
_0205EAC0:
	and r0, r2, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205E9A8
