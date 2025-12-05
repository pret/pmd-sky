	.include "asm/macros.inc"
	.include "main_02058E8C.inc"

	.text

	arm_func_start DisableAllIqSkills
DisableAllIqSkills: ; 0x02058E8C
	mov r3, #0
	mov r2, r3
_02058E94:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	str r2, [r0, r3, lsl #2]
	mov r3, r1, asr #0x10
	cmp r3, #3
	blt _02058E94
	bx lr
	arm_func_end DisableAllIqSkills

	arm_func_start EnableAllLearnableIqSkills
EnableAllLearnableIqSkills: ; 0x02058EB0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x48
	mov r6, r0
	add r0, sp, #0
	bl GetLearnableIqSkills
	mov r0, r6
	bl DisableAllIqSkills
	mov r5, #0
	add r4, sp, #0
	b _02058EF4
_02058ED8:
	ldrb r0, [r4, r5]
	cmp r0, #0
	beq _02058EFC
	ldrb r1, [r4, r5]
	mov r0, r6
	bl EnableIqSkill
	add r5, r5, #1
_02058EF4:
	cmp r5, #0x45
	blt _02058ED8
_02058EFC:
	add sp, sp, #0x48
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end EnableAllLearnableIqSkills
