	.include "asm/macros.inc"
	.include "overlay_29_023498A0.inc"

	.text

	arm_func_start GenerateMissionEggMonster
GenerateMissionEggMonster: ; 0x023498A0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	str r0, [sp]
	ldrb r0, [r0, #0x16]
	cmp r0, #5
	bne _02349A54
	bl GetRandomSpawnMonsterID
	mov sb, r0
#ifndef JAPAN
	bl IsCastform
	cmp r0, #0
	mov r0, sb
	beq _023498E4
	bl GetMonsterGenderVeneer
	cmp r0, #1
	ldreq sb, _02349A5C ; =0x0000017B
	ldrne sb, _02349A60 ; =0x000003D3
	b _02349904
_023498E4:
	bl IsCherrim
	cmp r0, #0
	beq _02349904
	mov r0, sb
	bl GetMonsterGenderVeneer
	cmp r0, #1
	moveq sb, #0x1cc
	ldrne sb, _02349A64 ; =0x00000424
_02349904:
#endif
	ldr r0, _02349A68 ; =0x000001C1
	sub r0, r0, #2
	str r0, [sp, #8]
	ldr r0, _02349A6C ; =0x00000418
	sub r0, r0, #1
	str r0, [sp, #4]
	ldr r0, _02349A68 ; =0x000001C1
	add r7, r0, #0x10
	ldr r0, _02349A6C ; =0x00000418
	add r6, r0, #0x10
	add r5, r0, #0x11
	ldr r0, _02349A68 ; =0x000001C1
	add r4, r0, #1
	add fp, r0, #2
	add r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, _02349A68 ; =0x000001C1
	add r8, r0, #6
_0234994C:
	cmp sb, r8
	ldreq r0, _02349A6C ; =0x00000418
	addeq sl, r0, #6
	beq _02349A44
	cmp sb, #0x1d0
	ldreq r0, _02349A68 ; =0x000001C1
	addeq sl, r0, #0xd
	beq _02349A44
	cmp sb, r7
	ldreq r0, _02349A68 ; =0x000001C1
	addeq sl, r0, #0xe
	beq _02349A44
	cmp sb, r6
	ldreq r0, _02349A6C ; =0x00000418
	addeq sl, r0, #0xe
	beq _02349A44
	cmp sb, r5
	ldreq r0, _02349A6C ; =0x00000418
	addeq sl, r0, #0xf
	beq _02349A44
	cmp sb, r4
	ldreq sl, [sp, #4]
	beq _02349A44
	cmp sb, fp
	ldreq sl, _02349A6C ; =0x00000418
	beq _02349A44
	cmp sb, #0x1c4
	ldreq r0, _02349A68 ; =0x000001C1
	addeq sl, r0, #0x258
	beq _02349A44
	ldr r0, [sp, #0xc]
	cmp sb, r0
	bne _023499F4
	mov r0, #3
	bl DungeonRandInt
	cmp r0, #0
	ldreq sl, [sp, #8]
	beq _02349A44
	cmp r0, #1
	moveq sl, #0x1c0
	ldrne sl, _02349A68 ; =0x000001C1
	b _02349A44
_023499F4:
	mov r0, sb
	bl GetMonsterPreEvolution
	mov sl, r0
	add r0, sp, #0x10
	mov r1, sb
	bl GetEvoParameters
	ldrh r0, [sp, #0x16]
	cmp r0, #0xa
	bne _02349A28
	mov r0, sl
	bl FemaleToMaleForm
	mov sl, r0
	b _02349A3C
_02349A28:
	cmp r0, #0xb
	bne _02349A3C
	mov r0, sl
	bl GetSecondFormIfValid
	mov sl, r0
_02349A3C:
	cmp sl, #0
	beq _02349A4C
_02349A44:
	mov sb, sl
	b _0234994C
_02349A4C:
	ldr r0, [sp]
	strh sb, [r0, #0x18]
_02349A54:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifndef JAPAN
_02349A5C: .word 0x0000017B
_02349A60: .word 0x000003D3
_02349A64: .word 0x00000424
#endif
_02349A68: .word 0x000001C1
_02349A6C: .word 0x00000418
	arm_func_end GenerateMissionEggMonster

	arm_func_start ov29_02349A70
ov29_02349A70: ; 0x02349A70
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, #0
	ldr r4, _02349AD0 ; =DUNGEON_PTR
	b _02349AC0
_02349A80:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xa84]
#else
	ldr r6, [r0, #0xb28]
#endif
	mov r0, r6
	bl EntityIsValid__0234987C
	cmp r0, #0
	beq _02349AB4
	ldr r0, [r6, #0xb4]
	bl IsExperienceLocked
	cmp r0, #0
	movne r0, r6
	ldmneia sp!, {r4, r5, r6, pc}
_02349AB4:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_02349AC0:
	cmp r5, #4
	blt _02349A80
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02349AD0: .word DUNGEON_PTR
	arm_func_end ov29_02349A70

	arm_func_start ov29_02349AD4
ov29_02349AD4: ; 0x02349AD4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02349C80 ; =DUNGEON_PTR
	mov r5, r0
	ldr r2, [r2]
	mov r4, r1
	ldrb r0, [r2, #0x760]
	add r1, r2, #0x760
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsb r0, [r1, #3]
	bl GetAcceptedMission
	ldrb r1, [r0]
	cmp r1, #5
	bne _02349C78
	ldrb r1, [r0, #1]
	cmp r1, #0
	cmpne r1, #7
	cmpne r1, #2
	cmpne r1, #1
	cmpne r1, #8
	bne _02349B3C
	ldrsh r1, [r0, #0x10]
	cmp r5, r1
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349B3C:
	cmp r1, #6
	cmpne r1, #4
	bne _02349B5C
	ldrsh r1, [r0, #0x14]
	cmp r4, r1
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349B5C:
	cmp r1, #9
	bne _02349B90
	ldrsh r1, [r0, #0x10]
	cmp r5, r1
	moveq r1, #7
	streqb r1, [r0]
	beq _02349C60
	cmp r5, #0
	ldreqsh r1, [r0, #0x14]
	cmpeq r4, r1
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349B90:
	cmp r1, #3
	bne _02349BE8
	ldrb r1, [r0, #2]
	cmp r1, #0
	moveq r1, #7
	streqb r1, [r0]
	beq _02349C60
	cmp r1, #1
	bne _02349BC8
	ldrsh r1, [r0, #0x14]
	cmp r4, r1
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349BC8:
	cmp r1, #2
	moveq r1, #7
	streqb r1, [r0]
	beq _02349C60
	cmp r1, #3
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349BE8:
	cmp r1, #4
	bne _02349C04
	ldrsh r1, [r0, #0x14]
	cmp r4, r1
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349C04:
	cmp r1, #5
	moveq r1, #7
	streqb r1, [r0]
	beq _02349C60
	cmp r1, #0xa
	bne _02349C30
	ldrsh r1, [r0, #0x10]
	cmp r5, r1
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349C30:
	cmp r1, #0xb
	bne _02349C4C
	ldrsh r1, [r0, #0xe]
	cmp r5, r1
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349C4C:
	cmp r1, #0xc
	ldreqsh r1, [r0, #0x14]
	cmpeq r4, r1
	moveq r1, #7
	streqb r1, [r0]
_02349C60:
	ldrb r1, [r0]
	cmp r1, #7
	ldreqb r1, [r0, #0x16]
	cmpeq r1, #5
	bne _02349C78
	bl GenerateMissionEggMonster
_02349C78:
	bl ov29_022E8244
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02349C80: .word DUNGEON_PTR
	arm_func_end ov29_02349AD4

	arm_func_start ov29_02349C84
ov29_02349C84: ; 0x02349C84
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0xa0
	bl IsDestinationFloor
	cmp r0, #0
	moveq r0, #0
	beq _0234A1F8
	bl GetMissionDestination
	ldr r1, _0234A200 ; =ov29_023537C8
	mov r2, #0
	mov r4, r0
	str r2, [r1]
	bl GetTargetMonsterNotFoundFlag
	cmp r0, #0
	beq _02349CD4
	bl ov29_022EAC8C
	ldr r1, _0234A204 ; =0x00000E11
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_02349CD4:
	ldrb r0, [r4, #1]
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _0234A1D4
_02349CE4: ; jump table
	b _02349D20 ; case 0
	b _02349D20 ; case 1
	b _02349D20 ; case 2
	b _02349D38 ; case 3
	b _02349D20 ; case 4
	b _02349E6C ; case 5
	b _02349D20 ; case 6
	b _02349D20 ; case 7
	b _02349D20 ; case 8
	b _0234A1A4 ; case 9
	b _0234A134 ; case 10
	b _02349F1C ; case 11
	b _0234A120 ; case 12
	b _0234A1D4 ; case 13
	b _0234A1D4 ; case 14
_02349D20:
	bl ov29_022EAC8C
	ldr r1, _0234A208 ; =0x00000E04
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_02349D38:
	ldrb r0, [r4, #2]
	cmp r0, #3
	beq _0234A1D4
	bl ov29_022EAC8C
	ldr r1, _0234A208 ; =0x00000E04
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldrb r0, [r4, #2]
	cmp r0, #2
	bne _02349DC8
	bl ov29_023491B8
	mov r1, r0
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0234A20C ; =0x00000E34
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldrsh r5, [r4, #0xa]
	add r0, sp, #0x10
	mov r2, #0
	mov r1, r5
	bl InitPortraitDungeon
	mov r1, r5
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A210 ; =0x00000E35
	add r0, sp, #0x10
	mov r2, #1
	bl DisplayMessage
	ldrsh r0, [r4, #0xa]
	mov r1, #0
	bl ov29_02348888
	b _0234A1D4
_02349DC8:
	cmp r0, #0
	bne _0234A1D4
	bl ov29_023491B8
	mov r5, r0
	mov r1, r5
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
#ifdef JAPAN
	ldr r1, _0234B4B4 ; =0x00000B71
	mov r0, #0
#else
	mov r0, #0
	mov r1, #0xe30
#endif
	mov r2, #1
	bl DisplayMessage
	ldrsh r4, [r4, #0xa]
	add r0, sp, #0
	mov r2, #0
	mov r1, r4
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A214 ; =0x00000E31
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234A218 ; =0x00000E32
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldr r0, [r5, #0xb4]
	mov r1, #0
	ldrsh r0, [r0, #2]
	bl ov29_02348888
	ldr r2, _0234A21C ; =DUNGEON_PTR
	ldr r3, _0234A220 ; =0x00000E33
	ldr r2, [r2]
	mov r0, r5
	add r2, r2, #0x348
	mov r1, #0
	add r2, r2, #0x400
	bl ov29_0234AF34
	b _0234A1D4
_02349E6C:
	bl ov29_022EAC8C
	ldr r1, _0234A208 ; =0x00000E04
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	bl ov29_023491B8
	mov r5, r0
	mov r0, #1
	mov r1, r5
	mov r2, #0
	bl SubstitutePlaceholderStringTags
#ifdef JAPAN
	ldr r1, _0234B4B4 ; =0x00000B71
	mov r0, #0
#else
	mov r0, #0
	mov r1, #0xe30
#endif
	mov r2, #1
	bl DisplayMessage
	ldrsh r4, [r4, #0xa]
	add r0, sp, #0x20
	mov r2, #0
	mov r1, r4
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A214 ; =0x00000E31
	add r0, sp, #0x20
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234A218 ; =0x00000E32
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldr r0, [r5, #0xb4]
	mov r1, #0
	ldrsh r0, [r0, #2]
	bl ov29_02348888
	ldr r2, _0234A21C ; =DUNGEON_PTR
	ldr r3, _0234A220 ; =0x00000E33
	ldr r2, [r2]
	mov r0, r5
	add r2, r2, #0x348
	mov r1, #0
	add r2, r2, #0x400
	bl ov29_0234AF34
	b _0234A1D4
_02349F1C:
	mov r0, #4
	bl FindMonsterWithBehavior
	add r0, r0, #4
	bl ov29_022FA3D4
	mov r0, #1
	bl ov29_022EAF34
	bl GetMissionTargetEnemy
	mov r1, r0
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	mov r0, #0
	ldr r1, _0234A224 ; =0x00000E0A
	mov r2, #1
	bl DisplayMessage
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _02349FA4
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0x80
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	add r0, sp, #0x80
	mov r1, #0x12
	bl SetPortraitLayout
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A228 ; =0x00000E0B
	add r0, sp, #0x80
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_02349FA4:
	cmp r0, #1
	bne _02349FF0
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0x70
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	add r0, sp, #0x70
	mov r1, #0x12
	bl SetPortraitLayout
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A22C ; =0x00000E0C
	add r0, sp, #0x70
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_02349FF0:
	cmp r0, #2
	bne _0234A03C
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0x60
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	add r0, sp, #0x60
	mov r1, #0x12
	bl SetPortraitLayout
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A230 ; =0x00000E0D
	add r0, sp, #0x60
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_0234A03C:
	cmp r0, #3
	bne _0234A088
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0x50
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	add r0, sp, #0x50
	mov r1, #0x12
	bl SetPortraitLayout
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A234 ; =0x00000E0E
	add r0, sp, #0x50
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_0234A088:
	cmp r0, #4
	bne _0234A0D4
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0x40
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	add r0, sp, #0x40
	mov r1, #0x12
	bl SetPortraitLayout
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
#ifdef JAPAN
	add r0, sp, #0x40
	mov r1, #0xb50
#else
	ldr r1, _0234A238 ; =0x00000E0F
	add r0, sp, #0x40
#endif
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_0234A0D4:
	cmp r0, #5
	bne _0234A1D4
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0x30
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	add r0, sp, #0x30
	mov r1, #0x12
	bl SetPortraitLayout
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
#ifdef JAPAN
	ldr r1, _0234B4DC_2 ; =0x00000B51
	add r0, sp, #0x30
#else
	add r0, sp, #0x30
	mov r1, #0xe10
#endif
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_0234A120:
	ldr r1, _0234A23C ; =0x00000E09
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_0234A134:
	ldrb r0, [r4, #2]
	cmp r0, #5
	bne _0234A148
	bl ov29_0234AE40
	b _0234A1D4
_0234A148:
	cmp r0, #7
	bne _0234A198
	mov r0, #1
	bl ov29_0234ADCC
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0x90
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A240 ; =0x00000E07
	add r0, sp, #0x90
	mov r2, #1
	bl DisplayMessage
	mov r0, #2
	bl ov29_022EAF34
	b _0234A1D4
_0234A198:
	mov r0, #0
	bl ov29_0234ADCC
	b _0234A1D4
_0234A1A4:
	ldrb r0, [r4, #2]
	cmp r0, #2
	bne _0234A1B8
	bl ov29_0234AE40
	b _0234A1D4
_0234A1B8:
	cmp r0, #1
	bne _0234A1CC
	mov r0, #3
	bl ov29_0234ADCC
	b _0234A1D4
_0234A1CC:
	mov r0, #0
	bl ov29_0234ADCC
_0234A1D4:
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	ldr r0, _0234A200 ; =ov29_023537C8
	ldr r0, [r0]
	cmp r0, #0
	beq _0234A1F4
	blx r0
_0234A1F4:
	mov r0, #1
_0234A1F8:
	add sp, sp, #0xa0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_02349C84_OFFSET -0x2BF
#else
#define OV29_02349C84_OFFSET 0
#endif
_0234A200: .word ov29_023537C8
_0234A204: .word 0x00000E11 + OV29_02349C84_OFFSET
_0234A208: .word 0x00000E04 + OV29_02349C84_OFFSET
_0234A20C: .word 0x00000E34 + OV29_02349C84_OFFSET
_0234A210: .word 0x00000E35 + OV29_02349C84_OFFSET
#ifdef JAPAN
_0234B4B4: .word 0x00000B71
#endif
_0234A214: .word 0x00000E31 + OV29_02349C84_OFFSET
_0234A218: .word 0x00000E32 + OV29_02349C84_OFFSET
_0234A21C: .word DUNGEON_PTR
_0234A220: .word 0x00000E33 + OV29_02349C84_OFFSET
_0234A224: .word 0x00000E0A + OV29_02349C84_OFFSET
_0234A228: .word 0x00000E0B + OV29_02349C84_OFFSET
_0234A22C: .word 0x00000E0C + OV29_02349C84_OFFSET
_0234A230: .word 0x00000E0D + OV29_02349C84_OFFSET
_0234A234: .word 0x00000E0E + OV29_02349C84_OFFSET
#ifdef JAPAN
_0234B4DC_2: .word 0x00000B51
#else
_0234A238: .word 0x00000E0F
#endif
_0234A23C: .word 0x00000E09 + OV29_02349C84_OFFSET
_0234A240: .word 0x00000E07 + OV29_02349C84_OFFSET
	arm_func_end ov29_02349C84

	arm_func_start ov29_0234A244
ov29_0234A244: ; 0x0234A244
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl ov29_023491B8
	movs r4, r0
	bne _0234A26C
	ldr r1, _0234A2C8 ; =0x00000E2D
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	ldmia sp!, {r3, r4, r5, pc}
_0234A26C:
	mov r1, r4
	mov r0, #2
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r4
	bl ov29_023009CC
	cmp r0, #0
	bne _0234A2A0
#ifdef JAPAN
	mov r0, #0
	mov r1, #0xb70
#else
	ldr r1, _0234A2CC ; =0x00000E2F
	mov r0, #0
#endif
	mov r2, #1
	bl DisplayMessage2
	ldmia sp!, {r3, r4, r5, pc}
_0234A2A0:
	mov r0, r5
	mov r1, r4
	bl CanSeeTarget
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, _0234A2D0 ; =0x00000E2C
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0234A2C8: .word 0x00000B6E
_0234A2D0: .word 0x00000B6D
#else
_0234A2C8: .word 0x00000E2D
_0234A2CC: .word 0x00000E2F
_0234A2D0: .word 0x00000E2C
#endif
	arm_func_end ov29_0234A244

	arm_func_start ov29_0234A2D4
ov29_0234A2D4: ; 0x0234A2D4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov sl, r0
	ldr sb, [sl, #0xb4]
	bl GetLeader
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, sl
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, sl
	bl ov29_023009CC
	cmp r0, #0
	bne _0234A32C
	ldr r1, _0234A5B0 ; =0x00000E27
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _0234A5A8
_0234A32C:
	mov r0, #7
	bl IsCurrentMissionType
	cmp r0, #0
	mov r0, #0
	mov r3, #1
	beq _0234A504
	ldr r1, _0234A5B4 ; =0x00000E21
	mov r2, r0
	str r0, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _0234A5A8
	mov r7, #0
	mov fp, r7
	mov r6, #1
	ldr r5, _0234A5B8 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, #6
	b _0234A3D8
_0234A374:
	mul r0, r7, r4
	ldr r1, [r5]
	ldr r1, [r1, #0x384]
	ldrb r2, [r1, r0]
	add r8, r1, r0
	tst r2, #1
	movne r0, r6
	moveq r0, fp
	tst r0, #0xff
	beq _0234A3D4
	ldrb r0, [r8]
	tst r0, #2
	bne _0234A3D4
	tst r0, #0x10
	beq _0234A3C4
	tst r2, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _0234A3D4
_0234A3C4:
	bl GetItemToDeliver
	ldrsh r1, [r8, #4]
	cmp r1, r0
	beq _0234A3E0
_0234A3D4:
	add r7, r7, #1
_0234A3D8:
	cmp r7, #0x32
	blt _0234A374
_0234A3E0:
	cmp r7, #0x32
	bne _0234A40C
	bl GetItemToDeliver
	mov r1, r0
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _0234A5BC ; =0x00000E26
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _0234A5A8
_0234A40C:
	mov r0, #6
	ldr r1, _0234A5B8 ; =BAG_ITEMS_PTR_MIRROR
	mul r4, r7, r0
	ldr r0, [r1]
	ldr r0, [r0, #0x384]
	add r0, r0, r4
	ldrb r1, [r0, #1]
	cmp r1, #0
	beq _0234A47C
	ldr r0, _0234A5C0 ; =DUNGEON_PTR
	sub r1, r1, #1
	ldr r0, [r0]
	add r0, r0, r1, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r1, [r0, #0xa84]
#else
	ldr r1, [r0, #0xb28]
#endif
	cmp r1, #0
	moveq r0, #0
	beq _0234A468
	ldr r0, [r1]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_0234A468:
	cmp r0, #0
	beq _0234A47C
	ldr r0, [r1, #0xb4]
	add r0, r0, #0x62
	bl ItemZInit
_0234A47C:
	ldr r0, _0234A5B8 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	add r0, r0, r4
	bl ItemZInit
	bl RemoveEmptyItemsInBagWrapper
	ldr r1, _0234A5C4 ; =0x00000E1D
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234A5B8 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x384]
	add r1, r1, r4
	bl PrepareItemForPrinting__02345728
	ldrsh r4, [sb, #4]
	add r0, sp, #0x14
	mov r2, #0
	mov r1, r4
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A5C8 ; =0x00000E1E
	add r0, sp, #0x14
	mov r2, #1
	bl DisplayMessage
#ifdef JAPAN
	mov r0, #0
	mov r1, #0xb60
#else
	ldr r1, _0234A5CC ; =0x00000E1F
	mov r0, #0
#endif
	mov r2, #1
	bl DisplayMessage
	ldr r4, _0234A5D0 ; =0x00000E44
	b _0234A570
_0234A504:
#ifdef JAPAN
	ldr r1, _0234B870 ; =0x00000B61
	mov r2, r0
#else
	mov r2, r0
	mov r1, #0xe20
#endif
	str r0, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _0234A5A8
	ldr r1, _0234A5D4 ; =0x00000E1A
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldrsh r4, [sb, #4]
	add r0, sp, #4
	mov r2, #0
	mov r1, r4
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A5D8 ; =0x00000E1B
	add r0, sp, #4
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234A5DC ; =0x00000E1C
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldr r4, _0234A5E0 ; =0x00000E23
_0234A570:
	ldrsh r0, [sb, #2]
	mov r1, #0
	bl ov29_02348888
	ldr r1, _0234A5C0 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	mov r3, r4
	add r1, r1, #0x348
	add r2, r1, #0x400
	mov r1, #0
	bl ov29_0234AF34
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234A5A8:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_0234A2D4_OFFSET -0x2BF
#else
#define OV29_0234A2D4_OFFSET 0
#endif
_0234A5B0: .word 0x00000E27 + OV29_0234A2D4_OFFSET
_0234A5B4: .word 0x00000E21 + OV29_0234A2D4_OFFSET
_0234A5B8: .word BAG_ITEMS_PTR_MIRROR
_0234A5BC: .word 0x00000E26 + OV29_0234A2D4_OFFSET
_0234A5C0: .word DUNGEON_PTR
_0234A5C4: .word 0x00000E1D + OV29_0234A2D4_OFFSET
_0234A5C8: .word 0x00000E1E + OV29_0234A2D4_OFFSET
#ifndef JAPAN
_0234A5CC: .word 0x00000E1F
#endif
_0234A5D0: .word 0x00000E44 + OV29_0234A2D4_OFFSET
#ifdef JAPAN
_0234B870: .word 0x00000B61
#endif
_0234A5D4: .word 0x00000E1A + OV29_0234A2D4_OFFSET
_0234A5D8: .word 0x00000E1B + OV29_0234A2D4_OFFSET
_0234A5DC: .word 0x00000E1C + OV29_0234A2D4_OFFSET
_0234A5E0: .word 0x00000E23 + OV29_0234A2D4_OFFSET
	arm_func_end ov29_0234A2D4

	arm_func_start ov29_0234A5E4
ov29_0234A5E4: ; 0x0234A5E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	ldr r6, [r7, #0xb4]
	bl GetLeader
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r7
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r7
	bl ov29_023009CC
	cmp r0, #0
	bne _0234A63C
	ldr r1, _0234A740 ; =0x00000E2E
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _0234A738
_0234A63C:
	bl ov29_023491B8
	movs r4, r0
	bne _0234A65C
	ldr r1, _0234A744 ; =0x00000E2D
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _0234A738
_0234A65C:
	mov r1, r4
	mov r0, #2
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r4
	bl ov29_023009CC
	cmp r0, #0
	bne _0234A690
#ifdef JAPAN
	mov r0, #0
	mov r1, #0xb70
#else
	ldr r1, _0234A748 ; =0x00000E2F
	mov r0, #0
#endif
	mov r2, #1
	bl DisplayMessage2
	b _0234A738
_0234A690:
	mov r0, r7
	mov r1, r4
	bl CanSeeTarget
	cmp r0, #0
	mov r0, #0
	mov r2, #1
	bne _0234A6B8
	ldr r1, _0234A74C ; =0x00000E2C
	bl DisplayMessage2
	b _0234A738
_0234A6B8:
	ldr r1, _0234A750 ; =0x00000E28
	bl DisplayMessage
	ldrsh r5, [r6, #4]
	add r0, sp, #0
	mov r2, #0
	mov r1, r5
	bl InitPortraitDungeon
	mov r1, r5
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A754 ; =0x00000E29
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234A758 ; =0x00000E2A
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldrsh r0, [r6, #2]
	mov r1, #0
	bl ov29_02348888
	ldr r2, _0234A75C ; =DUNGEON_PTR
	ldr r3, _0234A760 ; =0x00000E2B
	ldr r2, [r2]
	mov r0, r4
	add r2, r2, #0x348
	mov r1, r7
	add r2, r2, #0x400
	bl ov29_0234AF34
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234A738:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_0234A5E4_OFFSET -0x2BF
#else
#define OV29_0234A5E4_OFFSET 0
#endif
_0234A740: .word 0x00000E2E + OV29_0234A5E4_OFFSET
_0234A744: .word 0x00000E2D + OV29_0234A5E4_OFFSET
#ifndef JAPAN
_0234A748: .word 0x00000E2F
#endif
_0234A74C: .word 0x00000E2C + OV29_0234A5E4_OFFSET
_0234A750: .word 0x00000E28 + OV29_0234A5E4_OFFSET
_0234A754: .word 0x00000E29 + OV29_0234A5E4_OFFSET
_0234A758: .word 0x00000E2A + OV29_0234A5E4_OFFSET
_0234A75C: .word DUNGEON_PTR
_0234A760: .word 0x00000E2B + OV29_0234A5E4_OFFSET
	arm_func_end ov29_0234A5E4

#ifndef JAPAN
	arm_func_start ov29_0234A764
ov29_0234A764: ; 0x0234A764
	stmdb sp!, {r3, lr}
	bl GetLeader
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl GetForcedLossReason
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0234A764
#endif

	arm_func_start ov29_0234A790
ov29_0234A790: ; 0x0234A790
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
#ifdef JAPAN
	bl GetLeader
	cmp r0, #0
	beq _0234A8A4
#else
	bl ov29_0234A764
	cmp r0, #0
	bne _0234A8A4
#endif
	mov r0, #0xa
	mov r1, #4
	bl IsCurrentMissionTypeExact
	movs r4, r0
	mov r5, #0
	beq _0234A7CC
	bl ov29_023491B8
	movs r5, r0
	beq _0234A8A4
_0234A7CC:
	bl GetLeader
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r7
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A8AC ; =0x00000E14
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	bl ov29_0234AEE8
	cmp r4, #0
	beq _0234A84C
	ldr r1, [r5, #0xb4]
	mov r0, #1
	ldrsh r1, [r1, #2]
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, [r5, #0xb4]
	add r0, sp, #0
	ldrsh r6, [r1, #2]
	mov r2, #0
	mov r1, r6
	bl InitPortraitDungeon
	mov r1, r6
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A8B0 ; =0x00000E18
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage
_0234A84C:
	mov r1, r7
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	mov r0, r7
	mov r1, #0
	bl ov29_02348888
	cmp r4, #0
	beq _0234A890
	ldr r0, _0234A8B4 ; =DUNGEON_PTR
	ldr r3, _0234A8B8 ; =0x00000E44
	ldr r1, [r0]
	mov r0, r5
	add r1, r1, #0x348
	add r2, r1, #0x400
	mov r1, #0
	bl ov29_0234AF34
	b _0234A898
_0234A890:
	ldr r0, _0234A8B8 ; =0x00000E44
	bl ov29_02348A18
_0234A898:
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234A8A4:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_0234A790_OFFSET -0x2BF
#else
#define OV29_0234A790_OFFSET 0
#endif
_0234A8AC: .word 0x00000E14 + OV29_0234A790_OFFSET
_0234A8B0: .word 0x00000E18 + OV29_0234A790_OFFSET
_0234A8B4: .word DUNGEON_PTR
_0234A8B8: .word 0x00000E44 + OV29_0234A790_OFFSET
	arm_func_end ov29_0234A790

	arm_func_start ov29_0234A8BC
ov29_0234A8BC: ; 0x0234A8BC
	stmdb sp!, {r4, lr}
	mov r4, r0
#ifdef JAPAN
	bl GetLeader
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
#else
	bl ov29_0234A764
	cmp r0, #0
	ldmneia sp!, {r4, pc}
#endif
	bl IsDestinationFloorWithHiddenOutlaw
	cmp r0, #0
	beq _0234A928
	bl ov29_023496B0
	cmp r0, #0
	beq _0234A918
	bl GetItemToRetrieve
	mov r1, r0
	mov r0, #0
	bl ov29_02344B9C
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A978 ; =0x00000E16
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	b _0234A958
_0234A918:
	mov r0, r4
	mov r1, #0
	bl ov29_02348888
	ldmia sp!, {r4, pc}
_0234A928:
	bl GetLeader
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234A97C ; =0x00000E15
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
_0234A958:
	bl ov29_0234AEE8
	mov r0, r4
	mov r1, #0
	bl ov29_02348888
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_0234A978: .word 0x00000B57
_0234A97C: .word 0x00000B56
#else
_0234A978: .word 0x00000E16
_0234A97C: .word 0x00000E15
#endif
	arm_func_end ov29_0234A8BC

	arm_func_start ov29_0234A980
ov29_0234A980: ; 0x0234A980
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	bl ov29_023491B8
	movs r5, r0
	beq _0234AA78
	bl ov29_023009CC
	cmp r0, #0
	bne _0234A9DC
	mov r0, r5
	bl ov29_022E550C
	mov r0, r5
	mov r1, r5
	mov r2, #0
	mov r3, #1
	bl EndNegativeStatusConditionWrapper
	mov r1, r5
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0234AA80 ; =0x00000E39
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
_0234A9DC:
	mov r1, r5
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0234AA84 ; =0x00000E36
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, [r5, #0xb4]
	add r0, sp, #0
	ldrsh r4, [r1, #4]
	mov r2, #0
	mov r1, r4
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234AA88 ; =0x00000E37
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234AA8C ; =0x00000E38
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	mov r0, #0
	mov r1, r0
	bl ov29_02348888
	ldr r2, _0234AA90 ; =DUNGEON_PTR
	ldr r3, _0234AA94 ; =0x00000E3A
	ldr r2, [r2]
	mov r0, r5
	add r2, r2, #0x348
	mov r1, #0
	add r2, r2, #0x400
	bl ov29_0234AF34
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234AA78:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_0234A980_OFFSET -0x2BF
#else
#define OV29_0234A980_OFFSET 0
#endif
_0234AA80: .word 0x00000E39 + OV29_0234A980_OFFSET
_0234AA84: .word 0x00000E36 + OV29_0234A980_OFFSET
_0234AA88: .word 0x00000E37 + OV29_0234A980_OFFSET
_0234AA8C: .word 0x00000E38 + OV29_0234A980_OFFSET
_0234AA90: .word DUNGEON_PTR
_0234AA94: .word 0x00000E3A + OV29_0234A980_OFFSET
	arm_func_end ov29_0234A980

	arm_func_start ov29_0234AA98
ov29_0234AA98: ; 0x0234AA98
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	bl ov29_023491B8
	movs r4, r0
	bne _0234AAC4
	ldr r1, _0234AB9C ; =0x00000E2D
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _0234AB94
_0234AAC4:
	bl GetLeader
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	bl GetSpecialTargetItem
	mov r1, r0
	mov r0, #1
	bl SetPreprocessorArgsIdVal
#ifdef JAPAN
	mov r0, #0
	mov r1, #0xb80
#else
	ldr r1, _0234ABA0 ; =0x00000E3F
	mov r0, #0
#endif
	mov r2, #1
	bl DisplayMessage
	ldr r1, [r4, #0xb4]
	add r0, sp, #0
	ldrsh r5, [r1, #4]
	mov r2, #0
	mov r1, r5
	bl InitPortraitDungeon
	mov r1, r5
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
#ifdef JAPAN
	ldr r1, _0234BE10 ; =0x00000B81
	add r0, sp, #0
#else
	add r0, sp, #0
	mov r1, #0xe40
#endif
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234ABA4 ; =0x00000E41
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	add r0, r6, #4
	mov r1, #1
	bl RemoveGroundItem
	bl GetSpecialTargetItem
	mov r1, r0
	mov r0, #0
	bl ov29_02348888
	ldr r2, _0234ABA8 ; =DUNGEON_PTR
	ldr r3, _0234ABAC ; =0x00000E42
	ldr r2, [r2]
	mov r0, r4
	add r2, r2, #0x348
	mov r1, #0
	add r2, r2, #0x400
	bl ov29_0234AF34
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234AB94:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_0234AA98_OFFSET -0x2BF
#else
#define OV29_0234AA98_OFFSET 0
#endif
_0234AB9C: .word 0x00000E2D + OV29_0234AA98_OFFSET
#ifdef JAPAN
_0234BE10: .word 0x00000B81
#else
_0234ABA0: .word 0x00000E3F
#endif
_0234ABA4: .word 0x00000E41 + OV29_0234AA98_OFFSET
_0234ABA8: .word DUNGEON_PTR
_0234ABAC: .word 0x00000E42 + OV29_0234AA98_OFFSET
	arm_func_end ov29_0234AA98

	arm_func_start ov29_0234ABB0
ov29_0234ABB0: ; 0x0234ABB0
	stmdb sp!, {r4, lr}
	mov r4, r0
#ifdef JAPAN
	bl GetLeader
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
#else
	bl ov29_0234A764
	cmp r0, #0
	ldmneia sp!, {r4, pc}
#endif
	bl GetLeader
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234AC80 ; =0x00000E13
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	bl IsJirachiChallengeFloor
	cmp r0, #0
	bne _0234AC40
	ldr r0, _0234AC84 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	bne _0234AC38
	bl ov29_022EAEFC
	cmp r0, #0
	beq _0234AC38
	ldr r0, _0234AC84 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x32]
#else
	ldrsh r0, [r0, #0xd6]
#endif
	bl MusicTableIdxToMusicId
	bl ChangeDungeonMusic
_0234AC38:
	mov r0, #0
	bl ov29_022EAF34
_0234AC40:
	mov r0, r4
	mov r1, #0
	bl ov29_02348888
	bl IsJirachiChallengeFloor
	cmp r0, #0
	beq _0234AC68
	mov r0, #2
	mov r1, #1
	bl SetDungeonEscapeFields
	b _0234AC70
_0234AC68:
	ldr r0, _0234AC88 ; =0x00000E43
	bl ov29_02348A18
_0234AC70:
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_0234AC80: .word 0x00000B54
_0234AC84: .word DUNGEON_PTR
_0234AC88: .word 0x00000B84
#else
_0234AC80: .word 0x00000E13
_0234AC84: .word DUNGEON_PTR
_0234AC88: .word 0x00000E43
#endif
	arm_func_end ov29_0234ABB0

	arm_func_start ov29_0234AC8C
ov29_0234AC8C: ; 0x0234AC8C
	stmdb sp!, {r3, r4, r5, lr}
	bl GetSpecialTargetItem
	mov r1, r0
	mov r0, #0
	bl ov29_02348888
	bl ov29_0234D630
	bl GetMessageLogPreprocessorArgs
	mov r1, r0
	mov r0, #1
	str r0, [sp]
	mov r2, #0
	ldr r0, _0234AD08 ; =0x00000E12
	mov r3, r2
	bl ov29_0234D70C
	mov r0, #9
	bl ov29_022EACE4
	mov r5, #0x62
	mov r4, #9
	b _0234ACE0
_0234ACD8:
	mov r0, r5
	bl AdvanceFrame
_0234ACE0:
	mov r0, r4
	bl sub_02017C10
	cmp r0, #0
	bne _0234ACD8
	bl ov29_0234D838
	mov r0, #0
	bl ov29_0234D8A0
	ldr r0, _0234AD0C ; =0x00000E43
	bl ov29_02348A18
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0234AD08: .word 0x00000B53
_0234AD0C: .word 0x00000B84
#else
_0234AD08: .word 0x00000E12
_0234AD0C: .word 0x00000E43
#endif
	arm_func_end ov29_0234AC8C

	arm_func_start ov29_0234AD10
ov29_0234AD10: ; 0x0234AD10
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl IsDestinationFloorWithFleeingOutlaw
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	moveq r0, #0
	beq _0234AD44
	ldr r0, [r4]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
_0234AD44:
	cmp r0, #0
	ldrne r1, [r4, #0xb4]
	ldrneb r0, [r1, #6]
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r1, #0xbc]
	cmp r0, #3
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl ov29_02300B04
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r0, [r4, #4]
	ldrsh r1, [r4, #6]
	bl PositionIsOnStairs
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #0xb4]
	ldr r1, _0234ADC4 ; =0x0000025B
	ldrsh r5, [r0, #2]
	mov r0, r4
	mov r2, #0
	bl HandleFaint
	mov r1, r5
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234ADC8 ; =0x00000E19
	mov r0, #0
	mov r2, #1
	bl LogMessageById
	bl ov29_0234AEE8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234ADC4: .word 0x0000025B
#ifdef JAPAN
_0234ADC8: .word 0x00000B5A
#else
_0234ADC8: .word 0x00000E19
#endif
	arm_func_end ov29_0234AD10

	arm_func_start ov29_0234ADCC
ov29_0234ADCC: ; 0x0234ADCC
	stmdb sp!, {r3, lr}
	cmp r0, #3
	bne _0234ADF0
	bl ov29_022EAC8C
	ldr r1, _0234AE38 ; =0x00000E04
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldmia sp!, {r3, pc}
_0234ADF0:
	cmp r0, #2
	bne _0234AE0C
	mov r0, #3
	bl FindMonsterWithBehavior
	add r0, r0, #4
	bl ov29_022FA3D4
	b _0234AE1C
_0234AE0C:
	mov r0, #1
	bl FindMonsterWithBehavior
	add r0, r0, #4
	bl ov29_022FA3D4
_0234AE1C:
	mov r0, #1
	bl ov29_022EAF34
	ldr r1, _0234AE3C ; =0x00000E05
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_0234AE38: .word 0x00000B45
_0234AE3C: .word 0x00000B46
#else
_0234AE38: .word 0x00000E04
_0234AE3C: .word 0x00000E05
#endif
	arm_func_end ov29_0234ADCC

	arm_func_start ov29_0234AE40
ov29_0234AE40: ; 0x0234AE40
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r0, #2
	bl ov29_0234ADCC
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsStringToName
	ldr r1, _0234AE98 ; =0x00000E06
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234AE9C ; =TeleportFleeingOutlaw
	ldr r0, _0234AEA0 ; =ov29_023537C8
	str r1, [r0]
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_0234AE98: .word 0x00000B47
#else
_0234AE98: .word 0x00000E06
#endif
_0234AE9C: .word TeleportFleeingOutlaw
_0234AEA0: .word ov29_023537C8
	arm_func_end ov29_0234AE40
