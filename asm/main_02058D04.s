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
