	.include "asm/macros.inc"
	.include "overlay_29_02302A5C.inc"

	.text

	arm_func_start LevelUpItemEffect
LevelUpItemEffect: ; 0x02302A5C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x74
	mov sb, r1
	mov sl, r0
	mov r0, sb
	str r2, [sp]
	mov r8, r3
	bl EntityIsValid__02302A38
	cmp r0, #0
	beq _02302BF4
	ldr r5, [sb, #0xb4]
	mov r4, #0
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _02302AA4
	ldrb r1, [r5, #0xa]
	add r0, sp, #0xc
	bl GetUnlockedTacticFlags
_02302AA4:
	ldrsh r2, [r5, #0x12]
	ldrsh r1, [r5, #0x16]
	ldr r0, _02302BFC ; =0x000003E7
	ldrb fp, [r5, #0x1c]
	add r7, r2, r1
	ldrb r1, [r5, #0x1a]
	cmp r7, r0
	movgt r7, r0
	str r1, [sp, #8]
	ldrb r1, [r5, #0x1b]
	mov r0, r5
	ldrb r6, [r5, #0x1d]
	str r1, [sp, #4]
	bl IsExperienceLocked
	cmp r0, #0
	bne _02302BA8
	ldrb r1, [r5, #0xa]
	ldr r0, [sp]
	add r2, r1, r0
	cmp r2, #0x64
	movge r2, #0x64
	cmp r2, r1
	beq _02302BA8
	ldrsh r1, [r5, #2]
	add r0, sp, #0x18
	bl GetLvlUpEntry
	ldr r1, [sp, #0x18]
	ldrb r3, [sp, #0x98]
	str r1, [r5, #0x20]
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl LevelUp
	orrs r4, r4, r0
	beq _02302BA8
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _02302BA8
	ldrsh r2, [r5, #0x12]
	ldrsh r1, [r5, #0x16]
	ldr r0, _02302BFC ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	sub r0, r1, r7
	str r0, [sp, #0x48]
	ldrb r1, [r5, #0x1a]
	ldr r0, [sp, #8]
	cmp r8, #0
	sub r0, r1, r0
	str r0, [sp, #0x4c]
	ldrb r0, [r5, #0x1c]
	sub r0, r0, fp
	str r0, [sp, #0x50]
	ldrb r1, [r5, #0x1b]
	ldr r0, [sp, #4]
	sub r0, r1, r0
	str r0, [sp, #0x54]
	ldrb r0, [r5, #0x1d]
	sub r0, r0, r6
	str r0, [sp, #0x58]
	beq _02302BA8
	add r1, sp, #0x24
	mov r0, sb
	bl ov29_02302CC8
_02302BA8:
	add r2, sp, #0xc
	mov r0, sl
	mov r1, sb
	mov r3, r8
	bl ov29_02302C04
	mov r0, #0
#ifdef JAPAN
	str r0, [r5, #0x210]
	strb r0, [r5, #0x14f]
#else
	str r0, [r5, #0x214]
	strb r0, [r5, #0x153]
#endif
	cmp r4, #0
	bne _02302BF4
	cmp r8, #0
	beq _02302BF4
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02302C00 ; =0x00000F1D
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02302BF4:
	add sp, sp, #0x74
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02302BFC: .word 0x000003E7
#ifdef JAPAN
_02302C00: .word 0x00002484
#else
_02302C00: .word 0x00000F1D
#endif
	arm_func_end LevelUpItemEffect

	arm_func_start ov29_02302C04
ov29_02302C04: ; 0x02302C04
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sb, r1
	ldr r1, [sb, #0xb4]
	mov sl, r0
	ldrb r0, [r1, #7]
	mov r8, r2
	mov r4, r3
	cmp r0, #0
	beq _02302CB8
	ldrb r1, [r1, #0xa]
	add r0, sp, #0
	bl GetUnlockedTacticFlags
	ldr r0, _02302CC0 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl sub_0204F610
	cmp r0, #0
	bne _02302CB8
	cmp r4, #0
	beq _02302CB8
	mov r7, #0
	ldr r4, _02302CC4 ; =0x00000F2A
	mov fp, r7
	mov r5, #1
	add r6, sp, #0
_02302C6C:
	ldrb r0, [r8, r7]
	cmp r0, #0
	ldreqb r0, [r6, r7]
	cmpeq r0, #1
	bne _02302CAC
	mov r0, fp
	mov r1, sb
	mov r2, fp
	bl SubstitutePlaceholderStringTags
	mov r0, r5
	and r1, r7, #0xff
	bl ov29_0234B084
	mov r0, sl
	mov r1, sb
	mov r2, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02302CAC:
	add r7, r7, #1
	cmp r7, #0xc
	blt _02302C6C
_02302CB8:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02302CC0: .word DUNGEON_PTR
#ifdef JAPAN
_02302CC4: .word 0x00002491
#else
_02302CC4: .word 0x00000F2A
#endif
	arm_func_end ov29_02302C04

	arm_func_start ov29_02302CC8
ov29_02302CC8: ; 0x02302CC8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x58
	mov sb, r0
	mov r8, r1
	mov r4, #0
	bl AllocateTemp1024ByteBufferFromPool
	mov r5, r0
	ldr r7, [sb, #0xb4]
	mov r0, sb
	mov r1, r4
	mov r2, #1
	bl TryPointCameraToMonster
	add r0, sp, #0x18
	mov r1, r7
	bl GetMonsterName
	add r1, sp, #0x18
	mov r0, sb
	str r1, [r8, #0x38]
	bl ov29_023009CC
	cmp r0, #0
	beq _02302DBC
	mov r0, sb
	mov r6, r4
	bl ov29_022FB6E4
	cmp r0, #0
	bne _02302D40
	ldrb r0, [r7, #7]
	cmp r0, #0
	moveq r6, #1
	b _02302D58
_02302D40:
	ldr r0, _02302F64 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsSpecialEpisodeDungeon
	cmp r0, #0
	movne r6, #1
_02302D58:
	cmp r6, #0
	beq _02302DEC
	mov r0, r7
	bl GetPersonalityIndex
	mov r6, r0
	ldrb r0, [r7, #0x48]
	bl ov29_0234CFA0
	mov r2, r0
	mov r0, r6
	mov r1, #3
	bl GetTalkLine
	mov r6, r0
	ldrsh r1, [r7, #4]
	add r0, sp, #8
	mov r2, #0
	bl InitPortraitDungeon
	mov r1, r6
	mov r0, r5
	bl GetStringFromFileVeneer
	mov r0, sb
	add r1, sp, #8
	mov r2, r5
	mov r3, #1
	bl ov29_0234D304
	b _02302DEC
_02302DBC:
	ldr r0, _02302F68 ; =0x00000F27
	bl StringFromId
	mov r1, r0
	mov r0, r5
	bl strcpy
	mov r2, r4
	mov r0, r5
	mov r3, r2
	str r8, [sp]
	mov r1, #1
	str r1, [sp, #4]
	bl ov29_0234D234
_02302DEC:
	mov r0, #0
	strb r0, [r5]
	ldr r0, [r8, #0x24]
	cmp r0, #0
	ble _02302E18
	ldr r0, _02302F6C ; =0x00000F18
	bl StringFromId
	mov r1, r0
	mov r0, r5
	bl strcat
	add r4, r4, #1
_02302E18:
	ldr r0, [r8, #0x28]
	cmp r0, #0
	ble _02302E5C
	ldr r0, _02302F70 ; =ov29_023527F0
	ldrb r2, [r0, r4]
	cmp r2, #0
	beq _02302E44
	ldr r1, _02302F74 ; =ov29_023535C8
	mov r0, r5
	ldr r1, [r1, r2, lsl #2]
	bl strcat
_02302E44:
#ifdef JAPAN
	mov r0, #0x2480
#else
	ldr r0, _02302F78 ; =0x00000F19
#endif
	bl StringFromId
	mov r1, r0
	mov r0, r5
	bl strcat
	add r4, r4, #1
_02302E5C:
	ldr r0, [r8, #0x2c]
	cmp r0, #0
	ble _02302EA0
	ldr r0, _02302F70 ; =ov29_023527F0
	ldrb r2, [r0, r4]
	cmp r2, #0
	beq _02302E88
	ldr r1, _02302F74 ; =ov29_023535C8
	mov r0, r5
	ldr r1, [r1, r2, lsl #2]
	bl strcat
_02302E88:
	ldr r0, _02302F7C ; =0x00000F1A
	bl StringFromId
	mov r1, r0
	mov r0, r5
	bl strcat
	add r4, r4, #1
_02302EA0:
	ldr r0, [r8, #0x30]
	cmp r0, #0
	ble _02302EE4
	ldr r0, _02302F70 ; =ov29_023527F0
	ldrb r2, [r0, r4]
	cmp r2, #0
	beq _02302ECC
	ldr r1, _02302F74 ; =ov29_023535C8
	mov r0, r5
	ldr r1, [r1, r2, lsl #2]
	bl strcat
_02302ECC:
	ldr r0, _02302F80 ; =0x00000F1B
	bl StringFromId
	mov r1, r0
	mov r0, r5
	bl strcat
	add r4, r4, #1
_02302EE4:
	ldr r0, [r8, #0x34]
	cmp r0, #0
	ble _02302F24
	ldr r0, _02302F70 ; =ov29_023527F0
	ldrb r2, [r0, r4]
	cmp r2, #0
	beq _02302F10
	ldr r1, _02302F74 ; =ov29_023535C8
	mov r0, r5
	ldr r1, [r1, r2, lsl #2]
	bl strcat
_02302F10:
	ldr r0, _02302F84 ; =0x00000F1C
	bl StringFromId
	mov r1, r0
	mov r0, r5
	bl strcat
_02302F24:
	ldrb r0, [r5]
	cmp r0, #0
	beq _02302F4C
	mov r2, #0
	mov r0, r5
	mov r3, r2
	str r8, [sp]
	mov r1, #1
	str r1, [sp, #4]
	bl ov29_0234D234
_02302F4C:
	bl GetLeader
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
	add sp, sp, #0x58
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_02302CC8_OFFSET 0x1567
#else
#define OV29_02302CC8_OFFSET 0
#endif
_02302F64: .word DUNGEON_PTR
_02302F68: .word 0x00000F27 + OV29_02302CC8_OFFSET
_02302F6C: .word 0x00000F18 + OV29_02302CC8_OFFSET
_02302F70: .word ov29_023527F0
_02302F74: .word ov29_023535C8
#ifndef JAPAN
_02302F78: .word 0x00000F19
#endif
_02302F7C: .word 0x00000F1A + OV29_02302CC8_OFFSET
_02302F80: .word 0x00000F1B + OV29_02302CC8_OFFSET
_02302F84: .word 0x00000F1C + OV29_02302CC8_OFFSET
	arm_func_end ov29_02302CC8

	arm_func_start TryDecreaseLevel
TryDecreaseLevel: ; 0x02302F88
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r7, r1
	mov r8, r0
	mov r0, r7
	mov r6, r2
	bl EntityIsValid__02302A38
	cmp r0, #0
	beq _02303030
	ldr r5, [r7, #0xb4]
	mov r4, #0
	mov r0, r5
	bl IsExperienceLocked
	cmp r0, #0
	bne _02303000
	ldrb r0, [r5, #0xa]
	sub r2, r0, r6
	cmp r2, #1
	movlt r2, #1
	cmp r2, r0
	beq _02303000
	ldrsh r1, [r5, #2]
	add r0, sp, #0
	bl GetLvlUpEntry
	ldr r2, [sp]
	mov r0, r8
	mov r1, r7
	str r2, [r5, #0x20]
	bl ov29_02303284
	orr r4, r4, r0
_02303000:
	mov r0, #0
#ifdef JAPAN
	str r0, [r5, #0x210]
	strb r0, [r5, #0x14f]
#else
	str r0, [r5, #0x214]
	strb r0, [r5, #0x153]
#endif
	cmp r4, #0
	bne _02303030
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02303038 ; =0x00000F1E
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02303030:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_02303038: .word 0x00002485
#else
_02303038: .word 0x00000F1E
#endif
	arm_func_end TryDecreaseLevel

	arm_func_start LevelUp
LevelUp: ; 0x0230303C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r1
	str r0, [sp, #4]
	mov r0, sl
	mov r6, #0
	mov sb, r2
	str r3, [sp, #8]
	bl EntityIsValid__02302A38
	cmp r0, #0
	moveq r0, r6
	beq _02303268
	ldr r7, [sl, #0xb4]
	mov r0, r7
	ldrsh fp, [r7, #2]
	ldr r8, [r7, #0x20]
	bl IsExperienceLocked
	cmp r0, #0
	movne r0, r6
	bne _02303268
	ldrb r0, [r7, #0xa]
	ldr r4, _02303270 ; =ov29_0237C9C4
	add r5, r0, #1
	b _0230325C
_0230309C:
	add r0, sp, #0xc
	mov r1, fp
	mov r2, r5
	bl GetLvlUpEntry
	ldr r0, [sp, #0xc]
	cmp r0, r8
	bgt _02303264
	strb r5, [r7, #0xa]
	str r8, [r7, #0x20]
	cmp sb, #0
	beq _02303160
	ldrb r0, [r7, #6]
	cmp r0, #0
	bne _02303124
	mov r0, sl
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
	cmp r6, #0
	bne _023030F0
	bl ov29_022EAC7C
_023030F0:
	mov r0, #0
	mov r1, r5
	bl ov29_0234B09C
	bl ov29_0234B034
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
#ifdef JAPAN
	ldr r1, _023047C0 ; =0x00002487
	mov r0, sl
#else
	mov r0, sl
	mov r1, #0xf20
#endif
	bl ov29_0234D484
	b _02303160
_02303124:
	cmp r6, #0
	bne _02303130
	bl ov29_022EAC7C
_02303130:
	mov r0, #0
	mov r1, r5
	bl ov29_0234B09C
	bl ov29_0234B034
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
#ifdef JAPAN
	ldr r1, _023047C0 ; =0x00002487
	mov r0, sl
#else
	mov r0, sl
	mov r1, #0xf20
#endif
	bl LogMessageByIdWithPopup
_02303160:
	ldrh r1, [sp, #0x10]
	add r0, r7, #0x12
	mov r6, #1
	bl sub_02054FB8
	ldrsh r1, [r7, #0x10]
	ldrh r0, [sp, #0x10]
	add r0, r1, r0
	strh r0, [r7, #0x10]
	ldrsh r1, [r7, #0x12]
	ldrsh r0, [r7, #0x16]
	add r2, r1, r0
	ldr r0, _02303274 ; =0x000003E7
	cmp r2, r0
	movgt r1, r0
	ldrsh r0, [r7, #0x10]
	movle r1, r2
	cmp r0, r1
	blt _023031B8
	ldr r0, _02303274 ; =0x000003E7
	cmp r2, r0
	movgt r2, r0
	strh r2, [r7, #0x10]
_023031B8:
	ldr r0, _02303278 ; =ov29_0237C9C8
	ldrb r2, [r7, #0x1a]
	mov r1, r0
	strb r2, [r1]
	ldrb r2, [r7, #0x1b]
	strb r2, [r1, #1]
	ldrb r1, [r7, #0x1c]
	strb r1, [r4]
	ldrb r1, [r7, #0x1d]
	strb r1, [r4, #1]
	ldrb r1, [sp, #0x12]
	bl sub_02054FEC
	ldrb r1, [sp, #0x13]
	ldr r0, _0230327C ; =ov29_0237C9C9
	bl sub_02054FEC
	ldrb r1, [sp, #0x14]
	mov r0, r4
	bl sub_02055020
	ldrb r1, [sp, #0x15]
	ldr r0, _02303280 ; =ov29_0237C9C5
	bl sub_02055020
	mov r0, sl
	bl ov29_023021F0
	mov r0, sl
	bl ov29_02318D58
	ldr r0, _02303278 ; =ov29_0237C9C8
	mov r1, sl
	ldrb r2, [r0]
	ldr r0, [sp, #4]
	strb r2, [r7, #0x1a]
	ldr r2, _02303278 ; =ov29_0237C9C8
	ldr r3, [sp, #8]
	ldrb ip, [r2, #1]
	mov r2, sb
	strb ip, [r7, #0x1b]
	ldrb ip, [r4]
	strb ip, [r7, #0x1c]
	ldrb ip, [r4, #1]
	strb ip, [r7, #0x1d]
	bl ov29_023034E0
	add r5, r5, #1
_0230325C:
	cmp r5, #0x64
	ble _0230309C
_02303264:
	mov r0, r6
_02303268:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02303270: .word ov29_0237C9C4
#ifdef JAPAN
_023047C0: .word 0x00002487
#endif
_02303274: .word 0x000003E7
_02303278: .word ov29_0237C9C8
_0230327C: .word ov29_0237C9C9
_02303280: .word ov29_0237C9C5
	arm_func_end LevelUp

	arm_func_start ov29_02303284
ov29_02303284: ; 0x02303284
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov sl, r1
	str r0, [sp, #4]
	mov r0, sl
	bl EntityIsValid__02302A38
	cmp r0, #0
	moveq r0, #0
	beq _023034BC
	ldr r7, [sl, #0xb4]
	mov r0, r7
	ldrsh r5, [r7, #2]
	ldr r8, [r7, #0x20]
	ldrb r6, [r7, #0xa]
	bl IsExperienceLocked
	cmp r0, #0
	movne r0, #0
	bne _023034BC
	mov sb, #1
	add r4, sp, #8
	b _023032F8
_023032D8:
	mov r0, r4
	mov r1, r5
	mov r2, sb
	bl GetLvlUpEntry
	ldr r0, [sp, #8]
	cmp r0, r8
	bge _02303304
	add sb, sb, #1
_023032F8:
	ldrb r0, [r7, #0xa]
	cmp sb, r0
	blt _023032D8
_02303304:
	sub r4, sb, #1
	ldrb sb, [r7, #0xa]
	ldr fp, _023034C4 ; =ov29_0237C9C4
	b _02303450
_02303314:
	cmp sb, #0x64
	strge r8, [r7, #0x20]
	bge _0230333C
	add r0, sp, #8
	mov r1, r5
	add r2, sb, #1
	bl GetLvlUpEntry
	ldr r0, [sp, #8]
	sub r0, r0, #1
	str r0, [r7, #0x20]
_0230333C:
	cmp r6, sb
	ble _0230344C
	add r0, sp, #8
	mov r1, r5
	add r2, sb, #1
	bl GetLvlUpEntry
	strb sb, [r7, #0xa]
	ldrh r1, [sp, #0xc]
	add r0, r7, #0x10
	rsb r1, r1, #0
	bl sub_02054FB8
	ldrh r1, [sp, #0xc]
	add r0, r7, #0x12
	rsb r1, r1, #0
	bl sub_02054FB8
	ldrsh r1, [r7, #0x12]
	ldrsh r0, [r7, #0x16]
	add r2, r1, r0
	ldr r0, _023034C8 ; =0x000003E7
	cmp r2, r0
	movgt r1, r0
	ldrsh r0, [r7, #0x10]
	movle r1, r2
	cmp r0, r1
	blt _023033B0
	ldr r0, _023034C8 ; =0x000003E7
	cmp r2, r0
	movgt r2, r0
	strh r2, [r7, #0x10]
_023033B0:
	ldr r0, _023034CC ; =ov29_0237C9C8
	ldrb r2, [r7, #0x1a]
	mov r1, r0
	strb r2, [r1]
	ldrb r2, [r7, #0x1b]
	strb r2, [r1, #1]
	ldrb r1, [r7, #0x1c]
	strb r1, [fp]
	ldrb r1, [r7, #0x1d]
	strb r1, [fp, #1]
	ldrb r1, [sp, #0xe]
	rsb r1, r1, #0
	bl sub_02054FEC
	ldrb r1, [sp, #0xf]
	ldr r0, _023034D0 ; =ov29_0237C9C9
	rsb r1, r1, #0
	bl sub_02054FEC
	ldrb r1, [sp, #0x10]
	mov r0, fp
	rsb r1, r1, #0
	bl sub_02055020
	ldrb r1, [sp, #0x11]
	ldr r0, _023034D4 ; =ov29_0237C9C5
	rsb r1, r1, #0
	bl sub_02055020
	mov r0, sl
	bl ov29_023021F0
	mov r0, sl
	bl ov29_02318D58
	ldr r0, _023034CC ; =ov29_0237C9C8
	ldrb r0, [r0]
	strb r0, [r7, #0x1a]
	ldr r0, _023034CC ; =ov29_0237C9C8
	ldrb r0, [r0, #1]
	strb r0, [r7, #0x1b]
	ldrb r0, [fp]
	strb r0, [r7, #0x1c]
	ldrb r0, [fp, #1]
	strb r0, [r7, #0x1d]
_0230344C:
	sub sb, sb, #1
_02303450:
	cmp sb, r4
	bgt _02303314
	bl ov29_0234B034
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
	ldrb r1, [r7, #0xa]
	cmp r1, r6
	bne _02303494
	ldr r2, _023034D8 ; =0x00000F22
	ldr r0, [sp, #4]
	mov r1, sl
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _023034BC
_02303494:
	mov r0, #0
	bl ov29_0234B09C
	mov r0, sl
	mov r1, #0x204
	bl ov29_022E56A0
	ldr r2, _023034DC ; =0x00000F21
	ldr r0, [sp, #4]
	mov r1, sl
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
_023034BC:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023034C4: .word ov29_0237C9C4
_023034C8: .word 0x000003E7
_023034CC: .word ov29_0237C9C8
_023034D0: .word ov29_0237C9C9
_023034D4: .word ov29_0237C9C5
#ifdef JAPAN
_023034D8: .word 0x00002489
_023034DC: .word 0x00002488
#else
_023034D8: .word 0x00000F22
_023034DC: .word 0x00000F21
#endif
	arm_func_end ov29_02303284

	arm_func_start ov29_023034E0
ov29_023034E0: ; 0x023034E0
#ifdef JAPAN
#define OV29_023034E0_OFFSET -4
#else
#define OV29_023034E0_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x78
	mov sb, r1
	ldr r5, [sb, #0xb4]
	mov r4, #0
	ldrb r0, [r5, #6]
	mov r8, r2
	mov fp, r4
	str r3, [sp, #8]
	cmp r0, #0
	str r4, [sp, #0xc]
	add r0, r5, #0x4a
	strne r4, [sp, #8]
	movne r8, r4
	bl ov29_022EBCE8
	mov sl, #0
	mov r6, r0
	mvn r0, #0
	cmp r6, r0
	addne r0, r5, r6, lsl #3
	addne r0, r0, #0x100
	ldrneh r7, [r0, #0x28 + OV29_023034E0_OFFSET]
	mov ip, sl
	mov lr, sl
	moveq r7, #0
	mov r3, #1
	add r0, sp, #0x10
_0230354C:
	add r1, r5, ip, lsl #3
	ldrb r1, [r1, #0x124 + OV29_023034E0_OFFSET]
	tst r1, #1
	movne r1, r3
	moveq r1, lr
	tst r1, #0xff
	beq _02303588
	add r1, r5, ip, lsl #3
	add r1, r1, #0x100
	ldrh r2, [r1, #0x28 + OV29_023034E0_OFFSET]
	mov r1, sl, lsl #1
	add sl, sl, #1
	strh r2, [r0, r1]
	mov r1, sl, lsl #0x10
	mov sl, r1, asr #0x10
_02303588:
	add r1, ip, #1
	mov r1, r1, lsl #0x10
	mov ip, r1, asr #0x10
	cmp ip, #4
	blt _0230354C
	mov r2, sl
	mov r3, #0
	add r1, sp, #0x10
	b _023035C0
_023035AC:
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r2, lsl #1
	strh r3, [r1, r2]
	mov r2, r0, asr #0x10
_023035C0:
	cmp r2, #4
	blt _023035AC
	add r1, sp, #0x10
	stmia sp, {r1, sl}
	ldrsh r1, [r5, #2]
	ldrb r2, [r5, #0xa]
	ldrsh r3, [r5, #0xe]
	add r0, sp, #0x58
	bl sub_02053904
	mov sl, r0
	add r0, sp, #0x18
	add r1, r5, #0x124 + OV29_023034E0_OFFSET
	bl sub_020149C0
	cmp sl, #0
	beq _02303670
	mov r0, sl
	bl DungeonRandInt
	mov sl, #0
	add ip, sp, #0x18
	mov r1, sl
	mov r2, #1
	b _02303668
_02303618:
	ldrb r3, [ip, sl, lsl #3]
	tst r3, #1
	movne r3, r2
	moveq r3, r1
	tst r3, #0xff
	bne _02303664
	add r1, sp, #0x58
	mov r0, r0, lsl #1
	ldrh r2, [r1, r0]
	add r3, sp, #0x18
	mov r0, sb
	add r1, r3, sl, lsl #3
	bl ov29_0231EA04
	add r2, sp, #0x1a
	mov r1, sl, lsl #3
	ldrh r0, [r2, r1]
	orr r0, r0, #4
	strh r0, [r2, r1]
	b _02303670
_02303664:
	add sl, sl, #1
_02303668:
	cmp sl, #8
	blt _02303618
_02303670:
	add sl, sp, #0x18
_02303674:
	mov lr, #0
	mov r1, lr
_0230367C:
	ldrb r0, [sl, r1, lsl #3]
	add r1, r1, #1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addne lr, lr, #1
	cmp r1, #8
	blt _0230367C
	cmp lr, #4
	bgt _02303770
	mov sl, #0
	mov ip, sl
	b _023036FC
_023036B4:
	add r1, r5, ip, lsl #3
	add r0, sp, #0x18
	add r2, r1, #0x124 + OV29_023034E0_OFFSET
	add r3, r0, ip, lsl #3
	mov r1, #4
_023036C8:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _023036C8
	add r0, r5, ip, lsl #3
	add r0, r0, #0x100
	ldrh r1, [r0, #0x26 + OV29_023034E0_OFFSET]
	add ip, ip, #1
	tst r1, #4
	bicne r1, r1, #4
	strneh r1, [r0, #0x26 + OV29_023034E0_OFFSET]
	ldrneh r4, [r0, #0x28 + OV29_023034E0_OFFSET]
	movne sl, #1
_023036FC:
	cmp ip, lr
	blt _023036B4
	mov r1, #0
	b _02303718
_0230370C:
	add r0, r5, ip, lsl #3
	strb r1, [r0, #0x124 + OV29_023034E0_OFFSET]
	add ip, ip, #1
_02303718:
	cmp ip, #4
	blt _0230370C
	cmp sl, #0
	cmpne r8, #0
	beq _02303818
	bl ov29_0234B034
	mov r1, #0
	mov r2, r5
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
	mov r1, r4
	mov r0, #0
	bl ov29_0234B084
	ldr r1, _023038C4 ; =0x0000131B
	mov r0, sb
	bl ov29_022E56A0
	ldr r1, _023038C8 ; =0x00000F23
	mov r0, sb
	bl ov29_0234D484
	mov fp, #1
	b _02303818
_02303770:
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _02303808
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02303808
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _023037E8
	cmp r8, #0
	beq _023037E8
	mov r0, #0xa
	mov r1, #6
	bl ov29_022EA370
	ldrsh r1, [r5, #2]
	ldr r0, _023038CC ; =0xFFFFFE5E
	mov r2, #1
	add r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	mov r0, #0
	ldr r1, _023038D0 ; =0x00000F25
	bhi _023037E4
	add r1, r1, #1
	bl DisplayMessage2
	b _023037E8
_023037E4:
	bl DisplayMessage2
_023037E8:
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, sb
	mov r1, sl
	mov r2, #1
	mov r3, #0
	bl ov29_0234FAEC
	b _02303674
_02303808:
	mov r0, sb
	mov r1, sl
	bl ov29_02303BEC
	b _02303674
_02303818:
	cmp fp, #0
	cmpne r7, #0
	mvnne r0, #0
	cmpne r6, r0
	beq _023038BC
	mov r2, #0
	mov r4, r6
	mov r0, r2
	mov r1, #1
	b _0230389C
_02303840:
	add r3, r5, r4, lsl #3
	ldrb r3, [r3, #0x124 + OV29_023034E0_OFFSET]
	tst r3, #1
	movne r3, r1
	moveq r3, r0
	tst r3, #0xff
	beq _02303870
	add r3, r5, r4, lsl #3
	add r3, r3, #0x100
	ldrh r3, [r3, #0x28 + OV29_023034E0_OFFSET]
	cmp r7, r3
	beq _023038A4
_02303870:
	add r3, r4, #1
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	mov r4, r3, lsr #0x1f
	rsb r3, r4, r3, lsl #30
	add r4, r4, r3, ror #30
	add r3, r2, #1
	mov r2, r4, lsl #0x10
	mov r3, r3, lsl #0x10
	mov r4, r2, asr #0x10
	mov r2, r3, asr #0x10
_0230389C:
	cmp r2, #4
	blt _02303840
_023038A4:
	cmp r2, #4
	beq _023038B4
	cmp r4, r6
	beq _023038BC
_023038B4:
	mov r0, #1
	strb r0, [r5, #0x23e + OV29_023034E0_OFFSET]
_023038BC:
	add sp, sp, #0x78
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023038C4: .word 0x0000131B
#ifdef JAPAN
_023038C8: .word 0x0000248A
_023038CC: .word 0xFFFFFE5E
_023038D0: .word 0x0000248C
#else
_023038C8: .word 0x00000F23
_023038CC: .word 0xFFFFFE5E
_023038D0: .word 0x00000F25
#endif
	arm_func_end ov29_023034E0

	arm_func_start ov29_023038D4
ov29_023038D4: ; 0x023038D4
#ifdef JAPAN
#define OV29_023038D4_OFFSET -4
#else
#define OV29_023038D4_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xa4
	mov sl, r0
	ldr r8, [sl, #0xb4]
	mov r6, r1
	mov r5, #0
	add r0, sp, #0
	add r1, r8, #0x124 + OV29_023038D4_OFFSET
	mov r7, r5
	bl sub_020149C0
	mov r4, r5
	add r3, sp, #0
	mov r0, r5
	mov r1, #1
	b _02303958
_02303910:
	ldrb r2, [r3, r4, lsl #3]
	tst r2, #1
	movne r2, r1
	moveq r2, r0
	tst r2, #0xff
	bne _02303954
	add r1, sp, #0
	mov r0, sl
	mov r2, r6
	add r1, r1, r4, lsl #3
	bl ov29_0231EA04
	add r2, sp, #2
	mov r1, r4, lsl #3
	ldrh r0, [r2, r1]
	orr r0, r0, #4
	strh r0, [r2, r1]
	b _02303960
_02303954:
	add r4, r4, #1
_02303958:
	cmp r4, #8
	blt _02303910
_02303960:
	mov sb, #0
	mov fp, #1
	add r4, sp, #0
	b _02303AC8
_02303970:
	mov r6, #0
	mov r1, r6
_02303978:
	ldrb r0, [r4, r1, lsl #3]
	add r1, r1, #1
	tst r0, #1
	movne r0, fp
	moveq r0, #0
	tst r0, #0xff
	addne r6, r6, #1
	cmp r1, #8
	blt _02303978
	cmp r6, #4
	bgt _02303A84
	mov sb, #0
	add r4, r8, #0x124 + OV29_023038D4_OFFSET
	add fp, sp, #0
	b _02303A14
_023039B4:
	add r0, r8, sb, lsl #3
	add r3, fp, sb, lsl #3
	add r2, r0, #0x124 + OV29_023038D4_OFFSET
	mov r1, #4
_023039C4:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _023039C4
	add r0, r8, sb, lsl #3
	add r3, r0, #0x100
	ldrh r0, [r3, #0x26 + OV29_023038D4_OFFSET]
	tst r0, #4
	beq _02303A10
	bic r5, r0, #4
	add r0, sp, #0x40
	mov r2, #0
	add r1, r4, sb, lsl #3
	strh r5, [r3, #0x26 + OV29_023038D4_OFFSET]
	bl FormatMoveString
	add r0, r8, sb, lsl #3
	add r0, r0, #0x100
	ldrh r5, [r0, #0x28 + OV29_023038D4_OFFSET]
	mov r7, #1
_02303A10:
	add sb, sb, #1
_02303A14:
	cmp sb, r6
	blt _023039B4
	mov r1, #0
	b _02303A30
_02303A24:
	add r0, r8, sb, lsl #3
	strb r1, [r0, #0x124 + OV29_023038D4_OFFSET]
	add sb, sb, #1
_02303A30:
	cmp sb, #4
	blt _02303A24
	cmp r7, #0
	beq _02303AD0
	ldrb r0, [r8, #6]
	cmp r0, #0
	bne _02303AD0
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r5
	mov r0, #0
	bl ov29_0234B084
	ldr r1, _02303B08 ; =0x0000131B
	mov r0, sl
	bl ov29_022E56A0
	ldr r1, _02303B0C ; =0x00000F23
	mov r0, sl
	bl ov29_0234D484
	b _02303AD0
_02303A84:
	ldrb r0, [r8, #6]
	mov r7, #0
	cmp r0, #0
	bne _02303AC4
	ldr r1, _02303B10 ; =0x00000F28
	mov r0, r7
	mov r2, #1
	bl DisplayMessage
	mov r2, #1
	mov r0, sl
	mov r1, r4
	mov r3, r2
	bl ov29_0234FAEC
	cmp r0, #0
	moveq r0, r7
	beq _02303B00
_02303AC4:
	add sb, sb, #1
_02303AC8:
	cmp sb, #0x1e
	blt _02303970
_02303AD0:
	cmp r7, #0
	ldreqb r0, [r8, #6]
	cmpeq r0, #0
	bne _02303AFC
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02303B14 ; =0x00000F24
	mov r0, sl
	bl ov29_0234D484
_02303AFC:
	mov r0, #1
_02303B00:
	add sp, sp, #0xa4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02303B08: .word 0x0000131B
#ifdef JAPAN
_02303B0C: .word 0x0000248A
_02303B10: .word 0x0000248F
_02303B14: .word 0x0000248B
#else
_02303B0C: .word 0x00000F23
_02303B10: .word 0x00000F28
_02303B14: .word 0x00000F24
#endif
	arm_func_end ov29_023038D4

	arm_func_start GetMonsterMoves
GetMonsterMoves: ; 0x02303B18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov sb, r2
	mov r2, #0
	mov sl, r0
	mov r8, r2
_02303B30:
	mov r0, r2, lsl #1
	add r2, r2, #1
	strh r8, [sl, r0]
	cmp r2, #4
	blt _02303B30
	mov r0, r1
	bl GetMovesetLevelUpPtr
	mov r7, r0
	add r6, sp, #0
	mov r5, #0
	mov r4, #4
	b _02303BD8
_02303B60:
	mov r0, r7
	mov r1, r6
	bl GetEncodedHalfword
	ldrb r1, [r0]
	add r7, r0, #1
	cmp r1, sb
	bgt _02303BE4
	mov r1, r5
	ldrh r2, [sp]
	b _02303BA4
_02303B88:
	mov r0, r1, lsl #1
	ldrh r0, [sl, r0]
	cmp r2, r0
	beq _02303BAC
	add r0, r1, #1
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
_02303BA4:
	cmp r1, #4
	blt _02303B88
_02303BAC:
	cmp r1, #4
	bne _02303BD8
	cmp r8, #4
	movne r0, r8
	addne r8, r8, #1
	bne _02303BCC
	mov r0, r4
	bl DungeonRandInt
_02303BCC:
	ldrh r1, [sp]
	mov r0, r0, lsl #1
	strh r1, [sl, r0]
_02303BD8:
	ldrb r0, [r7]
	cmp r0, #0
	bne _02303B60
_02303BE4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end GetMonsterMoves

	arm_func_start ov29_02303BEC
ov29_02303BEC: ; 0x02303BEC
	stmdb sp!, {r4, lr}
	mov r0, #0
	mov r4, r1
	mov ip, r0
	mov r2, r0
	mov r3, #1
_02303C04:
	ldrb r1, [r4, ip, lsl #3]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	ldrneb r1, [r4, ip, lsl #3]
	addne r0, r0, #1
	bicne r1, r1, #2
	strneb r1, [r4, ip, lsl #3]
	add ip, ip, #1
	cmp ip, #8
	blt _02303C04
	bl DungeonRandInt
	add r1, r4, r0, lsl #3
	ldrh lr, [r1, #4]
	b _02303C64
_02303C44:
	add ip, r4, r0, lsl #3
	add r3, ip, #8
	mov r2, #4
_02303C50:
	ldrh r1, [r3], #2
	subs r2, r2, #1
	strh r1, [ip], #2
	bne _02303C50
	add r0, r0, #1
_02303C64:
	cmp r0, #7
	blt _02303C44
	mov r1, #0
	mov r0, lr
	strb r1, [r4, #0x38]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02303BEC

	arm_func_start EvolveMonster
EvolveMonster: ; 0x02303C7C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x20
	mov r7, r1
	ldr r6, [r7, #0xb4]
	mov r8, r0
	mov r5, r2
	bl ov29_0234B034
	mov r1, #0
	mov r2, r6
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
	mov r1, r5
	mov r0, #1
	bl ov29_0234B06C
	mov r0, r5
	bl DungeonGetSpriteIndex
	strh r5, [r6, #4]
	strh r5, [r6, #2]
	mov r4, r0
	ldrb r2, [r6, #0xa]
	add r0, sp, #0x14
	mov r1, r5
	bl GetLvlUpEntry
	ldr r1, [sp, #0x14]
	mov r0, r6
	str r1, [r6, #0x20]
	mov r1, #0
	strh r4, [r7, #0xa8]
	bl SubInitMonster
	mov r0, r7
	bl SetMonsterTypeAndAbility
	mov r0, r7
	mov r1, #7
	bl ov29_02304830
	ldr r2, _02303DFC ; =0x00000F29
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r7
	bl ov29_022E6724
	bl ov29_022EAC9C
	ldr r0, _02303E00 ; =0x0000013F
	cmp r5, r0
	addne r0, r0, #0x258
	cmpne r5, r0
	bne _02303DF4
	mov r5, #0
	ldr r4, _02303E04 ; =DIRECTIONS_XY
	mov r8, #0x140
	b _02303D84
_02303D48:
	mov r1, r5, lsl #2
	add r0, r4, r5, lsl #2
	ldrsh ip, [r7, #4]
	ldrsh r3, [r4, r1]
	ldrsh r2, [r7, #6]
	ldrsh r1, [r0, #2]
	add r0, ip, r3
	add r1, r2, r1
	bl GetTile
	mov r1, r0
	mov r0, r8
	bl IsInvalidSpawnTile
	cmp r0, #0
	beq _02303D8C
	add r5, r5, #1
_02303D84:
	cmp r5, #8
	blt _02303D48
_02303D8C:
	mov r0, #0x140
	bl IsOnMonsterSpawnList
	cmp r0, #0
	beq _02303DF4
	mov r0, #0x140
	strh r0, [sp, #4]
	ldrb r1, [r6, #0xa]
	mov r2, #0
	ldr r0, _02303E04 ; =DIRECTIONS_XY
	mov r5, r5, lsl #2
	strh r1, [sp, #0xc]
	strb r2, [sp, #6]
	ldrsh r3, [r0, r5]
	ldrsh r4, [r7, #4]
	ldr r1, _02303E08 ; =DIRECTIONS_XY + 2
	add r0, sp, #4
	add r3, r4, r3
	strh r3, [sp, #0xe]
	ldrsh r4, [r7, #6]
	ldrsh r3, [r1, r5]
	mov r1, #1
	str r2, [sp, #8]
	add r3, r4, r3
	strh r3, [sp, #0x10]
	strb r2, [sp, #0x12]
	bl SpawnMonster
_02303DF4:
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_02303DFC: .word 0x00002490
#else
_02303DFC: .word 0x00000F29
#endif
_02303E00: .word 0x0000013F
_02303E04: .word DIRECTIONS_XY
_02303E08: .word DIRECTIONS_XY + 2
	arm_func_end EvolveMonster

	arm_func_start ov29_02303E0C
ov29_02303E0C: ; 0x02303E0C
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0xbc]
	cmp r1, #1
	cmpne r1, #2
	cmpne r1, #3
	cmpne r1, #0xb
	cmpne r1, #0xc
	cmpne r1, #0xd
	cmpne r1, #0xe
	beq _02303E4C
	cmp r1, #4
	bne _02303E54
	ldrsh r0, [r0, #2]
	bl NeedsItemToSpawn
	cmp r0, #0
	beq _02303E54
_02303E4C:
	mov r0, #1
	ldmia sp!, {r3, pc}
_02303E54:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02303E0C

	arm_func_start ov29_02303E5C
ov29_02303E5C: ; 0x02303E5C
	stmdb sp!, {r3, r4, r5, lr}
	mvn r4, #0x1f
	cmp r3, r4
	ldrgtsh ip, [sp, #0x10]
	cmpgt ip, r4
	ldmleia sp!, {r3, r4, r5, pc}
	rsb lr, r4, #0xff
	cmp r3, lr
	cmplt ip, #0xe0
	ldmgeia sp!, {r3, r4, r5, pc}
	cmp r1, #6
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r5, _02303F0C ; =ov29_0237C888
	mov lr, #0x48
	smlabb r5, r2, lr, r5
	mov r2, #0xc
	mla r1, r2, r1, r5
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh lr, [r1, #2]
	ldrsh r5, [r1, #8]
	sub r0, r2, #0x20c
	and r0, lr, r0
	strh r0, [r1, #2]
	ldrh r2, [r1, #2]
	add r0, r3, r5
	and r0, r0, r4, lsr #23
	orr r0, r2, r0
	strh r0, [r1, #2]
	ldrh r3, [r1, #6]
	ldrsh r4, [r1, #0xa]
	ldr r0, _02303F10 ; =0xFFFF000F
	ldr r2, _02303F14 ; =_020AFC4C
	and r0, r3, r0
	strh r0, [r1, #6]
	add r0, ip, r4
	ldrh r4, [r1, #6]
	mov r3, r0, lsl #0x14
	ldr r0, [r2]
	orr r3, r4, r3, lsr #16
	mov r2, #0
	strh r3, [r1, #6]
	bl sub_0201B9F8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02303F0C: .word ov29_0237C888
_02303F10: .word 0xFFFF000F
_02303F14: .word _020AFC4C
	arm_func_end ov29_02303E5C

	arm_func_start ov29_02303F18
ov29_02303F18: ; 0x02303F18
#ifdef JAPAN
#define OV29_02303F18_OFFSET -4
#define OV29_02303F18_OFFSET_2 -0xA4
#else
#define OV29_02303F18_OFFSET 0
#define OV29_02303F18_OFFSET_2 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x38
	ldr r1, _023046C8 ; =DUNGEON_PTR
	mov r7, r0
	ldr r0, [r1]
	ldr r5, [r7, #0xb4]
	add r0, r0, #0x1a000
	ldr r1, [r0, #0x22c + OV29_02303F18_OFFSET_2]
	cmp r1, r7
	moveq r4, #0
	ldrneb r4, [r0, #0x245 + OV29_02303F18_OFFSET_2]
	ldrb r0, [r5, #0xd8]
	ldrb r1, [r7, #0xaf]
	cmp r0, #2
	ldrb r0, [r7, #0xae]
	moveq r4, #1
	cmp r1, r0
	ldreqb r1, [r7, #0xb1]
	ldreqb r0, [r7, #0xb0]
	cmpeq r1, r0
	ldreqb r0, [r7, #0xb3]
	cmpeq r0, #0
	bne _02304044
	add r0, r7, #0x2c
	mov r6, #0
	bl sub_0201D1B0
	cmp r0, #0
	moveq r6, #1
	cmp r6, #0
	beq _02304044
	mov r0, r7
	bl GetIdleAnimationId
	mov r3, #1
	strb r3, [r7, #0x21]
#ifdef JAPAN
	ldrb r1, [r5, #0x109]
#else
	ldrb r1, [r5, #0x10a]
#endif
	cmp r1, #0x63
	bne _02303FF4
	ldrb r6, [r7, #0xaf]
	cmp r6, #0xd
	bhs _02303FF0
	ldrb r1, [r5, #0xd2]
	cmp r1, #1
	moveq r3, #2
	beq _02303FD4
	ldrb r1, [r7, #0x23]
	cmp r1, #3
	movlo r3, #0
_02303FD4:
	ldr r2, _023046CC ; =ov29_02352810
	mov r1, #0xd
	mla r1, r3, r1, r2
	ldrb r1, [r6, r1]
	cmp r1, #7
	moveq r1, r0
	b _02303FF4
_02303FF0:
	mov r1, #0x63
_02303FF4:
	cmp r1, #0x63
	beq _02304044
	strb r1, [r7, #0xae]
	mov r1, #0
	strb r1, [r7, #0x28]
	ldrb r2, [r7, #0xb1]
	mov r1, #1
	and r2, r2, #7
	strb r2, [r7, #0xb0]
	strb r1, [r7, #0xb3]
	ldrb r1, [r5, #0x23d + OV29_02303F18_OFFSET]
	cmp r1, #0
	ldreqb r1, [r7, #0xae]
	cmpeq r1, #6
	ldreqb r1, [r7, #0xb2]
	addeq r2, r1, #1
	andeq r1, r2, #0xff
	streqb r2, [r7, #0xb2]
	cmpeq r1, #0x10
	streqb r0, [r7, #0xae]
_02304044:
	ldrh r0, [r7, #0x2e]
	orr r0, r0, #0x10
	strh r0, [r7, #0x2e]
	ldrb r2, [r7, #0xae]
	ldrb r0, [r7, #0xaf]
	cmp r0, r2
	ldreqb r1, [r7, #0xb1]
	ldreqb r0, [r7, #0xb0]
	cmpeq r1, r0
	ldreqb r0, [r7, #0xb3]
	cmpeq r0, #0
	beq _023041F4
	strb r2, [r7, #0xaf]
	ldrb r1, [r7, #0xb0]
	mov r0, #0
	strb r1, [r7, #0xb1]
	strb r0, [r7, #0xb3]
	ldrb r0, [r7, #0x28]
	cmp r0, #0
	movne r6, #2
	ldreqsh r6, [r7, #0xac]
	cmp r4, #0
	bne _0230414C
	cmp r0, #0
	beq _023040EC
	bl GetLoadedAttackSpriteId
	mov r1, r0
	add r0, r7, #0x2c
	bl SetSpriteIdForAnimationControl
	bl Rand16Bit
	mov r1, r6, lsl #0x10
	mov r3, r1, asr #0x10
	mov r1, #0
	str r1, [sp]
	and r0, r0, #3
	stmib sp, {r0, r1}
	str r1, [sp, #0xc]
	ldrb r1, [r7, #0xae]
	ldrb r2, [r7, #0xb0]
	add r0, r7, #0x2c
	bl SetAndPlayAnimationForAnimationControl
	b _023041E4
_023040EC:
	ldrsh r1, [r7, #0xa8]
	add r0, r7, #0x2c
	bl SetSpriteIdForAnimationControl
	bl Rand16Bit
	ldrb r1, [r7, #0xaa]
	and r0, r0, #3
	mov r3, r6, lsl #0x10
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldrb r1, [r7, #0xae]
	ldrb r2, [r7, #0xb0]
	add r0, r7, #0x2c
	mov r3, r3, asr #0x10
	bl SetAndPlayAnimationForAnimationControl
	ldrb r0, [r5, #0x171 + OV29_02303F18_OFFSET]
	cmp r0, #0
	beq _023041E4
	add r0, r7, #0x2c
	mov r1, #1
	bl sub_0201D198
	b _023041E4
_0230414C:
	cmp r0, #0
	beq _02304198
	bl GetLoadedAttackSpriteId
	mov r1, r0
	add r0, r7, #0x2c
	bl SetSpriteIdForAnimationControl
	bl Rand16Bit
	mov r1, r6, lsl #0x10
	mov r3, r1, asr #0x10
	mov r1, #0
	str r1, [sp]
	and r0, r0, #3
	stmib sp, {r0, r1}
	str r1, [sp, #0xc]
	ldrb r1, [r7, #0xae]
	ldrb r2, [r7, #0xb0]
	add r0, r7, #0x2c
	bl SetAndPlayAnimationForAnimationControl
	b _023041E4
_02304198:
	ldr r0, _023046D0 ; =0x00000229
	bl DungeonGetSpriteIndex
	mov r1, r0
	add r0, r7, #0x2c
	bl SetSpriteIdForAnimationControl
	bl Rand16Bit
	mov r1, r6, lsl #0x10
	mov r3, r1, asr #0x10
	ldrb r2, [r7, #0xaa]
	and r1, r0, #3
	mov r0, #0
	str r2, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r7, #0x2c
	ldrb r1, [r7, #0xae]
	ldrb r2, [r7, #0xb0]
	bl SetAndPlayAnimationForAnimationControl
_023041E4:
	ldrb r0, [r7, #0xae]
	cmp r0, #6
	movne r0, #0
	strneb r0, [r7, #0xb2]
_023041F4:
	ldr r1, [r7, #0xc]
	ldr r0, [r7, #0x14]
	cmp r1, r0
	ldreq r1, [r7, #0x10]
	ldreq r0, [r7, #0x18]
	cmpeq r1, r0
	bne _02304224
	ldrb r0, [r7, #0x23]
	cmp r0, #0xa
	addlo r0, r0, #1
	strlob r0, [r7, #0x23]
	b _0230422C
_02304224:
	mov r0, #0
	strb r0, [r7, #0x23]
_0230422C:
	ldr r1, [r7, #0xc]
	ldr r0, _023046D4 ; =0x0001A224
	str r1, [r7, #0x14]
	ldr r2, [r7, #0x10]
	ldr r1, _023046C8 ; =DUNGEON_PTR
	str r2, [r7, #0x18]
	ldr r8, [r1]
	add r1, r0, #2
	ldrsh r4, [r8, r1]
	ldr r6, [r7, #0x10]
	ldr r3, [r7, #0x1c]
	ldrb r2, [r5, #0x160 + OV29_02303F18_OFFSET]
	rsb r1, r4, r6, asr #8
	ldrsh r8, [r8, r0]
	add r1, r1, r1, lsr #31
	ldr sb, [r7, #0xc]
	ldr r0, [r5, #0x188 + OV29_02303F18_OFFSET]
	sub r3, r6, r3
	sub r0, r3, r0
	rsb r8, r8, sb, asr #8
	mov sl, r1, asr #1
	cmp r2, #0
	rsb sb, r4, r0, asr #8
	subeq sl, sl, #1
	bl ov29_022ECB38
	cmp r0, #0
	beq _023042B0
	ldr r0, _023046D8 ; =ov29_0237C850
	ldr r0, [r0]
	tst r0, #1
	mvnne r0, #1
	moveq r0, #2
	add r8, r8, r0
_023042B0:
	ldrb r0, [r5, #0x172 + OV29_02303F18_OFFSET]
	cmp r0, #0
	bne _023042D8
	mov r0, r7
	bl ov29_022E273C
	ldrb r1, [r5, #0x170 + OV29_02303F18_OFFSET]
	mov r4, r0
	cmp r1, #0
	movne r4, #0
	b _02304310
_023042D8:
	ldrb r0, [r5, #0x173 + OV29_02303F18_OFFSET]
	cmp r0, #0
	beq _023042FC
	ldr r0, _023046D8 ; =ov29_0237C850
	ldr r0, [r0]
	tst r0, #4
	movne r0, #1
	mvneq r0, #0
	add r8, r8, r0
_023042FC:
	ldrb r0, [r5, #0x174 + OV29_02303F18_OFFSET]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r4, r0, #0xff
_02304310:
	ldr r3, _023046DC ; =ov29_0235280C
	add r0, sp, #0x28
	ldrh r6, [r3]
	add r2, r7, #0x2c
	mov r1, #4
	strh r6, [sp, #0x18]
	ldrh r3, [r3, #2]
	strh r3, [sp, #0x1a]
	ldr r3, [r7, #0xc]
	mov r3, r3, asr #8
	strh r3, [sp, #0x18]
	ldr ip, [r7, #0x10]
	ldr r6, [r7, #0x1c]
	ldr r3, [r5, #0x188 + OV29_02303F18_OFFSET]
	sub r6, ip, r6
	sub r3, r6, r3
	mov r3, r3, asr #8
	strh r3, [sp, #0x1a]
	bl sub_0201D034
	ldr r1, _023046C8 ; =DUNGEON_PTR
	ldr r0, [r5, #0xb0]
	ldr r2, [r1]
	add r1, sp, #0x18
	add r2, r2, #0x1a000
	ldrb r3, [r2, #0x23c + OV29_02303F18_OFFSET_2]
	add r2, sp, #0x28
	bl ov29_022DDB98
	add r0, sp, #0x10
	mov r1, r7
	bl ov29_022E3A40
	cmp r4, #0
	ldrneb r0, [r5, #0x156 + OV29_02303F18_OFFSET]
	cmpne r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	str r0, [sp]
	ldrsh r1, [r5, #4]
	ldr r0, [r5, #0xb0]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl ov29_022DD7D8
	mov r0, r7
	mov r1, sl
	bl ov29_022E6E80
	mov r0, r7
	bl ov29_023046E8
	cmp r4, #0
	beq _0230464C
	ldr r0, [r7, #0xb4]
	ldr r1, _023046C8 ; =DUNGEON_PTR
	ldr r3, _023046E0 ; =0x0000F3FF
	ldrb r6, [r0, #0x220 + OV29_02303F18_OFFSET]
	mov r0, #0
	ldr r1, [r1]
	add r2, r3, #0xc00
	strh r3, [sp, #0x1c]
	strh r2, [sp, #0x1e]
	strh r3, [sp, #0x20]
	strh r0, [sp, #0x22]
	strh r0, [sp, #0x24]
	add r2, r1, #0x1a000
	ldrb r2, [r2, #0x23c + OV29_02303F18_OFFSET_2]
	mov r2, r2, lsl #0xa
	strh r2, [sp, #0x26]
	ldrb r2, [r5, #6]
	cmp r2, #0
	beq _02304458
	ldrb r2, [r5, #0xbc]
	cmp r2, #0xb
	blo _02304434
	cmp r2, #0xe
	bls _02304458
_02304434:
	ldrsh r3, [r5, #4]
	ldr r2, _023046E4 ; =0xFFFFFE5D
	add r2, r3, r2
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #2
	movls r0, #1
_02304458:
	ldrb r2, [r5, #0xef]
	cmp r2, #1
	addeq r1, r1, #0x1a000
	ldreqb r1, [r1, #0x244 + OV29_02303F18_OFFSET_2]
	cmpeq r1, #0
	moveq r0, #1
	cmp r0, #0
	beq _023044B8
	bl ov29_02338988
	cmp r0, #0
	beq _02304498
	ldr r0, _023046D8 ; =ov29_0237C850
	ldr r0, [r0]
	tst r0, #1
	beq _023044B8
	b _023046C0
_02304498:
	bl ov29_022E3580
	cmp r0, #0
	bne _023044B8
	bl ov29_022E3570
	cmp r0, #0
	ldreqh r0, [sp, #0x22]
	orreq r0, r0, #0x400
	streqh r0, [sp, #0x22]
_023044B8:
	ldrh r2, [r7, #0x2e]
	add r1, sp, #0x1c
	add r0, r7, #0x2c
	orr r2, r2, #0x20
	strh r2, [r7, #0x2e]
	bl sub_0201D110
	ldrb r0, [r5, #6]
	cmp r0, #0
	ldrneb r0, [r5, #0xd8]
	cmpne r0, #2
	moveq r0, #1
	movne r0, #0
	mov r1, r0, lsl #0x10
	mov r0, r5
	mov r4, r1, asr #0x10
	bl IsExperienceLocked
	cmp r0, #0
	bne _0230450C
	ldrb r0, [r5, #0xbc]
	cmp r0, #7
	bne _02304510
_0230450C:
	mov r4, #1
_02304510:
	strh sl, [r7, #0x64]
	strh r8, [r7, #0x48]
	strh sb, [r7, #0x4a]
#ifdef JAPAN
	ldrb r0, [r5, #0x10a]
#else
	ldrb r0, [r5, #0x10b]
#endif
	cmp r0, #2
	beq _02304590
	ldrb r1, [r5, #0xc4]
	cmp r1, #6
	ldrneb r0, [r5, #0xbf]
	cmpne r0, #4
	cmpne r1, #2
	bne _02304558
	ldr r0, _023046D8 ; =ov29_0237C850
	ldr r0, [r0]
	and r0, r0, #2
	add r0, r8, r0
	strh r0, [r7, #0x48]
	strh sb, [r7, #0x4a]
_02304558:
	ldrb r0, [r7, #0x22]
	cmp r0, #0
	bne _02304570
	add r0, r7, #0x2c
	bl sub_0201CF5C
	b _02304590
_02304570:
	cmp r0, #1
	bne _02304590
	ldr r0, _023046D8 ; =ov29_0237C850
	ldr r0, [r0]
	tst r0, #1
	beq _02304590
	add r0, r7, #0x2c
	bl sub_0201CF5C
_02304590:
	ldrsh r2, [r7, #0x50]
	add r1, r5, #0x100
	ldr r0, _023046D4 ; =0x0001A224
	strh r2, [r1, #0x82 + OV29_02303F18_OFFSET]
	ldrsh r8, [r7, #0x52]
	ldr r3, _023046C8 ; =DUNGEON_PTR
	add r2, r0, #2
	strh r8, [r1, #0x84 + OV29_02303F18_OFFSET]
	ldrsh sb, [r1, #0x82 + OV29_02303F18_OFFSET]
	ldr r8, [r7, #0xc]
	add r8, sb, r8, asr #8
	strh r8, [r1, #0x82 + OV29_02303F18_OFFSET]
	ldrsh sb, [r1, #0x84 + OV29_02303F18_OFFSET]
	ldr r8, [r7, #0x10]
	add r8, sb, r8, asr #8
	strh r8, [r1, #0x84 + OV29_02303F18_OFFSET]
	ldr sb, [r3]
	ldrsh r8, [r1, #0x82 + OV29_02303F18_OFFSET]
	ldrsh r0, [sb, r0]
	ldrsh r3, [r1, #0x84 + OV29_02303F18_OFFSET]
	ldrsh r1, [sb, r2]
	sub r0, r8, r0
	mov r0, r0, lsl #0x10
	sub r1, r3, r1
	mov r1, r1, lsl #0x10
	mov r8, r0, asr #0x10
	mov sb, r1, asr #0x10
	bl ov29_022ECB38
	cmp r0, #0
	beq _02304628
	ldr r0, _023046D8 ; =ov29_0237C850
	ldr r0, [r0]
	tst r0, #1
	mvnne r0, #1
	moveq r0, #2
	add r0, r8, r0
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_02304628:
	ldrb r0, [r7, #0x22]
	cmp r0, #0
	bne _0230464C
	str sb, [sp]
	ldrb r0, [r5, #0x160 + OV29_02303F18_OFFSET]
	mov r1, r6
	mov r2, r4
	mov r3, r8
	bl ov29_02303E5C
_0230464C:
	ldrb r0, [r5, #0xc4]
	cmp r0, #1
	cmpne r0, #6
	beq _023046C0
	ldr r0, _023046C8 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x78b]
	cmp r0, #0
	beq _02304690
	bl ov29_0234B4E0
	cmp r0, #0
	bne _02304690
	add r0, r7, #0x2c
	bl SwitchAnimationControlToNextFrame
	add r0, r7, #0x2c
	bl SwitchAnimationControlToNextFrame
	b _023046B8
_02304690:
	ldrb r0, [r7, #0xaf]
	cmp r0, #0
	cmpne r0, #7
	bne _023046B8
	ldr r0, [r7, #0xb4]
	ldr r0, [r0, #0x110 + OV29_02303F18_OFFSET]
	cmp r0, #1
	ble _023046B8
	add r0, r7, #0x2c
	bl SwitchAnimationControlToNextFrame
_023046B8:
	add r0, r7, #0x2c
	bl SwitchAnimationControlToNextFrame
_023046C0:
	add sp, sp, #0x38
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_023046C8: .word DUNGEON_PTR
_023046CC: .word ov29_02352810
_023046D0: .word 0x00000229
_023046D4: .word 0x0001A224 + OV29_02303F18_OFFSET_2
_023046D8: .word ov29_0237C850
_023046DC: .word ov29_0235280C
_023046E0: .word 0x0000F3FF
_023046E4: .word 0xFFFFFE5D
	arm_func_end ov29_02303F18

	arm_func_start ov29_023046E8
ov29_023046E8: ; 0x023046E8
#ifdef JAPAN
#define OV29_023046E8_OFFSET -4
#else
#define OV29_023046E8_OFFSET 0
#endif
	ldr r1, [r0, #0xb4]
	ldrb r0, [r1, #0x172 + OV29_023046E8_OFFSET]
	cmp r0, #0
	bxne lr
#ifdef JAPAN
	ldrb r0, [r1, #0x10a]
#else
	ldrb r0, [r1, #0x10b]
#endif
	cmp r0, #1
	ldr r0, [r1, #0x188 + OV29_023046E8_OFFSET]
	bne _02304728
	cmp r0, #0xc800
	bxge lr
	add r0, r0, #0x800
	str r0, [r1, #0x188 + OV29_023046E8_OFFSET]
	cmp r0, #0xc800
	movgt r0, #0xc800
	strgt r0, [r1, #0x188 + OV29_023046E8_OFFSET]
	bx lr
_02304728:
	subs r0, r0, #0xc00
	str r0, [r1, #0x188 + OV29_023046E8_OFFSET]
	movmi r0, #0
	strmi r0, [r1, #0x188 + OV29_023046E8_OFFSET]
	bx lr
	arm_func_end ov29_023046E8

	arm_func_start ov29_0230473C
ov29_0230473C: ; 0x0230473C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	ldr r6, _023047B4 ; =DUNGEON_PTR
	mov r7, r5
_0230474C:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r4, [r0, #0xad4]
#else
	ldr r4, [r0, #0xb78]
#endif
	mov r0, r4
	bl EntityIsValid__023047B8
	cmp r0, #0
	ldrne r2, [r4, #0xb4]
#ifdef JAPAN
	ldrneb r0, [r2, #0x175]
#else
	ldrneb r0, [r2, #0x179]
#endif
	cmpne r0, #0
	beq _023047A4
	sub r1, r0, #1
	and r0, r1, #0xff
#ifdef JAPAN
	strb r1, [r2, #0x175]
#else
	strb r1, [r2, #0x179]
#endif
	tst r0, #1
	bne _023047A4
	ldrb r2, [r2, #0x4c]
	mov r0, r4
	mov r1, r7
	sub r2, r2, #1
	and r2, r2, #7
	bl ChangeMonsterAnimation
_023047A4:
	add r5, r5, #1
	cmp r5, #0x14
	blt _0230474C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023047B4: .word DUNGEON_PTR
	arm_func_end ov29_0230473C
