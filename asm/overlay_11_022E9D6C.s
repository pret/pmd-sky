	.include "asm/macros.inc"
	.include "overlay_11_022E9D6C.inc"

	.text

	arm_func_start ov11_022E9D6C
ov11_022E9D6C: ; 0x022E9D6C
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9D90 ; =ov11_023890E4
	mov r1, lr
	mov r2, ip
	bl sub_0200BCB0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9D90: .word ov11_023890E4
	arm_func_end ov11_022E9D6C

	arm_func_start ov11_022E9D94
ov11_022E9D94: ; 0x022E9D94
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9DB8 ; =ov11_023890A0
	mov r1, lr
	mov r2, ip
	bl sub_0200BC60
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9DB8: .word ov11_023890A0
	arm_func_end ov11_022E9D94

	arm_func_start ov11_022E9DBC
ov11_022E9DBC: ; 0x022E9DBC
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9DE0 ; =ov11_023890A0
	mov r1, lr
	mov r2, ip
	bl sub_0200BCB0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9DE0: .word ov11_023890A0
	arm_func_end ov11_022E9DBC

	arm_func_start ov11_022E9DE4
ov11_022E9DE4: ; 0x022E9DE4
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, #0x44
	mul r4, r0, r3
	mov r6, r2
	ldr r2, _022E9E24 ; =ov11_02388FD4
	mov r0, r0, lsl #1
	ldr r5, _022E9E28 ; =ov11_0238916C
	strh r1, [r2, r0]
	add r0, r5, r4
	mov r1, #1
	mov r2, #0
	bl sub_0200BB74
	mov r1, r6
	add r0, r5, r4
	bl sub_0200BB60
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E9E24: .word ov11_02388FD4
_022E9E28: .word ov11_0238916C
	arm_func_end ov11_022E9DE4

	arm_func_start ov11_022E9E2C
ov11_022E9E2C: ; 0x022E9E2C
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, #0x44
	mul r4, r0, r3
	ldr r3, _022E9E6C ; =ov11_02388FD4
	mov r0, r0, lsl #1
	ldr r5, _022E9E70 ; =ov11_0238916C
	strh r1, [r3, r0]
	mov r6, r2
	add r0, r5, r4
	mov r1, #0
	bl sub_0200BB60
	mov r2, r6
	add r0, r5, r4
	mov r1, #1
	bl sub_0200BB74
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E9E6C: .word ov11_02388FD4
_022E9E70: .word ov11_0238916C
	arm_func_end ov11_022E9E2C
