	.include "asm/macros.inc"
	.include "overlay_13_0238BDF0.inc"

	.text

; https://decomp.me/scratch/nfhAP
	arm_func_start GetOptionStringFromID
GetOptionStringFromID: ; 0x0238BDF0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	ldr r2, _0238BE40 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	add ip, sp, #4
	ldr r3, [r2]
	ldr r2, _0238BE44 ; =ov13_0238CE70
	add r1, r3, r1, lsl #1
	add r1, r1, #0x300
	ldrsh r4, [r1, #0x74]
	ldr r3, _0238BE48 ; =0x0000C402
	mov r1, #0x400
	orr lr, r4, #0x10000
	str r4, [sp, #4]
	str lr, [sp, #0x14]
	mov r4, r0
	str ip, [sp]
	bl PreprocessString
	mov r0, r4
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0238BE40: .word OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
_0238BE44: .word ov13_0238CE70
_0238BE48: .word 0x0000C402
	arm_func_end GetOptionStringFromID
