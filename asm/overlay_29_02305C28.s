	.include "asm/macros.inc"
	.include "overlay_29_02305C28.inc"

	.text

	arm_func_start EndNegativeStatusConditionWrapper
EndNegativeStatusConditionWrapper: ; 0x02305C28
	stmdb sp!, {r3, lr}
	mov ip, #0
	str ip, [sp]
	bl EndNegativeStatusCondition
	ldmia sp!, {r3, pc}
	arm_func_end EndNegativeStatusConditionWrapper

	arm_func_start TransferNegativeStatusCondition
TransferNegativeStatusCondition: ; 0x02305C3C
#ifdef JAPAN
#define TRANSFER_NEGATIVE_STATUS_CONDITION_OFFSET -1
#define TRANSFER_NEGATIVE_STATUS_CONDITION_OFFSET_2 -4
#else
#define TRANSFER_NEGATIVE_STATUS_CONDITION_OFFSET 0
#define TRANSFER_NEGATIVE_STATUS_CONDITION_OFFSET_2 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xb8
	mov sb, r0
	mov r8, r1
	bl EntityIsValid__02305C04
	cmp r0, #0
	beq _02305F4C
	mov r0, r8
	bl EntityIsValid__02305C04
	cmp r0, #0
	beq _02305F4C
	mov r5, #0
	mov r0, sb
	mov r1, r5
	ldr r6, [sb, #0xb4]
	ldr r7, [r8, #0xb4]
	bl MonsterHasNegativeStatus
	cmp r0, #0
	beq _02305D28
	mov r0, sb
	mov r1, r8
	bl ov29_02306DCC
	orr r5, r5, r0
	mov r0, sb
	mov r1, r8
	bl ov29_02306F00
	orr r5, r5, r0
	mov r0, sb
	mov r1, r8
	bl ov29_02307078
	orr r5, r5, r0
	mov r0, sb
	mov r1, r8
	bl ov29_02307198
	orr r5, r5, r0
	mov r0, sb
	mov r1, r8
	bl ov29_0230737C
	orr r5, r5, r0
	mov r0, sb
	mov r1, r8
	bl ov29_023076C0
	orr r5, r5, r0
	mov r0, sb
	mov r1, r8
	bl ov29_023077FC
	orr r5, r5, r0
	mov r0, sb
	mov r1, r8
	bl TransferNegativeBlinkerClassStatus
	orr r5, r5, r0
	mov r0, sb
	mov r1, r8
	bl ov29_02307A2C
	orr r5, r5, r0
	mov r0, sb
	mov r1, r8
	bl ov29_02307B0C
	orr r5, r5, r0
_02305D28:
	ldrb r0, [r6, #0x106 + TRANSFER_NEGATIVE_STATUS_CONDITION_OFFSET]
	cmp r0, #0
	beq _02305D68
	mov r0, sb
	mov r1, r8
	mov r2, #1
	bl TryInflictPerishSongStatus
	cmp r0, #0
	ldrneb r1, [r6, #0x106 + TRANSFER_NEGATIVE_STATUS_CONDITION_OFFSET]
	orrne r0, r5, #0x11
	andne r5, r0, #0xff
	orreq r0, r5, #1
	andeq r5, r0, #0xff
	strneb r1, [r7, #0x106 + TRANSFER_NEGATIVE_STATUS_CONDITION_OFFSET]
	mov r0, #0
	strb r0, [r6, #0x106 + TRANSFER_NEGATIVE_STATUS_CONDITION_OFFSET]
_02305D68:
	ldrb r0, [r6, #0xfe]
	cmp r0, #0
	beq _02305DAC
	mov r0, sb
	mov r1, r8
	mov r2, #0
	mov r3, #1
	bl TryInflictExposedStatus
	cmp r0, #0
	ldrneb r1, [r6, #0xfe]
	orrne r0, r5, #0x11
	andne r5, r0, #0xff
	orreq r0, r5, #1
	andeq r5, r0, #0xff
	strneb r1, [r7, #0xfe]
	mov r0, #0
	strb r0, [r6, #0xfe]
_02305DAC:
	mov r0, sb
	mov r1, r8
	mov r2, #0
	bl SafeguardIsActive
	cmp r0, #0
	bne _02305E08
	mov r0, sb
	mov r1, r8
	mov r2, #0
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	bne _02305E08
	mov r2, #0
_02305DE0:
	add r0, r6, r2
	ldrb r0, [r0, #0x119 + TRANSFER_NEGATIVE_STATUS_CONDITION_OFFSET_2]
	add r1, r7, r2
	add r2, r2, #1
	strb r0, [r1, #0x119 + TRANSFER_NEGATIVE_STATUS_CONDITION_OFFSET_2]
	cmp r0, #0
	orrne r0, r5, #0x11
	andne r5, r0, #0xff
	cmp r2, #5
	blt _02305DE0
_02305E08:
	mov r0, sb
	bl CalcSpeedStageWrapper
	mov r2, #0
	mov r4, r0
	mov r1, r2
_02305E1C:
	add r0, r6, r2
	add r2, r2, #1
	strb r1, [r0, #0x119 + TRANSFER_NEGATIVE_STATUS_CONDITION_OFFSET_2]
	cmp r2, #5
	blt _02305E1C
	mov r0, sb
	bl CalcSpeedStageWrapper
	cmp r4, r0
	orrne r0, r5, #1
	andne r5, r0, #0xff
	mov r0, #0
	add r6, r6, #0x124 + TRANSFER_NEGATIVE_STATUS_CONDITION_OFFSET_2
	mov r3, r0
	mov r4, #1
_02305E54:
	ldrb r1, [r6, r0, lsl #3]
	add ip, r6, r0, lsl #3
	tst r1, #1
	movne r1, r4
	moveq r1, r3
	tst r1, #0xff
	beq _02305E88
	ldrh r1, [ip, #2]
	tst r1, #1
	orrne r2, r5, #1
	bicne r1, r1, #1
	strneh r1, [ip, #2]
	andne r5, r2, #0xff
_02305E88:
	add r0, r0, #1
	cmp r0, #4
	blt _02305E54
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r7, #0xd8]
	mov r2, #0
	cmp r0, #2
	mov r0, #1
	bne _02305ED0
	mov r1, r8
	strb r2, [r7, #0xd8]
	bl SubstitutePlaceholderStringTags
	mov r0, #2
	strb r0, [r7, #0xd8]
	b _02305ED8
_02305ED0:
	mov r1, r8
	bl SubstitutePlaceholderStringTags
_02305ED8:
	cmp r5, #0
	beq _02305EF4
	cmp r5, #1
	beq _02305F08
	cmp r5, #0x11
	beq _02305F24
	b _02305F3C
_02305EF4:
	ldr r2, _02305F54 ; =0x00000CCC
	add r1, sp, #0
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02305F3C
_02305F08:
	mov r0, sb
	bl ov29_022E543C
	ldr r2, _02305F58 ; =0x00000CCB
	add r1, sp, #0
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02305F3C
_02305F24:
	mov r0, sb
	bl ov29_022E543C
	ldr r2, _02305F5C ; =0x00000CCA
	add r1, sp, #0
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02305F3C:
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, r8
	bl UpdateStatusIconFlags
_02305F4C:
	add sp, sp, #0xb8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_02305F54: .word 0x00000A0C
_02305F58: .word 0x00000A0B
_02305F5C: .word 0x00000A0A
#else
_02305F54: .word 0x00000CCC
_02305F58: .word 0x00000CCB
_02305F5C: .word 0x00000CCA
#endif
	arm_func_end TransferNegativeStatusCondition

	arm_func_start ov29_02305F60
ov29_02305F60: ; 0x02305F60
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r0, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r5, [r4, #0xb4]
	mov r1, #0
	mov r0, r5
	bl SubInitMonster
	mov ip, #0
#ifdef JAPAN
	strb ip, [r5, #0x105]
	strb ip, [r5, #0xfe]
	add r3, r5, #0x120
#else
	strb ip, [r5, #0x106]
	strb ip, [r5, #0xfe]
	add r3, r5, #0x124
#endif
	mov r1, ip
	mov r2, #1
_02305FA0:
	ldrb r0, [r3, ip, lsl #3]
	add lr, r3, ip, lsl #3
	add ip, ip, #1
	tst r0, #1
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	ldrneh r0, [lr, #2]
	bicne r0, r0, #1
	strneh r0, [lr, #2]
	cmp ip, #4
	blt _02305FA0
	mov r0, r4
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02305F60

	arm_func_start EndSleepClassStatus
EndSleepClassStatus: ; 0x02305FDC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov sb, r0
	mov r0, r8
	mov r7, r2
	mov r6, r3
	mov r4, #0
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r4
	ldr r5, [r8, #0xb4]
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r5, #0xbd]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _02306164
_02306028: ; jump table
	b _02306164 ; case 0
	b _02306044 ; case 1
	b _0230605C ; case 2
	b _02306070 ; case 3
	b _02306118 ; case 4
	b _023060A8 ; case 5
	b _02306164 ; case 6
_02306044:
	ldr r2, _0230618C ; =0x00000C8D
	mov r0, sb
	mov r1, r8
	mov r4, #1
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02306164
_0230605C:
	ldr r2, _02306190 ; =0x00000C8E
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02306164
_02306070:
	mov r4, #1
	mov r0, sb
	mov r1, r8
#ifdef JAPAN
	rsb r2, r4, #0x9d0
#else
	rsb r2, r4, #0xc90
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	cmp r6, #0
	beq _02306164
	ldr r0, _02306194 ; =ov10_022C45A8
	ldr r3, _02306198 ; =0x0000024E
	ldrsh r1, [r0]
	mov r0, r8
	mov r2, #8
	bl ApplyDamageAndEffectsWrapper
	b _02306164
_023060A8:
	mov r0, sb
	mov r1, r8
#ifdef JAPAN
	mov r2, #0x9d0
#else
	mov r2, #0xc90
#endif
	mov r4, #1
	bl LogMessageByIdWithPopupCheckUserTarget
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	beq _023060E8
	ldr r0, _0230619C ; =ov10_022C45A0
	mov r6, r4
	ldrsh r2, [r0]
	mov r0, sb
	mov r1, r8
	mov r3, #0
	str r6, [sp]
	bl TryIncreaseHp
_023060E8:
	ldrb r0, [sp, #0x20]
	mov r6, #0
	strb r6, [r5, #0xbd]
	cmp r0, #0
	beq _02306164
	mov r2, #1
	mov r0, sb
	mov r1, r8
	mov r3, r2
	str r6, [sp]
	bl EndNegativeStatusCondition
	b _02306164
_02306118:
	cmp r7, #0
	beq _02306154
	ldr r1, _023061A0 ; =ov10_022C4868
	mov r3, r4
	mov r0, r8
	mov r2, #1
	strb r3, [r5, #0xbd]
	bl CalcStatusDuration
	mov r2, r0
	mov r0, sb
	mov r1, r8
	add r2, r2, #1
	mov r3, #1
	bl TryInflictSleepStatus
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02306154:
	ldr r2, _023061A4 ; =0x00000C91
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
_02306164:
	mov r1, #0
	mov r0, r8
	strb r1, [r5, #0xbd]
	bl UpdateStatusIconFlags
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r8
	mov r1, #8
	bl ChangeMonsterAnimationToIdle
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
#define END_SLEEP_CLASS_STATUS_OFFSET -0x2C0
#else
#define END_SLEEP_CLASS_STATUS_OFFSET 0
#endif
_0230618C: .word 0x00000C8D + END_SLEEP_CLASS_STATUS_OFFSET
_02306190: .word 0x00000C8E + END_SLEEP_CLASS_STATUS_OFFSET
_02306194: .word ov10_022C45A8
_02306198: .word 0x0000024E
_0230619C: .word ov10_022C45A0
_023061A0: .word ov10_022C4868
_023061A4: .word 0x00000C91 + END_SLEEP_CLASS_STATUS_OFFSET
	arm_func_end EndSleepClassStatus
