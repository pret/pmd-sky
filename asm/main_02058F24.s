	.include "asm/macros.inc"
	.include "main_02058F24.inc"

	.text

	arm_func_start GetNextIqSkill
GetNextIqSkill: ; 0x02058F24
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	bl GetIqGroup
	ldr r2, _02058F9C ; =IQ_GROUP_SKILLS
	mov r1, #0x19
	mla lr, r0, r1, r2
	mov r0, #0
	mov r1, r0
	mov r3, r0
	ldr r2, _02058FA0 ; =IQ_SKILLS
	b _02058F90
_02058F50:
	ldrb ip, [lr], #1
	cmp ip, #0xff
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp ip, #0
	beq _02058F8C
	ldr r5, [r2, ip, lsl #2]
	cmp r5, r4
	ble _02058F8C
	cmp r1, #0
	beq _02058F80
	cmp r5, r1
	bge _02058F8C
_02058F80:
	mov r1, r5, lsl #0x10
	mov r0, ip
	mov r1, r1, asr #0x10
_02058F8C:
	add r3, r3, #1
_02058F90:
	cmp r3, #0x19
	blt _02058F50
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02058F9C: .word IQ_GROUP_SKILLS
_02058FA0: .word IQ_SKILLS
	arm_func_end GetNextIqSkill
