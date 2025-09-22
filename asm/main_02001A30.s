	.include "asm/macros.inc"
	.include "main_02001A30.inc"

	.text

	arm_func_start UFixedPoint64CmpLt
UFixedPoint64CmpLt: ; 0x02001A30
	cmp r0, r2
	movlo r0, #1
	bxlo lr
	movhi r0, #0
	bxhi lr
	cmp r1, r3
	movlo r0, #1
	movhs r0, #0
	bx lr
	arm_func_end UFixedPoint64CmpLt

	arm_func_start MultiplyByFixedPoint
MultiplyByFixedPoint: ; 0x02001A54
	stmdb sp!, {r3, r4, r5, lr}
	tst r0, #0x80000000
	movne r2, #1
	moveq r2, #0
	tst r1, #0x80000000
	and r4, r2, #0xff
	movne r2, #1
	moveq r2, #0
	cmp r0, #0
	and r5, r2, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	rsbne r0, r0, #0
	cmp r5, #0
	rsbne r1, r1, #0
	bl UMultiplyByFixedPoint
	cmp r4, r5
	rsbne r0, r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end MultiplyByFixedPoint

	arm_func_start sub_02001AB0
sub_02001AB0: ; 0x02001AB0
	stmdb sp!, {r3, r4, r5, lr}
	tst r0, #0x80000000
	movne r2, #1
	moveq r2, #0
	tst r1, #0x80000000
	and r4, r2, #0xff
	movne r2, #1
	moveq r2, #0
	cmp r1, #0
	and r5, r2, #0xff
	mvneq r0, #0x80000000
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	rsbne r0, r0, #0
	cmp r5, #0
	rsbne r1, r1, #0
	bl sub_02001BB4
	cmp r4, r5
	rsbne r0, r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02001AB0

	arm_func_start UMultiplyByFixedPoint
UMultiplyByFixedPoint: ; 0x02001B0C
	stmdb sp!, {r3, r4, r5, lr}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r3, #0
	mov r2, r3
	mov ip, r3
	mov lr, r3
	mov r4, r3
_02001B3C:
	mov r5, lr
	tst r1, #1
	beq _02001B58
	add lr, lr, r0
	add ip, ip, r3
	cmp r5, lr
	addhi ip, ip, #1
_02001B58:
	mov r1, r1, lsr #1
	tst r2, #1
	orrne r1, r1, #0x80000000
	mov r2, r2, lsr #1
	tst r0, #0x80000000
	mov r3, r3, lsl #1
	mov r0, r0, lsl #1
	add r4, r4, #1
	orrne r3, r3, #1
	bic r2, r2, #0x80000000
	cmp r4, #0x40
	bic r0, r0, #1
	blt _02001B3C
	mov r0, lr, lsr #8
	tst lr, #0x80
	movne r1, #1
	bic r0, r0, #0xff000000
	moveq r1, #0
	orr lr, r0, ip, lsl #24
	tst r1, #0xff
	addne lr, lr, #1
	mov r0, lr
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UMultiplyByFixedPoint

	arm_func_start sub_02001BB4
sub_02001BB4: ; 0x02001BB4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r1
	mvneq r0, #0x80000000
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, #0
	mov r1, r0, asr #0x18
	mov r0, r0, lsl #8
	mov r4, r8
	mov r5, r8
	mov sb, r8
	and r6, r1, #0xff
	bic r7, r0, #0xff
	mov fp, r8
_02001BF4:
	mov r0, r5, lsl #1
	tst r5, #0x80000000
	mov r4, r4, lsl #1
	orrne r4, r4, #1
	bic r5, r0, #1
	tst r6, #0x80000000
	orrne r5, r5, #1
	mov r3, r7, lsl #1
	tst r7, #0x80000000
	mov r6, r6, lsl #1
	bic r7, r3, #1
	mov r0, r4
	mov r1, r5
	mov r2, fp
	mov r3, sl
	orrne r6, r6, #1
	bl UFixedPoint64CmpLt
	cmp r0, #0
	bne _02001C58
	mov r0, r5
	sub r5, r5, sl
	cmp r0, r5
	mov r1, #1
	sublo r4, r4, #1
	b _02001C5C
_02001C58:
	mov r1, #0
_02001C5C:
	mov r0, r8, lsl #1
	bic r8, r0, #1
	cmp r1, #0
	add sb, sb, #1
	orrne r8, r8, #1
	cmp sb, #0x40
	blt _02001BF4
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02001BB4

	arm_func_start IntToFixedPoint64
IntToFixedPoint64: ; 0x02001C80
	mov r2, #0x10000
	rsb r2, r2, #0
	and r3, r1, r2
	mov r3, r3, lsr #0x10
	str r3, [r0]
	mov r3, r1, lsl #0x10
	str r3, [r0, #4]
	tst r1, #0x8000
	ldrne r1, [r0]
	orrne r1, r1, r2
	strne r1, [r0]
	bx lr
	arm_func_end IntToFixedPoint64

	arm_func_start FixedPoint64ToInt
FixedPoint64ToInt: ; 0x02001CB0
	ldmia r0, {r1, r2}
	mov r0, #0x10000
	rsb r0, r0, #0
	mov r1, r1, lsl #0x10
	and r0, r2, r0
	orr r0, r1, r0, lsr #16
	tst r2, #0x8000
	addne r0, r0, #1
	bx lr
	arm_func_end FixedPoint64ToInt

	arm_func_start FixedPoint32To64
FixedPoint32To64: ; 0x02001CD4
	mov r2, r1, asr #0x18
	mov r3, r1, lsl #8
	tst r2, #0x80
	mvnne r1, #0x7f
	orrne r1, r2, r1
	stmia r0, {r2, r3}
	andeq r1, r2, #0x7f
	str r1, [r0]
	bx lr
	arm_func_end FixedPoint32To64

	arm_func_start NegateFixedPoint64
NegateFixedPoint64: ; 0x02001CF8
	ldr r2, [r0]
	mvn r1, #0
	eor r2, r2, r1
	str r2, [r0]
	ldr r2, [r0, #4]
	eor r2, r2, r1
	adds r1, r2, #1
	str r1, [r0, #4]
	ldreq r1, [r0]
	addeq r1, r1, #1
	streq r1, [r0]
	bx lr
	arm_func_end NegateFixedPoint64

	arm_func_start FixedPoint64IsZero
FixedPoint64IsZero: ; 0x02001D28
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #0
	bxne lr
	ldr r0, [r0, #4]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end FixedPoint64IsZero

	arm_func_start FixedPoint64IsNegative
FixedPoint64IsNegative: ; 0x02001D50
	ldr r0, [r0]
	tst r0, #0x80000000
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end FixedPoint64IsNegative

	arm_func_start FixedPoint64CmpLt
FixedPoint64CmpLt: ; 0x02001D68
	stmdb sp!, {r3, lr}
	mov ip, r1
	ldr r2, [ip]
	mov lr, r0
	tst r2, #0x80000000
	movne r1, #2
	ldr r0, [lr]
	moveq r1, #0
	tst r0, #0x80000000
	movne r3, #1
	moveq r3, #0
	orr r1, r3, r1
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02001DB4
_02001DA4: ; jump table
	b _02001DB4 ; case 0
	b _02001DC4 ; case 1
	b _02001DCC ; case 2
	b _02001DD4 ; case 3
_02001DB4:
	ldr r1, [lr, #4]
	ldr r3, [ip, #4]
	bl UFixedPoint64CmpLt
	ldmia sp!, {r3, pc}
_02001DC4:
	mov r0, #1
	ldmia sp!, {r3, pc}
_02001DCC:
	mov r0, #0
	ldmia sp!, {r3, pc}
_02001DD4:
	ldr r1, [lr, #4]
	ldr r3, [ip, #4]
	bl UFixedPoint64CmpLt
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end FixedPoint64CmpLt

	arm_func_start MultiplyFixedPoint64
MultiplyFixedPoint64: ; 0x02001DF4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	ldr r3, [r1]
	mov r4, r0
	str r3, [sp, #0x10]
	ldr r1, [r1, #4]
	add r0, sp, #0x10
	str r1, [sp, #0x14]
	ldr r1, [r2]
	str r1, [sp, #8]
	ldr r1, [r2, #4]
	str r1, [sp, #0xc]
	bl FixedPoint64IsNegative
	mov r5, r0
	add r0, sp, #8
	bl FixedPoint64IsNegative
	mov r6, r0
	add r0, sp, #0x10
	bl FixedPoint64IsZero
	cmp r0, #0
	movne r0, #0
	strne r0, [r4]
	strne r0, [r4, #4]
	bne _02001EC0
	add r0, sp, #8
	bl FixedPoint64IsZero
	cmp r0, #0
	movne r0, #0
	strne r0, [r4]
	strne r0, [r4, #4]
	bne _02001EC0
	cmp r5, #0
	beq _02001E80
	add r0, sp, #0x10
	bl NegateFixedPoint64
_02001E80:
	cmp r6, #0
	beq _02001E90
	add r0, sp, #8
	bl NegateFixedPoint64
_02001E90:
	add r0, sp, #0
	add r1, sp, #0x10
	add r2, sp, #8
	bl UMultiplyFixedPoint64
	cmp r5, r6
	beq _02001EB0
	add r0, sp, #0
	bl NegateFixedPoint64
_02001EB0:
	ldr r0, [sp]
	str r0, [r4]
	ldr r0, [sp, #4]
	str r0, [r4, #4]
_02001EC0:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end MultiplyFixedPoint64

	arm_func_start DivideFixedPoint64
DivideFixedPoint64: ; 0x02001EC8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	ldr r3, [r1]
	mov r4, r0
	str r3, [sp, #0x10]
	ldr r1, [r1, #4]
	add r0, sp, #0x10
	str r1, [sp, #0x14]
	ldr r1, [r2]
	str r1, [sp, #8]
	ldr r1, [r2, #4]
	str r1, [sp, #0xc]
	bl FixedPoint64IsNegative
	mov r5, r0
	add r0, sp, #8
	bl FixedPoint64IsNegative
	mov r6, r0
	add r0, sp, #8
	bl FixedPoint64IsZero
	cmp r0, #0
	mvnne r0, #0x80000000
	strne r0, [r4]
	subne r0, r0, #0x80000000
	strne r0, [r4, #4]
	bne _02001F98
	add r0, sp, #0x10
	bl FixedPoint64IsZero
	cmp r0, #0
	movne r0, #0
	strne r0, [r4]
	strne r0, [r4, #4]
	bne _02001F98
	cmp r5, #0
	beq _02001F58
	add r0, sp, #0x10
	bl NegateFixedPoint64
_02001F58:
	cmp r6, #0
	beq _02001F68
	add r0, sp, #8
	bl NegateFixedPoint64
_02001F68:
	add r0, sp, #0
	add r1, sp, #0x10
	add r2, sp, #8
	bl UDivideFixedPoint64
	cmp r5, r6
	beq _02001F88
	add r0, sp, #0
	bl NegateFixedPoint64
_02001F88:
	ldr r0, [sp]
	str r0, [r4]
	ldr r0, [sp, #4]
	str r0, [r4, #4]
_02001F98:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DivideFixedPoint64

	arm_func_start UMultiplyFixedPoint64
UMultiplyFixedPoint64: ; 0x02001FA0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r4, r0
	mov r0, r6
	mov r5, r2
	bl FixedPoint64IsZero
	cmp r0, #0
	movne r0, #0
	strne r0, [r4]
	strne r0, [r4, #4]
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl FixedPoint64IsZero
	cmp r0, #0
	movne r0, #0
	strne r0, [r4]
	strne r0, [r4, #4]
	ldmneia sp!, {r4, r5, r6, pc}
	mov lr, #0
	ldmia r6, {r1, r2}
	ldmia r5, {r3, ip}
	mov r5, lr
	mov r6, lr
_02001FFC:
	mov r0, r5
	tst ip, #1
	beq _02002018
	add r5, r5, r2
	add lr, lr, r1
	cmp r0, r5
	addhi lr, lr, #1
_02002018:
	mov r0, r3, lsr #1
	tst r3, #1
	mov ip, ip, lsr #1
	bic r3, r0, #0x80000000
	orrne ip, ip, #0x80000000
	mov r1, r1, lsl #1
	tst r2, #0x80000000
	mov r0, r2, lsl #1
	add r6, r6, #1
	orrne r1, r1, #1
	cmp r6, #0x40
	bic r2, r0, #1
	blt _02001FFC
	mov r0, r5, lsr #0x10
	mov r0, r0, lsl #0x10
	tst r5, #0x8000
	mov r1, lr, lsl #0x10
	movne r2, #1
	orr r5, r1, r0, lsr #16
	mov r0, lr, lsr #0x10
	moveq r2, #0
	mov r0, r0, lsl #0x10
	tst r2, #0xff
	addne r5, r5, #1
	mov r0, r0, lsr #0x10
	stmia r4, {r0, r5}
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end UMultiplyFixedPoint64

	arm_func_start UDivideFixedPoint64
UDivideFixedPoint64: ; 0x02002084
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r4, r2
	mov sl, r0
	mov r0, r4
	mov r5, r1
	bl FixedPoint64IsZero
	cmp r0, #0
	mvnne r0, #0x80000000
	strne r0, [sl]
	subne r0, r0, #0x80000000
	strne r0, [sl, #4]
	bne _020021C0
	mov r0, r5
	bl FixedPoint64IsZero
	cmp r0, #0
	movne r0, #0
	strne r0, [sl]
	strne r0, [sl, #4]
	bne _020021C0
	ldr r2, [r5, #4]
	mov r0, #0x10000
	mov r1, r2, lsr #0x10
	mov r8, #0
	ldr r3, [r5]
	rsb r0, r0, #0
	and r2, r0, r2, lsl #16
	and r3, r0, r3, lsl #16
	ldr r0, [r4]
	mov r1, r1, lsl #0x10
	ldr fp, [r4, #4]
	str r0, [sp, #4]
	mov sb, r8
	mov r4, r8
	mov r5, r8
	str r8, [sp]
	orr r6, r3, r1, lsr #16
	orr r7, r2, #0x8000
_0200211C:
	mov r0, r5, lsl #1
	tst r5, #0x80000000
	mov r4, r4, lsl #1
	orrne r4, r4, #1
	bic r5, r0, #1
	tst r6, #0x80000000
	orrne r5, r5, #1
	mov r1, r7, lsl #1
	tst r7, #0x80000000
	mov r6, r6, lsl #1
	bic r7, r1, #1
	ldr r2, [sp, #4]
	mov r0, r4
	mov r1, r5
	mov r3, fp
	orrne r6, r6, #1
	bl UFixedPoint64CmpLt
	cmp r0, #0
	bne _02002188
	mov r0, r5
	sub r5, r5, fp
	cmp r0, r5
	ldr r0, [sp, #4]
	mov r1, #1
	sub r4, r4, r0
	sublo r4, r4, #1
	b _0200218C
_02002188:
	mov r1, #0
_0200218C:
	mov r0, sb, lsl #1
	tst sb, #0x80000000
	bic sb, r0, #1
	ldr r0, [sp]
	mov r8, r8, lsl #1
	add r0, r0, #1
	orrne r8, r8, #1
	cmp r1, #0
	orrne sb, sb, #1
	str r0, [sp]
	cmp r0, #0x40
	blt _0200211C
	stmia sl, {r8, sb}
_020021C0:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end UDivideFixedPoint64

	arm_func_start AddFixedPoint64
AddFixedPoint64: ; 0x020021C8
	stmdb sp!, {r3, lr}
	ldr ip, [r1, #4]
	ldr lr, [r1]
	ldr r1, [r2]
	ldr r3, [r2, #4]
	add r1, lr, r1
	add r2, ip, r3
	cmp r2, ip
	addlo r1, r1, #1
	stmia r0, {r1, r2}
	ldmia sp!, {r3, pc}
	arm_func_end AddFixedPoint64

	arm_func_start ClampedLn
ClampedLn: ; 0x020021F4
	cmp r1, #1
	movlt r1, #1
	cmp r1, #0x800
	ldrge r1, _02002220 ; =0x000007FF
	ldr r2, _02002224 ; =NATURAL_LOG_VALUE_TABLE
	mov r1, r1, lsl #1
	ldrsh r2, [r2, r1]
	mov r1, #0
	mov r2, r2, lsl #4
	stmia r0, {r1, r2}
	bx lr
	.align 2, 0
_02002220: .word 0x000007FF
_02002224: .word NATURAL_LOG_VALUE_TABLE
	arm_func_end ClampedLn

	arm_func_start sub_02002228
sub_02002228: ; 0x02002228
	bx lr
	arm_func_end sub_02002228

	arm_func_start GetRngSeed
GetRngSeed: ; 0x0200222C
	ldr r0, _02002238 ; =PRNG_SEQUENCE_NUM
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_02002238: .word PRNG_SEQUENCE_NUM
	arm_func_end GetRngSeed

	arm_func_start SetRngSeed
SetRngSeed: ; 0x0200223C
	ldr r1, _02002248 ; =PRNG_SEQUENCE_NUM
	strh r0, [r1]
	bx lr
	.align 2, 0
_02002248: .word PRNG_SEQUENCE_NUM
	arm_func_end SetRngSeed
