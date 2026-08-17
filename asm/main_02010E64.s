	.include "asm/macros.inc"
	.include "main_02010E64.inc"

	.text

	arm_func_start ApplyExclusiveItemStatBoosts
ApplyExclusiveItemStatBoosts: ; 0x02010E64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov r7, r1
	mov r6, r2
	mov r5, r3
	ldr r4, [sp, #0x28]
	bl GetExclusiveItemOffset
	ldr r1, _02010F6C ; =EXCLUSIVE_ITEM_STAT_BOOST_DATA_INDEXES
	ldrb r2, [r7]
	ldrb r1, [r1, r0, lsl #1]
	ldrb r0, [r4]
	strh r2, [sp, #4]
	ldrb r2, [r5]
	strh r0, [sp, #2]
	ldrb r3, [r6]
	ldr r0, _02010F70 ; =EXCLUSIVE_ITEM_ATTACK_BOOSTS
	mov r1, r1, lsl #2
	strh r3, [sp, #6]
	strh r2, [sp]
	ldrsb r2, [r0, r1]
	ldr r0, _02010F74 ; =EXCLUSIVE_ITEM_SPECIAL_ATTACK_BOOSTS
	ldrh sb, [sp, #4]
	ldrsb r8, [r0, r1]
	mov r0, r2, lsl #0x10
	add r0, sb, r0, lsr #16
	strh r0, [sp, #4]
	mov r0, r8, lsl #0x10
	ldrh lr, [sp, #6]
	ldrh r2, [sp, #4]
	ldr ip, _02010F78 ; =EXCLUSIVE_ITEM_DEFENSE_BOOSTS
	add r0, lr, r0, lsr #16
	ldrsb lr, [ip, r1]
	ldr r3, _02010F7C ; =EXCLUSIVE_ITEM_SPECIAL_DEFENSE_BOOSTS
	ldrsh ip, [sp, #2]
	ldrsb r1, [r3, r1]
	strh r0, [sp, #6]
	ldrsh r8, [sp]
	add r0, ip, r1
	strh r0, [sp, #2]
	cmp r2, #0xff
	movhi r0, #0xff
	strhih r0, [sp, #4]
	ldrh r0, [sp, #6]
	add r3, r8, lr
	ldrh r2, [sp, #4]
	cmp r0, #0xff
	movhi r0, #0xff
	strh r3, [sp]
	strhih r0, [sp, #6]
	ldrsh r0, [sp]
	strb r2, [r7]
	cmp r0, #0xff
	movgt r0, #0xff
	strgth r0, [sp]
	ldrsh r0, [sp, #2]
	ldrsh r1, [sp]
	cmp r0, #0xff
	movgt r0, #0xff
	strgth r0, [sp, #2]
	ldrh r0, [sp, #6]
	strb r0, [r6]
	ldrsh r0, [sp, #2]
	strb r1, [r5]
	strb r0, [r4]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02010F6C: .word EXCLUSIVE_ITEM_STAT_BOOST_DATA_INDEXES
_02010F70: .word EXCLUSIVE_ITEM_ATTACK_BOOSTS
_02010F74: .word EXCLUSIVE_ITEM_SPECIAL_ATTACK_BOOSTS
_02010F78: .word EXCLUSIVE_ITEM_DEFENSE_BOOSTS
_02010F7C: .word EXCLUSIVE_ITEM_SPECIAL_DEFENSE_BOOSTS
	arm_func_end ApplyExclusiveItemStatBoosts

	arm_func_start SetExclusiveItemEffect
SetExclusiveItemEffect: ; 0x02010F80
	cmp r1, #0
	bxeq lr
	mov ip, r1, lsr #5
	ldr r3, [r0, ip, lsl #2]
	sub r1, r1, ip, lsl #5
	mov r2, #1
	orr r1, r3, r2, lsl r1
	str r1, [r0, ip, lsl #2]
	bx lr
	arm_func_end SetExclusiveItemEffect
