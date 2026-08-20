	.include "asm/macros.inc"
	.include "overlay_29_0232A078.inc"

	.text

	arm_func_start DoMoveNightShade
DoMoveNightShade: ; 0x0232A078
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov r4, #0
	strb r4, [sp, #0x1c]
	mov r6, r0
	mov r4, r2
	ldr r2, [r6, #0xb4]
	mov r0, r4
	mov r5, r1
	mov r7, r3
	ldrb sb, [r2, #0xa]
	bl GetMoveType
	mov r8, r0
	ldrh r0, [r4, #4]
	bl GetMoveCategory
	mov r1, r7
	mov r7, r0
	mov r0, r4
	bl GetDamageSourceWrapper
	add r3, sp, #0x1c
	stmia sp, {r3, r8}
	str r7, [sp, #8]
	str r0, [sp, #0xc]
	mov r4, #0
	str r4, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	mov r1, r5
	mov r2, sb
	mov r0, r6
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
	arm_func_end DoMoveNightShade
