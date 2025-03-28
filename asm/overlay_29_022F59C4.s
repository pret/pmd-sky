	.include "asm/macros.inc"
	.include "overlay_29_022F59C4.inc"

	.text

	arm_func_start ov29_022F59C4
ov29_022F59C4: ; 0x022F59C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_022F87C0
	movs r1, r0
	moveq r1, #0
	beq _022F59FC
	ldr r0, [r1]
	cmp r0, #1
	movne r1, #0
	bne _022F59FC
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	movne r1, #0
_022F59FC:
	mov r0, r4
	mvn r2, #0
	bl ov29_022F5A40
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022F59C4

	arm_func_start ov29_022F5A0C
ov29_022F5A0C: ; 0x022F5A0C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetLeader
	ldr r1, _022F5A3C ; =DUNGEON_PTR
	ldrb r3, [r4, #4]
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, r3, lsl #2
	add r1, r1, #0x12000
#ifdef JAPAN
	ldr r1, [r1, #0xa84]
#else
	ldr r1, [r1, #0xb28]
#endif
	bl ov29_022F5A40
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F5A3C: .word DUNGEON_PTR
	arm_func_end ov29_022F5A0C

	arm_func_start ov29_022F5A40
ov29_022F5A40: ; 0x022F5A40
#ifdef JAPAN
#define OV29_022F5A40_OFFSET -4
#else
#define OV29_022F5A40_OFFSET 0
#endif
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
#endif
	sub sp, sp, #0x18 + OV29_022F5A40_OFFSET
	mov r6, r0
	movs sl, r1
	mov r5, r2
	ldr r8, [r6, #0xb4]
	bne _022F5A70
#ifdef JAPAN
	mov r0, #0
	mov r1, #0x900
#else
	ldr r1, _022F5D9C ; =0x00000BC1
	mov r0, #0
#endif
	mov r2, #1
	bl DisplayMessage2
	b _022F5D94
_022F5A70:
	bl ov29_023009CC
	cmp r0, #0
	bne _022F5A90
#ifdef JAPAN
	mov r0, #0
	mov r1, #0x900
#else
	ldr r1, _022F5D9C ; =0x00000BC1
	mov r0, #0
#endif
	mov r2, #1
	bl DisplayMessage2
	b _022F5D94
_022F5A90:
	ldr r0, [sl, #0xb4]
	ldrb r0, [r0, #0xbc]
	bl IsSecretBazaarNpcBehavior
	movs r4, r0
	bne _022F5ADC
	mov r0, r6
	mov r1, sl
	mov r2, #1
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	beq _022F5D84
	mov r0, sl
	mov r1, r6
	mov r2, #1
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	beq _022F5D84
_022F5ADC:
	ldr sb, [sl, #0xb4]
	bl ov29_0234B034
	mov r1, #0
	mov r2, sb
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
	bl ov29_0234B034
	mov r1, #0
	str r1, [sp]
	mov r1, #1
	mov r2, sb
	mov r3, #7
	bl ov29_0230040C
	mov r0, #3
	bl ov29_02348C64
	mov r0, r6
	mov r1, sl
	bl ov29_02307BDC
	mov r0, sl
	bl ov29_023009CC
	cmp r0, #0
	beq _022F5B4C
	mov r0, sl
	mov r1, #1
	bl CheckVariousStatuses2
	cmp r0, #0
	beq _022F5B78
_022F5B4C:
	add r0, r6, #4
	add r1, sl, #4
	bl GetDirectionTowardsPosition
	mov r1, r0
	mov r0, r6
	bl ov29_02304AFC
	ldr r1, _022F5DA0 ; =0x00000BC2
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _022F5D94
_022F5B78:
	add r0, r6, #4
	add r1, sl, #4
	bl GetDirectionTowardsPosition
	mov r1, r0
	mov r0, r6
	bl ov29_02304AFC
	cmp r5, #0
	blt _022F5BA8
	mov r0, sl
	mov r1, r5
	bl ov29_02304AFC
	b _022F5BB8
_022F5BA8:
	ldrb r1, [r8, #0x4c]
	mov r0, sl
	add r1, r1, #4
	bl ov29_02304AFC
_022F5BB8:
	cmp r4, #0
	beq _022F5BD0
	mov r0, r6
	mov r1, sl
	bl ov29_02344544
	b _022F5D94
_022F5BD0:
	ldrb r0, [sb, #9]
	cmp r0, #1
	bne _022F5BE4
	bl ov29_022F6748
	b _022F5D94
_022F5BE4:
	ldrb r0, [sb, #0xbc]
	cmp r0, #7
	bne _022F5C3C
	ldr r0, _022F5DA4 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	beq _022F5C18
	ldr r1, _022F5DA8 ; =0x00000BC3
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _022F5D94
_022F5C18:
	bl GetMissionDestination
	ldrb r0, [r0, #0x18]
	cmp r0, #0
	mov r0, sl
	beq _022F5C34
	bl ov29_0234A5E4
	b _022F5D94
_022F5C34:
	bl ov29_0234A2D4
	b _022F5D94
_022F5C3C:
	ldrsh r2, [sb, #0x12]
	ldrsh r1, [sb, #0x16]
	ldr r0, _022F5DAC ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	mov r0, r1, lsl #3
	mov r1, #0xa
	bl _s32_div_f
	ldrsh r1, [sb, #0x10]
	cmp r1, r0
	movge r4, #0
	bge _022F5C84
	mov r0, sl
	bl HasLowHealth
	cmp r0, #0
	moveq r4, #1
	movne r4, #2
_022F5C84:
	bl AllocateTemp1024ByteBufferFromPool
	ldrb r1, [sb, #0x48]
	mov r5, r0
	cmp r1, #0xd6
	bne _022F5CA4
	ldr r1, _022F5DB0 ; =0x0000025E
	bl GetStringFromFileVeneer
	b _022F5D3C
_022F5CA4:
	mov r0, sl
	mov r6, #0x14
	bl ov29_0231AE3C
#ifdef JAPAN
	mov r7, r0
#else
	str r0, [sp, #4]
	ldr r0, _022F5DB4 ; =0x000004D3
	sub fp, r0, #0x1b
#endif
_022F5CBC:
	mov r0, sb
	bl GetPersonalityIndex
#ifdef JAPAN
	mov fp, r0
	ldr r0, _022F5DB4 ; =0x000004D3
	cmp fp, r0
#else
	mov r7, r0
	cmp r7, fp
	ldrne r0, _022F5DB4 ; =0x000004D3
	cmpne r7, r0
#endif
	moveq r2, #0
	beq _022F5CE8
	ldrb r0, [r8, #0x48]
	bl ov29_0234CFA0
	mov r2, r0
_022F5CE8:
#ifdef JAPAN
	mov r0, fp
#else
	mov r0, r7
#endif
	mov r1, r4
	bl GetTalkLine
	mov r1, r0
	mov r0, r5
	bl GetStringFromFileVeneer
#ifdef JAPAN
	cmp r7, #0
#else
	ldr r0, [sp, #4]
	cmp r0, #0
#endif
	bne _022F5D3C
	ldr r1, _022F5DB8 ; =ov29_02352750
	mov r0, r5
	bl sub_02020880
	cmp r0, #0
	beq _022F5D3C
	subs r6, r6, #1
	bne _022F5D34
	ldr r1, _022F5DBC ; =ov29_02352758
	mov r0, r5
	bl strcpy
_022F5D34:
	cmp r6, #0
	bne _022F5CBC
_022F5D3C:
	ldrb r0, [sb, #0x48]
	cmp r0, #0xd7
	bne _022F5D5C
	mov r0, sl
	bl HasLowHealth
	cmp r0, #0
	movne r2, #2
	bne _022F5D60
_022F5D5C:
	mov r2, #0
_022F5D60:
	ldrsh r1, [sb, #4]
	add r0, sp, #8 + OV29_022F5A40_OFFSET
	bl InitPortraitDungeon
	add r1, sp, #8 + OV29_022F5A40_OFFSET
	mov r0, sl
	mov r2, r5
	mov r3, #1
	bl ov29_0234D304
	b _022F5D94
_022F5D84:
#ifdef JAPAN
	mov r0, #0
	mov r1, #0x900
#else
	ldr r1, _022F5D9C ; =0x00000BC1
	mov r0, #0
#endif
	mov r2, #1
	bl DisplayMessage2
_022F5D94:
	add sp, sp, #0x18 + OV29_022F5A40_OFFSET
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#endif
	.align 2, 0
#ifdef JAPAN
_022F5DA0: .word 0x00000901
_022F5DA4: .word DUNGEON_PTR
_022F5DA8: .word 0x00000902
_022F5DAC: .word 0x000003E7
_022F5DB0: .word 0x000004F8
_022F5DB4: .word 0x000004B8
#else
_022F5D9C: .word 0x00000BC1
_022F5DA0: .word 0x00000BC2
_022F5DA4: .word DUNGEON_PTR
_022F5DA8: .word 0x00000BC3
_022F5DAC: .word 0x000003E7
_022F5DB0: .word 0x0000025E
_022F5DB4: .word 0x000004D3
#endif
_022F5DB8: .word ov29_02352750
_022F5DBC: .word ov29_02352758
	arm_func_end ov29_022F5A40

	arm_func_start ov29_022F5DC0
ov29_022F5DC0: ; 0x022F5DC0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetLeader
	ldr r1, _022F5DF0 ; =DUNGEON_PTR
	ldrb r3, [r4, #4]
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, r3, lsl #2
	add r1, r1, #0x12000
#ifdef JAPAN
	ldr r1, [r1, #0xa84]
#else
	ldr r1, [r1, #0xb28]
#endif
	bl ov29_022F5DF4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F5DF0: .word DUNGEON_PTR
	arm_func_end ov29_022F5DC0

	arm_func_start ov29_022F5DF4
ov29_022F5DF4: ; 0x022F5DF4
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x44
	movs r7, r1
	ldr r4, [r7, #0xb4]
	mov r0, #0
	bne _022F5E1C
	ldr r1, _022F5F0C ; =0x00000BC4
	mov r2, #1
	bl DisplayMessage2
	b _022F5F04
_022F5E1C:
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrsh r0, [r4, #0xc]
	ldr r5, _022F5F10 ; =0x00000BC5
	cmp r0, #0
	add r6, r5, #4
	blt _022F5E84
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetActiveTeamMember
	mov r4, r0
	ldrsh r0, [r4, #8]
	bl CheckTeamMemberIdxVeneer
	cmp r0, #0
	addne r5, r5, #3
	addne r6, r5, #3
	bne _022F5E84
	ldrsh r0, [r4, #8]
	bl IsMonsterIdInNormalRangeVeneer
	cmp r0, #0
	beq _022F5E84
	bl IsMarowakTrainingMaze
	cmp r0, #0
	addne r5, r5, #2
	ldr r6, _022F5F14 ; =0x00000BCA
	addeq r5, r5, #1
_022F5E84:
	mov r2, #1
#ifdef JAPAN
	mov r0, #0
	mov r1, r5
	mov r3, r2
	str r0, [sp]
#else
	mov r1, r5
	mov r3, r2
	mov r0, #0
	str r2, [sp]
#endif
	bl YesNoMenu
	cmp r0, #1
	bne _022F5F04
	mov r0, #0
	bl ov29_0233A248
	mov r0, #0
	bl sub_02024FB8
	mov r1, r0
	add r0, sp, #4
	mov r2, #0x40
	bl strncpy
	mov r0, r7
	bl ov29_022E690C
	mov r0, r7
	mov r1, #0x25c
	mov r2, #0
	bl HandleFaint
#if defined(NORTH_AMERICA)
	bl UpdateMapSurveyorFlag
#endif
	bl ov29_022E8104
	bl ov29_022E81F8
	mov r0, #0
	add r1, sp, #4
	bl ov29_0234B0B4
	mov r1, r6
	mov r0, #0
	mov r2, #1
#ifdef JAPAN
	bl DisplayMessage2
#else
	bl DisplayMessage
#endif
_022F5F04:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_022F5F0C: .word 0x00000903
_022F5F10: .word 0x00000904
_022F5F14: .word 0x00000909
#else
_022F5F0C: .word 0x00000BC4
_022F5F10: .word 0x00000BC5
_022F5F14: .word 0x00000BCA
#endif
	arm_func_end ov29_022F5DF4

	arm_func_start ov29_022F5F18
ov29_022F5F18: ; 0x022F5F18
#ifdef JAPAN
#define OV29_022F5F18_OFFSET -4
#else
#define OV29_022F5F18_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov sb, r0
	mov r7, #0
	bl EntityIsValid__022F528C
	cmp r0, #0
	beq _022F5F88
	ldr r0, _022F6050 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	bl AreMovesEnabled
	cmp r0, #0
	bne _022F5F60
	ldr r1, _022F6054 ; =0x00000DFD
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
	b _022F6048
_022F5F60:
	ldr r4, [sb, #0xb4]
	mov r1, r7
	mov r0, sb
	strb r1, [r4, #0x23f + OV29_022F5F18_OFFSET]
	bl ShouldUsePp
	cmp r0, #0
	movne r7, #1
	strneb r7, [r4, #0x23f + OV29_022F5F18_OFFSET]
	mov r0, #0
	strb r0, [r4, #0x23e + OV29_022F5F18_OFFSET]
_022F5F88:
	mov r6, #0
	mov r4, #1
	mov r5, r6
	mov sl, r4
	b _022F5FD8
_022F5F9C:
	ldr r8, [sb, #0xb4]
	mov r0, sb
	str r5, [sp]
	ldrb r1, [r8, #0x54]
	mov r2, r4
	mov r3, r5
	bl ov29_0232145C
	bl IsFloorOver
	cmp r0, #0
	ldreqb r0, [r8, #0x23e + OV29_022F5F18_OFFSET]
	cmpeq r0, #0
	ldreqb r0, [r8, #0x163 + OV29_022F5F18_OFFSET]
	cmpeq r0, #0
	bne _022F5FEC
	add r6, r6, #1
_022F5FD8:
	mov r0, sb
	mov r1, sl
	bl GetNumberOfAttacks
	cmp r6, r0
	blt _022F5F9C
_022F5FEC:
	mov r0, sb
	bl EntityIsValid__022F528C
	cmp r0, #0
	beq _022F6014
	cmp r7, #0
	moveq r1, #1
	movne r1, #0
	mov r0, sb
	and r1, r1, #0xff
	bl UpdateMovePp
_022F6014:
	bl IsFloorOver
	cmp r0, #0
	bne _022F6048
	mov r0, sb
	bl EntityIsValid__022F528C
	cmp r0, #0
	beq _022F6040
	ldr r1, [sb, #0xb4]
	mov r0, sb
	ldrb r1, [r1, #0x54]
	bl ov29_022FA574
_022F6040:
	mov r0, sb
	bl TryActivateTruant
_022F6048:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022F6050: .word DUNGEON_PTR
#ifdef JAPAN
_022F6054: .word 0x00000B3D
#else
_022F6054: .word 0x00000DFD
#endif
	arm_func_end ov29_022F5F18

	arm_func_start ov29_022F6058
ov29_022F6058: ; 0x022F6058
#ifdef JAPAN
#define OV29_022F6058_OFFSET -4
#else
#define OV29_022F6058_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov sl, r0
	ldr r7, [sl, #0xb4]
	ldr r2, _022F61F8 ; =ov29_0237CA80
	mov r3, #0
	add r0, sp, #0xc
	str r3, [r2]
	mov sb, r1
	bl InitMove
	ldrb r0, [r7, #0xd0]
	cmp r0, #1
	bne _022F60AC
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _022F61FC ; =0x00000BCC
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	b _022F61F0
_022F60AC:
	ldrb r0, [r7, #0xbf]
	cmp r0, #4
	bne _022F60D8
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _022F6200 ; =0x00000BCD
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	b _022F61F0
_022F60D8:
	mov r6, #0
	cmp sb, #0x160
	moveq r8, #1
	movne r8, #0
	strb r6, [r7, #0x163 + OV29_022F6058_OFFSET]
	mov fp, r6
	mov r5, #0xa
	add r4, sp, #0xc
	b _022F6154
_022F60FC:
	mov r0, sl
	bl ov29_022F3B8C
	str fp, [r7, #0x18c + OV29_022F6058_OFFSET]
	ldrb r1, [sp, #0xc]
	strb r5, [sp, #0x12]
	mov r0, sl
	orr r1, r1, #0xc
	strb r1, [sp, #0xc]
	str fp, [sp]
	mov r1, r8
	mov r2, fp
	mov r3, fp
	str r4, [sp, #4]
	bl ov29_02322374
	mov r0, sl
	bl EntityIsValid__022F528C
	cmp r0, #0
	beq _022F6168
	ldrb r0, [r7, #0x163 + OV29_022F6058_OFFSET]
	cmp r0, #0
	bne _022F6168
	add r6, r6, #1
_022F6154:
	mov r0, sl
	mov r1, #1
	bl GetNumberOfAttacks
	cmp r6, r0
	blt _022F60FC
_022F6168:
	mov r0, sl
	bl EntityIsValid__022F528C
	cmp r0, #0
	beq _022F61F0
	cmp sb, #0x160
	ldreq r0, _022F61F8 ; =ov29_0237CA80
	ldreq r0, [r0]
	cmpeq r0, #0
	bne _022F6198
	ldr r1, _022F6204 ; =0x00000BCE
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_022F6198:
	ldrb r0, [r7, #7]
	cmp r0, #0
	cmpne sb, #0x160
	beq _022F61E8
	ldrb r1, [r7, #0x4c]
	ldr r0, _022F6208 ; =DIRECTIONS_XY
	ldrsh r3, [sl, #4]
	mov r1, r1, lsl #2
	ldrsh r2, [r0, r1]
	ldr r1, _022F620C ; =DIRECTIONS_XY + 2
	add r0, sp, #8
	add r2, r3, r2
	strh r2, [sp, #8]
	ldrb r2, [r7, #0x4c]
	ldrsh r3, [sl, #6]
	mov r2, r2, lsl #2
	ldrsh r1, [r1, r2]
	add r1, r3, r1
	strh r1, [sp, #0xa]
	bl ov29_02338430
_022F61E8:
	mov r0, sl
	bl EnemyEvolution
_022F61F0:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F61F8: .word ov29_0237CA80
#ifdef JAPAN
_022F61FC: .word 0x0000090B
_022F6200: .word 0x0000090C
_022F6204: .word 0x0000090D
#else
_022F61FC: .word 0x00000BCC
_022F6200: .word 0x00000BCD
_022F6204: .word 0x00000BCE
#endif
_022F6208: .word DIRECTIONS_XY
_022F620C: .word DIRECTIONS_XY + 2
	arm_func_end ov29_022F6058

	arm_func_start ov29_022F6210
ov29_022F6210: ; 0x022F6210
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	bl EntityIsValid__022F62A8
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r4, #0
	ldr r7, _022F62A4 ; =DUNGEON_PTR
	b _022F6294
_022F6234:
	ldr r0, [r7]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r5, [r0, #0xa94]
#else
	ldr r5, [r0, #0xb38]
#endif
	mov r0, r5
	bl EntityIsValid__022F62A8
	cmp r0, #0
	beq _022F6288
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #9]
	cmp r0, #1
	bne _022F6288
	mov r0, r5
	bl ov29_023009CC
	cmp r0, #0
	beq _022F6288
	ldrb r1, [r6, #0x25]
	ldrb r0, [r5, #0x25]
	cmp r1, r0
	moveq r0, r5
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_022F6288:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_022F6294:
	cmp r4, #0x10
	blt _022F6234
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F62A4: .word DUNGEON_PTR
	arm_func_end ov29_022F6210
