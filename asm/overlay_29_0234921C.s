	.include "asm/macros.inc"
	.include "overlay_29_0234921C.inc"

	.text

	arm_func_start IsCurrentMissionType
IsCurrentMissionType: ; 0x0234921C
	ldr r1, _0234924C ; =DUNGEON_PTR
	ldr r2, [r1]
	ldrb r1, [r2, #0x760]
	cmp r1, #0
	beq _0234923C
	ldrb r1, [r2, #0x761]
	cmp r1, r0
	beq _02349244
_0234923C:
	mov r0, #0
	bx lr
_02349244:
	mov r0, #1
	bx lr
	.align 2, 0
_0234924C: .word DUNGEON_PTR
	arm_func_end IsCurrentMissionType

	arm_func_start IsCurrentMissionTypeExact
IsCurrentMissionTypeExact: ; 0x02349250
	ldr r2, _02349288 ; =DUNGEON_PTR
	ldr r3, [r2]
	ldrb r2, [r3, #0x760]
	cmp r2, #0
	beq _02349278
	ldrb r2, [r3, #0x761]
	cmp r2, r0
	ldreqb r0, [r3, #0x762]
	cmpeq r0, r1
	beq _02349280
_02349278:
	mov r0, #0
	bx lr
_02349280:
	mov r0, #1
	bx lr
	.align 2, 0
_02349288: .word DUNGEON_PTR
	arm_func_end IsCurrentMissionTypeExact
