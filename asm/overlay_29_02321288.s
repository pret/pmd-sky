	.include "asm/macros.inc"
	.include "overlay_29_02321288.inc"

	.text

	arm_func_start ov29_02321288
ov29_02321288: ; 0x02321288
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x34]
	ldr r5, [sl, #0xb4]
	bl GetMonsterInFront
	movs r4, r0
	bne _023212E0
	mov r0, sl
	mov r1, r6
	bl ov29_022FAA04
	ldrh r2, [r6, #2]
	mov r0, sl
	mov r1, #1
	orr r2, r2, #8
	strh r2, [r6, #2]
	bl UpdateMovePp
	mov r0, #0
	b _02321428
_023212E0:
	add r2, sp, #8
	mov r3, r6
	mov r1, #4
_023212EC:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _023212EC
	mov r0, r4
	bl ov29_023247B4
	strh r0, [sp, #0xc]
	ldrh r0, [sp, #0xc]
	cmp r0, #0
	bne _02321360
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02321430 ; =0x00000F11
	mov r0, sl
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sl
	mov r1, r6
	bl ov29_022FAA04
	ldrh r2, [r6, #2]
	mov r0, sl
	mov r1, #1
	orr r2, r2, #8
	strh r2, [r6, #2]
	bl UpdateMovePp
	mov r0, #0
	b _02321428
_02321360:
	mov r0, sl
	mov r1, r6
	mov r2, #1
	bl CanMonsterUseMove
	cmp r0, #0
	beq _023213E4
	mov r0, r4
	bl ov29_022E4C84
	mov r0, sl
	bl ov29_022E4CD4
	mov r0, #1
#ifdef JAPAN
	strb r0, [r5, #0x21d]
#else
	strb r0, [r5, #0x221]
#endif
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02321434 ; =0x00000F12
	mov r1, r4
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUserTarget
	ldr r4, [sp, #0x30]
	add r0, sp, #8
	str r4, [sp]
	str r0, [sp, #4]
	mov r1, sb
	mov r2, r8
	mov r3, r7
	mov r0, sl
	bl ov29_02322374
	mov r4, r0
	mov r0, #0
#ifdef JAPAN
	strb r0, [r5, #0x21d]
#else
	strb r0, [r5, #0x221]
#endif
	b _02321408
_023213E4:
	ldr r1, [sp, #0x30]
	mov r0, sl
	str r1, [sp]
	mov r1, sb
	mov r2, r8
	mov r3, r7
	str r6, [sp, #4]
	bl ov29_02322374
	mov r4, r0
_02321408:
	mov r0, sl
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02321424
	mov r0, sl
	mov r1, r6
	bl ov29_022FAA04
_02321424:
	mov r0, r4
_02321428:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
#ifdef JAPAN
_02321430: .word 0x00000C53
_02321434: .word 0x00000C54
#else
_02321430: .word 0x00000F11
_02321434: .word 0x00000F12
#endif
	arm_func_end ov29_02321288
