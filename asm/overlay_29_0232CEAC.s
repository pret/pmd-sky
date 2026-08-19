	.include "asm/macros.inc"
	.include "overlay_29_0232CEAC.inc"

	.text

	arm_func_start DoMoveEcho
DoMoveEcho: ; 0x0232CEAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov r5, #0
	strb r5, [sp, #0x1c]
	mov r4, r1
	ldr r1, [r4, #0xb4]
	mov r5, r0
	ldrsh r0, [r1, #4]
	mov sb, r2
	mov r6, r3
	bl GetSize
	mov r8, r0
	mov r0, sb
	bl GetMoveType
	mov r7, r0
	ldrh r0, [sb, #4]
	bl GetMoveCategory
	mov r1, r6
	mov r6, r0
	mov r0, sb
	bl GetDamageSourceWrapper
	add r3, sp, #0x1c
	stmia sp, {r3, r7}
	str r6, [sp, #8]
	mov r1, r4
	str r0, [sp, #0xc]
	mov r4, #0
	str r4, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	mov r2, r8
	mov r0, r5
	str r4, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, r4
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DoMoveEcho

	arm_func_start DoMoveFamish
DoMoveFamish: ; 0x0232CF54
	stmdb sp!, {r3, lr}
	ldr r2, _0232CF70 ; =ov10_022C45BC
	mov r3, #0
	ldrsh r2, [r2]
	bl TryDecreaseBelly
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232CF70: .word ov10_022C45BC
	arm_func_end DoMoveFamish
