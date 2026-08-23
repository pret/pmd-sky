	.include "asm/macros.inc"
	.include "overlay_29_022F0654.inc"

	.text

	arm_func_start MakeTargetFaceUserAndIdle
MakeTargetFaceUserAndIdle: ; 0x022F0654
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #4
	add r1, r1, #4
	bl GetDirectionTowardsPosition
	mov r1, r0
	mov r0, r4
	and r1, r1, #0xff
	bl MakeMonsterIdleInDirection2
	ldmia sp!, {r4, pc}
	arm_func_end MakeTargetFaceUserAndIdle

	arm_func_start ov29_022F067C
ov29_022F067C: ; 0x022F067C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x24
	mov r7, r0
	mov r6, r2
	cmp r1, #0
	bne _022F06F4
	mov r5, #0
	ldr r8, _022F077C ; =DUNGEON_PTR
	mov r4, r5
	add sb, sp, #0x10
_022F06A4:
	ldr r0, [r8]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sl, [r0, #0xa84]
#else
	ldr sl, [r0, #0xb28]
#endif
	mov r0, sl
	bl EntityIsValid__022F0590
	cmp r0, #0
	strne sl, [sb, r5, lsl #2]
	add r4, r4, #1
	addne r5, r5, #1
	cmp r4, #4
	blt _022F06A4
	cmp r5, #4
	addlt r0, sp, #0x10
	movlt r1, #0
	strlt r1, [r0, r5, lsl #2]
	blt _022F0700
	moveq r0, #0
	streq r0, [sp, #0x20]
	b _022F0700
_022F06F4:
	mov r0, #0
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
_022F0700:
	mov r2, #0
	mov r4, #1
	strb r4, [sp, #8]
	strh r2, [sp, #0xa]
	strh r6, [sp, #0xc]
	strb r4, [sp, #0xe]
	strb r2, [sp, #0xf]
	add r1, sp, #8
	add r3, sp, #0x10
	mov r0, r7
	stmia sp, {r2, r4}
	bl ov29_02322DDC
	mov r0, r4
	bl AnimationDelayOrSomething
	mov r3, #0
	add r0, sp, #0x10
	add r2, sp, #8
	mov r1, r7
	str r3, [sp]
	bl ExecuteMoveEffect
	bl ov29_022E81F8
	mov r0, #0xa
	bl WaitUntilAlertBoxPauseIsOver
	mov r0, #0
	bl ov29_0234B1A4
	bl GetLeader
	mov r1, r4
	mov r2, r1
	bl TryPointCameraToMonster
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022F077C: .word DUNGEON_PTR
	arm_func_end ov29_022F067C

	arm_func_start ov29_022F0780
ov29_022F0780: ; 0x022F0780
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	bl ov29_0234D668
	bl GetMessageLogPreprocessorArgs
	mov r2, #0
	mov r1, r0
	mov ip, #1
	mov r0, r4
	mov r3, r2
	str ip, [sp]
	bl ov29_0234D690
	bl ov29_0234D650
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov29_022F0780

	arm_func_start SubtractMoneyCarriedWithSfx
SubtractMoneyCarriedWithSfx: ; 0x022F07BC
	stmdb sp!, {r3, lr}
	rsb r0, r0, #0
	bl AddMoneyCarried
	ldr r0, _022F07D4 ; =0x00001308
	bl PlaySeByIdVolumeWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F07D4: .word 0x00001308
	arm_func_end SubtractMoneyCarriedWithSfx

	arm_func_start ov29_022F07D8
ov29_022F07D8: ; 0x022F07D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _022F0844 ; =DUNGEON_PTR
	mov r4, r0
	mov r6, #0
_022F07E8:
	ldr r0, [r5]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xad4]
#else
	ldr r7, [r0, #0xb78]
#endif
	mov r0, r7
	bl EntityIsValid__022F0590
	cmp r0, #0
	beq _022F082C
	mov r0, r7
	bl IsSecretBazaarNpc
	cmp r0, #0
	beq _022F082C
	mov r0, r7
	mov r1, r4
	bl MakeMonsterIdleInDirection2
	mov r0, r7
	bl UpdateAiTargetPos
_022F082C:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x14
	blt _022F07E8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F0844: .word DUNGEON_PTR
	arm_func_end ov29_022F07D8

	arm_func_start ReopenMinimap
ReopenMinimap: ; 0x022F0848
	ldr ip, _022F0858 ; =UnkMapRelatedFunc
	mov r0, #0
	mov r1, r0
	bx ip
	.align 2, 0
_022F0858: .word UnkMapRelatedFunc
	arm_func_end ReopenMinimap

	arm_func_start GonePebbleGradualPaletteShift
GonePebbleGradualPaletteShift: ; 0x022F085C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r8, r1
	mov r1, #1
	mov r1, r1, lsl r8
	str r1, [sp, #4]
	mov r1, r1, lsl #8
	mov fp, r0
	mov r0, #0x100
	str r1, [sp]
	bl sub_02001AB0
	ldr r1, _022F0980 ; =DUNGEON_PTR
	mov r0, #0x400
	ldr r2, [r1]
	mov r1, #0
	add r5, r2, #0x1e0
	bl MemAlloc
	mov r6, r0
	mov r4, #0
_022F08A8:
	add r3, r5, r4, lsl #2
	add r2, r6, r4, lsl #2
	mov r1, #4
_022F08B4:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022F08B4
	add r4, r4, #1
	cmp r4, #0x100
	blt _022F08A8
	mov r4, #0
	b _022F0964
_022F08D8:
	mov r0, #0x25
	mov r7, r4, lsl #8
	bl AdvanceFrame
	ldr r0, [sp]
	mov sl, #0
	sub sb, r0, r4, lsl #8
_022F08F0:
	add r1, r6, sl, lsl #2
	ldrb r0, [r6, sl, lsl #2]
	ldrb r3, [r1, #1]
	ldrb r2, [r1, #2]
	mul r0, sb, r0
	add r1, fp, sl, lsl #2
	mul ip, sb, r3
	mul r2, sb, r2
	ldrb lr, [r1, #1]
	ldrb r3, [r1, #2]
	ldrb r1, [fp, sl, lsl #2]
	mla ip, r7, lr, ip
	mla r2, r7, r3, r2
	mla r0, r7, r1, r0
	mov r0, r0, asr #8
	mov r0, r0, asr r8
	mov r3, ip, asr #8
	mov r1, r2, asr #8
	mov r3, r3, asr r8
	strb r0, [r5, sl, lsl #2]
	add r2, r5, sl, lsl #2
	add sl, sl, #1
	strb r3, [r2, #1]
	mov r0, r1, asr r8
	strb r0, [r2, #2]
	cmp sl, #0x100
	blt _022F08F0
	bl ov29_022DE608
	add r4, r4, #1
_022F0964:
	ldr r0, [sp, #4]
	cmp r4, r0
	blt _022F08D8
	mov r0, r6
	bl MemFree
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F0980: .word DUNGEON_PTR
	arm_func_end GonePebbleGradualPaletteShift

	arm_func_start TalkToSecretBazaarNpc
TalkToSecretBazaarNpc: ; 0x022F0984
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x1c
	mov r6, r1
	ldr r4, [r6, #0xb4]
	mov r7, r0
	ldrsh r1, [r4, #2]
	add r0, sp, #0xc
	mov r5, r3
	bl InitPortraitDungeon
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _022F09E0
	mov r0, r6
	bl CheckMonsterTeamMemberIdx
	cmp r0, #0
	bne _022F09E0
	mov r1, r6
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldrsh r0, [r4, #0xc]
	bl SetMessageLogPreprocessorArgsSpeakerId0x30000
	b _022F09F4
_022F09E0:
	ldrsh r1, [r4, #2]
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldrsh r0, [r4, #2]
	bl SetMessageLogPreprocessorArgsSpeakerId
_022F09F4:
	cmp r5, #0
	beq _022F0A6C
	mov r1, #1
	add r0, sp, #4
	mov r2, r5
	mov r3, r1
	str r1, [sp]
	bl ov29_0234D860
	ldrb r0, [sp, #0x30]
	cmp r0, #0
	beq _022F0A28
	ldr r0, _022F0AA0 ; =ov29_022F0AA4
	bl ov29_0234D878
_022F0A28:
	add r0, sp, #0xc
	bl ov29_0234D65C
	bl GetMessageLogPreprocessorArgs
	mov r1, r0
	mov ip, #0
	add r2, sp, #4
	mov r0, r7
	mov r3, #1
	str ip, [sp]
	bl ov29_0234D690
	bl ov29_0234D650
	bl ov29_0234D88C
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _022F0A98
_022F0A6C:
	add r0, sp, #0xc
	bl ov29_0234D65C
	bl GetMessageLogPreprocessorArgs
	mov r1, r0
	mov r3, #1
	mov r0, r7
	mov r2, #0
	str r3, [sp]
	bl ov29_0234D690
	bl ov29_0234D650
	mov r0, #1
_022F0A98:
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_022F0AA0: .word ov29_022F0AA4
	arm_func_end TalkToSecretBazaarNpc

	arm_func_start ov29_022F0AA4
ov29_022F0AA4: ; 0x022F0AA4
	stmdb sp!, {r3, lr}
	ldr r1, _022F0AD4 ; =ov29_023535A4
	mvn r0, #1
	ldrsb r1, [r1]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	ldr r0, _022F0AD8 ; =ov29_023526A8
	ldr r1, _022F0ADC ; =ov29_022F0B10
	bl CreateTextBox
	ldr r1, _022F0AD4 ; =ov29_023535A4
	strb r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F0AD4: .word ov29_023535A4
_022F0AD8: .word ov29_023526A8
_022F0ADC: .word ov29_022F0B10
	arm_func_end ov29_022F0AA4

	arm_func_start ov29_022F0AE0
ov29_022F0AE0: ; 0x022F0AE0
	stmdb sp!, {r3, lr}
	ldr r0, _022F0B0C ; =ov29_023535A4
	mvn r1, #1
	ldrsb r0, [r0]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl CloseTextBox
	ldr r0, _022F0B0C ; =ov29_023535A4
	mvn r1, #1
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F0B0C: .word ov29_023535A4
	arm_func_end ov29_022F0AE0

	arm_func_start ov29_022F0B10
ov29_022F0B10: ; 0x022F0B10
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xd4
	mov r4, r0
	bl sub_02027B1C
	add r0, sp, #4
	bl InitPreprocessorArgs
	bl GetMoneyCarried
	str r0, [sp, #0x28]
	add r1, sp, #4
	str r1, [sp]
	ldr r2, _022F0B84 ; =ov29_023526B8
	add r0, sp, #0x54
	mov r1, #0x80
	mov r3, #0x400
	bl PreprocessString
	mov r1, #4
#ifdef JAPAN
	mov r0, r4
	mov r2, r1
	rsb r3, r1, #0x430
#else
	ldr r3, _022F0B88 ; =0x00000225
	mov r0, r4
	mov r2, r1
#endif
	bl AppendStandardStringToMission
	mov r0, r4
	mov r1, #0xa
	mov r2, #0x14
	add r3, sp, #0x54
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0xd4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022F0B84: .word ov29_023526B8
#ifndef JAPAN
_022F0B88: .word 0x00000225
#endif
	arm_func_end ov29_022F0B10

	arm_func_start GetLeaderAction
GetLeaderAction: ; 0x022F0B8C
	stmdb sp!, {r3, lr}
	bl GetLeaderMonster
	add r0, r0, #0x4a
	ldmia sp!, {r3, pc}
	arm_func_end GetLeaderAction

	arm_func_start GetLeaderActionId
GetLeaderActionId: ; 0x022F0B9C
	stmdb sp!, {r3, lr}
	bl GetLeaderMonster
	ldrh r0, [r0, #0x4a]
	ldmia sp!, {r3, pc}
	arm_func_end GetLeaderActionId

	arm_func_start GetEntityTouchscreenArea
GetEntityTouchscreenArea: ; 0x022F0BAC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r3, r0
	mov r6, r1
	add r0, sp, #0
	add r1, r3, #0x2c
	mov r2, #3
	ldrsh r4, [r3, #0x48]
	ldrsh r5, [r3, #0x4a]
	bl GetPixelOffsetFromSprite
	ldrsh r0, [sp]
	add r0, r4, r0
	sub r0, r0, #0xc
	str r0, [r6, #8]
	ldrsh r0, [sp, #2]
	add r0, r5, r0
	sub r0, r0, #0xc
	str r0, [r6]
	ldrsh r0, [sp]
	add r0, r4, r0
	add r0, r0, #0xc
	str r0, [r6, #0xc]
	ldrsh r0, [sp, #2]
	add r0, r5, r0
	add r0, r0, #0xc
	str r0, [r6, #4]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end GetEntityTouchscreenArea

	arm_func_start ov29_022F0C1C
ov29_022F0C1C: ; 0x022F0C1C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, [r0, #0xb4]
	mov r2, #0
	bl ov29_022F3B98
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022F0C1C

	arm_func_start ov29_022F0C3C
ov29_022F0C3C: ; 0x022F0C3C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	movs r4, r0
	moveq r0, #0
	beq _022F0C90
	cmp r1, #0
	beq _022F0C74
	add r3, sp, #0
	mov r2, #4
_022F0C60:
	ldrh r0, [r1], #2
	subs r2, r2, #1
	strh r0, [r3], #2
	bne _022F0C60
	b _022F0C80
_022F0C74:
	add r0, sp, #0
	mov r1, #0x160
	bl InitMove
_022F0C80:
	ldr r1, [r4, #0xb4]
	add r2, sp, #0
	mov r0, r4
	bl ov29_022F3B98
_022F0C90:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022F0C3C

	arm_func_start ov29_022F0C98
ov29_022F0C98: ; 0x022F0C98
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl GetTopScreenOption
	mov r7, r0
	mov r0, #4
	mov r1, #0x2f
	mov r8, #0
	bl ov29_022EA370
	mov r0, r8
	mov r1, r0
	bl ov29_022E0DD8
	mov r0, #2
	mov r1, r8
	bl ov29_022E0DD8
	mov r0, #3
	mov r1, r8
	bl ov29_022E0DD8
	mov r0, #4
	mov r1, r8
	bl ov29_022E0DD8
	ldr r1, _022F0EC8 ; =DUNGEON_PTR
	ldr r2, _022F0ECC ; =ov29_0237CFBB
	ldr r1, [r1]
	mov r0, #1
	strb r0, [r2]
	add r1, r1, #0x1a000
#ifdef JAPAN
	strb r0, [r1, #0x1a5]
#else
	strb r0, [r1, #0x249]
#endif
	bl ov29_0234B1A4
	mov r0, #1
	bl ov29_02338F58
	cmp sl, #0
	bne _022F0D24
	bl GetBottomScreenOption
	cmp r0, #0
	bne _022F0D44
_022F0D24:
	mov r0, #0
	mov r1, r0
	bl ov29_02339D7C
	cmp sl, #0
	beq _022F0D44
	mov r0, #0xc
	mov r1, #0
	bl UnkMapRelatedFunc
_022F0D44:
	bl ov29_023391C0
	mov sb, r0
	mov r0, #0
	mov r1, r0
	bl ov29_02339190
	bl UpdateMinimap
	mov r0, #4
	mov r1, #0x2f
	bl ov29_022EA370
	ldr r4, _022F0ED0 ; =ov29_0237C6A4
	ldr r5, _022F0ECC ; =ov29_0237CFBB
	ldr r6, _022F0ED4 ; =DUNGEON_BUTTON_INPUT
	mov fp, #0x2f
_022F0D78:
	mov r0, fp
	bl AdvanceFrame
	ldrh r3, [r6, #2]
	tst r3, #6
	beq _022F0D98
	ldr r0, _022F0ED8 ; =0x00003F03
	bl PlaySeByIdVolumeWrapper
	b _022F0E30
_022F0D98:
	ldrb r0, [r5]
	cmp r0, #0
	bne _022F0DDC
	ldrh r2, [r4]
	mov r1, #0
	tst r2, #0x40
	beq _022F0DBC
	tst r2, #2
	movne r1, #1
_022F0DBC:
	cmp r1, #0
	movne r8, #1
	cmp r8, #0
	beq _022F0DE0
	tst r2, #4
	beq _022F0DE0
	bl ov29_022E0C4C
	b _022F0E30
_022F0DDC:
	mov r8, #0
_022F0DE0:
	tst r3, #1
	bne _022F0E18
	tst r3, #0x400
	bne _022F0E18
	cmp r0, #0
	beq _022F0D78
	ldrh r1, [r4]
	mov r2, #0
	tst r1, #0x40
	beq _022F0E10
	tst r1, #2
	movne r2, #1
_022F0E10:
	cmp r2, #0
	beq _022F0D78
_022F0E18:
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [r5]
	bl UpdateMinimap
	b _022F0D78
_022F0E30:
	cmp sl, #0
	bne _022F0E44
	bl GetBottomScreenOption
	cmp r0, #0
	bne _022F0E64
_022F0E44:
	mov r0, #0
	mov r1, r0
	bl ov29_0233A0E8
	cmp sl, #0
	beq _022F0E64
	mov r0, #0xb
	mov r1, #0
	bl UnkMapRelatedFunc
_022F0E64:
	mov r0, sb
	mov r1, #0
	bl ov29_02339190
	mov r0, #0
	bl ov29_02338F58
	ldr r1, _022F0EC8 ; =DUNGEON_PTR
	mov r0, r7
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0x1a000
#ifdef JAPAN
	strb r2, [r1, #0x1a5]
#else
	strb r2, [r1, #0x249]
#endif
	bl SetTopScreenOption
	ldr r0, _022F0ECC ; =ov29_0237CFBB
	mov r1, #1
	strb r1, [r0]
	bl UpdateMinimap
	mov r0, #0
	bl ov29_022E0DF0
	mov r0, #0x2f
	bl AdvanceFrame
	mov r0, #0x2f
	bl AdvanceFrame
	bl sub_02006B70
	bl ov29_022E0B44
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F0EC8: .word DUNGEON_PTR
_022F0ECC: .word ov29_0237CFBB
_022F0ED0: .word ov29_0237C6A4
_022F0ED4: .word DUNGEON_BUTTON_INPUT
_022F0ED8: .word 0x00003F03
	arm_func_end ov29_022F0C98
