	.include "asm/macros.inc"
	.include "overlay_29_022ECF78.inc"

	.text

	arm_func_start ov29_022ECF78
ov29_022ECF78: ; 0x022ECF78
	ldr r1, _022ECFAC ; =DUNGEON_PTR
	ldr r0, _022ECFB0 ; =0x0002CA66
	ldr r2, [r1]
	ldr r1, _022ECFB4 ; =0x0000027A
	ldrsh r2, [r2, r0]
	cmp r2, r1
	addne r0, r1, #3
	cmpne r2, r0
	addne r0, r1, #1
	cmpne r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_022ECFAC: .word DUNGEON_PTR
#ifdef JAPAN
_022ECFB0: .word 0x0002C9C2
#else
_022ECFB0: .word 0x0002CA66
#endif
_022ECFB4: .word 0x0000027A
	arm_func_end ov29_022ECF78

	arm_func_start ov29_022ECFB8
ov29_022ECFB8: ; 0x022ECFB8
	stmdb sp!, {r4, lr}
	ldr r1, _022ED004 ; =DUNGEON_PTR
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	beq _022ECFF8
#ifdef JAPAN
	add r0, r1, #0x168
#else
	add r0, r1, #0x20c
#endif
	add lr, r0, #0x2c800
	mov ip, #0xe
_022ECFDC:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _022ECFDC
	ldmia lr, {r0, r1}
	stmia r4, {r0, r1}
	ldmia sp!, {r4, pc}
_022ECFF8:
	mov r1, #0xe8
	bl MemZero
	ldmia sp!, {r4, pc}
	.align 2, 0
_022ED004: .word DUNGEON_PTR
	arm_func_end ov29_022ECFB8
