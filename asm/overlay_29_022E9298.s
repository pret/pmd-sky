	.include "asm/macros.inc"
	.include "overlay_29_022E9298.inc"

	.text

	arm_func_start ov29_022E9298
ov29_022E9298: ; 0x022E9298
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	mov r7, r2
	bl GetTile
	mov r6, r0
	bl GetVisibilityRange
	cmp r7, #0
	ldrb r2, [r6, #7]
	bne _022E92D0
	cmp r2, #0xff
	bne _022E930C
_022E92D0:
	ldrsh r1, [r5]
	sub r1, r1, r0
	str r1, [r4]
	ldrsh r1, [r5]
	add r1, r1, r0
	add r1, r1, #1
	str r1, [r4, #8]
	ldrsh r1, [r5, #2]
	sub r1, r1, r0
	str r1, [r4, #4]
	ldrsh r1, [r5, #2]
	add r0, r1, r0
	add r0, r0, #1
	str r0, [r4, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022E930C:
	ldr r0, _022E9358 ; =DUNGEON_PTR
	mov r1, #0x1c
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x244
#else
	add r0, r0, #0x2e8
#endif
	add r0, r0, #0xec00
	mla r1, r2, r1, r0
	ldrsh r0, [r1, #2]
	sub r0, r0, #1
	str r0, [r4]
	ldrsh r0, [r1, #6]
	add r0, r0, #2
	str r0, [r4, #8]
	ldrsh r0, [r1, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	ldrsh r0, [r1, #8]
	add r0, r0, #2
	str r0, [r4, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E9358: .word DUNGEON_PTR
	arm_func_end ov29_022E9298
