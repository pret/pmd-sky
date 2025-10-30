	.include "asm/macros.inc"
	.include "overlay_29_02311C28.inc"

	.text

	arm_func_start ov29_02311C28
ov29_02311C28: ; 0x02311C28
	stmdb sp!, {r3, lr}
	ldrb ip, [sp, #8]
	str ip, [sp]
	bl IsProtectedFromSleepClassStatus
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02311C28

	arm_func_start TryInflictNightmareStatus
TryInflictNightmareStatus: ; 0x02311C4C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r2
	mov r2, #1
	mov r3, r2
	mov r7, r0
	mov r6, r1
	str r2, [sp]
	mov r4, #0
	bl IsProtectedFromSleepClassStatus
	cmp r0, #0
	bne _02311D4C
	ldr r5, [r6, #0xb4]
	ldrb r0, [r5, #0xbd]
	cmp r0, #2
	beq _02311D34
	mov r0, r6
	bl ov29_022E4B8C
	ldrb r0, [r5, #0xbd]
	cmp r0, #3
	beq _02311CE0
	mov r0, r7
	mov r1, r6
	mov r2, #0x2f
#ifndef JAPAN
	mov r3, #1
#endif
	strb r8, [r5, #0xbe]
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02311CE4
	ldrb r0, [r5, #0xbe]
	mov r1, r0, asr #1
	and r0, r1, #0xff
	cmp r0, #1
	strb r1, [r5, #0xbe]
	movlo r0, #1
	strlob r0, [r5, #0xbe]
	b _02311CE4
_02311CE0:
	mov r4, #1
_02311CE4:
	mov r2, #3
	mov r0, r6
	mov r1, #8
	strb r2, [r5, #0xbd]
	bl ov29_02304A48
	cmp r4, #0
	beq _02311D14
	ldr r2, _02311D54 ; =0x00000D0D
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02311D44
_02311D14:
	ldr r2, _02311D58 ; =0x00000D0C
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	b _02311D44
_02311D34:
	ldr r2, _02311D5C ; =0x00000D0E
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02311D44:
	mov r0, r6
	bl UpdateStatusIconFlags
_02311D4C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_02311D54: .word 0x00000A4D
_02311D58: .word 0x00000A4C
_02311D5C: .word 0x00000A4E
#else
_02311D54: .word 0x00000D0D
_02311D58: .word 0x00000D0C
_02311D5C: .word 0x00000D0E
#endif
	arm_func_end TryInflictNightmareStatus

	arm_func_start TryInflictNappingStatus
TryInflictNappingStatus: ; 0x02311D60
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r4, #0
	mov r6, r2
	mov r5, #1
	mov r2, r4
	mov r3, r4
	mov r8, r0
	mov r7, r1
	str r5, [sp]
	bl IsProtectedFromSleepClassStatus
	cmp r0, #0
	bne _02311E5C
	ldr r5, [r7, #0xb4]
	ldrb r0, [r5, #0xbd]
	cmp r0, #2
	beq _02311E44
	mov r0, r7
	bl ov29_022E4BA0
	ldrb r0, [r5, #0xbd]
	cmp r0, #0
	cmpne r0, #4
	bne _02311DFC
	mov r0, r8
	mov r1, r7
	mov r2, #0x2f
#ifndef JAPAN
	mov r3, #1
#endif
	strb r6, [r5, #0xbe]
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02311E00
	ldrb r0, [r5, #0xbe]
	mov r1, r0, asr #1
	and r0, r1, #0xff
	cmp r0, #1
	strb r1, [r5, #0xbe]
	movlo r0, #1
	strlob r0, [r5, #0xbe]
	b _02311E00
_02311DFC:
	mov r4, #1
_02311E00:
	mov r2, #5
	mov r0, r7
	mov r1, #8
	strb r2, [r5, #0xbd]
	bl ov29_02304A48
	cmp r4, #0
	beq _02311E30
	ldr r2, _02311E64 ; =0x00000D08
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02311E54
_02311E30:
	ldr r2, _02311E68 ; =0x00000D05
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02311E54
_02311E44:
	ldr r2, _02311E6C ; =0x00000D0B
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02311E54:
	mov r0, r7
	bl UpdateStatusIconFlags
_02311E5C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_02311E64: .word 0x00000A48
_02311E68: .word 0x00000A45
_02311E6C: .word 0x00000A4B
#else
_02311E64: .word 0x00000D08
_02311E68: .word 0x00000D05
_02311E6C: .word 0x00000D0B
#endif
	arm_func_end TryInflictNappingStatus

	arm_func_start TryInflictYawningStatus
TryInflictYawningStatus: ; 0x02311E70
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r2
	mov r2, #1
	mov r3, r2
	mov r6, r0
	mov r5, r1
	str r2, [sp]
	bl IsProtectedFromSleepClassStatus
	cmp r0, #0
	bne _02311F6C
	ldr r1, [r5, #0xb4]
	ldrb r0, [r1, #0xbd]
	cmp r0, #0
	bne _02311EEC
	mov r0, #4
	strb r0, [r1, #0xbd]
	mov r0, r5
	strb r4, [r1, #0xbe]
	bl ov29_022E53EC
	mov r0, r5
	mov r1, #8
	bl ov29_02304A48
	ldr r2, _02311F74 ; =0x00000D0F
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	b _02311F64
_02311EEC:
	cmp r0, #1
	cmpne r0, #3
	cmpne r0, #5
	bne _02311F10
	ldr r2, _02311F78 ; =0x00000D12
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02311F64
_02311F10:
	cmp r0, #2
	bne _02311F2C
	mov r0, r6
	mov r1, r5
#ifdef JAPAN
	mov r2, #0xa50
#else
	mov r2, #0xd10
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02311F64
_02311F2C:
	cmp r0, #4
	bne _02311F48
	ldr r2, _02311F7C ; =0x00000D11
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02311F64
_02311F48:
	ldr r2, _02311F74 ; =0x00000D0F
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
_02311F64:
	mov r0, r5
	bl UpdateStatusIconFlags
_02311F6C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02311F74: .word 0x00000A4F
_02311F78: .word 0x00000A52
_02311F7C: .word 0x00000A51
#else
_02311F74: .word 0x00000D0F
_02311F78: .word 0x00000D12
_02311F7C: .word 0x00000D11
#endif
	arm_func_end TryInflictYawningStatus

	arm_func_start TryInflictSleeplessStatus
TryInflictSleeplessStatus: ; 0x02311F80
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r4, #0
	bl EntityIsValid__023118B4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r5, [r6, #0xb4]
	mov r1, r6
	ldrb r0, [r5, #0xbd]
	cmp r0, #1
	cmpne r0, #5
	cmpne r0, #3
	mov r0, #0
	mov r2, r0
	moveq r4, #1
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r5, #0xbd]
	cmp r0, #2
	beq _02312040
	ldr r1, _0231205C ; =ov10_022C4728
	mov r3, #2
	mov r0, r6
	mov r2, #0
	strb r3, [r5, #0xbd]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r5, #0xbe]
	mov r1, #0xff
#ifdef JAPAN
	strb r1, [r5, #0x174]
	mov r0, r6
	strb r1, [r5, #0x173]
#else
	strb r1, [r5, #0x178]
	mov r0, r6
	strb r1, [r5, #0x177]
#endif
	bl ov29_022E4BB4
	mov r0, r6
	mov r1, #8
	bl ov29_02304A48
	cmp r4, #0
	beq _0231202C
	ldr r2, _02312060 ; =0x00000D13
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_0231202C:
	ldr r2, _02312064 ; =0x00000D15
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02312050
_02312040:
	ldr r2, _02312068 ; =0x00000D14
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02312050:
	mov r0, r6
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0231205C: .word ov10_022C4728
#ifdef JAPAN
_02312060: .word 0x00000A53
_02312064: .word 0x00000A55
_02312068: .word 0x00000A54
#else
_02312060: .word 0x00000D13
_02312064: .word 0x00000D15
_02312068: .word 0x00000D14
#endif
	arm_func_end TryInflictSleeplessStatus

	arm_func_start TryInflictPausedStatus
TryInflictPausedStatus: ; 0x0231206C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r4, r2
	mov r5, r3
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, #0
	ldr r4, [r6, #0xb4]
	beq _023120BC
	ldrb r2, [sp, #0x18]
	mov r0, r7
	mov r1, r6
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_023120BC:
	ldrb r2, [sp, #0x18]
	mov r0, r7
	mov r1, r6
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	mov r2, r4
	mov r3, r1
	str r1, [sp]
	bl SetPreprocessorArgsStringToName
	ldrb r0, [r4, #0xd0]
	cmp r0, #3
	beq _02312160
	mov r1, #3
	mov r0, r6
	strb r1, [r4, #0xd0]
	add r1, r5, #1
	strb r1, [r4, #0xd1]
	bl ov29_022E4428
	cmp r5, #1
	bne _02312140
	ldr r2, _0231219C ; =0x00000D16
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02312150
_02312140:
	ldr r2, _023121A0 ; =0x00000D18
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02312150:
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	b _0231218C
_02312160:
	cmp r5, #1
	bne _0231217C
	ldr r2, _023121A4 ; =0x00000D17
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231218C
_0231217C:
	ldr r2, _023121A8 ; =0x00000D19
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_0231218C:
	mov r0, r6
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_PAUSED_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_PAUSED_STATUS_OFFSET 0
#endif
_0231219C: .word 0x00000D16 + TRY_INFLICT_PAUSED_STATUS_OFFSET
_023121A0: .word 0x00000D18 + TRY_INFLICT_PAUSED_STATUS_OFFSET
_023121A4: .word 0x00000D17 + TRY_INFLICT_PAUSED_STATUS_OFFSET
_023121A8: .word 0x00000D19 + TRY_INFLICT_PAUSED_STATUS_OFFSET
	arm_func_end TryInflictPausedStatus

	arm_func_start TryInflictInfatuatedStatus
TryInflictInfatuatedStatus: ; 0x023121AC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r8, r2
	mov r7, r3
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	beq _0231231C
	mov r0, r5
	mov r1, r4
	mov r2, r8
	ldr r6, [r4, #0xb4]
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	bne _0231231C
	mov r0, r5
	mov r1, r4
	mov r2, r8
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	bne _0231231C
	mov r0, r5
	mov r1, r4
	mov r2, #0x29
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02312260
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r8, #0
	beq _02312258
	ldr r2, _02312324 ; =0x00000DA3
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02312258:
	mov r0, #0
	b _0231231C
_02312260:
	ldr r3, _02312328 ; =0x00000DBB
	mov ip, #3
	mov r0, r5
	mov r1, r4
	mov r2, r8
	str ip, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	movne r0, #0
	bne _0231231C
	cmp r7, #0
	movne r0, #1
	bne _0231231C
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	mov r2, r6
	mov r3, r1
	str r1, [sp]
	bl SetPreprocessorArgsStringToName
	ldrb r0, [r6, #0xd0]
	cmp r0, #7
	beq _02312300
	ldr r1, _0231232C ; =ov10_022C4804
	mov r3, #7
	mov r0, r4
	mov r2, #1
	strb r3, [r6, #0xd0]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r4
	strb r1, [r6, #0xd1]
	bl ov29_022E4C00
	ldr r2, _02312330 ; =0x00000D1A
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r5
	mov r1, r4
	bl TryActivateQuickFeet
	b _02312310
_02312300:
	ldr r2, _02312334 ; =0x00000D1B
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02312310:
	mov r0, r4
	bl UpdateStatusIconFlags
	mov r0, #1
_0231231C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_INFATUATED_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_INFATUATED_STATUS_OFFSET 0
#endif
_02312324: .word 0x00000DA3 + TRY_INFLICT_INFATUATED_STATUS_OFFSET
_02312328: .word 0x00000DBB + TRY_INFLICT_INFATUATED_STATUS_OFFSET
_0231232C: .word ov10_022C4804
_02312330: .word 0x00000D1A + TRY_INFLICT_INFATUATED_STATUS_OFFSET
_02312334: .word 0x00000D1B + TRY_INFLICT_INFATUATED_STATUS_OFFSET
	arm_func_end TryInflictInfatuatedStatus

	arm_func_start TryInflictBurnStatus
TryInflictBurnStatus: ; 0x02312338
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r4, r2
	mov r8, r3
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r7, [sb, #0xb4]
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl SetPreprocessorArgsStringToName
	mov r0, sl
	mov r1, sb
	mov r2, #0x42
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _023123F0
	cmp r8, #0
	beq _023123E8
	ldr r2, _023125F0 ; =0x00000DAB
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_023123E8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_023123F0:
	mov r0, sb
	mov r1, #2
	bl MonsterIsType
	cmp r0, #0
	beq _02312424
	cmp r8, #0
	beq _0231241C
	ldr r2, _023125F4 ; =0x00000DAC
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0231241C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02312424:
	mov r0, sb
	bl GetTileAtEntity
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #2
	bne _0231247C
	ldr r0, _023125F8 ; =DUNGEON_PTR
	ldr r1, _023125FC ; =SECONDARY_TERRAIN_TYPES
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	ldrb r0, [r1, r0]
	cmp r0, #1
	beq _0231247C
	cmp r8, #0
	beq _02312474
	ldr r2, _02312600 ; =0x00000DB9
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02312474:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0231247C:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xbf]
	mov r5, #1
	cmp r0, #1
	beq _023124F4
	ldr r1, _02312604 ; =ov10_022C4874
	mov r0, sb
	mov r2, r5
	strb r5, [r7, #0xbf]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r7, #0xc0]
	mov r5, #0
	strb r5, [r7, #0xc1]
	strb r5, [r7, #0xc2]
	cmp r4, #0
	beq _023124D4
	mov r0, sb
	bl ov29_022E4294
_023124D4:
	ldr r2, _02312608 ; =0x00000D1C
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sl
	mov r1, sb
	bl TryActivateQuickFeet
	b _02312504
_023124F4:
	ldr r2, _0231260C ; =0x00000D1D
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02312504:
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, sb
	mov r1, #0x19
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023125E8
	cmp r5, #0
	bne _023125E8
	mov r5, #0
	ldr fp, _02312610 ; =DIRECTIONS_XY
	mov r4, r5
_02312534:
	mov r1, r4, lsl #2
	add r0, fp, r4, lsl #2
	ldrsh r3, [fp, r1]
	ldrsh r1, [r0, #2]
	ldrsh r0, [sb, #4]
	ldrsh r2, [sb, #6]
	add r0, r0, r3
	add r1, r2, r1
	bl GetTile
	ldr r6, [r0, #0xc]
	mov r0, r6
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _023125DC
	ldr r0, [r6]
	cmp r0, #1
	bne _023125DC
	cmp r5, #0
	bne _023125AC
	mov r5, #1
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl SetPreprocessorArgsStringToName
	ldr r2, _02312614 ; =0x00000DC5
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_023125AC:
	mov r0, sb
	mov r1, r6
	bl GetTreatmentBetweenMonstersIgnoreStatus
	cmp r0, #1
	bne _023125DC
	mov r2, #0
	str r2, [sp]
	mov r0, sl
	mov r1, r6
	mov r2, #1
	mov r3, r8
	bl TryInflictBurnStatus
_023125DC:
	add r4, r4, #1
	cmp r4, #8
	blt _02312534
_023125E8:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_BURN_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_BURN_STATUS_OFFSET 0
#endif
_023125F0: .word 0x00000DAB + TRY_INFLICT_BURN_STATUS_OFFSET
_023125F4: .word 0x00000DAC + TRY_INFLICT_BURN_STATUS_OFFSET
_023125F8: .word DUNGEON_PTR
_023125FC: .word SECONDARY_TERRAIN_TYPES
_02312600: .word 0x00000DB9 + TRY_INFLICT_BURN_STATUS_OFFSET
_02312604: .word ov10_022C4874
_02312608: .word 0x00000D1C + TRY_INFLICT_BURN_STATUS_OFFSET
_0231260C: .word 0x00000D1D + TRY_INFLICT_BURN_STATUS_OFFSET
_02312610: .word DIRECTIONS_XY
_02312614: .word 0x00000DC5 + TRY_INFLICT_BURN_STATUS_OFFSET
	arm_func_end TryInflictBurnStatus

	arm_func_start TryInflictBurnStatusWholeTeam
TryInflictBurnStatusWholeTeam: ; 0x02312618
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	ldr r4, _02312660 ; =DUNGEON_PTR
	mov r6, r7
	mov r5, #1
_0231262C:
	ldr r0, [r4]
	mov r2, r5
	add r0, r0, r7, lsl #2
	str r6, [sp]
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	mov r3, r5
	mov r1, r0
	bl TryInflictBurnStatus
	add r7, r7, #1
	cmp r7, #4
	blt _0231262C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02312660: .word DUNGEON_PTR
	arm_func_end TryInflictBurnStatusWholeTeam

	arm_func_start TryInflictPoisonedStatus
TryInflictPoisonedStatus: ; 0x02312664
#ifdef JAPAN
#define TRY_INFLICT_POISONED_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_POISONED_STATUS_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r8, r2
	mov r4, r3
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r7, [sb, #0xb4]
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl SetPreprocessorArgsStringToName
	mov r0, sb
	mov r1, #0x1b
	bl ItemIsActive__02311BF8
	cmp r0, #0
	beq _02312714
	cmp r8, #0
	beq _0231270C
	mov r0, sl
	mov r1, sb
	mov r2, #0xdb0 + TRY_INFLICT_POISONED_STATUS_OFFSET
	bl LogMessageByIdWithPopupCheckUserTarget
_0231270C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02312714:
	mov r0, sl
	mov r1, sb
	mov r2, #0x45
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02312750
	cmp r8, #0
	beq _02312748
	ldr r2, _02312924 ; =0x00000DAD
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02312748:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02312750:
	mov r0, sb
	mov r1, #8
	bl MonsterIsType
	cmp r0, #0
	bne _02312778
	mov r0, sb
	mov r1, #0x11
	bl MonsterIsType
	cmp r0, #0
	beq _02312798
_02312778:
	cmp r8, #0
	beq _02312790
	ldr r2, _02312928 ; =0x00000DAE
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02312790:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02312798:
	cmp r4, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xbf]
	mov r4, #1
	cmp r0, #3
	beq _02312830
	cmp r0, #2
	beq _0231281C
	ldr r1, _0231292C ; =ov10_022C4878
	mov r3, #2
	mov r0, sb
	mov r2, r4
	strb r3, [r7, #0xbf]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r7, #0xc0]
	mov r4, #0
	strb r4, [r7, #0xc1]
	mov r0, sb
	strb r4, [r7, #0xc2]
	bl ov29_022E4388
	ldr r2, _02312930 ; =0x00000D1E
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sb
	mov r1, #8
	bl ov29_02304A84
	mov r0, sl
	mov r1, sb
	bl TryActivateQuickFeet
	b _02312840
_0231281C:
	mov r0, sl
	mov r1, sb
	mov r2, #0xd20 + TRY_INFLICT_POISONED_STATUS_OFFSET
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02312840
_02312830:
	mov r0, sl
	mov r1, sb
	add r2, r4, #0xd20 + TRY_INFLICT_POISONED_STATUS_OFFSET
	bl LogMessageByIdWithPopupCheckUserTarget
_02312840:
	mov r0, sb
	mov r1, #0x19
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02312914
	cmp r4, #0
	bne _02312914
	mov r5, #0
	ldr fp, _02312934 ; =DIRECTIONS_XY
	mov r4, r5
_02312868:
	mov r1, r4, lsl #2
	add r0, fp, r4, lsl #2
	ldrsh r6, [sb, #4]
	ldrsh r3, [fp, r1]
	ldrsh r1, [r0, #2]
	ldrsh r2, [sb, #6]
	add r0, r6, r3
	add r1, r2, r1
	bl GetTile
	ldr r6, [r0, #0xc]
	mov r0, r6
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _02312908
	ldr r0, [r6]
	cmp r0, #1
	bne _02312908
	cmp r5, #0
	bne _023128E0
	mov r5, #1
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl SetPreprocessorArgsStringToName
	ldr r2, _02312938 ; =0x00000DC5
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_023128E0:
	mov r0, sb
	mov r1, r6
	bl GetTreatmentBetweenMonstersIgnoreStatus
	cmp r0, #1
	bne _02312908
	mov r0, sl
	mov r1, r6
	mov r2, r8
	mov r3, #0
	bl TryInflictPoisonedStatus
_02312908:
	add r4, r4, #1
	cmp r4, #8
	blt _02312868
_02312914:
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02312924: .word 0x00000DAD + TRY_INFLICT_POISONED_STATUS_OFFSET
_02312928: .word 0x00000DAE + TRY_INFLICT_POISONED_STATUS_OFFSET
_0231292C: .word ov10_022C4878
_02312930: .word 0x00000D1E + TRY_INFLICT_POISONED_STATUS_OFFSET
_02312934: .word DIRECTIONS_XY
_02312938: .word 0x00000DC5 + TRY_INFLICT_POISONED_STATUS_OFFSET
	arm_func_end TryInflictPoisonedStatus

	arm_func_start TryInflictBadlyPoisonedStatus
TryInflictBadlyPoisonedStatus: ; 0x0231293C
#ifdef JAPAN
#define TRY_INFLICT_BADLY_POISONED_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_BADLY_POISONED_STATUS_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r8, r2
	mov r4, r3
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r7, [sb, #0xb4]
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl SetPreprocessorArgsStringToName
	mov r0, sb
	mov r1, #0x1b
	bl ItemIsActive__02311BF8
	cmp r0, #0
	beq _023129EC
	cmp r8, #0
	beq _023129E4
	mov r0, sl
	mov r1, sb
	mov r2, #0xdb0 + TRY_INFLICT_BADLY_POISONED_STATUS_OFFSET
	bl LogMessageByIdWithPopupCheckUserTarget
_023129E4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_023129EC:
	mov r0, sl
	mov r1, sb
	mov r2, #0x45
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02312A28
	cmp r8, #0
	beq _02312A20
	ldr r2, _02312BE0 ; =0x00000DAD
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02312A20:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02312A28:
	mov r0, sb
	mov r1, #8
	bl MonsterIsType
	cmp r0, #0
	bne _02312A50
	mov r0, sb
	mov r1, #0x11
	bl MonsterIsType
	cmp r0, #0
	beq _02312A70
_02312A50:
	cmp r8, #0
	beq _02312A68
	ldr r2, _02312BE4 ; =0x00000DAE
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02312A68:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02312A70:
	cmp r4, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xbf]
	mov r4, #1
	cmp r0, #3
	beq _02312AEC
	ldr r1, _02312BE8 ; =ov10_022C4880
	mov r3, #3
	mov r0, sb
	mov r2, r4
	strb r3, [r7, #0xbf]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r7, #0xc0]
	mov r4, #0
	strb r4, [r7, #0xc1]
	mov r0, sb
	strb r4, [r7, #0xc2]
	bl ov29_022E43D8
	ldr r2, _02312BEC ; =0x00000D1F
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sb
	mov r1, #8
	bl ov29_02304A84
	mov r0, sl
	mov r1, sb
	bl TryActivateQuickFeet
	b _02312AFC
_02312AEC:
	mov r0, sl
	mov r1, sb
	add r2, r4, #0xd20 + TRY_INFLICT_BADLY_POISONED_STATUS_OFFSET
	bl LogMessageByIdWithPopupCheckUserTarget
_02312AFC:
	mov r0, sb
	mov r1, #0x19
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02312BD0
	cmp r4, #0
	bne _02312BD0
	mov r5, #0
	ldr fp, _02312BF0 ; =DIRECTIONS_XY
	mov r4, r5
_02312B24:
	mov r1, r4, lsl #2
	add r0, fp, r4, lsl #2
	ldrsh r6, [sb, #4]
	ldrsh r3, [fp, r1]
	ldrsh r1, [r0, #2]
	ldrsh r2, [sb, #6]
	add r0, r6, r3
	add r1, r2, r1
	bl GetTile
	ldr r6, [r0, #0xc]
	mov r0, r6
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _02312BC4
	ldr r0, [r6]
	cmp r0, #1
	bne _02312BC4
	cmp r5, #0
	bne _02312B9C
	mov r5, #1
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl SetPreprocessorArgsStringToName
	ldr r2, _02312BF4 ; =0x00000DC5
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02312B9C:
	mov r0, sb
	mov r1, r6
	bl GetTreatmentBetweenMonstersIgnoreStatus
	cmp r0, #1
	bne _02312BC4
	mov r0, sl
	mov r1, r6
	mov r2, r8
	mov r3, #0
	bl TryInflictBadlyPoisonedStatus
_02312BC4:
	add r4, r4, #1
	cmp r4, #8
	blt _02312B24
_02312BD0:
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02312BE0: .word 0x00000DAD + TRY_INFLICT_BADLY_POISONED_STATUS_OFFSET
_02312BE4: .word 0x00000DAE + TRY_INFLICT_BADLY_POISONED_STATUS_OFFSET
_02312BE8: .word ov10_022C4880
_02312BEC: .word 0x00000D1F + TRY_INFLICT_BADLY_POISONED_STATUS_OFFSET
_02312BF0: .word DIRECTIONS_XY
_02312BF4: .word 0x00000DC5 + TRY_INFLICT_BADLY_POISONED_STATUS_OFFSET
	arm_func_end TryInflictBadlyPoisonedStatus

	arm_func_start TryInflictFrozenStatus
TryInflictFrozenStatus: ; 0x02312BF8
#ifdef JAPAN
#define TRY_INFLICT_FROZEN_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_FROZEN_STATUS_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r5, r2
	bl EntityIsValid__023118B4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r4, [r6, #0xb4]
	ldrb r0, [r4, #0xc4]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl SafeguardIsActive
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov ip, #4
	mov r0, r7
	mov r1, r6
	mov r2, r5
	rsb r3, ip, #0xdc0 + TRY_INFLICT_FROZEN_STATUS_OFFSET
	str ip, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, #0x41
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02312CC4
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r2, _02312E00 ; =0x00000DA8
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02312CC4:
	mov r0, r6
	mov r1, #6
	bl MonsterIsType
	cmp r0, #0
	beq _02312CF4
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r2, _02312E04 ; =0x00000DA9
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02312CF4:
	mov r0, r6
	bl GetTileAtEntity
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #2
	bne _02312D48
	ldr r0, _02312E08 ; =DUNGEON_PTR
	ldr r1, _02312E0C ; =SECONDARY_TERRAIN_TYPES
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _02312D48
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r2, _02312E10 ; =0x00000DAA
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02312D48:
	mov ip, #4
	mov r0, r7
	mov r1, r6
	mov r2, r5
	rsb r3, ip, #0xdc0 + TRY_INFLICT_FROZEN_STATUS_OFFSET
	str ip, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r0, [r4, #0xc4]
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02312D88
	ldr r0, [r4, #0xb4]
	bl FreeOtherWrappedMonsters
_02312D88:
	mov r0, r6
	bl ov29_022E4C4C
	mov r2, #1
	ldr r1, _02312E14 ; =ov10_022C4870
	mov r0, r6
	strb r2, [r4, #0xc4]
	bl CalcStatusDuration
	add r3, r0, #1
	strb r3, [r4, #0xcc]
	mov r3, #0
	ldr r2, _02312E18 ; =0x00000D22
	mov r0, r7
	mov r1, r6
	strb r3, [r4, #0xcd]
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	bl UpdateStatusIconFlags
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	mov r0, r6
	mov r1, #0
	bl ChangeShayminForme
	cmp r0, #3
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r2, _02312E1C ; =0x00000D23
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02312E00: .word 0x00000DA8 + TRY_INFLICT_FROZEN_STATUS_OFFSET
_02312E04: .word 0x00000DA9 + TRY_INFLICT_FROZEN_STATUS_OFFSET
_02312E08: .word DUNGEON_PTR
_02312E0C: .word SECONDARY_TERRAIN_TYPES
_02312E10: .word 0x00000DAA + TRY_INFLICT_FROZEN_STATUS_OFFSET
_02312E14: .word ov10_022C4870
_02312E18: .word 0x00000D22 + TRY_INFLICT_FROZEN_STATUS_OFFSET
_02312E1C: .word 0x00000D23 + TRY_INFLICT_FROZEN_STATUS_OFFSET
	arm_func_end TryInflictFrozenStatus

	arm_func_start TryInflictConstrictionStatus
TryInflictConstrictionStatus: ; 0x02312E20
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r5, r2
	mov r4, r3
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, r4
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, r4
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r4, [r6, #0xb4]
	ldrb r1, [r4, #0xc4]
	add r0, r1, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02312EA4
	ldr r0, [r4, #0xb4]
	bl FreeOtherWrappedMonsters
	b _02312ECC
_02312EA4:
	cmp r1, #5
	bne _02312ECC
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02312F68 ; =0x00000C9B
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02312ECC:
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xc4]
	cmp r0, #7
	beq _02312F48
	ldr r1, _02312F6C ; =ov10_022C48A0
	mov r3, #7
	mov r0, r6
	mov r2, #1
	strb r3, [r4, #0xc4]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r4, #0xcc]
	mov r0, #0
	strb r0, [r4, #0xcd]
	mov r0, r6
	str r5, [r4, #0xc8]
	bl ov29_022E42E4
	ldr r2, _02312F70 ; =0x00000D24
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	mov r1, #8
	bl ov29_02304A84
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	b _02312F58
_02312F48:
	ldr r2, _02312F74 ; =0x00000D25
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02312F58:
	mov r0, r6
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_CONSTRICTION_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_CONSTRICTION_STATUS_OFFSET 0
#endif
_02312F68: .word 0x00000C9B + TRY_INFLICT_CONSTRICTION_STATUS_OFFSET
_02312F6C: .word ov10_022C48A0
_02312F70: .word 0x00000D24 + TRY_INFLICT_CONSTRICTION_STATUS_OFFSET
_02312F74: .word 0x00000D25 + TRY_INFLICT_CONSTRICTION_STATUS_OFFSET
	arm_func_end TryInflictConstrictionStatus

	arm_func_start TryInflictShadowHoldStatus
TryInflictShadowHoldStatus: ; 0x02312F78
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #0x2b
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _0231302C
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, #1
	mov r1, #0x2b
	bl SetPreprocessorArgsIdVal
	cmp r4, #0
	bne _02313024
	ldr r2, _0231311C ; =0x00000D28
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02313024:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_0231302C:
	cmp r4, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r4, [r5, #0xb4]
	ldrb r1, [r4, #0xc4]
	add r0, r1, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _0231305C
	ldr r0, [r4, #0xb4]
	bl FreeOtherWrappedMonsters
	b _02313084
_0231305C:
	cmp r1, #5
	bne _02313084
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02313120 ; =0x00000C9B
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02313084:
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xc4]
	cmp r0, #2
	beq _023130FC
	ldr r1, _02313124 ; =ov10_022C4898
	mov r3, #2
	mov r0, r5
	mov r2, #1
	strb r3, [r4, #0xc4]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xcc]
	mov r1, #0
	strb r1, [r4, #0xcd]
	bl ov29_022E42E0
	ldr r2, _02313128 ; =0x00000D26
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r5
	mov r1, #8
	bl ov29_02304A84
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	b _0231310C
_023130FC:
	ldr r2, _0231312C ; =0x00000D27
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_0231310C:
	mov r0, r5
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_SHADOW_HOLD_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_SHADOW_HOLD_STATUS_OFFSET 0
#endif
_0231311C: .word 0x00000D28 + TRY_INFLICT_SHADOW_HOLD_STATUS_OFFSET
_02313120: .word 0x00000C9B + TRY_INFLICT_SHADOW_HOLD_STATUS_OFFSET
_02313124: .word ov10_022C4898
_02313128: .word 0x00000D26 + TRY_INFLICT_SHADOW_HOLD_STATUS_OFFSET
_0231312C: .word 0x00000D27 + TRY_INFLICT_SHADOW_HOLD_STATUS_OFFSET
	arm_func_end TryInflictShadowHoldStatus

	arm_func_start TryInflictIngrainStatus
TryInflictIngrainStatus: ; 0x02313130
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__023118B4
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r4, [r5, #0xb4]
	ldrb r0, [r4, #0xc4]
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _0231316C
	ldr r0, [r4, #0xb4]
	bl FreeOtherWrappedMonsters
_0231316C:
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xc4]
	cmp r0, #5
	beq _023131CC
	ldr r1, _023131E8 ; =ov10_022C48B8
	mov r3, #5
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xc4]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xcc]
	mov r1, #0
	strb r1, [r4, #0xcd]
	bl ov29_022E4D24
	ldr r2, _023131EC ; =0x00000D29
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023131DC
_023131CC:
	ldr r2, _023131F0 ; =0x00000D2A
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023131DC:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023131E8: .word ov10_022C48B8
#ifdef JAPAN
_023131EC: .word 0x00000A69
_023131F0: .word 0x00000A6A
#else
_023131EC: .word 0x00000D29
_023131F0: .word 0x00000D2A
#endif
	arm_func_end TryInflictIngrainStatus

	arm_func_start TryInflictWrappedStatus
TryInflictWrappedStatus: ; 0x023131F4
#ifdef JAPAN
#define TRY_INFLICT_WRAPPED_STATUS_OFFSET -0xA4
#else
#define TRY_INFLICT_WRAPPED_STATUS_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	bl EntityIsValid__023118B4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r4, [r7, #0xb4]
	ldr r5, [r6, #0xb4]
	ldrb r1, [r4, #0xc4]
	cmp r1, #3
	cmpne r1, #4
	ldrneb r0, [r5, #0xc4]
	cmpne r0, #3
	cmpne r0, #4
	beq _02313324
	mov r0, #3
	strb r0, [r4, #0xc4]
	mov r0, #0x7f
	strb r0, [r4, #0xcc]
	mov r2, #0
	ldr r1, _023133DC ; =ov10_022C48AC
	mov r0, r6
	strb r2, [r4, #0xcd]
	mov r3, #4
	mov r2, #1
	strb r3, [r5, #0xc4]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r5, #0xcc]
	mov r0, #0
	ldr r3, _023133E0 ; =DUNGEON_PTR
	strb r0, [r5, #0xcd]
	ldr r1, [r3]
	mov r0, r7
	add r1, r1, #0x3000
	ldr r2, [r1, #0xe30 + TRY_INFLICT_WRAPPED_STATUS_OFFSET]
	mov r1, r6
	str r2, [r4, #0xb4]
	ldr r2, [r3]
	add r2, r2, #0x3000
	ldr r2, [r2, #0xe30 + TRY_INFLICT_WRAPPED_STATUS_OFFSET]
	str r2, [r5, #0xb4]
	ldr r2, [r3]
	add r2, r2, #0x3000
	ldr r3, [r2, #0xe30 + TRY_INFLICT_WRAPPED_STATUS_OFFSET]
	add r3, r3, #1
	str r3, [r2, #0xe30 + TRY_INFLICT_WRAPPED_STATUS_OFFSET]
	bl ov29_022E4290
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _023133E4 ; =0x00000D2B
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	mov r1, #8
	bl ov29_02304A84
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	b _023133D0
_02313324:
	cmp r1, #3
	bne _0231334C
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _023133E8 ; =0x00000D2C
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_0231334C:
	ldrb r0, [r5, #0xc4]
	cmp r0, #3
	bne _02313378
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _023133E8 ; =0x00000D2C
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02313378:
	ldrb r0, [r4, #0xc4]
	cmp r0, #4
	bne _023133A4
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _023133EC ; =0x00000D2D
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_023133A4:
	ldrb r0, [r5, #0xc4]
	cmp r0, #4
	bne _023133D0
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _023133EC ; =0x00000D2D
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_023133D0:
	mov r0, r6
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_WRAPPED_STATUS_DATA_OFFSET -0x2C0
#else
#define TRY_INFLICT_WRAPPED_STATUS_DATA_OFFSET 0
#endif
_023133DC: .word ov10_022C48AC
_023133E0: .word DUNGEON_PTR
_023133E4: .word 0x00000D2B + TRY_INFLICT_WRAPPED_STATUS_DATA_OFFSET
_023133E8: .word 0x00000D2C + TRY_INFLICT_WRAPPED_STATUS_DATA_OFFSET
_023133EC: .word 0x00000D2D + TRY_INFLICT_WRAPPED_STATUS_DATA_OFFSET
	arm_func_end TryInflictWrappedStatus

	arm_func_start FreeOtherWrappedMonsters
FreeOtherWrappedMonsters: ; 0x023133F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, #0
	ldr r7, _02313468 ; =DUNGEON_PTR
	mov r6, r0
	mov sb, r4
	mov r8, r4
_02313408:
	ldr r0, [r7]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r5, [r0, #0xad4]
#else
	ldr r5, [r0, #0xb78]
#endif
	mov r0, r5
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _02313458
	ldr r1, [r5, #0xb4]
	ldr r0, [r1, #0xb4]
	cmp r0, r6
	bne _02313450
	ldrb r0, [r1, #0xc4]
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	strlsb sb, [r1, #0xc4]
	str r8, [r1, #0xb4]
_02313450:
	mov r0, r5
	bl UpdateStatusIconFlags
_02313458:
	add r4, r4, #1
	cmp r4, #0x14
	blt _02313408
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02313468: .word DUNGEON_PTR
	arm_func_end FreeOtherWrappedMonsters

	arm_func_start TryInflictPetrifiedStatus
TryInflictPetrifiedStatus: ; 0x0231346C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__023118B4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r5
	bl ov29_022E41F0
	ldr r4, [r5, #0xb4]
	ldrb r0, [r4, #0xc4]
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _023134E0
	ldr r0, [r4, #0xb4]
	bl FreeOtherWrappedMonsters
_023134E0:
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xc4]
	cmp r0, #6
	beq _02313560
	mov r0, #6
	strb r0, [r4, #0xc4]
	ldrb r0, [r4, #7]
	mov r2, #1
	cmp r0, #0
	beq _02313524
	ldr r1, _023135E8 ; =ov10_022C479C
	mov r0, r5
	bl CalcStatusDuration
	b _02313530
_02313524:
	ldr r1, _023135EC ; =ov10_022C47A0
	mov r0, r5
	bl CalcStatusDuration
_02313530:
	add r0, r0, #1
	strb r0, [r4, #0xcc]
	mov r3, #0
	ldr r2, _023135F0 ; =0x00000D32
	mov r0, r6
	mov r1, r5
	strb r3, [r4, #0xcd]
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	b _02313570
_02313560:
	ldr r2, _023135F4 ; =0x00000D33
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02313570:
	ldrb r0, [r4, #6]
	cmp r0, #0
	beq _023135DC
	mov r4, #0
	ldr r6, _023135F8 ; =DUNGEON_PTR
	mov r8, #6
	mov r7, r4
_0231358C:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sb, [r0, #0xa84]
#else
	ldr sb, [r0, #0xb28]
#endif
	mov r0, sb
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _023135D0
	ldr r1, [sb, #0xb4]
	ldrb r0, [r1, #0x7c]
	cmp r0, #1
	ldreq r0, [r1, #0x84]
	cmpeq r0, r5
	streqb r8, [r1, #0x7c]
	streq r7, [r1, #0x84]
	streqh r7, [r1, #0x80]
	streqb r7, [r1, #0x7e]
_023135D0:
	add r4, r4, #1
	cmp r4, #4
	blt _0231358C
_023135DC:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_023135E8: .word ov10_022C479C
_023135EC: .word ov10_022C47A0
#ifdef JAPAN
_023135F0: .word 0x00000A72
_023135F4: .word 0x00000A73
#else
_023135F0: .word 0x00000D32
_023135F4: .word 0x00000D33
#endif
_023135F8: .word DUNGEON_PTR
	arm_func_end TryInflictPetrifiedStatus

	arm_func_start LowerOffensiveStat
LowerOffensiveStat: ; 0x023135FC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r5, r3
	mov r8, r0
	bl AllocateTemp1024ByteBufferFromPool
	mov r6, r0
	bl AllocateTemp1024ByteBufferFromPool
	mov r4, r0
	mov r1, r5, lsl #0x10
	mov r0, r7
	mov r5, r1, asr #0x10
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _023137E8
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _02313660
	ldr r1, _023137F4 ; =0x00000DCB
	mov r0, r6
	bl CopyStringFromId
	mov r1, r6
	mov r0, #1
	bl SetMessageLogPreprocessorArgsString
	b _02313678
_02313660:
	ldr r1, _023137F8 ; =0x00000DCA
	mov r0, r6
	bl CopyStringFromId
	mov r1, r6
	mov r0, #1
	bl SetMessageLogPreprocessorArgsString
_02313678:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	beq _02313720
	ldrb r2, [sp, #0x2c]
	mov r0, r8
	mov r1, r7
	bl IsProtectedFromStatDrops
	cmp r0, #0
	bne _023137E8
	mov r0, r7
	mov r1, #0x12
	bl ItemIsActive__02311BF8
	cmp r0, #0
	beq _023136D4
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _023137FC ; =0x00000DB2
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023137E8
_023136D4:
	mov r0, r8
	mov r1, r7
	mov r2, #9
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02313720
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _02313720
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02313800 ; =0x00000D9E
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023137E8
_02313720:
	mov r0, #0
	mov r1, r7
	mov r2, r0
	ldr r6, [r7, #0xb4]
	bl SubstitutePlaceholderStringTags
	add r1, sp, #0x20
	ldr r1, [r1]
	mov r0, r7
	bl ov29_022E4D28
	mov r0, r7
	mov r1, #0x61
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, r5, lsl #0x11
	movne r5, r0, asr #0x10
	cmp r5, #1
	bne _02313780
	ldr r1, _02313804 ; =0x00000DCD
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #2
	bl SetMessageLogPreprocessorArgsString
	b _02313798
_02313780:
	ldr r1, _02313808 ; =0x00000DCC
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #2
	bl SetMessageLogPreprocessorArgsString
_02313798:
	ldr r1, [sp, #0x20]
	add r0, r6, r1, lsl #1
	ldrsh r0, [r0, #0x24]
	subs r4, r0, r5
	movmi r4, #0
	cmp r4, r0
	beq _023137D0
	ldr r2, _0231380C ; =0x00000D91
	add r3, r6, r1, lsl #1
	mov r0, r8
	mov r1, r7
	strh r4, [r3, #0x24]
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023137E0
_023137D0:
	ldr r2, _02313810 ; =0x00000DD9
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_023137E0:
	mov r0, r7
	bl UpdateStatusIconFlags
_023137E8:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
#ifdef JAPAN
#define LOWER_OFFENSIVE_STAT_OFFSET -0x2C0
#else
#define LOWER_OFFENSIVE_STAT_OFFSET 0
#endif
_023137F4: .word 0x00000DCB + LOWER_OFFENSIVE_STAT_OFFSET
_023137F8: .word 0x00000DCA + LOWER_OFFENSIVE_STAT_OFFSET
_023137FC: .word 0x00000DB2 + LOWER_OFFENSIVE_STAT_OFFSET
_02313800: .word 0x00000D9E + LOWER_OFFENSIVE_STAT_OFFSET
_02313804: .word 0x00000DCD + LOWER_OFFENSIVE_STAT_OFFSET
_02313808: .word 0x00000DCC + LOWER_OFFENSIVE_STAT_OFFSET
_0231380C: .word 0x00000D91 + LOWER_OFFENSIVE_STAT_OFFSET
_02313810: .word 0x00000DD9 + LOWER_OFFENSIVE_STAT_OFFSET
	arm_func_end LowerOffensiveStat
