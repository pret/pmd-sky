	.include "asm/macros.inc"
	.include "main_0205BFB0.inc"

	.text

	arm_func_start sub_0205BFB0
sub_0205BFB0: ; 0x0205BFB0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050990
	ldr r1, _0205C194 ; =_022B57BC
	add r0, sp, #0
	mov r2, #0x20
	bl CopyBitsTo
	ldr r5, _0205C198 ; =_020B0A54
	mov r7, #0
	add r6, sp, #0
	mov r4, #0xb0
_0205BFEC:
	ldr r1, [r5]
	mov r0, r6
	mla r1, r7, r4, r1
	bl sub_0205C440
	add r7, r7, #1
	cmp r7, #0x20
	blt _0205BFEC
	ldr r1, _0205C198 ; =_020B0A54
	add r0, sp, #0
	ldr r4, [r1, #8]
	mov r2, #4
	mov r1, r4
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #1
	mov r2, #7
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #2
	bl Copy16BitsTo
	add r0, sp, #0
	add r1, r4, #4
	mov r2, #0xb
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #6
	bl sub_02059AF8
	add r0, sp, #0
	add r1, r4, #7
	bl sub_02059AF8
	add r0, sp, #0
	add r1, r4, #8
	mov r2, #0xa
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0xa
	mov r2, #0xa
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0xc
	mov r2, #8
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0xd
	mov r2, #8
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0xe
	mov r2, #8
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0xf
	mov r2, #8
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0x10
	mov r2, #0x18
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0x14
	mov r2, #0x45
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0x20
	mov r2, #4
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0x22
	bl CopyMovesetTo
	add r0, sp, #0
	add r1, r4, #0x3a
	mov r2, #0x50
	bl CopyBitsTo
	ldr r1, _0205C198 ; =_020B0A54
	add r0, sp, #0
	ldr r4, [r1, #8]
	mov r2, #0xb
	add r1, r4, #0x46
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0x48
	mov r2, #0xb
	bl CopyBitsTo
	ldr r1, _0205C198 ; =_020B0A54
	add r0, sp, #0
	ldr r1, [r1, #4]
	mov r2, #0x20
	bl CopyBitsTo
	ldr r4, _0205C198 ; =_020B0A54
	mov r7, #0
	add r6, sp, #0
	mov r5, #0x40
_0205C15C:
	ldr r1, [r4, #4]
	mov r0, r6
	add r1, r1, #4
	mov r2, r5
	add r1, r1, r7, lsl #3
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #0x20
	blt _0205C15C
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0205C194: .word _022B57BC
_0205C198: .word _020B0A54
	arm_func_end sub_0205BFB0
