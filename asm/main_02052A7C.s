	.include "asm/macros.inc"
	.include "main_02052A7C.inc"

	.text

	arm_func_start GetExp
GetExp: ; 0x02052A7C
	stmdb sp!, {r4, lr}
	ldr r2, _02052AAC ; =MONSTER_DATA_TABLE_PTR
	sub r3, r1, #1
	ldr r2, [r2]
	mov r1, #0x44
	smlabb r0, r0, r1, r2
	ldrsh r4, [r0, #0x1c]
	mov r1, #0xa
	mul r0, r4, r3
	bl _s32_div_f
	add r0, r4, r0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02052AAC: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetExp

	arm_func_start GetEvoParameters
GetEvoParameters: ; 0x02052AB0
	ldr r3, _02052ADC ; =MONSTER_DATA_TABLE_PTR
	mov r2, #0x44
	ldr ip, [r3]
	mov r3, #4
	smlabb r1, r1, r2, ip
	add r2, r1, #8
_02052AC8:
	ldrh r1, [r2], #2
	subs r3, r3, #1
	strh r1, [r0], #2
	bne _02052AC8
	bx lr
	.align 2, 0
_02052ADC: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetEvoParameters

	arm_func_start GetTreasureBoxChances
GetTreasureBoxChances: ; 0x02052AE0
	stmdb sp!, {r4, lr}
	mov r2, #0x44
	smulbb r4, r0, r2
	ldr r2, _02052B24 ; =MONSTER_DATA_TABLE_PTR
	mov lr, #0
_02052AF4:
	ldr r3, [r2]
	add r0, lr, #1
	add r3, r4, r3
	add r3, r3, lr, lsl #1
	ldrsh r3, [r3, #0x3c]
	mov r0, r0, lsl #0x10
	mov ip, lr, lsl #1
	mov lr, r0, asr #0x10
	strh r3, [r1, ip]
	cmp lr, #4
	blt _02052AF4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02052B24: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetTreasureBoxChances
