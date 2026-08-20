	.include "asm/macros.inc"
	.include "overlay_29_02325FC4.inc"

	.text

	arm_func_start DoMoveDig
DoMoveDig: ; 0x02325FC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl GetTileAtEntity
	mov sb, r0
	bl IsTileGround
	cmp r0, #0
	beq _02326000
	ldrh r0, [sb]
	and r0, r0, #3
	cmp r0, #1
	beq _02326014
_02326000:
	ldr r2, _0232607C ; =0x00000EC4
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02326074
_02326014:
	mov r0, r8
	mov r1, r6
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _02326050
	ldr r1, _02326080 ; =DIG_DAMAGE_MULTIPLIER
	mov r0, r8
	ldr r3, [r1]
	mov r1, r7
	mov r2, r6
	str r5, [sp]
	bl DealDamage
	mov r0, r8
	bl EndTwoTurnMove
	b _02326070
_02326050:
	ldr r0, _02326084 ; =0x00000CD6
	bl StringFromId
	str r0, [sp]
	mov r0, r8
	mov r1, r8
	mov r3, r6
	mov r2, #0xa
	bl BeginChargedMove
_02326070:
	mov r4, #1
_02326074:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_0232607C: .word 0x00000C06
_02326080: .word DIG_DAMAGE_MULTIPLIER
_02326084: .word 0x00000A16
#else
_0232607C: .word 0x00000EC4
_02326080: .word DIG_DAMAGE_MULTIPLIER
_02326084: .word 0x00000CD6
#endif
	arm_func_end DoMoveDig
