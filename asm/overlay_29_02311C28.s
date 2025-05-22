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
	bl ov29_0234B034
	mov r1, #0
	mov r2, r4
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
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
	bl ov29_0234B034
	mov r1, #0
	mov r2, r6
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
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
	bl ov29_0234B034
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
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
	bl ov29_0234B034
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
	ldr r2, _02312614 ; =0x00000DC5
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_023125AC:
	mov r0, sb
	mov r1, r6
	bl ov29_023018AC
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
	bl ov29_0234B034
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
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
	bl ov29_0234B034
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
	ldr r2, _02312938 ; =0x00000DC5
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_023128E0:
	mov r0, sb
	mov r1, r6
	bl ov29_023018AC
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
	bl ov29_0234B034
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
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
	bl ov29_0234B034
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
	ldr r2, _02312BF4 ; =0x00000DC5
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02312B9C:
	mov r0, sb
	mov r1, r6
	bl ov29_023018AC
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
	bl ov29_0234B084
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
	bl ov29_0234B0B4
	b _02313678
_02313660:
	ldr r1, _023137F8 ; =0x00000DCA
	mov r0, r6
	bl CopyStringFromId
	mov r1, r6
	mov r0, #1
	bl ov29_0234B0B4
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
	bl ov29_0234B0B4
	b _02313798
_02313780:
	ldr r1, _02313808 ; =0x00000DCC
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #2
	bl ov29_0234B0B4
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

	arm_func_start LowerDefensiveStat
LowerDefensiveStat: ; 0x02313814
#ifdef JAPAN
#define LOWER_DEFENSIVE_STAT_OFFSET -0x2C0
#else
#define LOWER_DEFENSIVE_STAT_OFFSET 0
#endif
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
	beq _0231397C
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _02313878
	ldr r1, _02313988 ; =0x00000DC9
	mov r0, r6
	bl CopyStringFromId
	mov r1, r6
	mov r0, #1
	bl ov29_0234B0B4
	b _02313890
_02313878:
	ldr r1, _0231398C ; =0x00000DC8
	mov r0, r6
	bl CopyStringFromId
	mov r1, r6
	mov r0, #1
	bl ov29_0234B0B4
_02313890:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	beq _023138B4
	ldrb r2, [sp, #0x2c]
	mov r0, r8
	mov r1, r7
	bl IsProtectedFromStatDrops
	cmp r0, #0
	bne _0231397C
_023138B4:
	mov r0, #0
	mov r1, r7
	mov r2, r0
	ldr r6, [r7, #0xb4]
	bl SubstitutePlaceholderStringTags
	add r1, sp, #0x20
	ldr r1, [r1]
	mov r0, r7
	bl ov29_022E4DCC
	mov r0, r7
	mov r1, #0x61
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, r5, lsl #0x11
	movne r5, r0, asr #0x10
	cmp r5, #1
	bne _02313914
	ldr r1, _02313990 ; =0x00000DCD
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #2
	bl ov29_0234B0B4
	b _0231392C
_02313914:
	ldr r1, _02313994 ; =0x00000DCC
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #2
	bl ov29_0234B0B4
_0231392C:
	ldr r1, [sp, #0x20]
	add r0, r6, r1, lsl #1
	ldrsh r0, [r0, #0x28]
	subs r4, r0, r5
	movmi r4, #0
	cmp r4, r0
	beq _02313964
	add r3, r6, r1, lsl #1
	mov r0, r8
	mov r1, r7
	mov r2, #0xd90 + LOWER_DEFENSIVE_STAT_OFFSET
	strh r4, [r3, #0x28]
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02313974
_02313964:
	ldr r2, _02313998 ; =0x00000DD7
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02313974:
	mov r0, r7
	bl UpdateStatusIconFlags
_0231397C:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02313988: .word 0x00000DC9 + LOWER_DEFENSIVE_STAT_OFFSET
_0231398C: .word 0x00000DC8 + LOWER_DEFENSIVE_STAT_OFFSET
_02313990: .word 0x00000DCD + LOWER_DEFENSIVE_STAT_OFFSET
_02313994: .word 0x00000DCC + LOWER_DEFENSIVE_STAT_OFFSET
_02313998: .word 0x00000DD7 + LOWER_DEFENSIVE_STAT_OFFSET
	arm_func_end LowerDefensiveStat

	arm_func_start BoostOffensiveStat
BoostOffensiveStat: ; 0x0231399C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov r6, r3
	mov sb, r0
	bl AllocateTemp1024ByteBufferFromPool
	mov r4, r0
	bl AllocateTemp1024ByteBufferFromPool
	mov r5, r0
	mov r1, r6, lsl #0x10
	mov r0, r8
	mov r6, r1, asr #0x10
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _02313AE4
	mov r0, #0
	mov r1, r8
	mov r2, r0
	ldr r7, [r8, #0xb4]
	bl SubstitutePlaceholderStringTags
	add r1, sp, #0x28
	ldr r1, [r1]
	mov r0, r8
	bl ov29_022E4E74
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _02313A24
	ldr r1, _02313AF0 ; =0x00000DCB
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0B4
	b _02313A3C
_02313A24:
	ldr r1, _02313AF4 ; =0x00000DCA
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0B4
_02313A3C:
	mov r0, r8
	mov r1, #0x61
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, r6, lsl #0x11
	movne r6, r0, asr #0x10
	cmp r6, #1
	bne _02313A78
	ldr r1, _02313AF8 ; =0x00000DCD
	mov r0, r5
	bl CopyStringFromId
	mov r1, r5
	mov r0, #2
	bl ov29_0234B0B4
	b _02313A90
_02313A78:
	ldr r1, _02313AFC ; =0x00000DCC
	mov r0, r5
	bl CopyStringFromId
	mov r1, r5
	mov r0, #2
	bl ov29_0234B0B4
_02313A90:
	ldr r1, [sp, #0x28]
	add r0, r7, r1, lsl #1
	ldrsh r0, [r0, #0x24]
	add r4, r0, r6
	cmp r4, #0x14
	movge r4, #0x14
	cmp r4, r0
	beq _02313ACC
	ldr r2, _02313B00 ; =0x00000D8F
	add r3, r7, r1, lsl #1
	mov r0, sb
	mov r1, r8
	strh r4, [r3, #0x24]
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02313ADC
_02313ACC:
	ldr r2, _02313B04 ; =0x00000DD8
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
_02313ADC:
	mov r0, r8
	bl UpdateStatusIconFlags
_02313AE4:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
#ifdef JAPAN
#define BOOST_OFFENSIVE_STAT_OFFSET -0x2C0
#else
#define BOOST_OFFENSIVE_STAT_OFFSET 0
#endif
_02313AF0: .word 0x00000DCB + BOOST_OFFENSIVE_STAT_OFFSET
_02313AF4: .word 0x00000DCA + BOOST_OFFENSIVE_STAT_OFFSET
_02313AF8: .word 0x00000DCD + BOOST_OFFENSIVE_STAT_OFFSET
_02313AFC: .word 0x00000DCC + BOOST_OFFENSIVE_STAT_OFFSET
_02313B00: .word 0x00000D8F + BOOST_OFFENSIVE_STAT_OFFSET
_02313B04: .word 0x00000DD8 + BOOST_OFFENSIVE_STAT_OFFSET
	arm_func_end BoostOffensiveStat

; https://decomp.me/scratch/90P8f
	arm_func_start BoostDefensiveStat
BoostDefensiveStat: ; 0x02313B08
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov r6, r3
	mov sb, r0
	bl AllocateTemp1024ByteBufferFromPool
	mov r4, r0
	bl AllocateTemp1024ByteBufferFromPool
	mov r5, r0
	mov r1, r6, lsl #0x10
	mov r0, r8
	mov r6, r1, asr #0x10
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _02313C50
	mov r0, #0
	mov r1, r8
	mov r2, r0
	ldr r7, [r8, #0xb4]
	bl SubstitutePlaceholderStringTags
	add r1, sp, #0x28
	ldr r1, [r1]
	mov r0, r8
	bl ov29_022E4F1C
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _02313B90
	ldr r1, _02313C5C ; =0x00000DC9
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0B4
	b _02313BA8
_02313B90:
	ldr r1, _02313C60 ; =0x00000DC8
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0B4
_02313BA8:
	mov r0, r8
	mov r1, #0x61
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, r6, lsl #0x11
	movne r6, r0, asr #0x10
	cmp r6, #1
	bne _02313BE4
	ldr r1, _02313C64 ; =0x00000DCD
	mov r0, r5
	bl CopyStringFromId
	mov r1, r5
	mov r0, #2
	bl ov29_0234B0B4
	b _02313BFC
_02313BE4:
	ldr r1, _02313C68 ; =0x00000DCC
	mov r0, r5
	bl CopyStringFromId
	mov r1, r5
	mov r0, #2
	bl ov29_0234B0B4
_02313BFC:
	ldr r1, [sp, #0x28]
	add r0, r7, r1, lsl #1
	ldrsh r0, [r0, #0x28]
	add r4, r0, r6
	cmp r4, #0x14
	movge r4, #0x14
	cmp r4, r0
	beq _02313C38
	ldr r2, _02313C6C ; =0x00000D8E
	add r3, r7, r1, lsl #1
	mov r0, sb
	mov r1, r8
	strh r4, [r3, #0x28]
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02313C48
_02313C38:
	ldr r2, _02313C70 ; =0x00000DD6
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
_02313C48:
	mov r0, r8
	bl UpdateStatusIconFlags
_02313C50:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
#ifdef JAPAN
#define BOOST_DEFENSIVE_STAT_OFFSET -0x2C0
#else
#define BOOST_DEFENSIVE_STAT_OFFSET 0
#endif
_02313C5C: .word 0x00000DC9 + BOOST_DEFENSIVE_STAT_OFFSET
_02313C60: .word 0x00000DC8 + BOOST_DEFENSIVE_STAT_OFFSET
_02313C64: .word 0x00000DCD + BOOST_DEFENSIVE_STAT_OFFSET
_02313C68: .word 0x00000DCC + BOOST_DEFENSIVE_STAT_OFFSET
_02313C6C: .word 0x00000D8E + BOOST_DEFENSIVE_STAT_OFFSET
_02313C70: .word 0x00000DD6 + BOOST_DEFENSIVE_STAT_OFFSET
	arm_func_end BoostDefensiveStat

	arm_func_start FlashFireShouldActivate
FlashFireShouldActivate: ; 0x02313C74
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, #0x6b
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	mov r2, #0x48
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #0xb4]
	ldrsh r0, [r0, #0x30]
	cmp r0, #2
	movge r0, #1
	movlt r0, #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end FlashFireShouldActivate

	arm_func_start ActivateFlashFire
ActivateFlashFire: ; 0x02313CE4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r0, r5
	bl EntityIsValid__023118B4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrsh r0, [r4, #0x30]
	add r1, r0, #1
	cmp r1, #2
	movge r1, #2
	cmp r0, r1
	beq _02313D34
	mov r0, r5
	strh r1, [r4, #0x30]
	bl ov29_022E4338
_02313D34:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ActivateFlashFire

	arm_func_start ApplyOffensiveStatMultiplier
ApplyOffensiveStatMultiplier: ; 0x02313D40
#ifdef JAPAN
#define APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET -0x2C0
#else
#define APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET 0
#endif
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov sb, r0
	mov r7, r3
	bl AllocateTemp1024ByteBufferFromPool
	mov r4, r0
	mov r0, r8
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _02313F3C
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _02313D94
	ldr r1, _02313F48 ; =0x00000DCB
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0B4
	b _02313DAC
_02313D94:
	ldr r1, _02313F4C ; =0x00000DCA
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0B4
_02313DAC:
	cmp r7, #0x100
	bge _02313DCC
	ldrb r2, [sp, #0x30]
	mov r0, sb
	mov r1, r8
	bl IsProtectedFromStatDrops
	cmp r0, #0
	bne _02313F3C
_02313DCC:
	mov r0, r8
	mov r1, #0x12
	bl ItemIsActive__02311BF8
	cmp r0, #0
	beq _02313E0C
	cmp r7, #0x100
	bge _02313E0C
	mov r0, #0
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02313F50 ; =0x00000DB2
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02313F3C
_02313E0C:
	mov r0, sb
	mov r1, r8
	mov r2, #9
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02313E6C
	ldr r0, [sp, #0x28]
	cmp r0, #0
	bne _02313E6C
	cmp r7, #0x100
	bge _02313E6C
	ldrb r0, [sp, #0x30]
	cmp r0, #0
	beq _02313F3C
	mov r0, #0
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02313F54 ; =0x00000D9E
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02313F3C
_02313E6C:
	mov r0, #0
	mov r1, r8
	mov r2, r0
	ldr r5, [r8, #0xb4]
	bl SubstitutePlaceholderStringTags
	ldr r6, [sp, #0x28]
	cmp r7, #0x100
	add r0, r5, r6, lsl #2
	ldr r4, [r0, #0x34]
	add r1, sp, #0x28
	mov r0, r8
	bge _02313EA8
	ldr r1, [r1]
	bl ov29_022E5068
	b _02313EB0
_02313EA8:
	ldr r1, [r1]
	bl ov29_022E4FC0
_02313EB0:
	add r0, r5, r6, lsl #2
	ldr r0, [r0, #0x34]
	mov r1, r7
	bl MultiplyByFixedPoint
	add r1, r5, r6, lsl #2
	str r0, [r1, #0x34]
	cmp r0, #2
	movlt r0, #2
	strlt r0, [r1, #0x34]
	add r2, r5, r6, lsl #2
	ldr r1, [r2, #0x34]
	ldr r0, _02313F58 ; =0x000063FD
	cmp r1, r0
	strgt r0, [r2, #0x34]
	add r0, r5, r6, lsl #2
	ldr r0, [r0, #0x34]
	cmp r4, r0
	ble _02313F0C
	ldr r2, _02313F5C ; =0x00000DD1
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02313F34
_02313F0C:
	bge _02313F24
	mov r0, sb
	mov r1, r8
	mov r2, #0xdd0 + APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02313F34
_02313F24:
	ldr r2, _02313F60 ; =0x00000DD3
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
_02313F34:
	mov r0, r8
	bl UpdateStatusIconFlags
_02313F3C:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02313F48: .word 0x00000DCB + APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET
_02313F4C: .word 0x00000DCA + APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET
_02313F50: .word 0x00000DB2 + APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET
_02313F54: .word 0x00000D9E + APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET
_02313F58: .word 0x000063FD
_02313F5C: .word 0x00000DD1 + APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET
_02313F60: .word 0x00000DD3 + APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET
	arm_func_end ApplyOffensiveStatMultiplier

	arm_func_start ApplyDefensiveStatMultiplier
ApplyDefensiveStatMultiplier: ; 0x02313F64
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov sb, r0
	mov r7, r3
	bl AllocateTemp1024ByteBufferFromPool
	mov r4, r0
	mov r0, r8
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _023140C0
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _02313FB8
	ldr r1, _023140CC ; =0x00000DC9
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0B4
	b _02313FD0
_02313FB8:
	ldr r1, _023140D0 ; =0x00000DC8
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0B4
_02313FD0:
	cmp r7, #0x100
	bge _02313FF0
	ldrb r2, [sp, #0x30]
	mov r0, sb
	mov r1, r8
	bl IsProtectedFromStatDrops
	cmp r0, #0
	bne _023140C0
_02313FF0:
	mov r0, #0
	mov r1, r8
	mov r2, r0
	ldr r5, [r8, #0xb4]
	bl SubstitutePlaceholderStringTags
	ldr r6, [sp, #0x28]
	cmp r7, #0x100
	add r0, r5, r6, lsl #2
	ldr r4, [r0, #0x3c]
	add r1, sp, #0x28
	mov r0, r8
	bge _0231402C
	ldr r1, [r1]
	bl ov29_022E51B0
	b _02314034
_0231402C:
	ldr r1, [r1]
	bl ov29_022E510C
_02314034:
	add r0, r5, r6, lsl #2
	ldr r0, [r0, #0x3c]
	mov r1, r7
	bl MultiplyByFixedPoint
	add r1, r5, r6, lsl #2
	str r0, [r1, #0x3c]
	cmp r0, #2
	movlt r0, #2
	strlt r0, [r1, #0x3c]
	add r2, r5, r6, lsl #2
	ldr r1, [r2, #0x3c]
	ldr r0, _023140D4 ; =0x000063FD
	cmp r1, r0
	strgt r0, [r2, #0x3c]
	add r0, r5, r6, lsl #2
	ldr r0, [r0, #0x3c]
	cmp r4, r0
	ble _02314090
	ldr r2, _023140D8 ; =0x00000DCF
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023140B8
_02314090:
	bge _023140A8
	ldr r2, _023140DC ; =0x00000DCE
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023140B8
_023140A8:
	ldr r2, _023140E0 ; =0x00000DD2
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
_023140B8:
	mov r0, r8
	bl UpdateStatusIconFlags
_023140C0:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
#ifdef JAPAN
#define APPLY_DEFENSIVE_STAT_MULTIPLIER_OFFSET -0x2C0
#else
#define APPLY_DEFENSIVE_STAT_MULTIPLIER_OFFSET 0
#endif
_023140CC: .word 0x00000DC9 + APPLY_DEFENSIVE_STAT_MULTIPLIER_OFFSET
_023140D0: .word 0x00000DC8 + APPLY_DEFENSIVE_STAT_MULTIPLIER_OFFSET
_023140D4: .word 0x000063FD
_023140D8: .word 0x00000DCF + APPLY_DEFENSIVE_STAT_MULTIPLIER_OFFSET
_023140DC: .word 0x00000DCE + APPLY_DEFENSIVE_STAT_MULTIPLIER_OFFSET
_023140E0: .word 0x00000DD2 + APPLY_DEFENSIVE_STAT_MULTIPLIER_OFFSET
	arm_func_end ApplyDefensiveStatMultiplier

	arm_func_start BoostHitChanceStat
BoostHitChanceStat: ; 0x023140E4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r1
	mov r7, r0
	bl AllocateTemp1024ByteBufferFromPool
	mov r8, r0
	mov r0, r6
	mov r4, #1
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _0231420C
	mov r0, #0
	mov r1, r6
	mov r2, r0
	ldr r5, [r6, #0xb4]
	bl SubstitutePlaceholderStringTags
	add r1, sp, #0x20
	ldr r1, [r1]
	mov r0, r6
	bl ov29_022E5258
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0231415C
	ldr r1, _02314218 ; =0x00000DC7
	mov r0, r8
	bl CopyStringFromId
	mov r1, r8
	mov r0, r4
	bl ov29_0234B0B4
	b _02314174
_0231415C:
	ldr r1, _0231421C ; =0x00000DC6
	mov r0, r8
	bl CopyStringFromId
	mov r1, r8
	mov r0, r4
	bl ov29_0234B0B4
_02314174:
	mov r0, r6
	mov r1, #0x61
	bl AbilityIsActiveVeneer
	ldr r1, [sp, #0x20]
	cmp r0, #0
	movne r0, r4, lsl #0x11
	add r2, r5, r1, lsl #1
	movne r4, r0, asr #0x10
	ldrsh r0, [r2, #0x2c]
	mov r3, r1, lsl #1
	cmp r0, #0x14
	bge _023141F4
	add r1, r5, #0x2c
	ldrsh r0, [r1, r3]
	add r0, r0, r4
	strh r0, [r1, r3]
	ldrsh r0, [r2, #0x2c]
	cmp r0, #0x14
	movgt r0, #0x14
	strgth r0, [r2, #0x2c]
	cmp r4, #2
	blt _023141E0
	ldr r2, _02314220 ; =0x00000D95
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314204
_023141E0:
	ldr r2, _02314224 ; =0x00000D93
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314204
_023141F4:
	ldr r2, _02314228 ; =0x00000DD5
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02314204:
	mov r0, r6
	bl UpdateStatusIconFlags
_0231420C:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
#ifdef JAPAN
#define BOOST_HIT_CHANCE_STAT_OFFSET -0x2C0
#else
#define BOOST_HIT_CHANCE_STAT_OFFSET 0
#endif
_02314218: .word 0x00000DC7 + BOOST_HIT_CHANCE_STAT_OFFSET
_0231421C: .word 0x00000DC6 + BOOST_HIT_CHANCE_STAT_OFFSET
_02314220: .word 0x00000D95 + BOOST_HIT_CHANCE_STAT_OFFSET
_02314224: .word 0x00000D93 + BOOST_HIT_CHANCE_STAT_OFFSET
_02314228: .word 0x00000DD5 + BOOST_HIT_CHANCE_STAT_OFFSET
	arm_func_end BoostHitChanceStat

	arm_func_start LowerHitChanceStat
LowerHitChanceStat: ; 0x0231422C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r1
	mov r7, r0
	mov r8, r3
	bl AllocateTemp1024ByteBufferFromPool
	mov r5, r0
	mov r0, r6
	mov r4, #1
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _023143C4
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _02314284
	ldr r1, _023143D0 ; =0x00000DC7
	mov r0, r5
	bl CopyStringFromId
	mov r1, r5
	mov r0, r4
	bl ov29_0234B0B4
	b _0231429C
_02314284:
	ldr r1, _023143D4 ; =0x00000DC6
	mov r0, r5
	bl CopyStringFromId
	mov r1, r5
	mov r0, r4
	bl ov29_0234B0B4
_0231429C:
	mov r0, r7
	mov r1, r6
	mov r2, r8
	bl IsProtectedFromStatDrops
	cmp r0, #0
	bne _023143C4
	mov r0, r7
	mov r1, r6
	mov r2, #0x1e
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02314308
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _02314308
	cmp r8, #0
	beq _023143C4
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _023143D8 ; =0x00000D9F
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023143C4
_02314308:
	mov r0, r6
	mov r1, #0x61
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, r4, lsl #0x11
	movne r4, r0, asr #0x10
	mov r0, #0
	mov r1, r6
	mov r2, r0
	ldr r5, [r6, #0xb4]
	bl SubstitutePlaceholderStringTags
	add r1, sp, #0x20
	ldr r1, [r1]
	mov r0, r6
	bl ov29_022E52F8
	ldr r1, [sp, #0x20]
	add r2, r5, r1, lsl #1
	ldrsh r0, [r2, #0x2c]
	mov r3, r1, lsl #1
	cmp r0, #0
	ble _023143AC
	add r1, r5, #0x2c
	ldrsh r0, [r1, r3]
	sub r0, r0, r4
	strh r0, [r1, r3]
	ldrsh r0, [r2, #0x2c]
	cmp r0, #0
	movlt r0, #0
	strlth r0, [r2, #0x2c]
	cmp r4, #2
	blt _02314398
	ldr r2, _023143DC ; =0x00000D94
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023143BC
_02314398:
	ldr r2, _023143E0 ; =0x00000D92
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023143BC
_023143AC:
	ldr r2, _023143E4 ; =0x00000DD4
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_023143BC:
	mov r0, r6
	bl UpdateStatusIconFlags
_023143C4:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
#ifdef JAPAN
#define LOWER_HIT_CHANCE_STAT_OFFSET -0x2C0
#else
#define LOWER_HIT_CHANCE_STAT_OFFSET 0
#endif
_023143D0: .word 0x00000DC7 + LOWER_HIT_CHANCE_STAT_OFFSET
_023143D4: .word 0x00000DC6 + LOWER_HIT_CHANCE_STAT_OFFSET
_023143D8: .word 0x00000D9F + LOWER_HIT_CHANCE_STAT_OFFSET
_023143DC: .word 0x00000D94 + LOWER_HIT_CHANCE_STAT_OFFSET
_023143E0: .word 0x00000D92 + LOWER_HIT_CHANCE_STAT_OFFSET
_023143E4: .word 0x00000DD4 + LOWER_HIT_CHANCE_STAT_OFFSET
	arm_func_end LowerHitChanceStat

	arm_func_start TryInflictCringeStatus
TryInflictCringeStatus: ; 0x023143E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r5, r2
	mov r4, r3
	bl AllocateTemp1024ByteBufferFromPool
	mov r0, r6
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, #0x1f
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02314498
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r5, #0
	beq _02314490
	ldr r2, _02314534 ; =0x00000DA2
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02314490:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02314498:
	cmp r4, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	ldr r4, [r6, #0xb4]
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd0]
	cmp r0, #1
	beq _02314514
	ldr r1, _02314538 ; =ov10_022C4884
	mov r2, #1
	mov r0, r6
	strb r2, [r4, #0xd0]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r6
	strb r1, [r4, #0xd1]
	bl PlayExclamationPointEffect__022E5D4C
	ldr r2, _0231453C ; =0x00000D02
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r7
	mov r1, r6
	bl TryActivateSteadfast
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	b _02314524
_02314514:
	ldr r2, _02314540 ; =0x00000D03
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02314524:
	mov r0, r6
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_CRINGE_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_CRINGE_STATUS_OFFSET 0
#endif
_02314534: .word 0x00000DA2 + TRY_INFLICT_CRINGE_STATUS_OFFSET
_02314538: .word ov10_022C4884
_0231453C: .word 0x00000D02 + TRY_INFLICT_CRINGE_STATUS_OFFSET
_02314540: .word 0x00000D03 + TRY_INFLICT_CRINGE_STATUS_OFFSET
	arm_func_end TryInflictCringeStatus

	arm_func_start TryInflictParalysisStatus
TryInflictParalysisStatus: ; 0x02314544
#ifdef JAPAN
#define TRY_INFLICT_PARALYSIS_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_PARALYSIS_STATUS_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r8, r2
	mov r4, r3
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	beq _023147D0
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	bne _023147D0
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	bne _023147D0
	mov r0, sl
	mov r1, sb
	mov r2, #0x16
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _023145F4
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r8, #0
	beq _023145EC
	mov r0, sl
	mov r1, sb
	mov r2, #0xda0 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
	bl LogMessageByIdWithPopupCheckUserTarget
_023145EC:
	mov r0, #0
	b _023147D0
_023145F4:
	mov r0, sb
	mov r1, #1
	bl ExclusiveItemEffectIsActive__023147EC
	cmp r0, #0
	beq _02314654
	cmp r8, #0
	beq _0231464C
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	add r2, sp, #4
	mov r0, sb
	mov r1, #1
	bl GetExclusiveItemWithEffectFromBag
	add r1, sp, #4
	mov r0, #1
	bl ov29_02344B44
	ldr r2, _023147D8 ; =0x00000DA1
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0231464C:
	mov r0, #0
	b _023147D0
_02314654:
	cmp r4, #0
	movne r0, #1
	bne _023147D0
	mov r0, #0
	ldr r7, [sb, #0xb4]
	mov r1, sb
	mov r2, r0
	mov r4, #1
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r7, #0xbf]
	cmp r0, #4
	beq _023146E0
	ldr r1, _023147DC ; =ov10_022C4894
	mov r3, #4
	mov r0, sb
	mov r2, r4
	strb r3, [r7, #0xbf]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r7, #0xc0]
	mov r4, #0
	strb r4, [r7, #0xc1]
	mov r0, sl
	mov r1, sb
	mov r2, #0xd00 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
	strb r4, [r7, #0xc2]
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sb
	bl ov29_022E4240
	mov r0, sb
	bl CalcSpeedStageWrapper
	mov r0, sl
	mov r1, sb
	bl TryActivateQuickFeet
	b _023146F0
_023146E0:
	ldr r2, _023147E0 ; =0x00000D01
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_023146F0:
	mov r0, sb
	mov r1, #0x19
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023147C4
	cmp r4, #0
	bne _023147C4
	mov r5, #0
	ldr fp, _023147E4 ; =DIRECTIONS_XY
	mov r4, r5
_02314718:
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
	beq _023147B8
	ldr r0, [r6]
	cmp r0, #1
	bne _023147B8
	cmp r5, #0
	bne _02314790
	mov r5, #1
	bl ov29_0234B034
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
	ldr r2, _023147E8 ; =0x00000DC5
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02314790:
	mov r0, sb
	mov r1, r6
	bl ov29_023018AC
	cmp r0, #1
	bne _023147B8
	mov r0, sl
	mov r1, r6
	mov r2, r8
	mov r3, #0
	bl TryInflictParalysisStatus
_023147B8:
	add r4, r4, #1
	cmp r4, #8
	blt _02314718
_023147C4:
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, #1
_023147D0:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023147D8: .word 0x00000DA1 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
_023147DC: .word ov10_022C4894
_023147E0: .word 0x00000D01 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
_023147E4: .word DIRECTIONS_XY
_023147E8: .word 0x00000DC5 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
	arm_func_end TryInflictParalysisStatus

	arm_func_start ExclusiveItemEffectIsActive__023147EC
ExclusiveItemEffectIsActive__023147EC: ; 0x023147EC
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
#ifdef JAPAN
	add r0, r2, #0x224
#else
	add r0, r2, #0x228
#endif
	bl ExclusiveItemEffectFlagTest
	ldmia sp!, {r3, pc}
	arm_func_end ExclusiveItemEffectIsActive__023147EC

	arm_func_start BoostSpeed
BoostSpeed: ; 0x02314810
#ifdef JAPAN
#define BOOST_SPEED_OFFSET -4
#else
#define BOOST_SPEED_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov sb, r0
	mov r0, r8
	mov r7, r2
	mov r6, r3
	bl EntityIsValid__023118B4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #0
	bne _02314850
	ldr r1, _0231492C ; =SPEED_BOOST_TURN_RANGE
	mov r0, r8
	mov r2, #0
	bl CalcStatusDuration
	add r6, r0, #1
_02314850:
	mov r0, #0
	mov r1, r8
	mov r2, r0
	ldr r5, [r8, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r0, r8
	mov r1, r7
	bl CalcSpeedStage
	mov r4, r0
	cmp r4, #4
	bne _0231489C
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	beq _02314920
	ldr r2, _02314930 ; =0x00000DDB
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314920
_0231489C:
	mov r2, #0
	b _023148BC
_023148A4:
	add r1, r5, r2
	ldrb r0, [r1, #0x114 + BOOST_SPEED_OFFSET]
	cmp r0, #0
	streqb r6, [r1, #0x114 + BOOST_SPEED_OFFSET]
	beq _023148C4
	add r2, r2, #1
_023148BC:
	cmp r2, #5
	blt _023148A4
_023148C4:
	mov r0, r8
	mov r1, r7
	bl CalcSpeedStage
	mov r6, r0
	cmp r4, r6
	bne _023148F0
	ldr r2, _02314934 ; =0x00000DDA
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314920
_023148F0:
	mov r0, r8
	bl ov29_022E44CC
	ldr r0, _02314938 ; =ov29_02353318
	mov r1, r6, lsl #1
	ldrh r2, [r0, r1]
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	strb r0, [r5, #0x101]
	mov r0, #0
	strb r0, [r5, #0x152 + BOOST_SPEED_OFFSET]
_02314920:
	mov r0, r8
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0231492C: .word SPEED_BOOST_TURN_RANGE
#ifdef JAPAN
_02314930: .word 0x00000B1B
_02314934: .word 0x00000B1A
#else
_02314930: .word 0x00000DDB
_02314934: .word 0x00000DDA
#endif
_02314938: .word ov29_02353318
	arm_func_end BoostSpeed

	arm_func_start BoostSpeedOneStage
BoostSpeedOneStage: ; 0x0231493C
	stmdb sp!, {r3, lr}
	str r3, [sp]
	mov r3, r2
	mov r2, #1
	bl BoostSpeed
	ldmia sp!, {r3, pc}
	arm_func_end BoostSpeedOneStage

	arm_func_start LowerSpeed
LowerSpeed: ; 0x02314954
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r8, r2
	mov r7, r3
	bl EntityIsValid__023118B4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	mov r2, r7
	bl SafeguardIsActive
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	mov r2, r7
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	mov r1, sb
	mov r2, r0
	ldr r4, [sb, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r0, sb
	bl CalcSpeedStageWrapper
	movs fp, r0
	bne _023149E8
	cmp r7, #0
	beq _02314AA0
	ldr r2, _02314AAC ; =0x00000DDC
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314AA0
_023149E8:
	mov r5, #0
	b _02314A34
_023149F0:
	mov r1, #0
	b _02314A28
_023149F8:
	add r6, r4, r1
#ifdef JAPAN
	ldrb r0, [r6, #0x115]
#else
	ldrb r0, [r6, #0x119]
#endif
	cmp r0, #0
	bne _02314A24
	ldr r1, _02314AB0 ; =ov10_022C488C
	mov r0, sb
	mov r2, #1
	bl CalcStatusDuration
	add r0, r0, #1
#ifdef JAPAN
	strb r0, [r6, #0x115]
#else
	strb r0, [r6, #0x119]
#endif
	b _02314A30
_02314A24:
	add r1, r1, #1
_02314A28:
	cmp r1, #5
	blt _023149F8
_02314A30:
	add r5, r5, #1
_02314A34:
	cmp r5, r8
	blt _023149F0
	mov r0, sb
	bl CalcSpeedStageWrapper
	mov r4, r0
	cmp fp, r4
	bne _02314A6C
	cmp r7, #0
	beq _02314AA0
	ldr r2, _02314AB4 ; =0x00000DDA
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314AA0
_02314A6C:
	mov r0, sb
	bl ov29_022E451C
	ldr r0, _02314AB8 ; =ov29_02353318
	mov r1, r4, lsl #1
	ldrh r2, [r0, r1]
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	cmp r4, #0
	bne _02314AA0
	mov r0, sl
	mov r1, sb
	bl TryActivateQuickFeet
_02314AA0:
	mov r0, sb
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_02314AAC: .word 0x00000B1C
_02314AB0: .word ov10_022C488C
_02314AB4: .word 0x00000B1A
#else
_02314AAC: .word 0x00000DDC
_02314AB0: .word ov10_022C488C
_02314AB4: .word 0x00000DDA
#endif
_02314AB8: .word ov29_02353318
	arm_func_end LowerSpeed

	arm_func_start TrySealMove
TrySealMove: ; 0x02314ABC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	mov r5, #0
	movs r7, r1
	mov r8, r0
	mov r6, r2
	moveq r0, r5
	beq _02314C18
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, r5
	bne _02314C18
	mov r0, r8
	mov r1, r7
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, r5
	bne _02314C18
	ldr r0, [r7, #0xb4]
	mov r4, r5
#ifdef JAPAN
	add ip, r0, #0x120
#else
	add ip, r0, #0x124
#endif
	mov lr, r4
	mov r2, r5
	mov r3, #1
	add r0, sp, #4
_02314B28:
	ldrb r1, [ip, lr, lsl #3]
	add sb, ip, lr, lsl #3
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _02314B54
	ldrh r1, [sb, #2]
	tst r1, #1
	streq sb, [r0, r4, lsl #2]
	addeq r4, r4, #1
_02314B54:
	add lr, lr, #1
	cmp lr, #4
	blt _02314B28
	cmp r6, #0
	beq _02314B74
	cmp r4, #0
	moveq r0, #0
	beq _02314C18
_02314B74:
	cmp r4, #0
	beq _02314BE8
	ldr r3, _02314C20 ; =0x00000DBE
	mov r5, #8
	mov r0, r8
	mov r1, r7
	mov r2, #1
	str r5, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	movne r0, #0
	bne _02314C18
	cmp r6, #0
	movne r0, #1
	bne _02314C18
	mov r0, r4
	bl DungeonRandInt
	add r1, sp, #4
	ldr r2, [r1, r0, lsl #2]
	mov r0, #0
	ldrh r1, [r2, #2]
	orr r1, r1, #1
	strh r1, [r2, #2]
	ldrh r1, [r2, #4]
	bl ov29_0234B084
	mov r0, r8
	mov r1, r7
	mov r5, #1
	bl TryActivateQuickFeet
_02314BE8:
	cmp r5, #0
	beq _02314C04
	ldr r2, _02314C24 ; =0x00000DE3
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314C14
_02314C04:
	ldr r2, _02314C28 ; =0x00000DE4
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02314C14:
	mov r0, #1
_02314C18:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_02314C20: .word 0x00000AFE
_02314C24: .word 0x00000B23
_02314C28: .word 0x00000B24
#else
_02314C20: .word 0x00000DBE
_02314C24: .word 0x00000DE3
_02314C28: .word 0x00000DE4
#endif
	arm_func_end TrySealMove

	arm_func_start BoostOrLowerSpeed
BoostOrLowerSpeed: ; 0x02314C2C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0x32
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	mov r2, #1
	mov r0, r5
	beq _02314C74
	mov r1, r4
	mov r3, r2
	bl LowerSpeed
	b _02314C84
_02314C74:
	mov r1, r4
	mov r3, #0
	str r2, [sp]
	bl BoostSpeed
_02314C84:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end BoostOrLowerSpeed

	arm_func_start ResetHitChanceStat
ResetHitChanceStat: ; 0x02314C8C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r8, r2
	mov r4, r3
	mov r7, #0
	bl EntityIsValid__023118B4
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [r5, #0xb4]
	add r1, r0, r8, lsl #1
	ldrsh r0, [r1, #0x2c]
	cmp r0, #0xa
	movne r0, #0xa
	movne r7, #1
	strneh r0, [r1, #0x2c]
	cmp r7, #0
	beq _02314CE4
	mov r0, r5
	bl ov29_022E543C
	b _02314CF4
_02314CE4:
	cmp r4, #0
	beq _02314CF4
	mov r0, r5
	bl ov29_022E543C
_02314CF4:
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r7, #0
	beq _02314D20
	mov r0, r6
	mov r1, r5
#ifdef JAPAN
	mov r2, #0xaa0
#else
	mov r2, #0xd60
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314D30
_02314D20:
	ldr r2, _02314D3C ; =0x00000D61
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02314D30:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_02314D3C: .word 0x00000AA1
#else
_02314D3C: .word 0x00000D61
#endif
	arm_func_end ResetHitChanceStat

	arm_func_start ExclusiveItemEffectIsActiveWithLogging
ExclusiveItemEffectIsActiveWithLogging: ; 0x02314D40
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r6, r1
	ldrb r1, [sp, #0x20]
	mov r7, r0
	mov r0, r6
	mov r5, r2
	mov r4, r3
	bl ExclusiveItemEffectIsActive__023147EC
	cmp r0, #0
	beq _02314DB8
	cmp r5, #0
	beq _02314DB0
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r1, [sp, #0x20]
	add r2, sp, #0
	mov r0, r6
	bl GetExclusiveItemWithEffectFromBag
	add r1, sp, #0
	mov r0, #1
	bl ov29_02344B44
	mov r0, r7
	mov r1, r6
	mov r2, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02314DB0:
	mov r0, #1
	b _02314DBC
_02314DB8:
	mov r0, #0
_02314DBC:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ExclusiveItemEffectIsActiveWithLogging

	arm_func_start ov29_02314DC4
ov29_02314DC4: ; 0x02314DC4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	mov r0, #0
	mov r5, r2
	mov r2, r0
	mov r6, r1
	mov r4, r3
	bl SubstitutePlaceholderStringTags
	add r2, sp, #0
	mov r0, r6
	mov r1, r4
	bl GetExclusiveItemWithEffectFromBag
	add r1, sp, #0
	mov r0, #1
	bl ov29_02344B44
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_02314DC4

	arm_func_start TryActivateQuickFeet
TryActivateQuickFeet: ; 0x02314E1C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, #0x6d
	bl AbilityIsActiveVeneer
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r3, #0
	mov r0, r5
	mov r1, r4
	mov r2, #1
	str r3, [sp]
	bl BoostSpeed
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end TryActivateQuickFeet

	arm_func_start TryInflictTerrifiedStatus
TryInflictTerrifiedStatus: ; 0x02314E60
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02314EB0 ; =ov10_022C4618
	mov r4, r1
	ldr ip, [r4, #0xb4]
	mov r3, #1
	mov r5, r0
	ldrsh r1, [r2]
#ifdef JAPAN
	strb r3, [ip, #0x103]
	mov r0, r4
	strb r1, [ip, #0x104]
#else
	strb r3, [ip, #0x104]
	mov r0, r4
	strb r1, [ip, #0x105]
#endif
	bl ov29_022E60E4
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02314EB4 ; =0x00000DE5
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02314EB0: .word ov10_022C4618
#ifdef JAPAN
_02314EB4: .word 0x00000B25
#else
_02314EB4: .word 0x00000DE5
#endif
	arm_func_end TryInflictTerrifiedStatus

	arm_func_start TryInflictGrudgeStatus
TryInflictGrudgeStatus: ; 0x02314EB8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	ldr r5, [r7, #0xb4]
	mov r8, r0
	mov r4, #0
	mov r6, r2
	mov r2, r4
	mov r0, #1
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r5, #0xfd]
	cmp r0, #0
	beq _02314F04
	cmp r6, #0
	beq _02314F2C
	ldr r2, _02314F34 ; =0x00000ED1
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314F2C
_02314F04:
	mov r4, #1
	mov r0, r7
	strb r4, [r5, #0xfd]
	bl UpdateStatusIconFlags
	cmp r6, #0
	beq _02314F2C
#ifdef JAPAN
	ldr r2, _0231640C ; =0x00000C12
	mov r0, r8
	mov r1, r7
#else
	mov r0, r8
	mov r1, r7
	mov r2, #0xed0
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_02314F2C:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_02314F34: .word 0x00000C13
_0231640C: .word 0x00000C12
#else
_02314F34: .word 0x00000ED1
#endif
	arm_func_end TryInflictGrudgeStatus

	arm_func_start TryInflictConfusedStatus
TryInflictConfusedStatus: ; 0x02314F38
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r5, r2
	mov r4, r3
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	mov r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, r6
	mov r1, #0x19
	bl ItemIsActive__0231513C
	cmp r0, #0
	beq _02314FD8
	cmp r5, #0
	beq _02314FD0
	ldr r2, _02315100 ; =0x00000DAF
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02314FD0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02314FD8:
	mov ip, #2
	ldr r3, _02315104 ; =0x00000DBA
	mov r0, r7
	mov r1, r6
	mov r2, r5
	str ip, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r7, r6
	beq _02315048
	cmp r7, #0
	moveq r0, #0
	beq _02315028
	ldr r0, [r7]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
_02315028:
	cmp r0, #0
	beq _02315048
	mov r0, r7
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _02315054
_02315048:
	mov r0, r6
	mov r1, #0x40
	bl AbilityIsActiveVeneer
_02315054:
	cmp r0, #0
	beq _0231507C
	cmp r5, #0
	beq _02315074
	ldr r2, _02315108 ; =0x00000DA7
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02315074:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0231507C:
	cmp r4, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl ov29_022E41CC
	ldr r4, [r6, #0xb4]
	ldrb r0, [r4, #0xd0]
	cmp r0, #2
	beq _023150E0
	ldr r1, _0231510C ; =ov10_022C4890
	mov r3, #2
	mov r0, r6
	mov r2, #1
	strb r3, [r4, #0xd0]
	bl CalcStatusDuration
	add r3, r0, #1
	ldr r2, _02315110 ; =0x00000CFE
	mov r0, r7
	mov r1, r6
	strb r3, [r4, #0xd1]
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	b _023150F0
_023150E0:
	ldr r2, _02315114 ; =0x00000CFF
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_023150F0:
	mov r0, r6
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_CONFUSED_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_CONFUSED_STATUS_OFFSET 0
#endif
_02315100: .word 0x00000DAF + TRY_INFLICT_CONFUSED_STATUS_OFFSET
_02315104: .word 0x00000DBA + TRY_INFLICT_CONFUSED_STATUS_OFFSET
_02315108: .word 0x00000DA7 + TRY_INFLICT_CONFUSED_STATUS_OFFSET
_0231510C: .word ov10_022C4890
_02315110: .word 0x00000CFE + TRY_INFLICT_CONFUSED_STATUS_OFFSET
_02315114: .word 0x00000CFF + TRY_INFLICT_CONFUSED_STATUS_OFFSET
	arm_func_end TryInflictConfusedStatus
