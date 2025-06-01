	.include "asm/macros.inc"
	.include "overlay_29_023383A8.inc"

	.text

	arm_func_start ov29_023383A8
ov29_023383A8: ; 0x023383A8
	ldr ip, _023383B4 ; =LogMessageByIdWithPopupCheckUser
	ldr r1, _023383B8 ; =0x00000D8D
	bx ip
	.align 2, 0
_023383B4: .word LogMessageByIdWithPopupCheckUser
#ifdef JAPAN
_023383B8: .word 0x00000ACD
#else
_023383B8: .word 0x00000D8D
#endif
	arm_func_end ov29_023383A8

	arm_func_start TryActivateGravity
TryActivateGravity: ; 0x023383BC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__02337CA8
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _02338424 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r2, r0, #0x12000
#ifdef JAPAN
	ldrb r0, [r2, #0xa58]
#else
	ldrb r0, [r2, #0xafc]
#endif
	cmp r0, #0
	beq _02338400
	ldr r1, _02338428 ; =0x00000C06
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0
	ldmia sp!, {r4, pc}
_02338400:
	ldr r1, _0233842C ; =0x00000C05
	mov r3, #1
	mov r0, r4
#ifdef JAPAN
	strb r3, [r2, #0xa58]
#else
	strb r3, [r2, #0xafc]
#endif
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r4
	bl ov29_02306D54
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_02338424: .word DUNGEON_PTR
#ifdef JAPAN
_02338428: .word 0x00000945
_0233842C: .word 0x00000944
#else
_02338428: .word 0x00000C06
_0233842C: .word 0x00000C05
#endif
	arm_func_end TryActivateGravity

	arm_func_start ov29_02338430
ov29_02338430: ; 0x02338430
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #1
	bl ov29_022EDEDC
	mov r0, r4
	bl PositionIsOnHiddenStairs
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #1
	bl HiddenStairsTrigger
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02338430

	arm_func_start ov29_0233845C
ov29_0233845C: ; 0x0233845C
	ldr r1, _02338474 ; =DUNGEON_PTR
	ldr r0, _02338478 ; =0x00012AFE
	ldr r1, [r1]
	mov r2, #0
	strh r2, [r1, r0]
	bx lr
	.align 2, 0
_02338474: .word DUNGEON_PTR
#ifdef JAPAN
_02338478: .word 0x00012A5A
#else
_02338478: .word 0x00012AFE
#endif
	arm_func_end ov29_0233845C

	arm_func_start ov29_0233847C
ov29_0233847C: ; 0x0233847C
	stmdb sp!, {r4, lr}
	ldr r1, _023384B8 ; =DUNGEON_PTR
	ldr r0, _023384BC ; =0x00012AFE
	ldr r3, [r1]
	ldrsh r2, [r3, r0]
	add r2, r2, #1
	strh r2, [r3, r0]
	ldr r1, [r1]
	ldrsh r4, [r1, r0]
	bl GetVictoriesOnOneFloor
	cmp r4, r0
	ldmleia sp!, {r4, pc}
	mov r0, r4
	bl SetVictoriesOnOneFloor
	ldmia sp!, {r4, pc}
	.align 2, 0
_023384B8: .word DUNGEON_PTR
#ifdef JAPAN
_023384BC: .word 0x00012A5A
#else
_023384BC: .word 0x00012AFE
#endif
	arm_func_end ov29_0233847C
