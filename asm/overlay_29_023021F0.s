	.include "asm/macros.inc"
	.include "overlay_29_023021F0.inc"

	.text

	arm_func_start UpdateIqSkillsWrapper
UpdateIqSkillsWrapper: ; 0x023021F0
	ldr ip, _023021FC ; =UpdateIqSkills
	ldr r0, [r0, #0xb4]
	bx ip
	.align 2, 0
_023021FC: .word UpdateIqSkills
	arm_func_end UpdateIqSkillsWrapper
