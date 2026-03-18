	.include "asm/macros.inc"
	.include "main_0205B39C.inc"

	.text

	arm_func_start sub_0205B39C
sub_0205B39C: ; 0x0205B39C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r5, r1
	bl AllocateTemp1024ByteBufferFromPool
	mov r7, r0
	b _0205B3C0
_0205B3B4:
	cmp r5, r0
	bge _0205B3CC
	add r4, r4, #2
_0205B3C0:
	ldrsb r0, [r4]
	cmp r0, #0
	bge _0205B3B4
_0205B3CC:
	mov r6, #0
	strb r6, [r7]
	ldrsb r0, [r4, #1]
	cmp r0, #0
	beq _0205B420
	ldr r5, _0205B434 ; =_020A353C
	b _0205B3F8
_0205B3E8:
	mov r0, r7
	mov r1, r5
	bl strcat
	add r6, r6, #1
_0205B3F8:
	ldrsb r1, [r4, #1]
	add r0, r1, r1, lsr #31
	cmp r6, r0, asr #1
	blt _0205B3E8
	tst r1, #1
	beq _0205B42C
	ldr r1, _0205B438 ; =_020A3544
	mov r0, r7
	bl strcat
	b _0205B42C
_0205B420:
	ldr r1, _0205B43C ; =_020A354C
	mov r0, r7
	bl strcat
_0205B42C:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0205B434: .word _020A353C
_0205B438: .word _020A3544
_0205B43C: .word _020A354C
	arm_func_end sub_0205B39C
