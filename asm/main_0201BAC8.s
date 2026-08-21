	.include "asm/macros.inc"
	.include "main_0201BAC8.inc"

	.text

	arm_func_start ChangeSimpleObjTexture
ChangeSimpleObjTexture: ; 0x0201BAC8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldrb r5, [sp, #0x18]
	ldrb r4, [sp, #0x1c]
	str r5, [sp]
	str r4, [sp, #4]
	ldrh ip, [r0, #0xc]
	ldr r4, [r0, #0x64]
	ldr r5, _0201BB1C ; =_020AFC28
	mov lr, ip, lsr #0x1f
	rsb ip, lr, ip, lsl #30
	add ip, lr, ip, ror #30
	mov ip, ip, lsl #1
	ldrsh ip, [r5, ip]
	mov r5, r1
	ldr r0, [r0, #4]
	smlabb r1, r2, ip, r4
	mov r2, r5
	bl sub_0201AC20
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201BB1C: .word _020AFC28
	arm_func_end ChangeSimpleObjTexture

	arm_func_start sub_0201BB20
sub_0201BB20: ; 0x0201BB20
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #4]
	bl sub_0201AD44
	ldr r0, [r4, #4]
	bl sub_0201AC10
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201BB20

	arm_func_start InitObjGraphicsControls
InitObjGraphicsControls: ; 0x0201BB3C
	stmdb sp!, {r3, lr}
	mov r0, #0x1f00
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r1, #0x1f00
	str r0, [r2]
	bl MemZero
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x1c0
	bl sub_0201AB90
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x3c4
	add r0, r0, #0xc00
	bl sub_0201AB90
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x1c0
	bl sub_0201AC10
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x3c4
	add r0, r0, #0xc00
	bl sub_0201AC10
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AEF0
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, _0201BCC0 ; =0x05000200
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AF18
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, _0201BCC4 ; =0x06894000
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AF64
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201AEF0
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, _0201BCC8 ; =0x05000600
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201AF18
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r3, #0
	ldr r0, [r0]
	str r3, [sp]
	add r1, r0, #0x1c8
	add r1, r1, #0x1c00
	add r2, r0, #0x1c0
	bl sub_0201B198
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r3, #1
	ldr r2, [r0]
	str r3, [sp]
	add r0, r2, #0x70
	add r1, r2, #0x264
	add r1, r1, #0x1c00
	add r2, r2, #0x3c4
	add r2, r2, #0xc00
	bl sub_0201B198
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r1, #2
	ldr r2, [r0]
	mov r3, #0
	str r1, [sp]
	add r0, r2, #0xe0
	add r1, r2, #0x1c8
	add r1, r1, #0x1c00
	add r2, r2, #0x1c0
	bl sub_0201B198
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r1, #3
	ldr r2, [r0]
	mov r3, #1
	str r1, [sp]
	add r0, r2, #0x150
	add r1, r2, #0x264
	add r1, r1, #0x1c00
	add r2, r2, #0x3c4
	add r2, r2, #0xc00
	bl sub_0201B198
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BCBC: .word OBJ_GRAPHICS_CONTROLS_PTR
_0201BCC0: .word 0x05000200
_0201BCC4: .word 0x06894000
_0201BCC8: .word 0x05000600
	arm_func_end InitObjGraphicsControls
