	.include "asm/macros.inc"
	.include "overlay_11_022E96F4.inc"

	.text

	arm_func_start ScriptSpecialProcess0x16
ScriptSpecialProcess0x16: ; 0x022E96F4
	cmp r0, #0
	moveq r1, #1
	ldr r0, _022E970C ; =ov11_02324FA0
	movne r1, #0
	strb r1, [r0, #2]
	bx lr
	.align 2, 0
_022E970C: .word ov11_02324FA0
	arm_func_end ScriptSpecialProcess0x16

	arm_func_start ov11_022E9710
ov11_022E9710: ; 0x022E9710
	ldr r1, _022E971C ; =ov11_02324FA0
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_022E971C: .word ov11_02324FA0
	arm_func_end ov11_022E9710

	arm_func_start ov11_022E9720
ov11_022E9720: ; 0x022E9720
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _022E9824 ; =ov11_02388FC0
	mov r1, #1
	str r0, [r2, #0x10]
	ldr r0, _022E9828 ; =ov11_0238905C
	bl sub_0200B894
	ldr r0, _022E982C ; =ov11_02389128
	mov r1, #0
	bl sub_0200B894
	ldr r0, _022E9830 ; =ov11_023890E4
	mov r1, #0
	bl sub_0200B894
	ldr r0, _022E9834 ; =ov11_02389018
	mov r1, #1
	bl sub_0200B894
	ldr r0, _022E9838 ; =ov11_023890A0
	mov r1, #0
	bl sub_0200B894
	mov r8, #0
	ldr r6, _022E983C ; =ov11_02388FD4
	ldr r5, _022E9840 ; =ov11_0238916C
	mov r7, r8
	mov r4, #0x44
_022E977C:
	mla r0, r8, r4, r5
	mov r2, r8, lsl #1
	mov r1, r7
	strh r7, [r6, r2]
	bl sub_0200B894
	add r8, r8, #1
	cmp r8, #2
	blt _022E977C
	bl ov11_022EBAE8
	mov r0, #0
	bl sub_0201BCCC
	mov r1, r0
	ldr r0, _022E9830 ; =ov11_023890E4
	bl sub_0200B908
	mov r0, #0
	bl sub_0201BCF4
	mov r1, r0
	ldr r0, _022E9830 ; =ov11_023890E4
	bl sub_0200B908
	mov r0, #1
	bl sub_0201BCCC
	mov r1, r0
	ldr r0, _022E9838 ; =ov11_023890A0
	bl sub_0200B908
	bl ov11_022E98CC
	bl ov11_022E99E0
	ldr r0, _022E9844 ; =ov11_02388FD8
	bl InitRender3dElement64
	mov r2, #0x100
	ldr r0, _022E9844 ; =ov11_02388FD8
	mov r1, #0xc0
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	mov r1, #0x20
	strh r1, [r0, #0x2a]
	mov r1, #1
	strb r1, [r0, #0x3e]
	mov r1, #2
	strb r1, [r0, #0x3c]
	mov r1, #0
	strb r1, [r0, #0x2f]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E9824: .word ov11_02388FC0
_022E9828: .word ov11_0238905C
_022E982C: .word ov11_02389128
_022E9830: .word ov11_023890E4
_022E9834: .word ov11_02389018
_022E9838: .word ov11_023890A0
_022E983C: .word ov11_02388FD4
_022E9840: .word ov11_0238916C
_022E9844: .word ov11_02388FD8
	arm_func_end ov11_022E9720

	arm_func_start ov11_022E9848
ov11_022E9848: ; 0x022E9848
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl sub_0201BCCC
	mov r1, r0
	ldr r0, _022E98B8 ; =ov11_023890E4
	bl sub_0200B918
	mov r0, #0
	bl sub_0201BCF4
	mov r1, r0
	ldr r0, _022E98B8 ; =ov11_023890E4
	bl sub_0200B918
	mov r0, #1
	bl sub_0201BCCC
	mov r1, r0
	ldr r0, _022E98BC ; =ov11_023890A0
	bl sub_0200B918
	bl ov11_022EBB14
	ldr r0, _022E98C0 ; =ov11_0238905C
	bl sub_0200B8B8
	ldr r0, _022E98C4 ; =ov11_02389128
	bl sub_0200B8B8
	ldr r0, _022E98B8 ; =ov11_023890E4
	bl sub_0200B8B8
	ldr r0, _022E98C8 ; =ov11_02389018
	bl sub_0200B8B8
	ldr r0, _022E98BC ; =ov11_023890A0
	bl sub_0200B8B8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E98B8: .word ov11_023890E4
_022E98BC: .word ov11_023890A0
_022E98C0: .word ov11_0238905C
_022E98C4: .word ov11_02389128
_022E98C8: .word ov11_02389018
	arm_func_end ov11_022E9848

	arm_func_start ov11_022E98CC
ov11_022E98CC: ; 0x022E98CC
	stmdb sp!, {r3, lr}
	ldr r2, _022E99D0 ; =ov11_02388FC0
	mov r0, #0
	strb r0, [r2]
	strb r0, [r2, #2]
	str r0, [r2, #0xc]
	str r0, [r2, #8]
	mov r1, #1
	strb r1, [r2, #1]
	ldr r2, [r2, #0x10]
	cmp r2, #2
	bne _022E9968
	bl sub_02008F4C
	cmp r0, #0x100
	bne _022E9924
	ldr r0, _022E99D4 ; =ov11_0238905C
	mov r1, #0
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =ov11_02389128
	mov r1, #2
	bl sub_0200B8D4
	b _022E99A8
_022E9924:
	mov r0, #0
	bl sub_02008F4C
	cmp r0, #0x100
	mov r1, #0
	bne _022E9950
	ldr r0, _022E99D4 ; =ov11_0238905C
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =ov11_02389128
	mov r1, #1
	bl sub_0200B8D4
	b _022E99A8
_022E9950:
	ldr r0, _022E99D4 ; =ov11_0238905C
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =ov11_02389128
	mov r1, #0
	bl sub_0200B8D4
	b _022E99A8
_022E9968:
	cmp r2, #0
	bne _022E9994
	ldr r0, _022E99D4 ; =ov11_0238905C
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =ov11_02389128
	mov r1, #1
	bl sub_0200B8D4
	ldr r0, _022E99D0 ; =ov11_02388FC0
	mov r1, #1
	str r1, [r0, #0x10]
	b _022E99A8
_022E9994:
	ldr r0, _022E99D4 ; =ov11_0238905C
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =ov11_02389128
	mov r1, #0
	bl sub_0200B8D4
_022E99A8:
	ldr r0, _022E99DC ; =ov11_023890E4
	mov r1, #0
	bl sub_0200B8D4
	ldr r0, _022E99D4 ; =ov11_0238905C
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA80C
	ldr r0, _022E99D8 ; =ov11_02389128
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E99D0: .word ov11_02388FC0
_022E99D4: .word ov11_0238905C
_022E99D8: .word ov11_02389128
_022E99DC: .word ov11_023890E4
	arm_func_end ov11_022E98CC

	arm_func_start ov11_022E99E0
ov11_022E99E0: ; 0x022E99E0
	stmdb sp!, {r3, lr}
	ldr r0, _022E9A6C ; =ov11_02388FC0
	ldr r0, [r0, #0x10]
	cmp r0, #2
	bne _022E9A44
	mov r0, #1
	bl sub_02008F4C
	cmp r0, #0x100
	bne _022E9A14
	ldr r0, _022E9A70 ; =ov11_02389018
	mov r1, #2
	bl sub_0200B8D4
	b _022E9A50
_022E9A14:
	mov r0, #1
	bl sub_02008F4C
	cmp r0, #0
	bne _022E9A34
	ldr r0, _022E9A70 ; =ov11_02389018
	mov r1, #1
	bl sub_0200B8D4
	b _022E9A50
_022E9A34:
	ldr r0, _022E9A70 ; =ov11_02389018
	mov r1, #0
	bl sub_0200B8D4
	b _022E9A50
_022E9A44:
	ldr r0, _022E9A70 ; =ov11_02389018
	mov r1, #1
	bl sub_0200B8D4
_022E9A50:
	ldr r0, _022E9A74 ; =ov11_023890A0
	mov r1, #0
	bl sub_0200B8D4
	ldr r0, _022E9A70 ; =ov11_02389018
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA80C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9A6C: .word ov11_02388FC0
_022E9A70: .word ov11_02389018
_022E9A74: .word ov11_023890A0
	arm_func_end ov11_022E99E0
