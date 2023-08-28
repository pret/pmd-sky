	.include "asm/macros.inc"
	.include "overlay_29_022FEDBC.inc"

	.text

	arm_func_start ov29_022FEDBC
ov29_022FEDBC: ; 0x022FEDBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r4, #0
_022FEDC8:
	ldr r0, _022FEFB8 ; =0x02353538
	mov r6, #0
	ldr r0, [r0]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb78]
	mov r0, r7
	bl EntityIsValid__022FED98
	cmp r0, #0
	ldrne r8, [r7, #0xb4]
	ldrneb r5, [r8, #0x177]
	cmpne r5, #0xff
	beq _022FEFA4
	mov r0, r7
	mov r1, #1
	bl ov29_02300DCC
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [r8, #0x177]
	bne _022FEFA4
	mov r0, r7
	bl ov29_023007A8
	cmp r0, #0
	moveq r0, #0xff
	streqb r0, [r8, #0x177]
	beq _022FEFA4
	ldrb r0, [r8, #0xf3]
	cmp r0, #1
	moveq r0, #0xff
	streqb r0, [r8, #0x177]
	beq _022FEFA4
	mov r0, #4
	bl DungeonRandInt
	ldr fp, _022FEFBC ; =0x0000020D
	mov sb, r6
	add lr, r8, #0x124
	sub r1, fp, #0xc6
	b _022FEF80
_022FEE60:
	ldrb r2, [lr, r0, lsl #3]
	add sl, lr, r0, lsl #3
	tst r2, #1
	movne r2, #1
	moveq r2, #0
	tst r2, #0xff
	beq _022FEF70
	add ip, sp, #8
	mov r3, #4
_022FEE84:
	ldrh r2, [sl], #2
	subs r3, r3, #1
	strh r2, [ip], #2
	bne _022FEE84
	ldrh r2, [sp, #0xc]
	cmp r2, #0x8a
	cmpne r2, r1
	cmpne r2, fp
	beq _022FEF70
	mov sb, #0
	add r6, r8, #0x124
	mov fp, #1
	b _022FEF20
_022FEEB8:
	ldrb r0, [r6, sb, lsl #3]
	add sl, r6, sb, lsl #3
	tst r0, #1
	movne r0, fp
	moveq r0, #0
	tst r0, #0xff
	beq _022FEF1C
	ldrb r0, [r8, #7]
	cmp r0, #0
	bne _022FEEEC
	ldrb r0, [sl]
	tst r0, #4
	beq _022FEF1C
_022FEEEC:
	ldrh r0, [sl, #4]
	cmp r0, #0xe3
	bne _022FEF1C
	mov r0, r7
	mov r1, sl
	mov r2, #1
	bl CanMonsterUseMove
	cmp r0, #0
	beq _022FEF1C
	add r0, sl, #6
	bl TickStatusTurnCounter
	b _022FEF28
_022FEF1C:
	add sb, sb, #1
_022FEF20:
	cmp sb, #4
	blt _022FEEB8
_022FEF28:
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _022FEFC0 ; =0x00000DF3
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	and r0, r5, #7
	strb r0, [r8, #0x4c]
	mov r1, #0
	add r2, sp, #8
	stmia sp, {r1, r2}
	mov r0, r7
	mov r2, r1
	mov r3, #1
	bl ov29_02322374
	mov r6, #1
	b _022FEF88
_022FEF70:
	add r0, r0, #1
	cmp r0, #4
	moveq r0, #0
	add sb, sb, #1
_022FEF80:
	cmp sb, #4
	blt _022FEE60
_022FEF88:
	mov r0, #0xff
	strb r0, [r8, #0x177]
	cmp r6, #0
	beq _022FEFA4
	ldr r1, _022FEFC4 ; =0x00001204
	mov r0, r7
	bl ov29_022E56A0
_022FEFA4:
	add r4, r4, #1
	cmp r4, #0x14
	blt _022FEDC8
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FEFB8: .word 0x02353538
_022FEFBC: .word 0x0000020D
_022FEFC0: .word 0x00000DF3
_022FEFC4: .word 0x00001204
	arm_func_end ov29_022FEDBC

	arm_func_start ov29_022FEFC8
ov29_022FEFC8: ; 0x022FEFC8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r5, #0
_022FEFD4:
	ldr r0, _022FF160 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb78]
	mov r0, r8
	bl EntityIsValid__022FED98
	cmp r0, #0
	ldrne sl, [r8, #0xb4]
	ldrneb r7, [sl, #0x178]
	cmpne r7, #0xff
	beq _022FF14C
	mov r0, r8
	mov r1, #1
	bl ov29_02300DCC
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [sl, #0x178]
	strneb r0, [sl, #0x177]
	bne _022FF14C
	mov r0, r8
	bl ov29_023007A8
	cmp r0, #0
	moveq r0, #0xff
	streqb r0, [sl, #0x178]
	streqb r0, [sl, #0x177]
	beq _022FF14C
	ldrb r0, [sl, #0xf3]
	cmp r0, #1
	moveq r0, #0xff
	streqb r0, [sl, #0x178]
	streqb r0, [sl, #0x177]
	beq _022FF14C
	mov r6, #0
	add r4, sl, #0x124
	mov fp, #1
	b _022FF0F8
_022FF068:
	ldrb r0, [r4, r6, lsl #3]
	add sb, r4, r6, lsl #3
	tst r0, #1
	movne r0, fp
	moveq r0, #0
	tst r0, #0xff
	beq _022FF0F4
	ldrb r0, [sl, #7]
	cmp r0, #0
	bne _022FF09C
	ldrb r0, [sb]
	tst r0, #4
	beq _022FF0F4
_022FF09C:
	ldrh r0, [sb, #4]
	cmp r0, #0x19
	bne _022FF0F4
	mov r0, r8
	mov r1, sb
	mov r2, #1
	bl CanMonsterUseMove
	cmp r0, #0
	beq _022FF0F4
	add r2, sp, #8
	mov r3, sb
	mov r1, #4
_022FF0CC:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022FF0CC
	add r0, sb, #6
	bl TickStatusTurnCounter
	mov r0, r8
	mov r1, sb
	bl ov29_022FAA04
	b _022FF100
_022FF0F4:
	add r6, r6, #1
_022FF0F8:
	cmp r6, #4
	blt _022FF068
_022FF100:
	mov r0, #0
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _022FF164 ; =0x00000DF4
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
	and r0, r7, #7
	mov r1, #0
	strb r0, [sl, #0x4c]
	add r3, sp, #8
	stmia sp, {r1, r3}
	mov r0, r8
	mov r2, r1
	mov r3, #1
	bl ov29_02322374
	mov r0, #0xff
	strb r0, [sl, #0x178]
	strb r0, [sl, #0x177]
_022FF14C:
	add r5, r5, #1
	cmp r5, #0x14
	blt _022FEFD4
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FF160: .word 0x02353538
_022FF164: .word 0x00000DF4
	arm_func_end ov29_022FEFC8

	arm_func_start ov29_022FF168
ov29_022FF168: ; 0x022FF168
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r5, _022FF1C4 ; =0x02353538
	mov r6, r4
_022FF178:
	ldr r0, [r5]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb78]
	mov r0, r7
	bl EntityIsValid__022FED98
	cmp r0, #0
	ldrne r2, [r7, #0xb4]
	ldrneb r0, [r2, #0x15c]
	cmpne r0, #0
	beq _022FF1B4
	mov r0, r7
	mov r1, r7
	strb r6, [r2, #0x15c]
	bl ov29_02313CE4
_022FF1B4:
	add r4, r4, #1
	cmp r4, #0x14
	blt _022FF178
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FF1C4: .word 0x02353538
	arm_func_end ov29_022FF168

	arm_func_start HasStatusThatPreventsActing
HasStatusThatPreventsActing: ; 0x022FF1C8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	add r0, r4, #0x4a
	mov r1, #1
	bl SetMonsterActionFields
	ldrb r0, [r4, #0xbd]
	cmp r0, #1
	cmpne r0, #3
	cmpne r0, #5
	bne _022FF20C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022FF20C:
	ldrb r0, [r4, #0xc4]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _022FF27C
_022FF21C: ; jump table
	b _022FF27C ; case 0
	b _022FF238 ; case 1
	b _022FF27C ; case 2
	b _022FF24C ; case 3
	b _022FF260 ; case 4
	b _022FF27C ; case 5
	b _022FF274 ; case 6
_022FF238:
	ldr r1, _022FF3DC ; =0x00000C28
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022FF24C:
	ldr r1, _022FF3E0 ; =0x00000C29
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022FF260:
	ldr r1, _022FF3E4 ; =0x00000C2A
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022FF274:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022FF27C:
	ldrb r0, [r4, #0xd0]
	cmp r0, #3
	beq _022FF294
	cmp r0, #7
	beq _022FF2A8
	b _022FF2BC
_022FF294:
	ldr r1, _022FF3E8 ; =0x00000C2B
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022FF2A8:
	ldr r1, _022FF3EC ; =0x00000C2C
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022FF2BC:
	ldrb r0, [r4, #0xd2]
	cmp r0, #1
	bne _022FF2DC
	ldr r1, _022FF3F0 ; =0x00000C2D
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022FF2DC:
	ldrb r0, [r4, #0xd8]
	cmp r0, #2
	bne _022FF320
	ldrsh r1, [r4, #2]
	add r0, r4, #0x4a
	bl SetActionPassTurnOrWalk
	mov r0, #8
	bl DungeonRandInt
	strb r0, [r4, #0x4c]
	ldrsh r2, [r5, #4]
	add r1, r4, #0x100
	mov r0, #1
	strh r2, [r1, #0x7e]
	ldrsh r2, [r5, #6]
	sub r2, r2, #1
	strh r2, [r1, #0x80]
	ldmia sp!, {r3, r4, r5, pc}
_022FF320:
	ldrb r0, [r4, #9]
	cmp r0, #1
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	beq _022FF3AC
	ldrb r1, [r4, #0x4c]
	mov r0, r5
	bl ov29_02300E78
	cmp r0, #0
	beq _022FF368
	ldrsh r1, [r4, #2]
	add r0, r4, #0x4a
	bl SetActionPassTurnOrWalk
	b _022FF3A4
_022FF368:
	mov r0, #2
	bl DungeonRandInt
	cmp r0, #0
	beq _022FF39C
	mov r0, #8
	bl DungeonRandInt
	and r1, r0, #0xff
	and r0, r1, #7
	strb r0, [r4, #0x4c]
	ldrsh r1, [r4, #2]
	add r0, r4, #0x4a
	bl SetActionPassTurnOrWalk
	b _022FF3A4
_022FF39C:
	mov r0, r5
	bl ChooseAiMove
_022FF3A4:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022FF3AC:
	ldrb r0, [r4, #0xf1]
	cmp r0, #2
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsh r1, [r4, #2]
	add r0, r4, #0x4a
	bl SetActionPassTurnOrWalk
	mov r0, #8
	bl DungeonRandInt
	strb r0, [r4, #0x4c]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FF3DC: .word 0x00000C28
_022FF3E0: .word 0x00000C29
_022FF3E4: .word 0x00000C2A
_022FF3E8: .word 0x00000C2B
_022FF3EC: .word 0x00000C2C
_022FF3F0: .word 0x00000C2D
	arm_func_end HasStatusThatPreventsActing

	arm_func_start ov29_022FF3F4
ov29_022FF3F4: ; 0x022FF3F4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	mov r4, #0
	ldr r6, [r7, #0xb4]
	mov r0, r4
	mov r1, r7
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	add r0, r6, #0x4a
	mov r1, #1
	bl SetMonsterActionFields
	ldrb r0, [r6, #0xbd]
	cmp r0, #1
	cmpne r0, #3
	cmpne r0, #5
	bne _022FF448
	ldr r1, _022FF60C ; =0x00000C2E
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF448:
	ldrb r0, [r6, #0xc4]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _022FF4B8
_022FF458: ; jump table
	b _022FF4B8 ; case 0
	b _022FF474 ; case 1
	b _022FF4B8 ; case 2
	b _022FF488 ; case 3
	b _022FF49C ; case 4
	b _022FF4B8 ; case 5
	b _022FF4B0 ; case 6
_022FF474:
	ldr r1, _022FF610 ; =0x00000C28
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF488:
	ldr r1, _022FF614 ; =0x00000C29
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF49C:
	ldr r1, _022FF618 ; =0x00000C2A
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF4B0:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF4B8:
	ldrb r0, [r6, #0xd0]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022FF51C
_022FF4C8: ; jump table
	b _022FF51C ; case 0
	b _022FF51C ; case 1
	b _022FF4EC ; case 2
	b _022FF4F4 ; case 3
	b _022FF51C ; case 4
	b _022FF51C ; case 5
	b _022FF51C ; case 6
	b _022FF508 ; case 7
	b _022FF51C ; case 8
_022FF4EC:
	mov r4, #1
	b _022FF51C
_022FF4F4:
	ldr r1, _022FF61C ; =0x00000C2B
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF508:
	ldr r1, _022FF620 ; =0x00000C2C
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF51C:
	ldrb r0, [r6, #0xd2]
	cmp r0, #1
	bne _022FF53C
	ldr r1, _022FF624 ; =0x00000C2D
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF53C:
	cmp r0, #0
	cmpne r0, #0xb
	cmpne r0, #0xc
	beq _022FF604
	cmp r4, #0
	beq _022FF564
	ldr r1, _022FF628 ; =0x00000C2F
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	b _022FF5FC
_022FF564:
	mov r5, #0
	add r4, r6, #0x124
	mov r8, r5
	mov sb, #1
	b _022FF5F4
_022FF578:
	ldrb r0, [r4, r5, lsl #3]
	mov r1, r5, lsl #3
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	beq _022FF5F0
	mov r0, r7
	add r1, r4, r1
	bl ov29_023245A4
	cmp r0, #0
	beq _022FF5F0
	ldrb r0, [r6, #0xd4]
	cmp r0, r5
	bne _022FF5F0
	b _022FF5CC
_022FF5B8:
	add r0, r6, r5, lsl #3
	ldrb r0, [r0, #0x124]
	tst r0, #2
	beq _022FF5D4
	sub r5, r5, #1
_022FF5CC:
	cmp r5, #0
	bgt _022FF5B8
_022FF5D4:
	ldrb r1, [r6, #0x4e]
	mov r2, r5, lsl #0x10
	add r0, r6, #0x4a
	mov r2, r2, asr #0x10
	bl ov29_022EBC98
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF5F0:
	add r5, r5, #1
_022FF5F4:
	cmp r5, #4
	blt _022FF578
_022FF5FC:
	mov r0, r7
	bl ov29_02318D58
_022FF604:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FF60C: .word 0x00000C2E
_022FF610: .word 0x00000C28
_022FF614: .word 0x00000C29
_022FF618: .word 0x00000C2A
_022FF61C: .word 0x00000C2B
_022FF620: .word 0x00000C2C
_022FF624: .word 0x00000C2D
_022FF628: .word 0x00000C2F
	arm_func_end ov29_022FF3F4

	arm_func_start ov29_022FF62C
ov29_022FF62C: ; 0x022FF62C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetMobilityType
	cmp r4, #0
	beq _022FF660
	cmp r0, #0
	cmpne r0, #4
	moveq r1, #1
	movne r1, #0
	tst r1, #0xff
	ldrne r0, _022FF670 ; =0x0237C9B8
	ldrneb r0, [r0, #5]
	ldmneia sp!, {r4, pc}
_022FF660:
	cmp r0, #4
	ldrhs r1, _022FF670 ; =0x0237C9B8
	ldrhsb r0, [r1, r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FF670: .word 0x0237C9B8
	arm_func_end ov29_022FF62C

	arm_func_start ov29_022FF674
ov29_022FF674: ; 0x022FF674
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #4
	moveq r2, #1
	movne r2, #0
	mov r0, r1
	and r1, r2, #0xff
	bl ov29_022FF62C
	mov r4, r0
	cmp r4, #3
	beq _022FF6BC
	mov r0, r5
	bl HasConditionalGroundImmunity
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
_022FF6BC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022FF674

	arm_func_start ov29_022FF6C4
ov29_022FF6C4: ; 0x022FF6C4
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldr r1, [r4, #0xc]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	ldrh r1, [r4]
	tst r1, #0x10
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mov r1, #0
	bl ov29_022FF62C
	ldrh r1, [r4]
	cmp r0, #3
	and r1, r1, #3
	addls pc, pc, r0, lsl #2
	b _022FF754
_022FF708: ; jump table
	b _022FF718 ; case 0
	b _022FF728 ; case 1
	b _022FF744 ; case 2
	b _022FF754 ; case 3
_022FF718:
	cmp r1, #1
	bne _022FF75C
	mov r0, #0
	ldmia sp!, {r4, pc}
_022FF728:
	cmp r1, #2
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r1, #1
	bne _022FF75C
	mov r0, #0
	ldmia sp!, {r4, pc}
_022FF744:
	cmp r1, #0
	beq _022FF75C
	mov r0, #0
	ldmia sp!, {r4, pc}
_022FF754:
	mov r0, #0
	ldmia sp!, {r4, pc}
_022FF75C:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022FF6C4

	arm_func_start ov29_022FF764
ov29_022FF764: ; 0x022FF764
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r0
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	ldr r5, [r6, #0xb4]
	bl GetTile
	ldrsh r1, [r7]
	mov r4, r0
	cmp r1, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r0, [r7, #2]
	cmp r0, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, #0x38
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r0, #0x20
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r4]
	tst r0, #0x10
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	bl ov29_02336204
	cmp r0, #0
	bne _022FF810
	ldrb r0, [r5, #0xef]
	cmp r0, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_022FF810:
	ldrsh r1, [r5, #2]
	mov r0, r6
	bl ov29_022FF674
	ldrh r2, [r4]
	mov r1, r0
	mov r0, r6
	and r4, r2, #3
	bl ov29_022FF8C8
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022FF888
_022FF83C: ; jump table
	b _022FF84C ; case 0
	b _022FF85C ; case 1
	b _022FF878 ; case 2
	b _022FF888 ; case 3
_022FF84C:
	cmp r4, #1
	bne _022FF890
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FF85C:
	cmp r4, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, #1
	bne _022FF890
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FF878:
	cmp r4, #0
	beq _022FF890
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FF888:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FF890:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_022FF764

	arm_func_start ItemIsActive__022FF898
ItemIsActive__022FF898: ; 0x022FF898
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0x6f
	mov r5, r0
	bl AbilityIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl HasHeldItem
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ItemIsActive__022FF898

	arm_func_start ov29_022FF8C8
ov29_022FF8C8: ; 0x022FF8C8
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
	arm_func_end ov29_022FF8C8

	arm_func_start ov29_022FF908
ov29_022FF908: ; 0x022FF908
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xb4]
	ldrb r1, [r4, #0xef]
	cmp r1, #3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsh r1, [r4, #2]
	mov r0, r5
	bl ov29_022FF674
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022FF908

	arm_func_start ov29_022FF958
ov29_022FF958: ; 0x022FF958
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r0
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	ldr r5, [r6, #0xb4]
	bl GetTile
	ldrsh r1, [r7]
	mov r4, r0
	cmp r1, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r0, [r7, #2]
	cmp r0, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, #0x38
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r0, #0x20
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r4]
	tst r0, #0x10
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	ldrne r0, [r0]
	cmpne r0, #1
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	bl ov29_02336204
	cmp r0, #0
	bne _022FFA0C
	ldrb r0, [r5, #0xef]
	cmp r0, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_022FFA0C:
	ldrsh r1, [r5, #2]
	mov r0, r6
	bl ov29_022FF674
	ldrh r2, [r4]
	mov r1, r0
	mov r0, r6
	and r4, r2, #3
	bl ov29_022FF8C8
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022FFA84
_022FFA38: ; jump table
	b _022FFA48 ; case 0
	b _022FFA58 ; case 1
	b _022FFA74 ; case 2
	b _022FFA84 ; case 3
_022FFA48:
	cmp r4, #1
	bne _022FFA8C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFA58:
	cmp r4, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, #1
	bne _022FFA8C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFA74:
	cmp r4, #0
	beq _022FFA8C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFA84:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFA8C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_022FF958

	arm_func_start ov29_022FFA94
ov29_022FFA94: ; 0x022FFA94
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r0
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	ldr r5, [r6, #0xb4]
	bl GetTile
	ldrsh r1, [r7]
	mov r4, r0
	cmp r1, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r0, [r7, #2]
	cmp r0, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, #0x38
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r0, #0x20
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r4]
	tst r0, #0x10
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	ldrne r0, [r0]
	cmpne r0, #1
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r1, [r5, #2]
	mov r0, r6
	bl ov29_022FF674
	ldrh r1, [r4]
	cmp r0, #3
	and r1, r1, #3
	addls pc, pc, r0, lsl #2
	b _022FFB80
_022FFB34: ; jump table
	b _022FFB44 ; case 0
	b _022FFB54 ; case 1
	b _022FFB70 ; case 2
	b _022FFB70 ; case 3
_022FFB44:
	cmp r1, #1
	bne _022FFB88
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFB54:
	cmp r1, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, #1
	bne _022FFB88
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFB70:
	cmp r1, #0
	beq _022FFB88
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFB80:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFB88:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_022FFA94

	arm_func_start ov29_022FFB90
ov29_022FFB90: ; 0x022FFB90
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r0
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	ldr r5, [r6, #0xb4]
	bl GetTile
	ldrsh r1, [r7]
	mov r4, r0
	cmp r1, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r0, [r7, #2]
	cmp r0, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, #0x38
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r0, #0x20
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r4]
	tst r0, #0x10
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	ldrne r0, [r0]
	cmpne r0, #1
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	bl ov29_02336204
	cmp r0, #0
	bne _022FFC44
	ldrb r0, [r5, #0xef]
	cmp r0, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_022FFC44:
	ldrsh r1, [r5, #2]
	mov r0, r6
	bl ov29_022FF674
	ldrh r2, [r4]
	mov r1, r0
	mov r0, r6
	and r4, r2, #3
	bl ov29_022FF8C8
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022FFC94
_022FFC70: ; jump table
	b _022FFC80 ; case 0
	b _022FFC80 ; case 1
	b _022FFC80 ; case 2
	b _022FFC94 ; case 3
_022FFC80:
	cmp r4, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFC94:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_022FFB90

	arm_func_start ov29_022FFC9C
ov29_022FFC9C: ; 0x022FFC9C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r0
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	ldr r5, [r6, #0xb4]
	bl GetTile
	ldrsh r1, [r7]
	mov r4, r0
	cmp r1, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r0, [r7, #2]
	cmp r0, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, #0x38
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r0, #0x20
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r4]
	tst r0, #0x10
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r4, #0xc]
	cmp r1, #0
	beq _022FFD38
	ldr r0, [r1]
	cmp r0, #1
	bne _022FFD30
	ldr r0, [r1, #0xb4]
	cmp r0, r5
	beq _022FFD38
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFD30:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFD38:
	bl ov29_02336204
	cmp r0, #0
	bne _022FFD6C
	ldrb r0, [r5, #0xef]
	cmp r0, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_022FFD6C:
	ldrsh r1, [r5, #2]
	mov r0, r6
	bl ov29_022FF674
	ldrh r2, [r4]
	mov r1, r0
	mov r0, r6
	and r4, r2, #3
	bl ov29_022FF8C8
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022FFDE4
_022FFD98: ; jump table
	b _022FFDA8 ; case 0
	b _022FFDB8 ; case 1
	b _022FFDD4 ; case 2
	b _022FFDE4 ; case 3
_022FFDA8:
	cmp r4, #1
	bne _022FFDEC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFDB8:
	cmp r4, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, #1
	bne _022FFDEC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFDD4:
	cmp r4, #0
	beq _022FFDEC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFDE4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFDEC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_022FFC9C

	arm_func_start CalcSpeedStage
CalcSpeedStage: ; 0x022FFDF4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r6, [r8, #0xb4]
	bl GetApparentWeather
	mov r4, #0
	mov r5, r0
	mov r1, r4
_022FFE14:
	add r2, r6, r1
	ldrb r0, [r2, #0x119]
	add r1, r1, #1
	cmp r0, #0
	ldrb r0, [r2, #0x114]
	subne r4, r4, r7
	cmp r0, #0
	addne r4, r4, r7
	cmp r1, #5
	blt _022FFE14
	ldrb r0, [r6, #0xbf]
	cmp r0, #4
	ldrsh r0, [r6, #2]
	subeq r4, r4, #1
	bl GetSpeedStatus
	add r4, r4, r0
	mov r0, r8
	mov r1, #6
	bl MonsterIsType
	cmp r0, #0
	beq _022FFE78
	mov r0, r8
	bl GetApparentWeather
	cmp r0, #7
	addeq r4, r4, #1
_022FFE78:
	mov r0, r8
	mov r1, #0x3a
	bl IqSkillIsEnabled
	cmp r0, #0
	ldr r1, _022FFF18 ; =0x023535B8
	addne r4, r4, #1
	ldrb r0, [r1, r5]
	cmp r0, #0
	beq _022FFEB0
	ldrb r1, [r1, r5]
	mov r0, r8
	bl ExclusiveItemEffectIsActive__022FFF28
	cmp r0, #0
	addne r4, r4, #1
_022FFEB0:
	ldrsh r1, [r6, #4]
	ldr r0, _022FFF1C ; =0x000001A5
	cmp r1, r0
	addne r0, r0, #0x72
	cmpne r1, r0
	ldrsh r1, [r6, #2]
	ldr r0, _022FFF20 ; =0x0000017F
	addeq r4, r4, #1
	cmp r1, r0
	addne r0, r0, #0x258
	cmpne r1, r0
	bne _022FFEFC
	ldrb r0, [r6, #6]
	cmp r0, #0
	ldrne r0, _022FFF24 ; =0x02353538
	ldrne r0, [r0]
	ldrneb r0, [r0, #0x790]
	cmpne r0, #0
	addne r4, r4, #1
_022FFEFC:
	cmp r4, #0
	movlt r4, #0
	cmp r4, #5
	movge r4, #4
	mov r0, r4
	str r4, [r6, #0x110]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FFF18: .word 0x023535B8
_022FFF1C: .word 0x000001A5
_022FFF20: .word 0x0000017F
_022FFF24: .word 0x02353538
	arm_func_end CalcSpeedStage

	arm_func_start ExclusiveItemEffectIsActive__022FFF28
ExclusiveItemEffectIsActive__022FFF28: ; 0x022FFF28
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r2, #0x228
	bl ExclusiveItemEffectFlagTest
	ldmia sp!, {r3, pc}
	arm_func_end ExclusiveItemEffectIsActive__022FFF28

	arm_func_start CalcSpeedStageWrapper
CalcSpeedStageWrapper: ; 0x022FFF4C
	ldr ip, _022FFF58 ; =CalcSpeedStage
	mov r1, #1
	bx ip
	.align 2, 0
_022FFF58: .word CalcSpeedStage
	arm_func_end CalcSpeedStageWrapper

	arm_func_start GetNumberOfAttacks
GetNumberOfAttacks: ; 0x022FFF5C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	mov r5, #0
	mov sl, r0
	mov sb, r1
	mov r6, r5
	mov r7, r5
	bl EntityIsValid__023000E4
	cmp r0, #0
	moveq r0, r5
	beq _023000D4
	mov r0, sl
	bl GetApparentWeather
	mov r8, r0
	cmp r8, #4
	bne _022FFFB8
	mov r0, sl
	mov r1, #0x1b
	bl AbilityIsActive
	cmp r0, #0
	movne r5, #1
	movne r6, r5
	b _022FFFD8
_022FFFB8:
	cmp r8, #1
	bne _022FFFD8
	mov r0, sl
	mov r1, #0x4a
	bl AbilityIsActive
	cmp r0, #0
	movne r5, #1
	movne r6, r5
_022FFFD8:
	ldr r4, _023000DC ; =0x023535B0
	ldrb r0, [r4, r8]
	cmp r0, #0
	beq _02300000
	ldrb r1, [r4, r8]
	mov r0, sl
	bl ExclusiveItemEffectIsActive__022FFF28
	cmp r0, #0
	ldrneb r7, [r4, r8]
	movne r5, #1
_02300000:
	mov r0, sl
	mov r1, #0x54
	bl AbilityIsActive
	cmp r0, #0
	beq _02300028
	ldr r0, [sl, #0xb4]
	ldrsh r0, [r0, #0x66]
	cmp r0, #0
	moveq r5, #1
	moveq r6, r5
_02300028:
	cmp sb, #0
	beq _023000C8
	cmp r6, #0
	beq _02300068
	ldr r0, [sl, #0xb4]
	mov r2, r5
	mov r1, #0x40
	bl ov29_023023C0
	cmp r0, #0
	beq _023000C8
	mov r0, sl
	bl ov29_022E655C
	mov r0, sl
	mov r1, #0xc30
	bl LogMessageByIdWithPopupCheckUser
	b _023000C8
_02300068:
	cmp r7, #0
	beq _023000C8
	ldr r0, [sl, #0xb4]
	mov r2, r5
	mov r1, #0x40
	bl ov29_023023C0
	cmp r0, #0
	beq _023000C8
	mov r0, sl
	bl ov29_022E655C
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	add r2, sp, #0
	mov r0, sl
	mov r1, r7
	bl ov29_0230F654
	add r1, sp, #0
	mov r0, #0
	bl ov29_02344B44
	ldr r1, _023000E0 ; =0x00000C31
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_023000C8:
	cmp r5, #0
	movne r0, #2
	moveq r0, #1
_023000D4:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_023000DC: .word 0x023535B0
_023000E0: .word 0x00000C31
	arm_func_end GetNumberOfAttacks
