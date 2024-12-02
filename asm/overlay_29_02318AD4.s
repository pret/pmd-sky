	.include "asm/macros.inc"
	.include "overlay_29_02318AD4.inc"

	.text

	arm_func_start ov29_02318AD4
ov29_02318AD4: ; 0x02318AD4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	mov r8, #1
	bl IsMonster__02318AB0
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov sb, #0
	ldr r7, [r4, #0xb4]
	mov r5, sb
	mov r6, r8
	mov r4, #0x53
	b _02318B3C
_02318B04:
#ifdef JAPAN
	ldrb r0, [r7, #0x10a]
	cmp r0, #1
	bne _02318B20
	ldr r0, [r7, #0x184]
#else
	ldrb r0, [r7, #0x10b]
	cmp r0, #1
	bne _02318B20
	ldr r0, [r7, #0x188]
#endif
	cmp r0, #0xc800
	movge r8, r6
	movlt r8, r5
_02318B20:
	cmp r8, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r4
	bl AdvanceFrame
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_02318B3C:
	cmp sb, #0x190
	blt _02318B04
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_02318AD4

	arm_func_start ov29_02318B48
ov29_02318B48: ; 0x02318B48
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	mov r8, #1
	bl IsMonster__02318AB0
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov sb, #0
	ldr r7, [r4, #0xb4]
	mov r5, sb
	mov r6, r8
	mov r4, #0x53
	b _02318BB0
_02318B78:
#ifdef JAPAN
	ldrb r0, [r7, #0x10a]
	cmp r0, #0
	bne _02318B94
	ldr r0, [r7, #0x184]
#else
	ldrb r0, [r7, #0x10b]
	cmp r0, #0
	bne _02318B94
	ldr r0, [r7, #0x188]
#endif
	cmp r0, #0
	movle r8, r6
	movgt r8, r5
_02318B94:
	cmp r8, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r4
	bl AdvanceFrame
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_02318BB0:
	cmp sb, #0x190
	blt _02318B78
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_02318B48

	arm_func_start ov29_02318BBC
ov29_02318BBC: ; 0x02318BBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov sb, r0
	mov r0, r8
	mov r7, r2
	mov r6, r3
	bl EntityIsValid__02318D34
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #0
	ldr r5, [r8, #0xb4]
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r5, #0xd2]
	cmp r0, r7
	cmpeq r7, #0xc
	bne _02318C18
	ldr r2, _02318D20 ; =0x00000D7A
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02318C18:
	strb r7, [r5, #0xd2]
	mov r2, #0
#ifdef JAPAN
	add r0, r5, #0x120
#else
	add r0, r5, #0x124
#endif
	b _02318C3C
_02318C28:
	add r1, r0, r2, lsl #3
	cmp r1, r6
	streqb r2, [r5, #0xd4]
	beq _02318C44
	add r2, r2, #1
_02318C3C:
	cmp r2, #4
	blt _02318C28
_02318C44:
	add r0, r7, #0xf9
	mov r1, #1
	and r0, r0, #0xff
#ifdef JAPAN
	strb r1, [r5, #0x150]
#else
	strb r1, [r5, #0x154]
#endif
	cmp r0, #1
	mov r4, #0
	movls r4, r1
#ifdef JAPAN
	strlsb r1, [r5, #0x10a]
#else
	strlsb r1, [r5, #0x10b]
#endif
	bls _02318C7C
	cmp r7, #9
	cmpne r7, #0xa
	cmpne r7, #0xd
	moveq r0, #2
#ifdef JAPAN
	streqb r0, [r5, #0x10a]
#else
	streqb r0, [r5, #0x10b]
#endif
_02318C7C:
	cmp r7, #1
	bne _02318CD0
	ldr r1, _02318D24 ; =ov10_022C4754
	mov r0, r8
	mov r2, #0
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r5, #0xd3]
	mov r0, #0
	str r0, [r5, #0xb8]
	ldrh r1, [r6, #4]
	cmp r1, #0x154
	ldreq r0, _02318D28 ; =0x00000166
	streqh r0, [r5, #0xac]
	beq _02318CD0
	ldr r0, _02318D2C ; =0x00000217
	cmp r1, r0
	subeq r0, r0, #0xb0
	streqh r0, [r5, #0xac]
	subne r0, r0, #0xb2
	strneh r0, [r5, #0xac]
_02318CD0:
	cmp r7, #0xc
	bne _02318CF0
	ldr r1, _02318D30 ; =ov10_022C475C
	mov r0, r8
	mov r2, #0
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r5, #0xd3]
_02318CF0:
	mov r0, r8
	mov r1, r4
	bl ov29_022E41B0
	ldr r2, [sp, #0x20]
	mov r0, sb
	mov r1, r8
	bl LogMessageWithPopupCheckUserTarget
	mov r0, r8
	bl UpdateStatusIconFlags
	mov r0, r8
	bl ov29_02318AD4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_02318D20: .word 0x00000ABA
#else
_02318D20: .word 0x00000D7A
#endif
_02318D24: .word ov10_022C4754
_02318D28: .word 0x00000166
_02318D2C: .word 0x00000217
_02318D30: .word ov10_022C475C
	arm_func_end ov29_02318BBC
