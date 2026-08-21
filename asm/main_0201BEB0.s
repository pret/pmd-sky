	.include "asm/macros.inc"
	.include "main_0201BEB0.inc"

	.text

	arm_func_start sub_0201BEB0
sub_0201BEB0: ; 0x0201BEB0
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BF0C ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201B004
	ldr r0, _0201BF0C ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201B004
	ldr r0, _0201BF0C ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	bl sub_0201BB20
	ldr r0, _0201BF0C ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0201BB20
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BF0C: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BEB0

	arm_func_start sub_0201BF10
sub_0201BF10: ; 0x0201BF10
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BF48 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl sub_0201BB20
	ldr r0, _0201BF48 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x150
	bl sub_0201BB20
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BF48: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BF10

	arm_func_start sub_0201BF4C
sub_0201BF4C: ; 0x0201BF4C
	stmdb sp!, {r3, lr}
	bl sub_0201BEB0
	bl sub_0201BF10
	bl CopyAttributesToOamBothScreens
	bl sub_0201BDEC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201BF4C

	arm_func_start sub_0201BF64
sub_0201BF64: ; 0x0201BF64
	stmdb sp!, {r3, lr}
	ldr r0, _0201BFA8 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	bl sub_0201B2A0
	ldr r0, _0201BFA8 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0201B2A0
	ldr r0, _0201BFA8 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl sub_0201B2A0
	ldr r0, _0201BFA8 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x150
	bl sub_0201B2A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BFA8: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BF64

	arm_func_start sub_0201BFAC
sub_0201BFAC: ; 0x0201BFAC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, _0201BFEC ; =OBJ_GRAPHICS_CONTROLS_PTR
	str r3, [sp]
	ldr lr, [ip]
	ldr ip, [sp, #0x10]
	mov r3, #0x70
	mov r4, r0
	mla r0, ip, r3, lr
	mov ip, r1
	mov r3, r2
	mov r1, r4
	mov r2, ip
	bl sub_0201B2DC
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201BFEC: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BFAC
