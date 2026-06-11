	.include "asm/macros.inc"
	.include "include/g3x.inc"

	.text

    arm_func_start G3i_OrthoW_
G3i_OrthoW_: ; 0x02077C48
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x50
	ldr ip, [sp, #0x58]
	ldr lr, [sp, #0x5c]
	str ip, [sp]
	ldr r4, [sp, #0x68]
	ldr ip, [sp, #0x60]
	str lr, [sp, #4]
	cmp r4, #0
	addeq r4, sp, #0x10
	str ip, [sp, #8]
	str r4, [sp, #0xc]
	bl MTX_OrthoW
	ldr r0, [sp, #0x64]
	cmp r0, #0
	addeq sp, sp, #0x50
	ldmeqia sp!, {r4, pc}
	ldr r1, _02077CA8 ; =0x04000440
	mov r2, #0
	mov r0, r4
	str r2, [r1]
	bl G3_LoadMtx44
	add sp, sp, #0x50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077CA8: .word 0x04000440
	arm_func_end G3i_OrthoW_

	arm_func_start G3i_LookAt_
G3i_LookAt_: ; 0x02077CAC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x30
	ldr r4, [sp, #0x40]
	mov r5, r3
	cmp r4, #0
	addeq r4, sp, #0
	mov r3, r4
	bl MTX_LookAt
	cmp r5, #0
	addeq sp, sp, #0x30
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _02077CF4 ; =0x04000440
	mov r2, #2
	mov r0, r4
	str r2, [r1]
	bl G3_LoadMtx43
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02077CF4: .word 0x04000440
	arm_func_end G3i_LookAt_

