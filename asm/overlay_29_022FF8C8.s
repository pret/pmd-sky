	.include "asm/macros.inc"
	.include "overlay_29_022FF8C8.inc"

	.text

#ifndef JAPAN
	arm_func_start GetMobilityTypeAfterIqSkills
GetMobilityTypeAfterIqSkills: ; 0x022FF8C8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	cmp r4, #3
	beq _022FF8EC
	mov r1, #0xc
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #2
_022FF8EC:
	mov r0, r5
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #3
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetMobilityTypeAfterIqSkills
#endif
