	.include "asm/macros.inc"
	.include "main_02058C4C.inc"

	.text

	arm_func_start GetUnlockedTactics
GetUnlockedTactics: ; 0x02058C4C
	stmdb sp!, {r3, lr}
	mov lr, #0
	ldr r3, _02058C98 ; =TACTICS_UNLOCK_LEVEL_TABLE
	mov ip, lr
_02058C5C:
	mov r2, ip, lsl #1
	ldrsh r2, [r3, r2]
	cmp r2, r1
	strleb ip, [r0, lr]
	add ip, ip, #1
	addle lr, lr, #1
	cmp ip, #0xc
	blt _02058C5C
	mov r1, #0xb
	b _02058C8C
_02058C84:
	strb r1, [r0, lr]
	add lr, lr, #1
_02058C8C:
	cmp lr, #0xc
	blt _02058C84
	ldmia sp!, {r3, pc}
	.align 2, 0
_02058C98: .word TACTICS_UNLOCK_LEVEL_TABLE
	arm_func_end GetUnlockedTactics

	arm_func_start GetUnlockedTacticFlags
GetUnlockedTacticFlags: ; 0x02058C9C
	stmdb sp!, {r4, lr}
	mov r4, #0
	ldr lr, _02058CD4 ; =TACTICS_UNLOCK_LEVEL_TABLE
	mov r2, r4
	mov r3, #1
_02058CB0:
	mov ip, r4, lsl #1
	ldrsh ip, [lr, ip]
	cmp ip, r1
	strleb r3, [r0, r4]
	strgtb r2, [r0, r4]
	add r4, r4, #1
	cmp r4, #0xc
	blt _02058CB0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02058CD4: .word TACTICS_UNLOCK_LEVEL_TABLE
	arm_func_end GetUnlockedTacticFlags

	arm_func_start CanLearnIqSkill
CanLearnIqSkill: ; 0x02058CD8
	cmp r1, #0
	moveq r0, #0
	bxeq lr
	ldr r2, _02058D00 ; =IQ_SKILLS
	ldr r1, [r2, r1, lsl #2]
	cmp r1, r0
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02058D00: .word IQ_SKILLS
	arm_func_end CanLearnIqSkill

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
	bl GetPerformanceFlagWithChecks
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
