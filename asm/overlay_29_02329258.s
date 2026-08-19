	.include "asm/macros.inc"
	.include "overlay_29_02329258.inc"

	.text

	arm_func_start DoMoveSeismicToss
DoMoveSeismicToss: ; 0x02329258
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x20
	mov r4, #0
	mov r6, r0
	strb r4, [sp, #0x1c]
	mov r5, r1
	ldr r1, [r6, #0xb4]
	mov r0, r5
	mov r4, r2
	mov sl, r3
	ldr r7, [r5, #0xb4]
	ldrb sb, [r1, #0xa]
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	beq _02329350
	ldrb r2, [r7, #0x4c]
	mov r0, r5
	mov r1, #0xc
	mov r3, r2, lsr #0x1f
	rsb r2, r3, r2, lsl #29
	add r2, r3, r2, ror #29
	bl ChangeMonsterAnimation
	mov r0, r5
	mov r1, #1
	bl SetTwoTurnInvincibility
	ldr r1, _023293C8 ; =0x00000221
	mov r0, r5
	bl PlaySeByIdIfShouldDisplayEntity
	mov r0, r5
	bl WaitUntilMonsterFliesOffscreen
	mov r0, #0x10
	mov r1, #0x67
	bl ov29_022EA370
	mov r0, r5
	mov r1, #0
	bl SetTwoTurnInvincibility
	ldrb r2, [r7, #0x4c]
	mov r0, r5
	mov r1, #0xc
	mov r3, r2, lsr #0x1f
	rsb r2, r3, r2, lsl #29
	add r2, r3, r2, ror #29
	bl ChangeMonsterAnimation
	mov r0, r5
	bl WaitUntilMonsterIsBackOnGround
	mov r0, r5
	mov r1, #0x210
	bl PlaySeByIdIfShouldDisplayEntity
	mov r0, #5
	mov r1, #0x2000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl WaitUntilFadeIsFinished
	mov r0, #4
	mov r1, #0x400
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #1
	bl ov29_022ECAFC
	mov r0, #0
	bl WaitUntilFadeIsFinished
_02329350:
	mov r0, r4
	bl GetMoveType
	mov r8, r0
	ldrh r0, [r4, #4]
	bl GetMoveCategory
	mov r7, r0
	mov r1, sl
	mov r0, r4
	bl GetDamageSourceWrapper
	add r3, sp, #0x1c
	stmia sp, {r3, r8}
	str r7, [sp, #8]
	str r0, [sp, #0xc]
	mov r4, #0
	str r4, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	mov r1, r5
	mov r2, sb
	mov r0, r6
	str r4, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, r4
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_023293C8: .word 0x00000221
	arm_func_end DoMoveSeismicToss
