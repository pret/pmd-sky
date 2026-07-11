	.include "asm/macros.inc"
	.include "main_02001D50.inc"

	.text

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
