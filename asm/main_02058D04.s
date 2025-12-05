	.include "asm/macros.inc"
	.include "main_02058D04.inc"

	.text

	arm_func_start GetLearnableIqSkills
GetLearnableIqSkills: ; 0x02058D04
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, #0
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r5, r6
	ldr r4, _02058DA0 ; =IQ_GROUP_SKILLS
	mov fp, #0x19
	b _02058D74
_02058D28:
	mov r0, sb
	bl GetIqGroup
	mla r1, r0, fp, r4
	and r0, r5, #0xff
	ldrb r7, [r0, r1]
	cmp r7, #0xff
	beq _02058D7C
	cmp r7, #0x18
	bne _02058D58
	mov r0, #3
	bl GetResolvedPerformanceProgressFlag
	b _02058D64
_02058D58:
	mov r0, r8
	mov r1, r7
	bl CanLearnIqSkill
_02058D64:
	cmp r0, #0
	strneb r7, [sl, r6]
	addne r6, r6, #1
	add r5, r5, #1
_02058D74:
	cmp r5, #0x19
	blt _02058D28
_02058D7C:
	mov r1, r6
	mov r0, #0
	b _02058D90
_02058D88:
	strb r0, [sl, r1]
	add r1, r1, #1
_02058D90:
	cmp r1, #0x45
	blt _02058D88
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02058DA0: .word IQ_GROUP_SKILLS
	arm_func_end GetLearnableIqSkills

	arm_func_start DisableIqSkill
DisableIqSkill: ; 0x02058DA4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl IqSkillFlagTest
	cmp r0, #0
	beq _02058DE4
	mov r0, r5, asr #4
	add r0, r5, r0, lsr #27
	mov r2, r0, asr #5
	sub r0, r5, r2, lsl #5
	mov r1, #1
	mvn r0, r1, lsl r0
	ldr r1, [r4, r2, lsl #2]
	and r0, r1, r0
	str r0, [r4, r2, lsl #2]
	ldmia sp!, {r3, r4, r5, pc}
_02058DE4:
	mov r0, r4
	mov r1, r5
	bl EnableIqSkill
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DisableIqSkill

	arm_func_start EnableIqSkill
EnableIqSkill: ; 0x02058DF4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _02058E64 ; =IQ_SKILL_RESTRICTIONS
	mov r3, r1, lsl #1
	ldrsh ip, [r2, r3]
	mov r3, #0
	mov r4, #1
_02058E0C:
	mov r5, r3, lsl #1
	ldrsh r5, [r2, r5]
	cmp ip, r5
	bne _02058E3C
	mov lr, r3, asr #4
	add lr, r3, lr, lsr #27
	mov r6, lr, asr #5
	sub lr, r3, r6, lsl #5
	mvn lr, r4, lsl lr
	ldr r5, [r0, r6, lsl #2]
	and r5, r5, lr
	str r5, [r0, r6, lsl #2]
_02058E3C:
	add r3, r3, #1
	cmp r3, #0x45
	blt _02058E0C
	mov ip, r1, lsr #5
	ldr r3, [r0, ip, lsl #2]
	sub r1, r1, ip, lsl #5
	mov r2, #1
	orr r1, r3, r2, lsl r1
	str r1, [r0, ip, lsl #2]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02058E64: .word IQ_SKILL_RESTRICTIONS
	arm_func_end EnableIqSkill
