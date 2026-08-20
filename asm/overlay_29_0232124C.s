	.include "asm/macros.inc"
	.include "overlay_29_0232124C.inc"

	.text

	arm_func_start ov29_0232124C
ov29_0232124C: ; 0x0232124C
	ldr ip, _0232125C ; =ov29_0232119C
	mov r1, #1
	mov r2, r1
	bx ip
	.align 2, 0
_0232125C: .word ov29_0232119C
	arm_func_end ov29_0232124C

	arm_func_start ov29_02321260
ov29_02321260: ; 0x02321260
	ldr ip, _02321270 ; =ov29_0232119C
	mov r1, #0
	mov r2, r1
	bx ip
	.align 2, 0
_02321270: .word ov29_0232119C
	arm_func_end ov29_02321260
