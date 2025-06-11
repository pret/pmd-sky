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
	bl MonsterCannotAttack
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
	bl MonsterCannotAttack
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
