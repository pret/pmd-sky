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

	arm_func_start sub_0201BCCC
sub_0201BCCC: ; 0x0201BCCC
	ldr r1, _0201BCEC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r2, #0x9c
	ldr r1, [r1]
	ldr ip, _0201BCF0 ; =sub_0201AD7C
	add r1, r1, #0x1c8
	add r1, r1, #0x1c00
	mla r0, r2, r0, r1
	bx ip
	.align 2, 0
_0201BCEC: .word OBJ_GRAPHICS_CONTROLS_PTR
_0201BCF0: .word sub_0201AD7C
	arm_func_end sub_0201BCCC

	arm_func_start sub_0201BCF4
sub_0201BCF4: ; 0x0201BCF4
	ldr r1, _0201BD14 ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r2, #0x9c
	ldr r1, [r1]
	ldr ip, _0201BD18 ; =sub_0201AD84
	add r1, r1, #0x1c8
	add r1, r1, #0x1c00
	mla r0, r2, r0, r1
	bx ip
	.align 2, 0
_0201BD14: .word OBJ_GRAPHICS_CONTROLS_PTR
_0201BD18: .word sub_0201AD84
	arm_func_end sub_0201BCF4

	arm_func_start sub_0201BD1C
sub_0201BD1C: ; 0x0201BD1C
	ldr r3, _0201BD4C ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r2, #0x9c
	ldr ip, [r3]
	and r3, r0, #1
	add r0, ip, #0x1c8
	add r0, r0, #0x1c00
	mla r2, r1, r2, r0
	ldrb r0, [r2, #0x78]
	bic r0, r0, #1
	orr r0, r0, r3
	strb r0, [r2, #0x78]
	bx lr
	.align 2, 0
_0201BD4C: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BD1C

	arm_func_start sub_0201BD50
sub_0201BD50: ; 0x0201BD50
	stmdb sp!, {r3, lr}
	ldr r3, _0201BD7C ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r2, #0x9c
	ldr r3, [r3]
	mov ip, r0
	add r0, r3, #0x1c8
	add r0, r0, #0x1c00
	mla r0, r1, r2, r0
	mov r1, ip
	bl sub_0201AEB4
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BD7C: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BD50

	arm_func_start sub_0201BD80
sub_0201BD80: ; 0x0201BD80
	stmdb sp!, {r3, lr}
	ldr ip, _0201BDB0 ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov lr, r0
	ldr ip, [ip]
	mov r3, #0x9c
	add r0, ip, #0x1c8
	add r0, r0, #0x1c00
	mla r0, r2, r3, r0
	mov r2, r1
	mov r1, lr
	bl sub_0201AECC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BDB0: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BD80

	arm_func_start CopyAttributesToOamBothScreens
CopyAttributesToOamBothScreens: ; 0x0201BDB4
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BDE8 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	bl CopyAttributesToOamWrapper
	ldr r0, _0201BDE8 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x70
	bl CopyAttributesToOamWrapper
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BDE8: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end CopyAttributesToOamBothScreens

	arm_func_start sub_0201BDEC
sub_0201BDEC: ; 0x0201BDEC
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BE24 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl CopyAttributesToOamWrapper
	ldr r0, _0201BE24 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x150
	bl CopyAttributesToOamWrapper
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BE24: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BDEC

	arm_func_start sub_0201BE28
sub_0201BE28: ; 0x0201BE28
	stmdb sp!, {r3, lr}
	ldr r0, _0201BE58 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AFB8
	ldr r0, _0201BE58 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201AFB8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BE58: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BE28

	arm_func_start GroupOamAttributesBothScreens
GroupOamAttributesBothScreens: ; 0x0201BE5C
	stmdb sp!, {r3, lr}
	ldr r0, _0201BE80 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	bl GroupOamAttributesWrapper
	ldr r0, _0201BE80 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x70
	bl GroupOamAttributesWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BE80: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end GroupOamAttributesBothScreens

	arm_func_start sub_0201BE84
sub_0201BE84: ; 0x0201BE84
	stmdb sp!, {r3, lr}
	ldr r0, _0201BEAC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl GroupOamAttributesWrapper
	ldr r0, _0201BEAC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x150
	bl GroupOamAttributesWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BEAC: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BE84

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
