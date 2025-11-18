	.include "asm/macros.inc"
	.include "overlay_29_023021F0.inc"

	.text

	arm_func_start ov29_023021F0
ov29_023021F0: ; 0x023021F0
	ldr ip, _023021FC ; =UpdateIqSkills
	ldr r0, [r0, #0xb4]
	bx ip
	.align 2, 0
_023021FC: .word UpdateIqSkills
	arm_func_end ov29_023021F0
