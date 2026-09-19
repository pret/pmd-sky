	.include "asm/macros.inc"
	.include "overlay_29_023068C4.inc"

	.text

	arm_func_start EndLeechSeedClassStatus
EndLeechSeedClassStatus: ; 0x023068C4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r0, r5
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xe0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0230692C
_02306900: ; jump table
	b _0230692C ; case 0
	b _02306910 ; case 1
	b _02306920 ; case 2
	b _0230692C ; case 3
_02306910:
	ldr r1, _02306948 ; =0x00000C94
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _0230692C
_02306920:
	ldr r1, _0230694C ; =0x00000CAF
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
_0230692C:
	mov r1, #0
	mov r0, r5
	strb r1, [r4, #0xe0]
	mov r1, #0xff
	strb r1, [r4, #0xe8]
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_02306948: .word 0x000009D4
_0230694C: .word 0x000009EF
#else
_02306948: .word 0x00000C94
_0230694C: .word 0x00000CAF
#endif
	arm_func_end EndLeechSeedClassStatus

	arm_func_start EndSureShotClassStatus
EndSureShotClassStatus: ; 0x02306950
#ifdef JAPAN
#define END_SURE_SHOT_CLASS_STATUS_OFFSET -0x2C0
#else
#define END_SURE_SHOT_CLASS_STATUS_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r0, r5
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xec]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _023069E0
_0230698C: ; jump table
	b _023069E0 ; case 0
	b _023069A4 ; case 1
	b _023069B4 ; case 2
	b _023069C4 ; case 3
	b _023069D4 ; case 4
	b _023069E0 ; case 5
_023069A4:
	mov r0, r5
	mov r1, #0xca0 + END_SURE_SHOT_CLASS_STATUS_OFFSET
	bl LogMessageByIdWithPopupCheckUser
	b _023069E0
_023069B4:
	ldr r1, _023069F4 ; =0x00000CA1
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _023069E0
_023069C4:
	ldr r1, _023069F8 ; =0x00000CA2
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _023069E0
_023069D4:
	ldr r1, _023069FC ; =0x00000CA3
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
_023069E0:
	mov r1, #0
	mov r0, r5
	strb r1, [r4, #0xec]
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023069F4: .word 0x00000CA1 + END_SURE_SHOT_CLASS_STATUS_OFFSET
_023069F8: .word 0x00000CA2 + END_SURE_SHOT_CLASS_STATUS_OFFSET
_023069FC: .word 0x00000CA3 + END_SURE_SHOT_CLASS_STATUS_OFFSET
	arm_func_end EndSureShotClassStatus

	arm_func_start EndInvisibleClassStatus
EndInvisibleClassStatus: ; 0x02306A00
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r1
	mov r4, #0
	mov r0, r8
	mov r7, r2
	mov r5, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	ldr r6, [r8, #0xb4]
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r6, #0xef]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02306ADC
_02306A48: ; jump table
	b _02306ADC ; case 0
	b _02306A60 ; case 1
	b _02306A84 ; case 2
	b _02306A74 ; case 3
	b _02306AC4 ; case 4
	b _02306ADC ; case 5
_02306A60:
	ldr r1, _02306B18 ; =0x00000CA8
	mov r0, r8
	mov r4, #1
	bl LogMessageByIdWithPopupCheckUser
	b _02306ADC
_02306A74:
	ldr r1, _02306B1C ; =0x00000CB8
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
	b _02306ADC
_02306A84:
	ldrsh r1, [r6, #2]
	mov r0, r8
	bl GetMonsterApparentId
	strh r0, [r6, #4]
	ldrsh r0, [r6, #4]
	bl DungeonGetSpriteIndex
	strh r0, [r8, #0xa8]
	mov r0, r8
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, r8
	bl ov29_02304830
	ldr r1, _02306B20 ; =0x00000CB6
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
	b _02306ADC
_02306AC4:
	cmp r7, #0
	bne _02306AD8
	ldr r1, _02306B24 ; =0x00000CAC
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
_02306AD8:
	mov r5, #1
_02306ADC:
	mov r1, #0
	mov r0, r8
	strb r1, [r6, #0xef]
	bl UpdateStatusIconFlags
	cmp r4, #0
	beq _02306AFC
	mov r0, #1
	bl HandleShopTransaction
_02306AFC:
	cmp r7, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r5, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r8
	bl EnsureCanStandCurrentTile
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
#define END_INVISIBLE_CLASS_OFFSET -0x2C0
#else
#define END_INVISIBLE_CLASS_OFFSET 0
#endif
_02306B18: .word 0x00000CA8 + END_INVISIBLE_CLASS_OFFSET
_02306B1C: .word 0x00000CB8 + END_INVISIBLE_CLASS_OFFSET
_02306B20: .word 0x00000CB6 + END_INVISIBLE_CLASS_OFFSET
_02306B24: .word 0x00000CAC + END_INVISIBLE_CLASS_OFFSET
	arm_func_end EndInvisibleClassStatus

	arm_func_start EndBlinkerClassStatus
EndBlinkerClassStatus: ; 0x02306B28
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r0, r5
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xf1]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02306BB8
_02306B64: ; jump table
	b _02306BB8 ; case 0
	b _02306B7C ; case 1
	b _02306B8C ; case 2
	b _02306B9C ; case 3
	b _02306BAC ; case 4
	b _02306BB8 ; case 5
_02306B7C:
	ldr r1, _02306BE8 ; =0x00000CA9
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306BB8
_02306B8C:
	ldr r1, _02306BEC ; =0x00000CAA
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306BB8
_02306B9C:
	ldr r1, _02306BF0 ; =0x00000CAB
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306BB8
_02306BAC:
	ldr r1, _02306BF4 ; =0x00000CAD
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
_02306BB8:
	mov r1, #0
	mov r0, r5
	strb r1, [r4, #0xf1]
	bl UpdateStatusIconFlags
	ldrb r0, [r4, #7]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0x31
	bl AdvanceFrame
	bl UpdateTrapsVisibility
	bl UpdateMinimap
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define END_BLINKER_CLASS_OFFSET -0x2C0
#else
#define END_BLINKER_CLASS_OFFSET 0
#endif
_02306BE8: .word 0x00000CA9 + END_BLINKER_CLASS_OFFSET
_02306BEC: .word 0x00000CAA + END_BLINKER_CLASS_OFFSET
_02306BF0: .word 0x00000CAB + END_BLINKER_CLASS_OFFSET
_02306BF4: .word 0x00000CAD + END_BLINKER_CLASS_OFFSET
	arm_func_end EndBlinkerClassStatus

	arm_func_start EndMuzzledStatus
EndMuzzledStatus: ; 0x02306BF8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r0, r5
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xf3]
	cmp r0, #0
	beq _02306C4C
	cmp r0, #1
	beq _02306C40
	cmp r0, #2
	b _02306C4C
_02306C40:
	ldr r1, _02306C60 ; =0x00000CB9
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
_02306C4C:
	mov r1, #0
	mov r0, r5
	strb r1, [r4, #0xf3]
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_02306C60: .word 0x000009F9
#else
_02306C60: .word 0x00000CB9
#endif
	arm_func_end EndMuzzledStatus

	arm_func_start EndMiracleEyeStatus
EndMiracleEyeStatus: ; 0x02306C64
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r0, r5
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xf5]
	cmp r0, #0
	beq _02306CB8
	cmp r0, #1
	beq _02306CAC
	cmp r0, #2
	b _02306CB8
_02306CAC:
	ldr r1, _02306CCC ; =0x00000CC4
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
_02306CB8:
	mov r1, #0
	mov r0, r5
	strb r1, [r4, #0xf5]
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_02306CCC: .word 0x00000A04
#else
_02306CCC: .word 0x00000CC4
#endif
	arm_func_end EndMiracleEyeStatus

	arm_func_start EndMagnetRiseStatus
EndMagnetRiseStatus: ; 0x02306CD0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r0, r6
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r4, #0
	ldr r5, [r6, #0xb4]
	mov r0, r4
	mov r1, r6
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r5, #0xf7]
	cmp r0, #0
	beq _02306D2C
	cmp r0, #1
	beq _02306D1C
	cmp r0, #2
	b _02306D2C
_02306D1C:
	ldr r1, _02306D50 ; =0x00000CC5
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r4, #1
_02306D2C:
	mov r1, #0
	mov r0, r6
	strb r1, [r5, #0xf7]
	bl UpdateStatusIconFlags
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl ov29_02321134
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02306D50: .word 0x00000A05
#else
_02306D50: .word 0x00000CC5
#endif
	arm_func_end EndMagnetRiseStatus

	arm_func_start ov29_02306D54
ov29_02306D54: ; 0x02306D54
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, #0
	ldr r4, _02306DC8 ; =DUNGEON_PTR
	mov sb, r0
	mov r5, r8
	mov r6, #1
	mov r7, r8
_02306D70:
	ldr r0, [r4]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r1, [r0, #0xad4]
#else
	ldr r1, [r0, #0xb78]
#endif
	cmp r1, #0
	moveq r0, r7
	beq _02306DA0
	ldr r0, [r1]
	cmp r0, #1
	moveq r0, r6
	movne r0, r5
	and r0, r0, #0xff
_02306DA0:
	cmp r0, #0
	beq _02306DB0
	mov r0, sb
	bl EndMagnetRiseStatus
_02306DB0:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x14
	blt _02306D70
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02306DC8: .word DUNGEON_PTR
	arm_func_end ov29_02306D54

	arm_func_start ov29_02306DCC
ov29_02306DCC: ; 0x02306DCC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r8, r1
	mov r4, #0
	mov sb, r0
	mov r0, r8
	mov sl, r4
	mov r5, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	mov r0, r4
	beq _02306EF8
	mov r1, sb
	mov r2, r0
	ldr r6, [sb, #0xb4]
	ldr r7, [r8, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r1, r8
	mov r0, #1
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r6, #0xbd]
	cmp r0, #0
	moveq r0, r4
	beq _02306EF8
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _02306E9C
_02306E3C: ; jump table
	b _02306E9C ; case 0
	b _02306E58 ; case 1
	b _02306E9C ; case 2
	b _02306E58 ; case 3
	b _02306E58 ; case 4
	b _02306E7C ; case 5
	b _02306E9C ; case 6
_02306E58:
	mov r2, #1
	mov r0, sb
	mov r1, r8
	mov r3, r2
	str r4, [sp]
	bl ov29_02311C28
	mov sl, r0
	mov r4, #1
	b _02306E9C
_02306E7C:
	mov r2, r4
	mov r0, sb
	mov r1, r8
	mov r3, r2
	str r2, [sp]
	bl ov29_02311C28
	mov sl, r0
	mov r4, #1
_02306E9C:
	cmp sl, #0
	beq _02306EBC
	ldrb r1, [r6, #0xbd]
	orr r0, r5, #0x11
	and r5, r0, #0xff
	strb r1, [r7, #0xbd]
	ldrb r0, [r6, #0xbe]
	strb r0, [r7, #0xbe]
_02306EBC:
	cmp r4, #0
	orrne r1, r5, #1
	movne r0, #0
	strneb r0, [r6, #0xbd]
	andne r5, r1, #0xff
	cmp r4, #0
	beq _02306EE4
	mov r0, sb
	mov r1, #0x378
	bl ChangeMonsterAnimationToIdle
_02306EE4:
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, r8
	bl UpdateStatusIconFlags
	mov r0, r5
_02306EF8:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov29_02306DCC

	arm_func_start ov29_02306F00
ov29_02306F00: ; 0x02306F00
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov sl, #0
	mov sb, r0
	mov r8, r1
	mov r4, sl
	mov r5, sl
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, sl
	beq _02307070
	mov r0, r8
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, sl
	beq _02307070
	ldr r6, [sb, #0xb4]
	ldr r7, [r8, #0xb4]
	ldrb r0, [r6, #0xbf]
	cmp r0, #0
	mov r0, sl
	beq _02307070
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r8
	mov r0, #1
	mov r2, sl
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r6, #0xbf]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0230701C
_02306F84: ; jump table
	b _0230701C ; case 0
	b _02306FFC ; case 1
	b _02306F9C ; case 2
	b _02306FBC ; case 3
	b _02306FDC ; case 4
	b _0230701C ; case 5
_02306F9C:
	mov r0, sb
	mov r1, r8
	mov r2, sl
	mov r3, #1
	bl TryInflictPoisonedStatus
	mov sl, r0
	mov r4, #1
	b _0230701C
_02306FBC:
	mov r0, sb
	mov r1, r8
	mov r2, sl
	mov r3, #1
	bl TryInflictBadlyPoisonedStatus
	mov sl, r0
	mov r4, #1
	b _0230701C
_02306FDC:
	mov r0, sb
	mov r1, r8
	mov r2, sl
	mov r3, #1
	bl TryInflictParalysisStatus
	mov sl, r0
	mov r4, #1
	b _0230701C
_02306FFC:
	mov r2, sl
	mov r4, #1
	mov r0, sb
	mov r1, r8
	mov r3, r2
	str r4, [sp]
	bl TryInflictBurnStatus
	mov sl, r0
_0230701C:
	cmp sl, #0
	beq _02307048
	add r3, r6, #0xbf
	add r2, r7, #0xbf
	mov r1, #4
_02307030:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02307030
	orr r0, r5, #0x11
	and r5, r0, #0xff
_02307048:
	cmp r4, #0
	orrne r0, r5, #1
	movne r1, #0
	andne r5, r0, #0xff
	mov r0, sb
	strneb r1, [r6, #0xbf]
	bl UpdateStatusIconFlags
	mov r0, r8
	bl UpdateStatusIconFlags
	mov r0, r5
_02307070:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov29_02306F00

	arm_func_start ov29_02307078
ov29_02307078: ; 0x02307078
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, #0
	mov sb, r0
	mov r8, r1
	mov sl, r4
	mov r5, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, r8
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r6, [sb, #0xb4]
	ldr r7, [r8, #0xb4]
	ldrb r1, [r6, #0xc4]
	cmp r1, #3
	cmpne r1, #4
	beq _023070E0
	ldrb r0, [r7, #0xc4]
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _023070E8
_023070E0:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_023070E8:
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _0230714C
_023070F4: ; jump table
	b _0230714C ; case 0
	b _0230714C ; case 1
	b _02307114 ; case 2
	b _0230714C ; case 3
	b _0230714C ; case 4
	b _0230714C ; case 5
	b _0230714C ; case 6
	b _02307130 ; case 7
_02307114:
	mov r0, sb
	mov r1, r8
	mov r2, #1
	bl TryInflictShadowHoldStatus
	mov sl, r0
	mov r4, #1
	b _0230714C
_02307130:
	mov r0, sb
	mov r1, r8
	mov r2, #0x7e
	mov r3, #1
	bl TryInflictConstrictionStatus
	mov sl, r0
	mov r4, #1
_0230714C:
	cmp sl, #0
	beq _0230716C
	add r0, r6, #0xc4
	add r7, r7, #0xc4
	ldmia r0, {r0, r1, r2}
	orr r3, r5, #0x11
	stmia r7, {r0, r1, r2}
	and r5, r3, #0xff
_0230716C:
	cmp r4, #0
	orrne r0, r5, #1
	movne r1, #0
	andne r5, r0, #0xff
	mov r0, sb
	strneb r1, [r6, #0xc4]
	bl UpdateStatusIconFlags
	mov r0, r8
	bl UpdateStatusIconFlags
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov29_02307078

	arm_func_start ov29_02307198
ov29_02307198: ; 0x02307198
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	mov r4, #0
	mov sb, r0
	mov r8, r1
	mov sl, r4
	mov r5, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, r4
	beq _02307374
	mov r0, r8
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, r4
	beq _02307374
	ldr r6, [sb, #0xb4]
	ldr r7, [r8, #0xb4]
	ldrb r0, [r6, #0xd0]
	cmp r0, #0
	mov r0, r4
	beq _02307374
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r8
	mov r0, #1
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r6, #0xd0]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _0230731C
_0230721C: ; jump table
	b _0230731C ; case 0
	b _02307300 ; case 1
	b _02307240 ; case 2
	b _0230729C ; case 3
	b _02307260 ; case 4
	b _02307280 ; case 5
	b _023072E4 ; case 6
	b _023072C4 ; case 7
	b _0230731C ; case 8
_02307240:
	mov r0, sb
	mov r1, r8
	mov r2, r4
	mov r3, #1
	bl TryInflictConfusedStatus
	mov sl, r0
	mov r4, #1
	b _0230731C
_02307260:
	mov r0, sb
	mov r1, r8
	mov r2, r4
	mov r3, #1
	bl TryInflictCoweringStatus
	mov sl, r0
	mov r4, #1
	b _0230731C
_02307280:
	mov r0, sb
	mov r1, r8
	mov r2, #1
	bl TryInflictTauntStatus
	mov sl, r0
	mov r4, #1
	b _0230731C
_0230729C:
	mov r3, r4
	mov r0, sb
	mov r1, r8
	str r3, [sp]
	mov r2, #1
	str r2, [sp, #4]
	bl TryInflictPausedStatus
	mov sl, r0
	mov r4, #1
	b _0230731C
_023072C4:
	mov r0, sb
	mov r1, r8
	mov r2, r4
	mov r3, #1
	bl TryInflictInfatuatedStatus
	mov sl, r0
	mov r4, #1
	b _0230731C
_023072E4:
	mov r0, sb
	mov r1, r8
	mov r2, #1
	bl TryInflictEncoreStatus
	mov sl, r0
	mov r4, #1
	b _0230731C
_02307300:
	mov r0, sb
	mov r1, r8
	mov r2, r4
	mov r3, #1
	bl TryInflictCringeStatus
	mov sl, r0
	mov r4, #1
_0230731C:
	cmp sl, #0
	beq _0230733C
	ldrb r1, [r6, #0xd0]
	orr r0, r5, #0x11
	and r5, r0, #0xff
	strb r1, [r7, #0xd0]
	ldrb r0, [r6, #0xd1]
	strb r0, [r7, #0xd1]
_0230733C:
	cmp r4, #0
	movne r0, #0
	orrne r1, r5, #1
	strneb r0, [r6, #0xd0]
	mov r0, sb
	andne r5, r1, #0xff
	bl UpdateStatusIconFlags
	mov r0, r8
	bl UpdateStatusIconFlags
	mov r0, sb
	bl CalcSpeedStageWrapper
	mov r0, r8
	bl CalcSpeedStageWrapper
	mov r0, r5
_02307374:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov29_02307198

	arm_func_start ov29_0230737C
ov29_0230737C: ; 0x0230737C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r4, #0
	mov sb, r0
	mov r8, r1
	mov r5, r4
	mov r6, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, r4
	beq _023076B4
	mov r0, r8
	bl EntityIsValid__02305C04
	cmp r0, #0
	mov r0, r4
	beq _023076B4
	mov r1, sb
	mov r2, r0
	ldr r7, [sb, #0xb4]
	ldr sl, [r8, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r1, r8
	mov r0, #1
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r7, #0xd8]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0230749C
_023073F0: ; jump table
	b _0230749C ; case 0
	b _02307410 ; case 1
	b _0230741C ; case 2
	b _0230749C ; case 3
	b _02307440 ; case 4
	b _02307460 ; case 5
	b _02307480 ; case 6
	b _0230749C ; case 7
_02307410:
	mov r5, #1
	mov r4, r5
	b _0230749C
_0230741C:
	mov r2, r4
	mov r4, #1
	mov r0, sb
	mov r1, r8
	mov r3, r2
	str r4, [sp]
	bl TryInflictDecoyStatus
	mov r5, r0
	b _0230749C
_02307440:
	mov r0, sb
	mov r1, r8
	mov r2, r4
	mov r3, #1
	bl TryInflictGastroAcidStatus
	mov r5, r0
	mov r4, #1
	b _0230749C
_02307460:
	mov r0, sb
	mov r1, r8
	mov r2, r4
	mov r3, #1
	bl TryInflictHealBlockStatus
	mov r5, r0
	mov r4, #1
	b _0230749C
_02307480:
	mov r0, sb
	mov r1, r8
	mov r2, r4
	mov r3, #1
	bl TryInflictEmbargoStatus
	mov r5, r0
	mov r4, #1
_0230749C:
	ldrb r0, [r7, #0xd8]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _023076A0
_023074AC: ; jump table
	b _023076A0 ; case 0
	b _023074C8 ; case 1
	b _02307528 ; case 2
	b _023076A0 ; case 3
	b _02307554 ; case 4
	b _023075D4 ; case 5
	b _0230763C ; case 6
_023074C8:
	cmp r5, #0
	beq _02307500
	mov r0, sb
	mov r1, r8
	bl TryRemoveSnatchedMonsterFromDungeonStruct
	add r3, r7, #0xd8
	add r2, sl, #0xd8
	mov r1, #5
_023074E8:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _023074E8
	orr r0, r6, #0x11
	and r6, r0, #0xff
_02307500:
	cmp r4, #0
	beq _023076A0
	mov r0, r8
	mov r1, sb
	mov r2, #1
	mov r3, #0
	bl EndCurseClassStatus
	orr r0, r6, #1
	and r6, r0, #0xff
	b _023076A0
_02307528:
	cmp r5, #0
	beq _023076A0
	mov r3, #0
	mov r0, sb
	mov r1, r8
	mov r2, #1
	str r3, [sp]
	bl TryInflictDecoyStatus
	orr r0, r6, #0x11
	and r6, r0, #0xff
	b _023076A0
_02307554:
	cmp r5, #0
	beq _023075AC
	mov r0, sb
	mov r1, r8
	bl TryRemoveSnatchedMonsterFromDungeonStruct
	add r3, r7, #0xd8
	add r2, sl, #0xd8
	mov r1, #5
_02307574:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02307574
	ldr r1, _023076BC ; =DUNGEON_PTR
	mov r0, r8
	ldr r1, [r1]
	mov r2, #1
	strb r2, [r1, #0xe]
	bl ov29_022FB984
	mov r0, r8
	bl UpdateStatusIconFlags
	orr r0, r6, #0x11
	and r6, r0, #0xff
_023075AC:
	cmp r4, #0
	beq _023076A0
	mov r0, r8
	mov r1, sb
	mov r2, #4
	mov r3, #0
	bl EndCurseClassStatus
	orr r0, r6, #1
	and r6, r0, #0xff
	b _023076A0
_023075D4:
	cmp r5, #0
	beq _02307614
	mov r0, sb
	mov r1, r8
	bl TryRemoveSnatchedMonsterFromDungeonStruct
	add r3, r7, #0xd8
	add r2, sl, #0xd8
	mov r1, #5
_023075F4:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _023075F4
	mov r0, r8
	bl UpdateStatusIconFlags
	orr r0, r6, #0x11
	and r6, r0, #0xff
_02307614:
	cmp r4, #0
	beq _023076A0
	mov r0, r8
	mov r1, sb
	mov r2, #5
	mov r3, #0
	bl EndCurseClassStatus
	orr r0, r6, #1
	and r6, r0, #0xff
	b _023076A0
_0230763C:
	cmp r5, #0
	beq _0230767C
	mov r0, sb
	mov r1, r8
	bl TryRemoveSnatchedMonsterFromDungeonStruct
	add r3, r7, #0xd8
	add r2, sl, #0xd8
	mov r1, #5
_0230765C:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _0230765C
	mov r0, r8
	bl UpdateStatusIconFlags
	orr r0, r6, #0x11
	and r6, r0, #0xff
_0230767C:
	cmp r4, #0
	beq _023076A0
	mov r0, r8
	mov r1, sb
	mov r2, #6
	mov r3, #0
	bl EndCurseClassStatus
	orr r0, r6, #1
	and r6, r0, #0xff
_023076A0:
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, r8
	bl UpdateStatusIconFlags
	mov r0, r6
_023076B4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_023076BC: .word DUNGEON_PTR
	arm_func_end ov29_0230737C

	arm_func_start ov29_023076C0
ov29_023076C0: ; 0x023076C0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, #0
	mov sb, r0
	mov r8, r1
	mov sl, r4
	mov r5, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, r8
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r6, [sb, #0xb4]
	ldr r7, [r8, #0xb4]
	ldrb r0, [r6, #0xe0]
	cmp r0, #0
	mov r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r8
	mov r0, #1
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r6, #0xe0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0230776C
_02307740: ; jump table
	b _0230776C ; case 0
	b _02307750 ; case 1
	b _0230776C ; case 2
	b _0230776C ; case 3
_02307750:
	mov r0, sb
	mov r1, r8
	mov r2, r4
	mov r3, #1
	bl TryInflictLeechSeedStatus
	mov sl, r0
	mov r4, #1
_0230776C:
	cmp sl, #0
	beq _023077CC
	add r0, r6, #0xe0
	add r3, r7, #0xe0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, #0xff
	strb r0, [r7, #0xe8]
	ldr r2, _023077F8 ; =DUNGEON_PTR
	mov r0, #0
_02307794:
	ldr r1, [r2]
	add r1, r1, r0, lsl #2
	add r1, r1, #0x12000
#ifdef JAPAN
	ldr r1, [r1, #0xad4]
#else
	ldr r1, [r1, #0xb78]
#endif
	cmp sb, r1
	streqb r0, [r7, #0xe8]
	ldreq r1, [sb, #0xb4]
	add r0, r0, #1
	ldreq r1, [r1, #0xb0]
	streq r1, [r7, #0xe4]
	cmp r0, #0x14
	blt _02307794
	orr r0, r5, #0x11
	and r5, r0, #0xff
_023077CC:
	cmp r4, #0
	orrne r0, r5, #1
	movne r1, #0
	andne r5, r0, #0xff
	mov r0, sb
	strneb r1, [r6, #0xe0]
	bl UpdateStatusIconFlags
	mov r0, r8
	bl UpdateStatusIconFlags
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_023077F8: .word DUNGEON_PTR
	arm_func_end ov29_023076C0

	arm_func_start ov29_023077FC
ov29_023077FC: ; 0x023077FC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, #0
	mov sb, r0
	mov r8, r1
	mov sl, r4
	mov r5, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, r8
	bl EntityIsValid__02305C04
	cmp r0, #0
	mov r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r1, sb
	mov r2, r0
	ldr r6, [sb, #0xb4]
	ldr r7, [r8, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r1, r8
	mov r0, #1
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r6, #0xec]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _023078A0
_0230786C: ; jump table
	b _023078A0 ; case 0
	b _023078A0 ; case 1
	b _02307884 ; case 2
	b _023078A0 ; case 3
	b _023078A0 ; case 4
	b _023078A0 ; case 5
_02307884:
	mov r0, sb
	mov r1, r8
	mov r2, r4
	mov r3, #1
	bl TryInflictWhifferStatus
	mov sl, r0
	mov r4, #1
_023078A0:
	cmp sl, #0
	beq _023078C0
	ldrb r1, [r6, #0xec]
	orr r0, r5, #0x11
	and r5, r0, #0xff
	strb r1, [r7, #0xec]
	ldrb r0, [r6, #0xed]
	strb r0, [r7, #0xed]
_023078C0:
	cmp r4, #0
	orrne r0, r5, #1
	movne r1, #0
	andne r5, r0, #0xff
	mov r0, sb
	strneb r1, [r6, #0xec]
	bl UpdateStatusIconFlags
	mov r0, r8
	bl UpdateStatusIconFlags
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov29_023077FC

	arm_func_start TransferNegativeBlinkerClassStatus
TransferNegativeBlinkerClassStatus: ; 0x023078EC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, #0
	mov sb, r0
	mov r8, r1
	mov sl, r4
	mov r5, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, r8
	bl EntityIsValid__02305C04
	cmp r0, #0
	mov r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r1, sb
	mov r2, r0
	ldr r6, [sb, #0xb4]
	ldr r7, [r8, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r1, r8
	mov r0, #1
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r6, #0xf1]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _023079C4
_0230795C: ; jump table
	b _023079C4 ; case 0
	b _02307974 ; case 1
	b _02307994 ; case 2
	b _023079C4 ; case 3
	b _023079B0 ; case 4
	b _023079C4 ; case 5
_02307974:
	mov r0, sb
	mov r1, r8
	mov r2, #1
	mov r3, r4
	bl TryInflictBlinkerStatus
	mov sl, r0
	mov r4, #1
	b _023079C4
_02307994:
	mov r0, sb
	mov r1, r8
	mov r2, #1
	bl TryInflictCrossEyedStatus
	mov sl, r0
	mov r4, #1
	b _023079C4
_023079B0:
	mov r0, sb
	mov r1, r8
	bl TryInflictDropeyeStatus
	mov sl, r0
	mov r4, #1
_023079C4:
	cmp sl, #0
	beq _023079E4
	ldrb r1, [r6, #0xf1]
	orr r0, r5, #0x11
	and r5, r0, #0xff
	strb r1, [r7, #0xf1]
	ldrb r0, [r6, #0xf2]
	strb r0, [r7, #0xf2]
_023079E4:
	cmp r4, #0
	orrne r0, r5, #1
	movne r1, #0
	andne r5, r0, #0xff
	mov r0, sb
	strneb r1, [r6, #0xf1]
	bl UpdateStatusIconFlags
	mov r0, r8
	bl UpdateStatusIconFlags
	ldrb r0, [r6, #7]
	cmp r0, #0
	beq _02307A24
	mov r0, #0x31
	bl AdvanceFrame
	bl UpdateTrapsVisibility
	bl UpdateMinimap
_02307A24:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end TransferNegativeBlinkerClassStatus

	arm_func_start ov29_02307A2C
ov29_02307A2C: ; 0x02307A2C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, #0
	mov sl, r0
	mov sb, r1
	mov r5, r4
	mov r6, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, sb
	bl EntityIsValid__02305C04
	cmp r0, #0
	mov r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r1, sl
	mov r2, r0
	ldr r7, [sl, #0xb4]
	ldr r8, [sb, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r1, sb
	mov r0, #1
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r7, #0xf3]
	cmp r0, #0
	beq _02307AC0
	cmp r0, #1
	beq _02307AA8
	cmp r0, #2
	b _02307AC0
_02307AA8:
	mov r0, sl
	mov r1, sb
	mov r2, #1
	bl TryInflictMuzzledStatus
	mov r5, r0
	mov r4, #1
_02307AC0:
	cmp r5, #0
	beq _02307AE0
	ldrb r1, [r7, #0xf3]
	orr r0, r6, #0x11
	and r6, r0, #0xff
	strb r1, [r8, #0xf3]
	ldrb r0, [r7, #0xf4]
	strb r0, [r8, #0xf4]
_02307AE0:
	cmp r4, #0
	orrne r0, r6, #1
	movne r1, #0
	andne r6, r0, #0xff
	mov r0, sl
	strneb r1, [r7, #0xf3]
	bl UpdateStatusIconFlags
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov29_02307A2C

	arm_func_start ov29_02307B0C
ov29_02307B0C: ; 0x02307B0C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, #0
	mov sl, r0
	mov sb, r1
	mov r5, r4
	mov r6, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, sb
	bl EntityIsValid__02305C04
	cmp r0, #0
	mov r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r1, sl
	mov r2, r0
	ldr r7, [sl, #0xb4]
	ldr r8, [sb, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r1, sb
	mov r0, #1
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r7, #0xf5]
	cmp r0, #1
	bne _02307B90
	mov r0, sl
	mov r1, sb
	mov r2, #1
	bl TryInflictMiracleEyeStatus
	mov r5, r0
	mov r4, #1
_02307B90:
	cmp r5, #0
	beq _02307BB0
	ldrb r1, [r7, #0xf5]
	orr r0, r6, #0x11
	and r6, r0, #0xff
	strb r1, [r8, #0xf5]
	ldrb r0, [r7, #0xf6]
	strb r0, [r8, #0xf6]
_02307BB0:
	cmp r4, #0
	orrne r0, r6, #1
	movne r1, #0
	andne r6, r0, #0xff
	mov r0, sl
	strneb r1, [r7, #0xf5]
	bl UpdateStatusIconFlags
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov29_02307B0C

	arm_func_start TryEndPetrifiedOrSleepStatus
TryEndPetrifiedOrSleepStatus: ; 0x02307BDC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	ldr r4, [r5, #0xb4]
	mov r6, r0
	ldrb r2, [r4, #0xc4]
	mov r3, #0
	cmp r2, #6
	bne _02307C0C
	mov r2, #1
	bl EndFrozenClassStatus
	mov r3, #1
_02307C0C:
	ldrb r0, [r4, #0xbd]
	cmp r0, #1
	ldreqb r0, [r4, #0xbe]
	cmpeq r0, #0x7f
	bne _02307C3C
	mov r3, #1
	mov r0, r6
	mov r1, r5
	mov r2, #0
	str r3, [sp]
	bl EndSleepClassStatus
	mov r3, #1
_02307C3C:
	mov r0, r3
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end TryEndPetrifiedOrSleepStatus

	arm_func_start ov29_02307C48
ov29_02307C48: ; 0x02307C48
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr ip, [r4, #0xb4]
	mov r3, #0
	mov r1, #1
	strb r3, [ip, #0xbd]
	mov r2, r1
	strb r3, [ip, #0xbe]
	bl ov29_022FA1D8
	mov r0, r4
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02307C48

	arm_func_start EndFrozenStatus
EndFrozenStatus: ; 0x02307C78
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r3, [r4, #0xb4]
	ldrb r0, [r3, #0xc4]
	cmp r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #0
	strb r0, [r3, #0xc4]
	strb r0, [r3, #0xcc]
	mov r1, r4
	mov r2, r0
	strb r0, [r3, #0xcd]
	bl SubstitutePlaceholderStringTags
	ldr r2, _02307CDC ; =0x00000C9F
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r4
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_02307CDC: .word 0x000009DF
#else
_02307CDC: .word 0x00000C9F
#endif
	arm_func_end EndFrozenStatus

	arm_func_start ResetTypeChanges
ResetTypeChanges: ; 0x02307CE0
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #0xb4]
	mov r1, #0
	bl TryRestoreRoostTyping
	mov r1, #0
	strb r1, [r4, #0xff]
	ldrsh r0, [r4, #2]
	bl GetType
	strb r0, [r4, #0x5e]
	ldrsh r0, [r4, #2]
	mov r1, #1
	bl GetType
	strb r0, [r4, #0x5f]
	ldmia sp!, {r4, pc}
	arm_func_end ResetTypeChanges

	arm_func_start EndProtectStatus
EndProtectStatus: ; 0x02307D18
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xd5]
	cmp r0, #7
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl EndReflectClassStatus
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end EndProtectStatus

	arm_func_start TryRestoreRoostTyping
TryRestoreRoostTyping: ; 0x02307D54
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldrne r2, [r5, #0xb4]
	ldrneb r0, [r2, #0xa9]
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	strb r0, [r2, #0xa9]
	ldrb r1, [r2, #0xaa]
	cmp r4, #0
	strb r1, [r2, #0x5e]
	ldrb r1, [r2, #0xab]
	strb r1, [r2, #0x5f]
	strb r0, [r2, #0xaa]
	strb r0, [r2, #0xab]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02307DBC ; =0x00000CC8
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_02307DBC: .word 0x00000A08
#else
_02307DBC: .word 0x00000CC8
#endif
	arm_func_end TryRestoreRoostTyping

	arm_func_start ov29_02307DC0
ov29_02307DC0: ; 0x02307DC0
#ifdef JAPAN
	ldr r1, [r0, #0xb4]
	mov r0, #0
	strb r0, [r1, #0x103]
	strb r0, [r1, #0x104]
#else
	mov r1, #0
	strb r1, [r0, #0x104]
	strb r1, [r0, #0x105]
#endif
	bx lr
	arm_func_end ov29_02307DC0

	arm_func_start ov29_02307DD0
ov29_02307DD0: ; 0x02307DD0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
_02307DD8:
	ldr r0, _02307EF4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xa94]
#else
	ldr r6, [r0, #0xb38]
#endif
	mov r0, r6
	bl EntityIsValid__02307EF8
	cmp r0, #0
	beq _02307EE4
	ldr r1, [r6, #0xb4]
	ldrb r0, [r1, #0xbd]
	cmp r0, #1
	ldreqb r0, [r1, #0xbe]
	cmpeq r0, #0x7f
	bne _02307EE4
	mov r8, #0
	mov r7, r8
	mov r5, r8
	ldrb sl, [r6, #0x25]
	ldr fp, _02307EF4 ; =DUNGEON_PTR
	b _02307EBC
_02307E2C:
	ldr r0, [fp]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sb, [r0, #0xa84]
#else
	ldr sb, [r0, #0xb28]
#endif
	mov r0, sb
	bl EntityIsValid__02307EF8
	cmp r0, #0
	beq _02307EB8
	mov r0, sb
	mov r1, #0x1f
	bl ItemIsActive__02307F1C
	cmp r0, #0
	bne _02307EB8
	ldrsh r1, [sb, #4]
	ldrsh r0, [r6, #4]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	bgt _02307E94
	ldrsh r1, [sb, #6]
	ldrsh r0, [r6, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	movle r8, #1
	ble _02307EC4
_02307E94:
	mov r0, sb
	mov r1, #0x24
	bl ItemIsActive__02307F1C
	cmp r0, #0
	beq _02307EB8
	ldrb r0, [sb, #0x25]
	cmp sl, r0
	moveq r7, #1
	beq _02307EC4
_02307EB8:
	add r5, r5, #1
_02307EBC:
	cmp r5, #4
	blt _02307E2C
_02307EC4:
	cmp r7, #0
	bne _02307ED4
	cmp r8, #0
	movne r7, #1
_02307ED4:
	cmp r7, #0
	beq _02307EE4
	mov r0, r6
	bl ov29_02307C48
_02307EE4:
	add r4, r4, #1
	cmp r4, #0x10
	blt _02307DD8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02307EF4: .word DUNGEON_PTR
	arm_func_end ov29_02307DD0
