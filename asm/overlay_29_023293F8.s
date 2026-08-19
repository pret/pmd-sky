	.include "asm/macros.inc"
	.include "overlay_29_023293F8.inc"

	.text

	arm_func_start DoMoveMoonlight
DoMoveMoonlight: ; 0x023293F8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl GetApparentWeather
	mov ip, #1
	ldr r1, _02329434 ; =MOONLIGHT_HP_RESTORATION_TABLE
	mov r0, r0, lsl #1
	ldrsh r2, [r1, r0]
	mov r0, r5
	mov r1, r4
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02329434: .word MOONLIGHT_HP_RESTORATION_TABLE
	arm_func_end DoMoveMoonlight

	arm_func_start DoMoveHornDrill
DoMoveHornDrill: ; 0x02329438
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov r7, r2
	mov sb, r0
	mov r2, #0
	mov r0, r7
	mov r8, r1
	mov r6, r3
	strb r2, [sp, #0x1c]
	bl GetMoveType
	mov r4, r0
	mov r0, sb
	mov r1, #0x57
	bl AbilityIsActiveVeneer
	mov r2, r4
	mov r3, r0
	mov r0, sb
	mov r1, r8
	bl ov29_0230D4A4
	cmp r0, #0
	bne _023294A4
	ldr r2, _0232952C ; =0x00000ED9
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _02329524
_023294A4:
	mov r0, r7
	bl GetMoveType
	mov r5, r0
	ldrh r0, [r7, #4]
	bl GetMoveCategory
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl GetDamageSourceWrapper
	add r2, sp, #0x1c
	stmia sp, {r2, r5}
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r2, _02329530 ; =0x0000270F
	mov r0, sb
	mov r1, r8
	mov r3, #1
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	mov r1, r8
	cmp r0, #0
	moveq r3, #1
	movne r3, #0
	mov r0, #0
	mov r2, r0
	strb r3, [sp, #0x1c]
	bl SubstitutePlaceholderStringTags
	ldrb r0, [sp, #0x1c]
_02329524:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_0232952C: .word 0x00000C1B
#else
_0232952C: .word 0x00000ED9
#endif
_02329530: .word 0x0000270F
	arm_func_end DoMoveHornDrill
