	.include "asm/macros.inc"
	.include "overlay_29_022FEDBC.inc"

	.text

	arm_func_start ov29_022FEDBC
ov29_022FEDBC: ; 0x022FEDBC
#ifdef JAPAN
#define OV29_022FEDBC_OFFSET -4
#else
#define OV29_022FEDBC_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r4, #0
_022FEDC8:
	ldr r0, _022FEFB8 ; =DUNGEON_PTR
	mov r6, #0
	ldr r0, [r0]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xad4]
#else
	ldr r7, [r0, #0xb78]
#endif
	mov r0, r7
	bl EntityIsValid__022FED98
	cmp r0, #0
	ldrne r8, [r7, #0xb4]
	ldrneb r5, [r8, #0x177 + OV29_022FEDBC_OFFSET]
	cmpne r5, #0xff
	beq _022FEFA4
	mov r0, r7
	mov r1, #1
	bl ov29_02300DCC
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [r8, #0x177 + OV29_022FEDBC_OFFSET]
	bne _022FEFA4
	mov r0, r7
	bl IsMonsterSleeping
	cmp r0, #0
	moveq r0, #0xff
	streqb r0, [r8, #0x177 + OV29_022FEDBC_OFFSET]
	beq _022FEFA4
	ldrb r0, [r8, #0xf3]
	cmp r0, #1
	moveq r0, #0xff
	streqb r0, [r8, #0x177 + OV29_022FEDBC_OFFSET]
	beq _022FEFA4
	mov r0, #4
	bl DungeonRandInt
	ldr fp, _022FEFBC ; =0x0000020D
	mov sb, r6
	add lr, r8, #0x124 + OV29_022FEDBC_OFFSET
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
	add r6, r8, #0x124 + OV29_022FEDBC_OFFSET
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
	strb r0, [r8, #0x177 + OV29_022FEDBC_OFFSET]
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
_022FEFB8: .word DUNGEON_PTR
_022FEFBC: .word 0x0000020D
#ifdef JAPAN
_022FEFC0: .word 0x00000B33
#else
_022FEFC0: .word 0x00000DF3
#endif
_022FEFC4: .word 0x00001204
	arm_func_end ov29_022FEDBC

	arm_func_start ov29_022FEFC8
ov29_022FEFC8: ; 0x022FEFC8
#ifdef JAPAN
#define OV29_022FEFC8_OFFSET -4
#else
#define OV29_022FEFC8_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r5, #0
_022FEFD4:
	ldr r0, _022FF160 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xad4]
#else
	ldr r8, [r0, #0xb78]
#endif
	mov r0, r8
	bl EntityIsValid__022FED98
	cmp r0, #0
	ldrne sl, [r8, #0xb4]
	ldrneb r7, [sl, #0x178 + OV29_022FEFC8_OFFSET]
	cmpne r7, #0xff
	beq _022FF14C
	mov r0, r8
	mov r1, #1
	bl ov29_02300DCC
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [sl, #0x178 + OV29_022FEFC8_OFFSET]
	strneb r0, [sl, #0x177 + OV29_022FEFC8_OFFSET]
	bne _022FF14C
	mov r0, r8
	bl IsMonsterSleeping
	cmp r0, #0
	moveq r0, #0xff
	streqb r0, [sl, #0x178 + OV29_022FEFC8_OFFSET]
	streqb r0, [sl, #0x177 + OV29_022FEFC8_OFFSET]
	beq _022FF14C
	ldrb r0, [sl, #0xf3]
	cmp r0, #1
	moveq r0, #0xff
	streqb r0, [sl, #0x178 + OV29_022FEFC8_OFFSET]
	streqb r0, [sl, #0x177 + OV29_022FEFC8_OFFSET]
	beq _022FF14C
	mov r6, #0
	add r4, sl, #0x124 + OV29_022FEFC8_OFFSET
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
	strb r0, [sl, #0x178 + OV29_022FEFC8_OFFSET]
	strb r0, [sl, #0x177 + OV29_022FEFC8_OFFSET]
_022FF14C:
	add r5, r5, #1
	cmp r5, #0x14
	blt _022FEFD4
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FF160: .word DUNGEON_PTR
#ifdef JAPAN
_022FF164: .word 0x00000B34
#else
_022FF164: .word 0x00000DF4
#endif
	arm_func_end ov29_022FEFC8

	arm_func_start TryActivateFlashFireOnAllMonsters
TryActivateFlashFireOnAllMonsters: ; 0x022FF168
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r5, _022FF1C4 ; =DUNGEON_PTR
	mov r6, r4
_022FF178:
	ldr r0, [r5]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xad4]
#else
	ldr r7, [r0, #0xb78]
#endif
	mov r0, r7
	bl EntityIsValid__022FED98
	cmp r0, #0
	ldrne r2, [r7, #0xb4]
#ifdef JAPAN
	ldrneb r0, [r2, #0x158]
#else
	ldrneb r0, [r2, #0x15c]
#endif
	cmpne r0, #0
	beq _022FF1B4
	mov r0, r7
	mov r1, r7
#ifdef JAPAN
	strb r6, [r2, #0x158]
#else
	strb r6, [r2, #0x15c]
#endif
	bl ActivateFlashFire
_022FF1B4:
	add r4, r4, #1
	cmp r4, #0x14
	blt _022FF178
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FF1C4: .word DUNGEON_PTR
	arm_func_end TryActivateFlashFireOnAllMonsters

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
#ifdef JAPAN
	strh r2, [r1, #0x7a]
	ldrsh r2, [r5, #6]
	sub r2, r2, #1
	strh r2, [r1, #0x7c]
#else
	strh r2, [r1, #0x7e]
	ldrsh r2, [r5, #6]
	sub r2, r2, #1
	strh r2, [r1, #0x80]
#endif
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
	bl CanMonsterMoveInDirection
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
#ifdef JAPAN
#define HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET -0x2C1
#else
#define HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET 0
#endif
_022FF3DC: .word 0x00000C28 + HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET
_022FF3E0: .word 0x00000C29 + HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET
_022FF3E4: .word 0x00000C2A + HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET
_022FF3E8: .word 0x00000C2B + HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET
_022FF3EC: .word 0x00000C2C + HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET
_022FF3F0: .word 0x00000C2D + HAS_STATUS_THAT_PREVENTS_ACTING_OFFSET
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
#ifdef JAPAN
	add r4, r6, #0x120
#else
	add r4, r6, #0x124
#endif
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
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _022FF5F0
	ldrb r0, [r6, #0xd4]
	cmp r0, r5
	bne _022FF5F0
	b _022FF5CC
_022FF5B8:
	add r0, r6, r5, lsl #3
#ifdef JAPAN
	ldrb r0, [r0, #0x120]
#else
	ldrb r0, [r0, #0x124]
#endif
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
	bl SetActionUseMovePlayer
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
#ifdef JAPAN
#define OV29_022FF3F4_OFFSET -0x2C1
#else
#define OV29_022FF3F4_OFFSET 0
#endif
_022FF60C: .word 0x00000C2E + OV29_022FF3F4_OFFSET
_022FF610: .word 0x00000C28 + OV29_022FF3F4_OFFSET
_022FF614: .word 0x00000C29 + OV29_022FF3F4_OFFSET
_022FF618: .word 0x00000C2A + OV29_022FF3F4_OFFSET
_022FF61C: .word 0x00000C2B + OV29_022FF3F4_OFFSET
_022FF620: .word 0x00000C2C + OV29_022FF3F4_OFFSET
_022FF624: .word 0x00000C2D + OV29_022FF3F4_OFFSET
_022FF628: .word 0x00000C2F + OV29_022FF3F4_OFFSET
	arm_func_end ov29_022FF3F4

	arm_func_start GetMobilityTypeCheckSlip
GetMobilityTypeCheckSlip: ; 0x022FF62C
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
	ldrne r0, _022FF670 ; =ov29_0237C9B8
	ldrneb r0, [r0, #5]
	ldmneia sp!, {r4, pc}
_022FF660:
	cmp r0, #4
	ldrhs r1, _022FF670 ; =ov29_0237C9B8
	ldrhsb r0, [r1, r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FF670: .word ov29_0237C9B8
	arm_func_end GetMobilityTypeCheckSlip

	arm_func_start GetMobilityTypeCheckSlipAndFloating
GetMobilityTypeCheckSlipAndFloating: ; 0x022FF674
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #4
	moveq r2, #1
	movne r2, #0
	mov r0, r1
	and r1, r2, #0xff
	bl GetMobilityTypeCheckSlip
	mov r4, r0
	cmp r4, #3
	beq _022FF6BC
	mov r0, r5
	bl IsFloating
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
_022FF6BC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetMobilityTypeCheckSlipAndFloating

	arm_func_start IsInvalidSpawnTile
IsInvalidSpawnTile: ; 0x022FF6C4
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
	bl GetMobilityTypeCheckSlip
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
	arm_func_end IsInvalidSpawnTile

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
	bl IsCurrentTilesetBackground
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
	bl GetMobilityTypeCheckSlipAndFloating
	ldrh r2, [r4]
#ifdef JAPAN
	mov r4, r0
	mov r0, r6
	mov r1, #0xc
	and r5, r2, #3
	bl IqSkillIsEnabled
	cmp r0, #0
	mov r0, r6
	mov r1, #0xd
	movne r4, #2
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #3
	cmp r4, #3
	addls pc, pc, r4, lsl #2
#else
	mov r1, r0
	mov r0, r6
	and r4, r2, #3
	bl GetMobilityTypeAfterIqSkills
	cmp r0, #3
	addls pc, pc, r0, lsl #2
#endif
	b _022FF888
_022FF83C: ; jump table
	b _022FF84C ; case 0
	b _022FF85C ; case 1
	b _022FF878 ; case 2
	b _022FF888 ; case 3
_022FF84C:
#ifdef JAPAN
	cmp r5, #1
#else
	cmp r4, #1
#endif
	bne _022FF890
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FF85C:
#ifdef JAPAN
	cmp r5, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #1
#else
	cmp r4, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, #1
#endif
	bne _022FF890
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FF878:
#ifdef JAPAN
	cmp r5, #0
#else
	cmp r4, #0
#endif
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
