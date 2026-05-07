	.include "asm/macros.inc"
	.include "include/os_reset.inc"

	.text

    arm_func_start OsCountZeroBits
OsCountZeroBits: ; 0x0207BA8C
	clz r0, r0
	bx lr
	arm_func_end OsCountZeroBits

	arm_func_start OSi_InitVramExclusive
OSi_InitVramExclusive: ; 0x0207BA94
	ldr r0, _0207BAC0 ; =OSi_vramExclusive
	mov r3, #0
	str r3, [r0]
	ldr r0, _0207BAC4 ; =_022B99D8
	mov r2, r3
_0207BAA8:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #9
	blt _0207BAA8
	bx lr
	.align 2, 0
_0207BAC0: .word OSi_vramExclusive
_0207BAC4: .word _022B99D8
	arm_func_end OSi_InitVramExclusive

	arm_func_start OSi_UnlockVram
OSi_UnlockVram: ; 0x0207BAC8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r5, r0
	mov sl, r1
	bl EnableIrqFlag
	ldr r4, _0207BB44 ; =OSi_vramExclusive
	ldr r1, _0207BB48 ; =0x000001FF
	ldr r2, [r4]
	mov sb, r0
	and r0, r5, r2
	ldr r6, _0207BB4C ; =_022B99D8
	and r8, r0, r1
	mov r7, #1
	mov r5, #0
_0207BAFC:
	mov r0, r8
	bl OsCountZeroBits
	rsbs r2, r0, #0x1f
	bmi _0207BB38
	mov r1, r2, lsl #1
	ldrh r0, [r6, r1]
	mvn r2, r7, lsl r2
	cmp sl, r0
	and r8, r8, r2
	bne _0207BAFC
	ldr r0, [r4]
	strh r5, [r6, r1]
	and r0, r0, r2
	str r0, [r4]
	b _0207BAFC
_0207BB38:
	mov r0, sb
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0207BB44: .word OSi_vramExclusive
_0207BB48: .word 0x000001FF
_0207BB4C: .word _022B99D8
	arm_func_end OSi_UnlockVram

