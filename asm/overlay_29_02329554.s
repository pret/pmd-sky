	.include "asm/macros.inc"
	.include "overlay_29_02329554.inc"

	.text

	arm_func_start DoMoveConversion
DoMoveConversion: ; 0x02329554
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r1, #0x25
	ldr r7, [sb, #0xb4]
	mov r8, #0
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02329598
	ldr r2, _02329658 ; =0x00000DC3
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	b _02329650
_02329598:
	mov r5, r8
#ifdef JAPAN
	add r4, r7, #0x120
#else
	add r4, r7, #0x124
#endif
	add fp, sp, #0
_023295A4:
	ldrb r0, [r4, r5, lsl #3]
	add r6, r4, r5, lsl #3
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _023295D8
	mov r0, sb
	mov r1, r6
	bl GetMoveTypeForMonster
	cmp r0, #0
	strne r6, [fp, r8, lsl #2]
	addne r8, r8, #1
_023295D8:
	add r5, r5, #1
	cmp r5, #4
	blt _023295A4
	cmp r8, #0
	bne _02329604
	ldr r2, _0232965C ; =0x00000DB6
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _02329650
_02329604:
	mov r0, r8
	bl DungeonRandInt
	add r1, sp, #0
	ldr r4, [r1, r0, lsl #2]
	mov r0, sb
	mov r1, r4
	bl GetMoveTypeForMonster
	strb r0, [r7, #0x5e]
	mov r0, #0
	strb r0, [r7, #0x5f]
	mov r1, #1
	strb r1, [r7, #0xff]
	ldrh r1, [r4, #4]
	bl SetPreprocessorArgsIdVal
	ldr r2, _02329660 ; =0x00000DB5
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
_02329650:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_02329658: .word 0x00000B03
_0232965C: .word 0x00000AF6
_02329660: .word 0x00000AF5
#else
_02329658: .word 0x00000DC3
_0232965C: .word 0x00000DB6
_02329660: .word 0x00000DB5
#endif
	arm_func_end DoMoveConversion
