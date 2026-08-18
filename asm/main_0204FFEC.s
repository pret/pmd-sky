	.include "asm/macros.inc"
	.include "main_0204FFEC.inc"

	.text

	arm_func_start ComputeSpecialCounters
ComputeSpecialCounters: ; 0x0204FFEC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	mov r8, r4
_0204FFF8:
	mov r0, #0x44
	mul sl, r8, r0
	ldr r0, _0205022C ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	ldrb r0, [r0, sl]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0205009C
	mov sb, #0
	mov r7, #1
	ldr r3, _02050230 ; =ADVENTURE_LOG_PTR
	ldr ip, _0205022C ; =TEAM_MEMBER_TABLE_PTR
	mov fp, sb
	mov lr, r7
	mov r2, #6
_0205003C:
	mul r1, sb, r2
	ldr r0, [ip]
	add r0, r0, sl
	add r5, r0, #0x22
	ldrb r0, [r5, r1]
	add r1, r5, r1
	tst r0, #1
	movne r0, r7
	moveq r0, fp
	tst r0, #0xff
	beq _02050090
	ldrh r0, [r1, #2]
	ldr r5, [r3]
	mov r1, r0, lsr #5
	add r6, r5, r1, lsl #2
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #27
	ldr r5, [r6, #0x16c]
	add r0, r1, r0, ror #27
	orr r0, r5, lr, lsl r0
	str r0, [r6, #0x16c]
_02050090:
	add sb, sb, #1
	cmp sb, #4
	blt _0205003C
_0205009C:
	ldr r0, _02050234 ; =0x0000022B
	add r8, r8, #1
	cmp r8, r0
	blt _0204FFF8
	mov r6, #0
	add r5, r0, #0x258
_020500B4:
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetDexNumberVeneer
	add r6, r6, #1
	cmp r6, r5
	blt _020500B4
	mov r7, #0
	ldr r5, _02050230 ; =ADVENTURE_LOG_PTR
	ldr sb, _02050238 ; =0x0000021F
	mov r8, r7
	mov r6, #1
_020500E0:
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	bl IsRealMove
	cmp r0, #0
	beq _02050120
	mov r0, r8, asr #4
	add r0, r8, r0, lsr #27
	ldr r2, [r5]
	mov r0, r0, asr #5
	add r2, r2, r0, lsl #2
	mov r1, r8, lsr #0x1f
	rsb r0, r1, r8, lsl #27
	ldr r2, [r2, #0x16c]
	add r0, r1, r0, ror #27
	tst r2, r6, lsl r0
	addne r7, r7, #1
_02050120:
	add r8, r8, #1
	cmp r8, sb
	blt _020500E0
	cmp r7, #0
	ble _02050150
	ldr r0, _02050230 ; =ADVENTURE_LOG_PTR
	ldr r1, [r0]
	str r7, [r1, #0x34]
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #4
	str r0, [r1]
_02050150:
	mov sb, #1
	ldr r5, _02050230 ; =ADVENTURE_LOG_PTR
	ldr sl, _0205023C ; =0x00000483
	mov r8, #0
	mov r6, sb
_02050164:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetBaseFormCastformCherrimDeoxys
	mov r7, r0
	bl GetDexNumberVeneer
	cmp r0, #0
	beq _020501B4
	mov r1, r0, asr #4
	add r1, r0, r1, lsr #27
	ldr r3, [r5]
	mov r2, r1, asr #5
	mov r1, r0, lsr #0x1f
	add r2, r3, r2, lsl #2
	rsb r0, r1, r0, lsl #27
	ldr r2, [r2, #0x44]
	add r0, r1, r0, ror #27
	tst r2, r6, lsl r0
	beq _020501B4
	mov r0, r7
	bl RecruitSpecialPokemonLog
_020501B4:
	add sb, sb, #1
	cmp sb, sl
	blt _02050164
	ldr r0, _02050230 ; =ADVENTURE_LOG_PTR
	mov r2, #1
	ldr r1, [r0]
	ldr r3, _02050240 ; =0x000001ED
	mov r0, r2
_020501D4:
	mov r5, r2, asr #4
	add r5, r2, r5, lsr #27
	mov sb, r5, asr #5
	mov r6, r2, lsr #0x1f
	rsb r5, r6, r2, lsl #27
	add r7, r1, sb, lsl #2
	add r6, r6, r5, ror #27
	add r5, r1, sb, lsl #2
	ldr r7, [r7, #0x44]
	ldr r5, [r5, #0xd8]
	tst r7, r0, lsl r6
	addne r8, r8, #1
	tst r5, r0, lsl r6
	add r2, r2, #1
	addne r4, r4, #1
	cmp r2, r3
	blt _020501D4
	ldr r0, _02050230 ; =ADVENTURE_LOG_PTR
	str r8, [r1, #0x2c]
	ldr r0, [r0]
	str r4, [r0, #0x30]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0205022C: .word TEAM_MEMBER_TABLE_PTR
_02050230: .word ADVENTURE_LOG_PTR
_02050234: .word 0x0000022B
_02050238: .word 0x0000021F
_0205023C: .word 0x00000483
_02050240: .word 0x000001ED
	arm_func_end ComputeSpecialCounters

	arm_func_start RecruitSpecialPokemonLog
RecruitSpecialPokemonLog: ; 0x02050244
	stmdb sp!, {r3, lr}
	cmp r0, #0x258
	subge r0, r0, #0x258
	movge r0, r0, lsl #0x10
	ldr r2, _020502AC ; =ADVENTURE_LOG_ENCOUNTERS_MONSTER_IDS
	mov r3, #0
	movge r0, r0, asr #0x10
_02050260:
	mov r1, r3, lsl #1
	ldrsh r1, [r2, r1]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	cmp r1, #0xc9
	bne _0205028C
	cmp r0, #0xc9
	blt _02050294
	cmp r0, #0xe4
	ble _0205029C
	b _02050294
_0205028C:
	cmp r1, r0
	beq _0205029C
_02050294:
	add r3, r3, #1
	b _02050260
_0205029C:
	add r0, r3, #0x24
	and r0, r0, #0xff
	bl SetAdventureLogCompleted
	ldmia sp!, {r3, pc}
	.align 2, 0
_020502AC: .word ADVENTURE_LOG_ENCOUNTERS_MONSTER_IDS
	arm_func_end RecruitSpecialPokemonLog
