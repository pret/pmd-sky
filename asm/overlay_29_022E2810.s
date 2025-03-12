	.include "asm/macros.inc"
	.include "overlay_29_022E2810.inc"

	.text

	arm_func_start CanTargetEntity
CanTargetEntity: ; 0x022E2810
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x20]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4]
	cmp r0, #1
	bne _022E28B8
	ldr r0, [r5]
	cmp r0, #1
	bne _022E28A4
	mov r0, r5
	bl CanSeeInvisibleMonsters
	cmp r0, #0
	ldreq r0, [r4, #0xb4]
	ldreqb r0, [r0, #0xef]
	cmpeq r0, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	beq _022E28B8
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022E28A4:
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_022E28B8:
	mov r0, r5
	bl HasDropeyeStatus
	mov r2, r0
	add r0, r5, #4
	add r1, r4, #4
	bl IsPositionInSight
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CanTargetEntity

	arm_func_start ov29_022E28D4
ov29_022E28D4: ; 0x022E28D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x20]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl HasDropeyeStatus
	mov r2, r0
	add r0, r5, #4
	add r1, r4, #4
	bl IsPositionActuallyInSight
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022E28D4

	arm_func_start ov29_022E2930
ov29_022E2930: ; 0x022E2930
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl HasDropeyeStatus
	mov r2, r0
	mov r1, r4
	add r0, r5, #4
	bl IsPositionActuallyInSight
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022E2930

	arm_func_start CanTargetPosition
CanTargetPosition: ; 0x022E2954
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl HasDropeyeStatus
	mov r2, r0
	mov r1, r4
	add r0, r5, #4
	bl IsPositionInSight
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CanTargetPosition

	arm_func_start PopulateActiveMonsterPtrs
PopulateActiveMonsterPtrs: ; 0x022E2978
#ifdef JAPAN
#define OV29_022E2978_OFFSET -0xA4
#else
#define OV29_022E2978_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	ldr r6, _022E2A34 ; =DUNGEON_PTR
	mov r4, r5
_022E2988:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + OV29_022E2978_OFFSET]
	mov r0, r7
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	ldrne r0, [r6]
	add r4, r4, #1
	addne r0, r0, r5, lsl #2
	addne r0, r0, #0x12000
	strne r7, [r0, #0xb78 + OV29_022E2978_OFFSET]
	addne r5, r5, #1
	cmp r4, #4
	blt _022E2988
	ldr r6, _022E2A34 ; =DUNGEON_PTR
	mov r4, #0
_022E29CC:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38 + OV29_022E2978_OFFSET]
	mov r0, r7
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	ldrne r0, [r6]
	add r4, r4, #1
	addne r0, r0, r5, lsl #2
	addne r0, r0, #0x12000
	strne r7, [r0, #0xb78 + OV29_022E2978_OFFSET]
	addne r5, r5, #1
	cmp r4, #0x10
	blt _022E29CC
	mov r2, #0
	ldr r1, _022E2A34 ; =DUNGEON_PTR
	b _022E2A28
_022E2A14:
	ldr r0, [r1]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	str r2, [r0, #0xb78 + OV29_022E2978_OFFSET]
	add r5, r5, #1
_022E2A28:
	cmp r5, #0x14
	blt _022E2A14
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E2A34: .word DUNGEON_PTR
	arm_func_end PopulateActiveMonsterPtrs

	arm_func_start GetTeamMemberIndex
GetTeamMemberIndex: ; 0x022E2A38
	ldr r1, _022E2A74 ; =DUNGEON_PTR
	mov r2, #0
	ldr r3, [r1]
	b _022E2A64
_022E2A48:
	add r1, r3, r2, lsl #2
	add r1, r1, #0x12000
#ifdef JAPAN
	ldr r1, [r1, #0xa84]
#else
	ldr r1, [r1, #0xb28]
#endif
	cmp r0, r1
	moveq r0, r2
	bxeq lr
	add r2, r2, #1
_022E2A64:
	cmp r2, #4
	blt _022E2A48
	mvn r0, #0
	bx lr
	.align 2, 0
_022E2A74: .word DUNGEON_PTR
	arm_func_end GetTeamMemberIndex

	arm_func_start ov29_022E2A78
ov29_022E2A78: ; 0x022E2A78
	stmdb sp!, {r4, lr}
	ldr r2, [r1]
	mov r4, r0
	cmp r2, #1
	beq _022E2AA0
	cmp r2, #2
	beq _022E2AAC
	cmp r2, #3
	ldmeqia sp!, {r4, pc}
	b _022E2ABC
_022E2AA0:
	ldr r1, [r1, #0xb4]
	bl GetMonsterName
	ldmia sp!, {r4, pc}
_022E2AAC:
	ldr r1, [r1, #0xb4]
	ldrb r1, [r1]
	bl ov29_022ED82C
	ldmia sp!, {r4, pc}
_022E2ABC:
	ldr r0, _022E2AD4 ; =0x00000A42
	bl StringFromId
	mov r1, r0
	mov r0, r4
	bl strcpy
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_022E2AD4: .word 0x00000B42
#else
_022E2AD4: .word 0x00000A42
#endif
	arm_func_end ov29_022E2A78

	arm_func_start SubstitutePlaceholderStringTags
SubstitutePlaceholderStringTags: ; 0x022E2AD8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r5, r2
	bl ov29_0234B034
	ldr r1, [r6]
	mov r4, r0
	cmp r1, #1
	beq _022E2B10
	cmp r1, #2
	beq _022E2B3C
	cmp r1, #3
	beq _022E2B2C
	b _022E2B50
_022E2B10:
	mov r1, #0
	str r1, [sp]
	ldr r2, [r6, #0xb4]
	mov r1, r7
	mov r3, r5
	bl ov29_0230040C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022E2B2C:
	ldr r2, [r6, #0xb4]
	mov r1, r7
	bl ov29_02344BA8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022E2B3C:
	ldr r2, [r6, #0xb4]
	mov r1, r7
	ldrb r2, [r2]
	bl ov29_022EDF7C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022E2B50:
	ldr r0, _022E2B64 ; =0x00000A42
	bl StringFromId
	add r1, r4, r7, lsl #2
	str r0, [r1, #0x38]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_022E2B64: .word 0x00000B42
#else
_022E2B64: .word 0x00000A42
#endif
	arm_func_end SubstitutePlaceholderStringTags

#ifdef EUROPE
	arm_func_start ov29_022E34A8_EU
ov29_022E34A8_EU: ; 0x022E34A8
	stmdb sp!, {r3, lr}
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	beq _022E34DC
	ldr r0, _022E34E8 ; =0x02354138
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _022E34DC
	bl GetForcedLossReason
	cmp r0, #1
	movne r0, #1
	bne _022E34E0
_022E34DC:
	mov r0, #0
_022E34E0:
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E34E8: .word 0x02354138
	arm_func_end ov29_022E34A8_EU
#endif

	arm_func_start ov29_022E2B68
ov29_022E2B68: ; 0x022E2B68
#ifdef JAPAN
#define OV29_022E2B68_OFFSET -0xA4
#else
#define OV29_022E2B68_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _022E2C5C ; =DUNGEON_PTR
	movs r5, r0
	ldr r2, [r1]
	mov r1, #0
	add r0, r2, #0x21c + OV29_022E2B68_OFFSET
	add r4, r0, #0x1a000
	strh r1, [r4, #8]
	ldr r0, _022E2C60 ; =0x0001A21C
	strh r1, [r4, #0xa]
	strh r1, [r2, r0]
	strh r1, [r4, #2]
	strh r1, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r1, [r4, #4]
	strh r1, [r4, #6]
	str r1, [r4, #0x14]
	strb r1, [r4, #0x2f]
	mov r0, #1
	strb r0, [r4, #0x30]
	strb r0, [r4, #0x31]
	str r1, [r4, #0x18]
	str r1, [r4, #0x1c]
	bne _022E2BF4
	strb r1, [r4, #0x22]
	strb r1, [r4, #0x29]
	strb r1, [r4, #0x28]
	strb r1, [r4, #0x26]
	strb r1, [r4, #0x2a]
	strb r1, [r4, #0x27]
	strb r1, [r4, #0x23]
	strb r1, [r4, #0x24]
	strb r1, [r4, #0x32]
	strb r1, [r4, #0x33]
	strb r1, [r4, #0x34]
_022E2BF4:
	mov r1, #0
	str r1, [r4, #0x10]
	mov r0, #3
	strb r0, [r4, #0x20]
	strb r1, [r4, #0x35]
	strb r1, [r4, #0x2b]
	strb r1, [r4, #0x36]
	strb r1, [r4, #0x37]
	strb r1, [r4, #0x2d]
	mov r0, #1
	strb r0, [r4, #0x2e]
	bl ov29_022E2C6C
	ldr r1, _022E2C64 ; =0x0000FFFF
	ldr r0, _022E2C68 ; =ov29_0237C84C
	cmp r5, #0
	str r1, [r0]
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _022E2C5C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x28000
	ldrb r0, [r0, #0x6c8 + OV29_022E2B68_OFFSET]
	ands r0, r0, #3
	strb r0, [r4, #0x21]
	moveq r0, #1
	streqb r0, [r4, #0x24]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E2C5C: .word DUNGEON_PTR
_022E2C60: .word 0x0001A21C + OV29_022E2B68_OFFSET
_022E2C64: .word 0x0000FFFF
_022E2C68: .word ov29_0237C84C
	arm_func_end ov29_022E2B68

	arm_func_start ov29_022E2C6C
ov29_022E2C6C: ; 0x022E2C6C
	ldr r0, _022E2C9C ; =DUNGEON_PTR
	mvn r1, #0
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x178
#else
	add r0, r0, #0x21c
#endif
	add r0, r0, #0x1a000
	strh r1, [r0, #0x3c]
	strh r1, [r0, #0x3e]
	strh r1, [r0, #0x40]
	strh r1, [r0, #0x42]
	strh r1, [r0, #0x38]
	strh r1, [r0, #0x3a]
	bx lr
	.align 2, 0
_022E2C9C: .word DUNGEON_PTR
	arm_func_end ov29_022E2C6C

	arm_func_start ov29_022E2CA0
ov29_022E2CA0: ; 0x022E2CA0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _022E2D34 ; =DUNGEON_PTR
	mov r4, r0
	ldr r3, [r1]
	ldr r0, _022E2D38 ; =0x0001A21C
	ldrsh r1, [r4]
	ldrsh r2, [r3, r0]
#ifdef JAPAN
	add r0, r3, #0x178
#else
	add r0, r3, #0x21c
#endif
	add r5, r0, #0x1a000
	sub r0, r2, r1
	ldr r6, [r5, #0x10]
	bl abs
	cmp r0, #6
	bgt _022E2D2C
	ldrsh r1, [r5, #2]
	ldrsh r0, [r4, #2]
	sub r0, r1, r0
	bl abs
	cmp r0, #5
	bgt _022E2D2C
	mov r0, r5
	bl ov29_022E3534
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	cmp r6, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl HasDropeyeStatus
	mov r2, r0
	mov r0, r5
	mov r1, r4
	bl IsPositionActuallyInSight
	ldmia sp!, {r4, r5, r6, pc}
_022E2D2C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E2D34: .word DUNGEON_PTR
#ifdef JAPAN
_022E2D38: .word 0x0001A178
#else
_022E2D38: .word 0x0001A21C
#endif
	arm_func_end ov29_022E2CA0

	arm_func_start ov29_022E2D3C
ov29_022E2D3C: ; 0x022E2D3C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _022E2DD0 ; =DUNGEON_PTR
	mov r4, r0
	ldr r3, [r1]
	ldr r0, _022E2DD4 ; =0x0001A21C
	ldrsh r1, [r4]
	ldrsh r2, [r3, r0]
#ifdef JAPAN
	add r0, r3, #0x178
#else
	add r0, r3, #0x21c
#endif
	add r5, r0, #0x1a000
	sub r0, r2, r1
	ldr r6, [r5, #0x10]
	bl abs
	cmp r0, #6
	bgt _022E2DC8
	ldrsh r1, [r5, #2]
	ldrsh r0, [r4, #2]
	sub r0, r1, r0
	bl abs
	cmp r0, #6
	bgt _022E2DC8
	mov r0, r5
	bl ov29_022E3534
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	cmp r6, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl HasDropeyeStatus
	mov r2, r0
	mov r0, r5
	mov r1, r4
	bl IsPositionActuallyInSight
	ldmia sp!, {r4, r5, r6, pc}
_022E2DC8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E2DD0: .word DUNGEON_PTR
#ifdef JAPAN
_022E2DD4: .word 0x0001A178
#else
_022E2DD4: .word 0x0001A21C
#endif
	arm_func_end ov29_022E2D3C

#ifndef JAPAN
	arm_func_start UpdateMapSurveyorFlag
UpdateMapSurveyorFlag: ; 0x022E2DD8
#ifdef EUROPE
	stmdb sp!, {r4, lr}
	ldr r1, _022E2DF8 ; =DUNGEON_PTR
	mov r0, #0x41
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r4, [r1, #0x241]
	bl TeamMemberHasEnabledIqSkill
	ldr r2, _022E2DF8 ; =DUNGEON_PTR
	ldr r1, [r2]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x241]
	ldr r0, [r2]
	add r0, r0, #0x1a000
	ldrb r0, [r0, #0x241]
	cmp r4, r0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
#else
	stmdb sp!, {r3, lr}
	mov r0, #0x41
	bl TeamMemberHasEnabledIqSkill
	ldr r1, _022E2DF8 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x241]
	ldmia sp!, {r3, pc}
#endif
	.align 2, 0
_022E2DF8: .word DUNGEON_PTR
	arm_func_end UpdateMapSurveyorFlag
#endif

	arm_func_start ov29_022E2DFC
ov29_022E2DFC: ; 0x022E2DFC
	stmdb sp!, {r3, lr}
	ldr r1, _022E2E50 ; =DUNGEON_PTR
	cmp r0, #0
	ldr r1, [r1]
#ifdef JAPAN
	add r1, r1, #0x178
#else
	add r1, r1, #0x21c
#endif
	add r1, r1, #0x1a000
	str r0, [r1, #0x10]
	moveq r0, #0
	streqb r0, [r1, #0x2f]
	beq _022E2E40
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #7]
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r1, #0x2f]
	movne r0, #1
	strneb r0, [r1, #0x2f]
_022E2E40:
	mov r0, #0
	bl UpdateCamera
	bl ov29_022E2C6C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E2E50: .word DUNGEON_PTR
	arm_func_end ov29_022E2DFC

	arm_func_start PointCameraToMonster
PointCameraToMonster: ; 0x022E2E54
	stmdb sp!, {r4, lr}
	ldr r2, _022E2EC0 ; =DUNGEON_PTR
	mov r4, r1
	ldr r1, [r2]
	cmp r0, #0
#ifdef JAPAN
	add r1, r1, #0x178
#else
	add r1, r1, #0x21c
#endif
	add r2, r1, #0x1a000
	moveq r1, #0
	streqb r1, [r2, #0x2f]
	beq _022E2E98
	ldr r1, [r0, #0xb4]
	ldrb r1, [r1, #7]
	cmp r1, #0
	moveq r1, #0
	streqb r1, [r2, #0x2f]
	movne r1, #1
	strneb r1, [r2, #0x2f]
_022E2E98:
	str r0, [r2, #0x10]
	mov r0, #0
	bl UpdateCamera
	bl ov29_022E2C6C
	bl ov29_02304954
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	bl UpdateTrapsVisibility
	bl UpdateMinimap
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E2EC0: .word DUNGEON_PTR
	arm_func_end PointCameraToMonster

	arm_func_start UpdateCamera
UpdateCamera: ; 0x022E2EC4
#ifdef JAPAN
#define UPDATE_CAMERA_OFFSET -0xA4
#else
#define UPDATE_CAMERA_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r1, _022E32DC ; =DUNGEON_PTR
	str r0, [sp]
	ldr r0, [r1]
	cmp r0, #0
	beq _022E32D4
	add r0, r0, #0x21c + UPDATE_CAMERA_OFFSET
	add r4, r0, #0x1a000
	ldr r5, [r4, #0x10]
	cmp r5, #0
	beq _022E32D0
	mov r0, r5
	bl EntityIsValid__022E32E8
	cmp r0, #0
	beq _022E32D0
	ldrb r8, [r4, #0x32]
	ldrb sb, [r4, #0x33]
	ldrh r0, [r4, #8]
	ldr sl, [r5, #0xb4]
	mov r6, #0
	strh r0, [r4, #0xc]
	ldrh r2, [r4, #0xa]
	mov r0, r5
	mov r1, #0x18
	strh r2, [r4, #0xe]
	ldrh r2, [r4]
	mov fp, r6
	mov r7, r6
	strh r2, [r4, #4]
	ldrh r2, [r4, #2]
	str r6, [sp, #4]
	strh r2, [r4, #6]
	ldrsh r2, [r5, #4]
	strh r2, [r4]
	ldrsh r2, [r5, #6]
	strh r2, [r4, #2]
	ldr r2, [r5, #0xc]
	mov r2, r2, asr #8
	sub r2, r2, #0x80
	strh r2, [r4, #8]
	ldr r2, [r5, #0x10]
	mov r2, r2, asr #8
	sub r2, r2, #0x6c
	strh r2, [r4, #0xa]
	ldrb r2, [r4, #0x27]
	str r2, [sp, #0xc]
	ldrb r2, [r4, #0x26]
	str r2, [sp, #8]
	bl ItemIsActive__022E330C
	cmp r0, #0
	ldrneb r0, [sl, #7]
	mov r1, #0
	cmpne r0, #0
	movne r0, #1
	strneb r0, [r4, #0x26]
	strneb r0, [r4, #0x27]
	ldreqb r0, [sl, #0xf9]
	streqb r0, [r4, #0x26]
	ldreqb r0, [sl, #0xfa]
	streqb r0, [r4, #0x27]
	strb r1, [r4, #0x32]
	strb r1, [r4, #0x33]
	mov r0, r5
	mov r1, #0xe
	bl ItemIsActive__022E330C
	cmp r0, #0
	ldrneb r0, [sl, #7]
	cmpne r0, #0
	movne r0, #1
	strneb r0, [r4, #0x32]
	strneb r0, [r4, #0x33]
	ldrb r1, [r4, #0x27]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	ldreqb r0, [r4, #0x32]
	ldrb r1, [r4, #0x26]
	cmpeq r8, r0
	ldr r0, [sp, #8]
	movne r6, #1
	cmp r0, r1
	ldreqb r0, [r4, #0x33]
	cmpeq sb, r0
	ldrb r0, [sl, #0xfb]
	movne fp, #1
	strb r0, [r4, #0x2a]
	ldrb r0, [r4, #0x2d]
	ldrb r8, [r4, #0x22]
	cmp r0, #0
	bne _022E309C
	mov r0, r5
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	movne r0, #1
	movne r2, #0xe
	strneb r0, [r4, #0x22]
	moveq r2, #0
	ldr r0, _022E32E0 ; =ov29_0237C84C
	streqb r2, [r4, #0x22]
	ldr r1, [r0]
	cmp r1, r2
	beq _022E30A8
	str r2, [r0]
	cmp r2, #0xe
	mov r0, #2
	mov r1, #0
	bne _022E3088
	bl sub_02009194
	mov r0, #3
	mov r1, #0
	bl sub_02009194
	b _022E30A8
_022E3088:
	bl sub_020091B0
	mov r0, #3
	mov r1, #0
	bl sub_020091B0
	b _022E30A8
_022E309C:
	ldr r1, _022E32E4 ; =0x0000FFFF
	ldr r0, _022E32E0 ; =ov29_0237C84C
	str r1, [r0]
_022E30A8:
	ldrb r0, [r4, #0x22]
	ldrb r1, [r4, #0x29]
	cmp r8, r0
	ldrb r0, [sl, #0xf1]
	movne r7, #1
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	strb r0, [r4, #0x29]
	ldrb r0, [r4, #0x29]
	cmp r1, r0
	ldreq r0, _022E32DC ; =DUNGEON_PTR
	ldreq r0, [r0]
	addeq r0, r0, #0x2c000
	ldreqb r0, [r0, #0xb10 + UPDATE_CAMERA_OFFSET]
	cmpeq r0, #0
	beq _022E3108
	bl ov29_023047DC
	ldr r0, _022E32DC ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	mov r7, #1
	add r0, r0, #0x2c000
	strb r1, [r0, #0xb10 + UPDATE_CAMERA_OFFSET]
_022E3108:
	mov r0, r5
	ldrb r8, [r4, #0x28]
	bl CanSeeInvisibleMonsters
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	strb r0, [r4, #0x28]
	ldrb r0, [r4, #0x28]
	cmp r8, r0
	movne r7, #1
	strne r7, [sp, #4]
	ldrb r8, [r4, #0x34]
	mov r0, r5
	bl HasDropeyeStatus
	and r1, r0, #0xff
	cmp r8, r1
	strb r0, [r4, #0x34]
	movne r7, #1
	strne r7, [sp, #4]
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _022E3168
	bl UpdateTrapsVisibility
	bl UpdateMinimap
_022E3168:
	cmp r7, #0
	beq _022E3178
	mov r0, #0
	bl ov29_022E3A58
_022E3178:
	ldr r0, [sp]
	cmp r0, #0
	beq _022E3228
	ldrb r0, [r4, #0x2c]
	cmp r0, #0
	bne _022E3228
	ldrsh r5, [r4, #8]
	ldrsh r7, [r4, #0xc]
	sub r0, r7, r5
	bl abs
	cmp r0, #8
	bge _022E31C0
	ldrsh r1, [r4, #0xe]
	ldrsh r0, [r4, #0xa]
	sub r0, r1, r0
	bl abs
	cmp r0, #8
	blt _022E31D0
_022E31C0:
	bl UpdateTrapsVisibility
	mov r0, #1
	strb r0, [r4, #0x2c]
	b _022E3228
_022E31D0:
	cmp r7, r5
	bge _022E31E8
	mov r0, #0xff
	mov r1, #0
	bl ov29_0233711C
	b _022E31F8
_022E31E8:
	ble _022E31F8
	mov r0, #0
	mov r1, r0
	bl ov29_0233711C
_022E31F8:
	ldrsh r1, [r4, #0xa]
	ldrsh r0, [r4, #0xe]
	cmp r0, r1
	bge _022E3218
	mov r0, #0
	mov r1, #0xc0
	bl ov29_023372A4
	b _022E3228
_022E3218:
	ble _022E3228
	mov r0, #0
	mov r1, r0
	bl ov29_023372A4
_022E3228:
	cmp fp, #0
	ldreqsh r1, [r4]
	ldreqsh r0, [r4, #4]
	cmpeq r1, r0
	ldreqsh r1, [r4, #2]
	ldreqsh r0, [r4, #6]
	cmpeq r1, r0
	beq _022E3288
	ldr r4, _022E32DC ; =DUNGEON_PTR
	mov r5, #0
_022E3250:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb78 + UPDATE_CAMERA_OFFSET]
	mov r0, r7
	bl EntityIsValid__022E32E8
	cmp r0, #0
	beq _022E327C
	ldrsh r0, [r7, #4]
	ldrsh r1, [r7, #6]
	bl DrawMinimapTile
_022E327C:
	add r5, r5, #1
	cmp r5, #0x14
	blt _022E3250
_022E3288:
	cmp r6, #0
	beq _022E32D0
	ldr r4, _022E32DC ; =DUNGEON_PTR
	mov r5, #0
_022E3298:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xbc8 + UPDATE_CAMERA_OFFSET]
	mov r0, r6
	bl EntityIsValid__022E32E8
	cmp r0, #0
	beq _022E32C4
	ldrsh r0, [r6, #4]
	ldrsh r1, [r6, #6]
	bl DrawMinimapTile
_022E32C4:
	add r5, r5, #1
	cmp r5, #0x40
	blt _022E3298
_022E32D0:
	bl ov29_022E34C8
_022E32D4:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E32DC: .word DUNGEON_PTR
_022E32E0: .word ov29_0237C84C
_022E32E4: .word 0x0000FFFF
	arm_func_end UpdateCamera
