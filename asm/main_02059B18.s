	.include "asm/macros.inc"
	.include "main_02059B18.inc"

	.text

	arm_func_start GetEvolutionPossibilities
GetEvolutionPossibilities: ; 0x02059B18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov sb, r0
	ldrsh r6, [sb, #4]
	mov r8, r1
	mov r5, #0
	strh r5, [r8, #6]
	ldrsh r0, [sb, #4]
	cmp r6, #0x258
	ldrlt r4, _0205A1DC ; =0x0000022A
	movlt r7, #1
	ldr r2, _0205A1E0 ; =0x000001BF
	ldrge r7, _0205A1E4 ; =0x00000259
	ldrge r4, _0205A1E8 ; =0x00000483
	cmp r0, r2
	blt _02059B64
	add r1, r2, #2
	cmp r0, r1
	movle r6, r2
_02059B64:
	ldr r2, _0205A1EC ; =0x00000417
	cmp r0, r2
	blt _02059B84
	add r1, r2, #2
	cmp r0, r1
	ldrle r4, _0205A1DC ; =0x0000022A
	suble r6, r2, #0x258
	movle r7, #1
_02059B84:
	ldr r1, _0205A1F0 ; =0x000003E1
	ldr r2, _0205A1F4 ; =0x000001CE
	cmp r0, r1
	subeq r6, r1, #0x258
	ldreq r4, _0205A1DC ; =0x0000022A
	ldr r1, _0205A1F8 ; =0x0000041E
	moveq r7, #1
	cmp r0, r1
	subeq r6, r1, #0x258
	subeq r4, r1, #0x1f4
	moveq r7, #1
	cmp r0, r2
	blt _02059BC4
	add r1, r2, #1
	cmp r0, r1
	movle r6, r2
_02059BC4:
	ldr r2, _0205A1FC ; =0x00000426
	cmp r0, r2
	blt _02059BDC
	add r1, r2, #1
	cmp r0, r1
	movle r6, r2
_02059BDC:
	mov r2, #0
	mov r1, r2
_02059BE4:
	add r0, r8, r2, lsl #1
	strh r1, [r0, #0x1a]
	strh r1, [r0, #0x2a]
	add r2, r2, #1
	strh r1, [r0, #0xa]
	cmp r2, #8
	blt _02059BE4
	strh r1, [r8, #8]
	ldrsh r0, [sb, #4]
	ldr r1, _0205A1F8 ; =0x0000041E
	cmp r0, r1
	bne _02059C2C
	bl CanEvolve
	cmp r0, #0
	bne _02059C44
	mov r0, #4
	strh r0, [r8, #6]
	b _0205A1D4
_02059C2C:
	mov r0, r6
	bl CanEvolve
	cmp r0, #0
	moveq r0, #4
	streqh r0, [r8, #6]
	beq _0205A1D4
_02059C44:
	ldr r0, _0205A200 ; =0xFFFFFE3E
	add r0, r0, #0x34c
	str r0, [sp, #0x24]
	ldr r0, _0205A1F0 ; =0x000003E1
	rsb fp, r0, #0x5a0
	sub r0, r0, #0x258
	str r0, [sp]
	ldr r0, _0205A200 ; =0xFFFFFE3E
	add r0, r0, #0x390
	str r0, [sp, #8]
	ldr r0, _0205A1F0 ; =0x000003E1
	rsb sl, r0, #0x5a0
	ldr r0, _0205A200 ; =0xFFFFFE3E
	add r0, r0, #0x390
	str r0, [sp, #4]
	ldr r0, _0205A1F0 ; =0x000003E1
	add r0, r0, #0x45
	str r0, [sp, #0xc]
	ldr r0, _0205A1F0 ; =0x000003E1
	sub r0, r0, #0x220
	str r0, [sp, #0x20]
	ldr r0, _0205A1F0 ; =0x000003E1
	rsb r0, r0, #0x5a0
	str r0, [sp, #0x1c]
	ldr r0, _0205A200 ; =0xFFFFFE3E
	sub r0, r0, #0x264
	str r0, [sp, #0x18]
	ldr r0, _0205A204 ; =0xFFFFFBE9
	sub r0, r0, #0x11
	str r0, [sp, #0x14]
	ldr r0, _0205A200 ; =0xFFFFFE3E
	sub r0, r0, #0xc
	str r0, [sp, #0x10]
	b _02059E1C
_02059CCC:
	mov r1, r7, lsl #0x10
	add r0, sp, #0x28
	mov r1, r1, asr #0x10
	bl GetEvoParameters
	ldrh r0, [sp, #0x2a]
	cmp r0, #0
	beq _02059E18
	ldrsh r0, [sp, #0x28]
	cmp r6, r0
	bne _02059E18
	cmp r6, sl
	bgt _02059D14
	cmp r6, fp
	bge _02059D8C
	ldr r0, [sp]
	cmp r6, r0
	beq _02059DD8
	b _02059E0C
_02059D14:
	ldr r0, [sp, #4]
	cmp r6, r0
	bgt _02059D30
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _02059D40
	b _02059E0C
_02059D30:
	ldr r0, [sp, #0xc]
	cmp r6, r0
	beq _02059D64
	b _02059E0C
_02059D40:
	ldrsh r2, [sb, #4]
	ldr r0, [sp, #0x10]
	sub r1, r7, #0x1d0
	add r0, r2, r0
	cmp r0, r1
	addeq r0, r8, r5, lsl #1
	streqh r7, [r0, #0xa]
	addeq r5, r5, #1
	b _02059E18
_02059D64:
	ldr r0, [sp, #0x14]
	ldrsh r2, [sb, #4]
	add r1, r7, r0
	ldr r0, [sp, #0x18]
	add r0, r2, r0
	cmp r0, r1
	addeq r0, r8, r5, lsl #1
	streqh r7, [r0, #0xa]
	addeq r5, r5, #1
	b _02059E18
_02059D8C:
	ldr r0, _0205A200 ; =0xFFFFFE3E
	ldrsh r2, [sb, #4]
	add r1, r7, r0
	ldr r0, _0205A204 ; =0xFFFFFBE9
	add r0, r2, r0
	cmp r0, r1
	addeq r0, r8, r5, lsl #1
	streqh r7, [r0, #0xa]
	ldrsh r1, [sb, #4]
	ldr r0, [sp, #0x1c]
	addeq r5, r5, #1
	cmp r1, r0
	blt _02059E18
	ldr r0, [sp, #0x20]
	cmp r1, r0
	addle r0, r8, r5, lsl #1
	strleh r7, [r0, #0xa]
	addle r5, r5, #1
	b _02059E18
_02059DD8:
	ldrsh r1, [sb, #4]
	ldr r0, _0205A1F0 ; =0x000003E1
	cmp r1, r0
	ldreq r0, [sp, #0x24]
	cmpeq r7, r0
	addeq r0, r8, r5, lsl #1
	addeq r1, r7, #0x258
	addeq r5, r5, #1
	streqh r1, [r0, #0xa]
	addne r0, r8, r5, lsl #1
	strneh r7, [r0, #0xa]
	addne r5, r5, #1
	b _02059E18
_02059E0C:
	add r0, r8, r5, lsl #1
	strh r7, [r0, #0xa]
	add r5, r5, #1
_02059E18:
	add r7, r7, #1
_02059E1C:
	cmp r7, r4
	blt _02059CCC
	cmp r5, #0
	moveq r0, #4
	streqh r0, [r8, #6]
	beq _0205A1D4
	mov r7, #0
	b _0205A1CC
_02059E3C:
	add r0, r8, r7, lsl #1
	ldrsh sl, [r0, #0xa]
	add r0, sp, #0x28
	mov r1, sl
	bl GetEvoParameters
	ldrh r0, [sp, #0x2a]
	mov r4, #0
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02059F44
_02059E64: ; jump table
	b _02059F44 ; case 0
	b _02059E78 ; case 1
	b _02059E98 ; case 2
	b _02059EB8 ; case 3
	b _02059EE4 ; case 4
_02059E78:
	ldrb r1, [sb, #1]
	ldrsh r0, [sp, #0x2c]
	cmp r1, r0
	ldrlth r0, [r8, #6]
	movlt r4, #1
	orrlt r0, r0, #2
	strlth r0, [r8, #6]
	b _02059F44
_02059E98:
	ldrsh r1, [sb, #8]
	ldrsh r0, [sp, #0x2c]
	cmp r1, r0
	ldrlth r0, [r8, #6]
	movlt r4, #1
	orrlt r0, r0, #0x10
	strlth r0, [r8, #6]
	b _02059F44
_02059EB8:
	ldrsh r0, [sp, #0x2c]
	bl FindItemInInventory
	cmp r0, #0
	ldrlth r0, [r8, #6]
	movlt r4, #1
	orrlt r0, r0, #8
	strlth r0, [r8, #6]
	ldrgesh r1, [sp, #0x2c]
	addge r0, r8, r7, lsl #1
	strgeh r1, [r0, #0x1a]
	b _02059F44
_02059EE4:
	ldrsh r0, [sp, #0x2c]
	mov r1, #0x258
	mov r6, r4
	bl _s32_div_f
	mov r0, r1, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r4
	bl IsMonsterOnTeam
	cmp r0, #0
	ldrsh r0, [sp, #0x2c]
	mov r1, #0x258
	addne r6, r6, #1
	bl _s32_div_f
	mov r0, r1, lsl #0x10
	mov r0, r0, asr #0x10
	add r0, r0, #0x258
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #0
	bl IsMonsterOnTeam
	cmp r0, #0
	addne r6, r6, #1
	cmp r6, #0
	moveq r4, #1
_02059F44:
	ldrh r0, [sp, #0x2e]
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _0205A1A8
_02059F54: ; jump table
	b _0205A1A8 ; case 0
	b _0205A08C ; case 1
	b _0205A0B8 ; case 2
	b _0205A0CC ; case 3
	b _0205A0E0 ; case 4
	b _0205A0F4 ; case 5
	b _0205A120 ; case 6
	b _0205A16C ; case 7
	b _0205A14C ; case 8
	b _0205A15C ; case 9
	b _0205A18C ; case 10
	b _0205A19C ; case 11
	b _02059F94 ; case 12
	b _02059FD0 ; case 13
	b _0205A00C ; case 14
	b _0205A04C ; case 15
_02059F94:
	mov r6, #0
	mov r4, #1
	mov r1, r6
	mov r0, #6
_02059FA4:
	mla r3, r6, r0, sb
	ldrb r2, [r3, #0x22]
	tst r2, #1
	beq _02059FC0
	ldrh r2, [r3, #0x24]
	cmp r2, #0x5d
	moveq r4, r1
_02059FC0:
	add r6, r6, #1
	cmp r6, #4
	blt _02059FA4
	b _0205A1A8
_02059FD0:
	mov r6, #0
	mov r4, #1
	mov r1, r6
	mov r0, #6
_02059FE0:
	mla r3, r6, r0, sb
	ldrb r2, [r3, #0x22]
	tst r2, #1
	beq _02059FFC
	ldrh r2, [r3, #0x24]
	cmp r2, #0x69
	moveq r4, r1
_02059FFC:
	add r6, r6, #1
	cmp r6, #4
	blt _02059FE0
	b _0205A1A8
_0205A00C:
	mov r0, #0
	ldr r1, _0205A208 ; =0x000001E7
	mov r4, #1
	mov r3, r0
	mov r2, #6
_0205A020:
	mla fp, r0, r2, sb
	ldrb r6, [fp, #0x22]
	tst r6, #1
	beq _0205A03C
	ldrh r6, [fp, #0x24]
	cmp r6, r1
	moveq r4, r3
_0205A03C:
	add r0, r0, #1
	cmp r0, #4
	blt _0205A020
	b _0205A1A8
_0205A04C:
	mov r0, #0
	ldr r1, _0205A20C ; =0x00000147
	mov r4, #1
	mov r3, r0
	mov r2, #6
_0205A060:
	mla fp, r0, r2, sb
	ldrb r6, [fp, #0x22]
	tst r6, #1
	beq _0205A07C
	ldrh r6, [fp, #0x24]
	cmp r6, r1
	moveq r4, r3
_0205A07C:
	add r0, r0, #1
	cmp r0, #4
	blt _0205A060
	b _0205A1A8
_0205A08C:
	mov r0, #0x97
	bl FindItemInInventory
	cmp r0, #0
	ldrlth r0, [r8, #6]
	movge r1, #0x97
	movlt r4, #1
	orrlt r0, r0, #8
	strlth r0, [r8, #6]
	addge r0, r8, r7, lsl #1
	strgeh r1, [r0, #0x2a]
	b _0205A1A8
_0205A0B8:
	ldrb r1, [sb, #0xc]
	ldrb r0, [sb, #0xe]
	cmp r1, r0
	movls r4, #1
	b _0205A1A8
_0205A0CC:
	ldrb r1, [sb, #0xc]
	ldrb r0, [sb, #0xe]
	cmp r1, r0
	movhs r4, #1
	b _0205A1A8
_0205A0E0:
	ldrb r1, [sb, #0xc]
	ldrb r0, [sb, #0xe]
	cmp r1, r0
	movne r4, #1
	b _0205A1A8
_0205A0F4:
	mov r0, #0x37
	bl FindItemInInventory
	cmp r0, #0
	ldrlth r0, [r8, #6]
	movge r1, #0x37
	movlt r4, #1
	orrlt r0, r0, #8
	strlth r0, [r8, #6]
	addge r0, r8, r7, lsl #1
	strgeh r1, [r0, #0x2a]
	b _0205A1A8
_0205A120:
	mov r0, #0x38
	bl FindItemInInventory
	cmp r0, #0
	ldrlth r0, [r8, #6]
	movge r1, #0x38
	movlt r4, #1
	orrlt r0, r0, #8
	strlth r0, [r8, #6]
	addge r0, r8, r7, lsl #1
	strgeh r1, [r0, #0x2a]
	b _0205A1A8
_0205A14C:
	ldrb r0, [r8, #4]
	tst r0, #1
	movne r4, #1
	b _0205A1A8
_0205A15C:
	ldrb r0, [r8, #4]
	tst r0, #1
	moveq r4, #1
	b _0205A1A8
_0205A16C:
	mov r0, #0x36
	bl FindItemInInventory
	cmp r0, #0
	addge r0, r8, r7, lsl #1
	movge r1, #0x36
	movlt r4, #1
	strgeh r1, [r0, #0x2a]
	b _0205A1A8
_0205A18C:
	ldrsh r0, [sb, #4]
	cmp r0, #0x258
	movge r4, #1
	b _0205A1A8
_0205A19C:
	ldrsh r0, [sb, #4]
	cmp r0, #0x258
	movlt r4, #1
_0205A1A8:
	cmp r4, #0
	ldreqh r0, [r8, #6]
	movne r1, #0
	orreq r0, r0, #1
	streqh r0, [r8, #6]
	addne r0, r8, r7, lsl #1
	streqh sl, [r8, #8]
	strneh r1, [r0, #0xa]
	add r7, r7, #1
_0205A1CC:
	cmp r7, r5
	blt _02059E3C
_0205A1D4:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0205A1DC: .word 0x0000022A
_0205A1E0: .word 0x000001BF
_0205A1E4: .word 0x00000259
_0205A1E8: .word 0x00000483
_0205A1EC: .word 0x00000417
_0205A1F0: .word 0x000003E1
_0205A1F4: .word 0x000001CE
_0205A1F8: .word 0x0000041E
_0205A1FC: .word 0x00000426
_0205A200: .word 0xFFFFFE3E
_0205A204: .word 0xFFFFFBE9
_0205A208: .word 0x000001E7
_0205A20C: .word 0x00000147
	arm_func_end GetEvolutionPossibilities

	arm_func_start GetMonsterEvoStatus
GetMonsterEvoStatus: ; 0x0205A210
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x3c
	add r1, sp, #0
	mov r4, r0
	bl GetEvolutionPossibilities
	ldrh r0, [sp, #6]
	tst r0, #1
	beq _0205A274
	ldrb r0, [r4, #2]
	cmp r0, #0xd6
	moveq r1, #1
	movne r1, #0
	tst r1, #0xff
	bne _0205A254
	bl JoinedAtRangeCheck2
	cmp r0, #0
	beq _0205A26C
_0205A254:
	mov r0, #0xa
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _0205A280
_0205A26C:
	mov r0, #1
	b _0205A280
_0205A274:
	tst r0, #4
	movne r0, #2
	moveq r0, #0
_0205A280:
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, pc}
	arm_func_end GetMonsterEvoStatus
