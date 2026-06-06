	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start NotANumber
NotANumber: ; 0x02086450
	ldr r0, _02086460 ; =_020B2FBC
	ldr ip, _02086464 ; =_f2d
	ldr r0, [r0]
	bx ip
	.align 2, 0
_02086460: .word _020B2FBC
_02086464: .word _f2d
	arm_func_end NotANumber

	arm_func_start _flush_line_buffered_output_files
_flush_line_buffered_output_files: ; 0x02086468
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _020864F0 ; =_020B2ED4
	mov r4, #0
	mov r5, #1
	mov r8, r0
	mvn sb, #0
	mov r7, r4
	mov r6, #0x4c
_02086488:
	ldr r1, [r0, #4]
	mov r2, r1, lsl #0x16
	movs r2, r2, lsr #0x1d
	beq _020864C8
	mov r1, r1, lsl #0x19
	mov r1, r1, lsr #0x1e
	tst r1, #1
	beq _020864C8
	ldr r1, [r0, #8]
	mov r1, r1, lsl #0x1d
	mov r1, r1, lsr #0x1d
	cmp r1, #1
	bne _020864C8
	bl fflush
	cmp r0, #0
	movne r4, sb
_020864C8:
	cmp r5, #3
	movge r0, r7
	bge _020864E0
	mul r0, r5, r6
	add r5, r5, #1
	add r0, r8, r0
_020864E0:
	cmp r0, #0
	bne _02086488
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020864F0: .word _020B2ED4
	arm_func_end _flush_line_buffered_output_files

	arm_func_start _flush_all
_flush_all: ; 0x020864F4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _02086558 ; =_020B2ED4
	mov r4, #0
	mov r5, #1
	mov r8, r0
	mvn sb, #0
	mov r7, r4
	mov r6, #0x4c
_02086514:
	ldr r1, [r0, #4]
	mov r1, r1, lsl #0x16
	movs r1, r1, lsr #0x1d
	beq _02086530
	bl fflush
	cmp r0, #0
	movne r4, sb
_02086530:
	cmp r5, #3
	movge r0, r7
	bge _02086548
	mul r0, r5, r6
	add r5, r5, #1
	add r0, r8, r0
_02086548:
	cmp r0, #0
	bne _02086514
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02086558: .word _020B2ED4
	arm_func_end _flush_all

