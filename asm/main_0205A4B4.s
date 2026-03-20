	.include "asm/macros.inc"
	.include "main_0205A4B4.inc"

	.text

	arm_func_start sub_0205A4B4
sub_0205A4B4: ; 0x0205A4B4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x184
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r0, #5
	mov r7, #0x10
	addls pc, pc, r0, lsl #2
	b _0205AD98
_0205A4D8: ; jump table
	b _0205AD98 ; case 0
	b _0205A9D4 ; case 1
	b _0205A4F0 ; case 2
	b _0205A900 ; case 3
	b _0205AAC8 ; case 4
	b _0205AC0C ; case 5
_0205A4F0:
	ldr r0, [r6, #0x2c]
	ldr r2, _0205ADA0 ; =0x00000951
	str r0, [sp, #0x90]
	ldr r1, [r6, #0x30]
	add r5, sp, #0x6c
	str r1, [sp, #0x94]
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, r7
	bl DrawTextInWindow
	mov r3, r5
	str r3, [sp]
	ldr r2, _0205ADA4 ; =0x00000952
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	bl PreprocessStringFromId
	mov r0, r4
	mov r1, #4
	mov r2, #0x1c
	add r3, sp, #0xbc
	bl DrawTextInWindow
	ldr r2, [r6, #0x2c]
	cmp r2, #0x64
	bge _0205A5B8
	ldrsh r1, [r6]
	add r0, sp, #0x18
	add r2, r2, #1
	bl GetLvlUpEntry
	ldr r1, [sp, #0x18]
	ldr r0, [r6, #0x30]
	ldr r2, _0205ADA8 ; =0x00000953
	sub r0, r1, r0
	str r0, [sp, #0x90]
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x28
	bl DrawTextInWindow
_0205A5B8:
	ldr r0, [r6, #0x24]
	ldr r2, _0205ADAC ; =0x00000954
	str r0, [sp, #0x90]
	ldr r1, [r6, #0x28]
	add r5, sp, #0x6c
	str r1, [sp, #0x94]
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x36
	bl DrawTextInWindow
	mov r3, r5
	str r3, [sp]
	ldr r2, _0205ADB0 ; =0x00000955
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	bl PreprocessStringFromId
	mov r0, r4
	mov r1, #4
	mov r2, #0x42
	add r3, sp, #0xbc
	bl DrawTextInWindow
	ldrb r1, [r6, #0x34]
	ldr r2, _0205ADB4 ; =0x00000957
	add r5, sp, #0x6c
	str r1, [sp, #0x90]
	ldrb r0, [r6, #0x39]
	mov r3, #0
	cmp r0, #0
	addne r0, r1, r0
	strne r0, [sp, #0x90]
	addne r2, r2, #1
	add r0, sp, #0xbc
	mov r1, #0xc8
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x42
	bl DrawTextInWindow
	ldrb r2, [r6, #0x3b]
	ldrb r1, [r6, #0x36]
	add r0, sp, #0xbc
	cmp r2, #0
	mov r3, #0
	beq _0205A6BC
	add r1, r1, r2
	str r1, [sp, #0x90]
	ldr r2, _0205ADB8 ; =0x0000095C
	mov r1, #0xc8
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x42
	bl DrawTextInWindow
	b _0205A6E4
_0205A6BC:
	ldr r2, _0205ADBC ; =0x0000095B
	str r1, [sp, #0x90]
	mov r1, #0xc8
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x42
	bl DrawTextInWindow
_0205A6E4:
	ldr r2, _0205ADC0 ; =0x00000956
	add r5, sp, #0x6c
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x4e
	bl DrawTextInWindow
	ldrb r1, [r6, #0x35]
	ldr r2, _0205ADC4 ; =0x00000959
	add r5, sp, #0x6c
	str r1, [sp, #0x90]
	ldrb r0, [r6, #0x3a]
	mov r3, #0
	cmp r0, #0
	addne r0, r1, r0
	strne r0, [sp, #0x90]
	addne r2, r2, #1
	add r0, sp, #0xbc
	mov r1, #0xc8
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x4e
	bl DrawTextInWindow
	ldrb r2, [r6, #0x3c]
	ldrb r1, [r6, #0x37]
	add r0, sp, #0xbc
	cmp r2, #0
	mov r3, #0
	beq _0205A7A8
	add r1, r1, r2
	str r1, [sp, #0x90]
	ldr r2, _0205ADC8 ; =0x0000095E
	mov r1, #0xc8
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x4e
	bl DrawTextInWindow
	b _0205A7D0
_0205A7A8:
	ldr r2, _0205ADCC ; =0x0000095D
	str r1, [sp, #0x90]
	mov r1, #0xc8
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x4e
	bl DrawTextInWindow
_0205A7D0:
	ldrb r0, [r6, #0x1c]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0205A820
	bl AllocateTemp1024ByteBufferFromPool
	ldr r2, _0205ADD0 ; =_020A34B8
	add r1, r6, #0x1c
	mov r7, r0
	bl sub_0200D670
#ifdef JAPAN
	ldr r2, _0205B0D0 ; =0x00002330
#endif
	add r5, sp, #0x6c
	str r7, [sp, #0xa4]
	add r0, sp, #0xbc
	mov r1, #0xc8
#ifndef JAPAN
	mov r2, #0x960
#endif
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	b _0205A83C
_0205A820:
	ldr r2, _0205ADD4 ; =0x0000095F
	add r5, sp, #0x6c
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
_0205A83C:
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x5a
	bl DrawTextInWindow
	ldrsh r0, [r6, #0x3e]
	mov r1, #0xa
	str r0, [sp, #0x90]
	ldrsh r0, [r6, #0x3e]
	bl _s32_div_f
	movs r1, r0
	movmi r1, #0
	cmp r1, #0x63
	ldr r0, _0205ADD8 ; =_020A34D2
	movge r1, #0x63
	bl sub_0205B39C
	str r0, [sp, #0xa4]
	add r5, sp, #0x6c
	ldr r2, _0205ADDC ; =0x00000961
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x68
	bl DrawTextInWindow
	ldrb r0, [r6, #0x38]
	cmp r0, #0
	bne _0205AD98
	bl AllocateTemp1024ByteBufferFromPool
	ldrb r1, [r6, #0x54]
	mov r6, r0
	bl sub_02058C30
	str r6, [sp, #0xa4]
	ldr r2, _0205ADE0 ; =0x00000962
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x74
	bl DrawTextInWindow
	b _0205AD98
_0205A900:
	ldr r3, _0205ADE4 ; =0x00000972
	mov r0, r4
	mov r2, r7
	mov r1, #4
	bl sub_02026268
	ldrb r0, [r6, #0x16]
	bl GetTypeStringId
	mov r3, r0
	mov r0, r4
	mov r1, #0x38
	mov r2, r7
	bl sub_02026268
	ldrb r0, [r6, #0x17]
	cmp r0, #0
	beq _0205A954
	bl GetTypeStringId
	mov r3, r0
	mov r0, r4
	mov r1, #0x68
	mov r2, r7
	bl sub_02026268
_0205A954:
	ldr r3, _0205ADE8 ; =0x00000973
	mov r0, r4
	mov r1, #4
	mov r2, #0x1c
	bl sub_02026268
	ldrb r0, [r6, #0x18]
	bl GetAbilityDescStringId
	bl StringFromId
	mov r1, #0
	str r1, [sp]
	mov r1, #0xb
	str r1, [sp, #4]
	mov r3, r0
	mov r0, r4
	mov r1, #4
	mov r2, #0x28
	bl sub_02026358
	ldrb r0, [r6, #0x19]
	cmp r0, #0
	beq _0205AD98
	bl GetAbilityDescStringId
	bl StringFromId
	mov r1, #0
	mov r3, r0
	mov r0, r4
	str r1, [sp]
	mov r4, #0xb
	mov r1, #4
	mov r2, #0x49
	str r4, [sp, #4]
	bl sub_02026358
	b _0205AD98
_0205A9D4:
	ldrsh r0, [r6, #0x56]
	mov fp, #0
	mov r1, fp
	sub r8, r0, #1
	sub r7, r7, #0xc
	mov sl, fp
_0205A9EC:
	add r0, r5, r1, lsl #2
	add r1, r1, #1
	str sl, [r0, #0xc]
	cmp r1, #0xa
	blt _0205A9EC
	b _0205AAA0
_0205AA04:
	cmp r8, #0
	cmpge r7, #0x10
	blt _0205AA94
	cmp r8, #0x1e
	bge _0205AAA8
	add sb, r6, r8
	ldrb r0, [sb, #0x58]
	cmp r0, #0
	beq _0205AA94
	mov fp, #1
	bl AllocateTemp1024ByteBufferFromPool
	ldrb r1, [sb, #0x58]
	str r0, [sp, #8]
	mov r2, #0x50
	mov r3, r1, lsl #1
	ldr r1, _0205ADEC ; =STATUS_NAME_STRING_IDS
	ldrh r1, [r1, r3]
	bl CopyNStringFromId
	ldr r0, [sp, #8]
	ldr r2, _0205ADF0 ; =_020A34FC
	str r0, [sp, #0xa8]
	add r0, sp, #0x6c
	str r0, [sp]
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	bl PreprocessString
	mov r0, r4
	mov r1, #0xc
	mov r2, r7
	add r3, sp, #0xbc
	bl DrawTextInWindow
	cmp sl, #1
	ldrgeb r1, [sb, #0x58]
	addge r0, r5, sl, lsl #2
	strge r1, [r0, #8]
_0205AA94:
	add sl, sl, #1
	add r8, r8, #1
	add r7, r7, #0xc
_0205AAA0:
	cmp sl, #0xa
	blt _0205AA04
_0205AAA8:
	cmp fp, #0
	bne _0205AD98
	ldr r3, _0205ADF4 ; =0x00000968
	mov r0, r4
	mov r1, #0xc
	mov r2, #0x10
	bl sub_02026268
	b _0205AD98
_0205AAC8:
	ldrsh r1, [r6]
	ldrsh r2, [r6, #0x3e]
	add r0, sp, #0x24
	bl GetLearnableIqSkills
	ldrsh r0, [r6, #0x40]
	mov r1, #0
	mov sb, r1
	sub r8, r0, #1
_0205AAE8:
	strb sb, [r5, r1]
	add r1, r1, #1
	cmp r1, #9
	blt _0205AAE8
	mov sl, sb
	sub r7, r7, #0xc
	add fp, sp, #0x24
	b _0205ABE4
_0205AB08:
	cmp r8, #0
	blt _0205ABD8
	cmp r8, #0x45
	bge _0205ABEC
	ldrb r0, [fp, r8]
	cmp r0, #0
	beq _0205ABD8
	mov sb, #1
	bl AllocateTemp1024ByteBufferFromPool
	str r0, [sp, #0xc]
	ldrb r0, [fp, r8]
	bl GetIqSkillStringId
	mov r1, r0
	ldr r0, [sp, #0xc]
	mov r2, #0x50
	bl CopyNStringFromId
	ldr r0, [sp, #0xc]
	ldrb r1, [fp, r8]
	str r0, [sp, #0xa8]
	add r0, r6, #0x48
	bl IqSkillFlagTest
	cmp r0, #0
	beq _0205AB80
	bl AllocateTemp1024ByteBufferFromPool
	ldr r1, _0205ADF8 ; =_020A3514
	str r0, [sp, #0x10]
	bl strcpy
	ldr r0, [sp, #0x10]
	str r0, [sp, #0xa4]
	b _0205AB98
_0205AB80:
	bl AllocateTemp1024ByteBufferFromPool
	ldr r1, _0205ADFC ; =_020A351C
	str r0, [sp, #0x14]
	bl strcpy
	ldr r0, [sp, #0x14]
	str r0, [sp, #0xa4]
_0205AB98:
	cmp sl, #1
	ldrgeb r1, [fp, r8]
	addge r0, r5, sl
	ldr r2, _0205AE00 ; =_020A3524
	strgeb r1, [r0, #-1]
	add r0, sp, #0x6c
	str r0, [sp]
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	bl PreprocessString
	mov r0, r4
	mov r1, #0xc
	mov r2, r7
	add r3, sp, #0xbc
	bl DrawTextInWindow
_0205ABD8:
	add sl, sl, #1
	add r8, r8, #1
	add r7, r7, #0xc
_0205ABE4:
	cmp sl, #0xa
	blt _0205AB08
_0205ABEC:
	cmp sb, #0
	bne _0205AD98
	ldr r3, _0205AE04 ; =0x00000969
	mov r0, r4
	mov r1, #0xc
	mov r2, #0x20
	bl sub_02026268
	b _0205AD98
_0205AC0C:
	bl AllocateTemp1024ByteBufferFromPool
	ldrsh r1, [r6]
	mov r5, r0
	bl GetNameRaw
	str r5, [sp, #0xa4]
	ldrsh r0, [r6]
	str r0, [sp, #0x90]
	ldrsh r0, [r6]
	bl GetMonsterGenderVeneer
	cmp r0, #1
	beq _0205AC48
	cmp r0, #2
	beq _0205AC50
	cmp r0, #3
	b _0205AC58
_0205AC48:
	ldr r2, _0205AE08 ; =0x00000963
	b _0205AC5C
_0205AC50:
	ldr r2, _0205AE0C ; =0x00000964
	b _0205AC5C
_0205AC58:
	ldr r2, _0205AE10 ; =0x00000965
_0205AC5C:
	add r5, sp, #0x6c
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x10
	bl DrawTextInWindow
	ldr r3, _0205AE14 ; =0x00000967
	mov r0, r4
	mov r1, #4
	mov r2, #0x1f
	bl sub_02026268
	ldrb r2, [r6, #0x1a]
	mov r1, r5
	add r0, sp, #0xbc
	str r2, [sp, #0x7c]
	str r1, [sp]
	ldr r2, _0205AE18 ; =0x0000096B
	mov r1, #0xc8
	mov r3, #0
	bl PreprocessStringFromId
	mov r0, r4
	mov r1, #4
	mov r2, #0x2b
	add r3, sp, #0xbc
	bl DrawTextInWindow
	bl AllocateTemp1024ByteBufferFromPool
	mov r5, r0
	ldrsh r0, [r6]
	bl GetCategoryString
	mov r1, r0
	mov r0, r5
	bl strcpy
	mov r0, #0x44
	strb r0, [r5, #4]
	str r5, [sp, #0xa4]
	add r1, sp, #0x6c
	str r1, [sp]
	ldr r2, _0205AE1C ; =0x00000966
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	bl PreprocessStringFromId
	mov r0, r4
	mov r1, #4
	mov r2, #0x3a
	add r3, sp, #0xbc
	bl DrawTextInWindow
	ldrsh r0, [r6]
	bl GetBodySize
	mov r1, r0
	ldr r0, _0205AE20 ; =_020A34C4
	bl sub_0205B39C
	str r0, [sp, #0xa4]
	add r1, sp, #0x6c
	str r1, [sp]
	ldr r2, _0205AE24 ; =0x0000096A
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
#ifdef JAPAN
	mov r2, #0x49
#else
	mov r2, #0x58
#endif
	bl DrawTextInWindow
	ldrb r2, [r6, #0x44]
	mov r0, r4
	mov r1, #4
#ifdef JAPAN
	add r2, r2, #0x33c
	add r2, r2, #0x2000
#else
	add r2, r2, #0x16c
	add r2, r2, #0x800
#endif
	mov r2, r2, lsl #0x10
	mov r3, r2, lsr #0x10
#ifdef JAPAN
	mov r2, #0x58
#else
	mov r2, #0x67
#endif
	bl sub_02026268
_0205AD98:
	add sp, sp, #0x184
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define SUB_0205A4B4_OFFSET 0x19D0
#else
#define SUB_0205A4B4_OFFSET 0
#endif
_0205ADA0: .word 0x00000951 + SUB_0205A4B4_OFFSET
_0205ADA4: .word 0x00000952 + SUB_0205A4B4_OFFSET
_0205ADA8: .word 0x00000953 + SUB_0205A4B4_OFFSET
_0205ADAC: .word 0x00000954 + SUB_0205A4B4_OFFSET
_0205ADB0: .word 0x00000955 + SUB_0205A4B4_OFFSET
_0205ADB4: .word 0x00000957 + SUB_0205A4B4_OFFSET
_0205ADB8: .word 0x0000095C + SUB_0205A4B4_OFFSET
_0205ADBC: .word 0x0000095B + SUB_0205A4B4_OFFSET
_0205ADC0: .word 0x00000956 + SUB_0205A4B4_OFFSET
_0205ADC4: .word 0x00000959 + SUB_0205A4B4_OFFSET
_0205ADC8: .word 0x0000095E + SUB_0205A4B4_OFFSET
_0205ADCC: .word 0x0000095D + SUB_0205A4B4_OFFSET
_0205ADD0: .word _020A34B8
#ifdef JAPAN
_0205B0D0: .word 0x00002330
#endif
_0205ADD4: .word 0x0000095F + SUB_0205A4B4_OFFSET
_0205ADD8: .word _020A34D2
_0205ADDC: .word 0x00000961 + SUB_0205A4B4_OFFSET
_0205ADE0: .word 0x00000962 + SUB_0205A4B4_OFFSET
_0205ADE4: .word 0x00000972 + SUB_0205A4B4_OFFSET
_0205ADE8: .word 0x00000973 + SUB_0205A4B4_OFFSET
_0205ADEC: .word STATUS_NAME_STRING_IDS
_0205ADF0: .word _020A34FC
_0205ADF4: .word 0x00000968 + SUB_0205A4B4_OFFSET
_0205ADF8: .word _020A3514
_0205ADFC: .word _020A351C
_0205AE00: .word _020A3524
_0205AE04: .word 0x00000969 + SUB_0205A4B4_OFFSET
_0205AE08: .word 0x00000963 + SUB_0205A4B4_OFFSET
_0205AE0C: .word 0x00000964 + SUB_0205A4B4_OFFSET
_0205AE10: .word 0x00000965 + SUB_0205A4B4_OFFSET
_0205AE14: .word 0x00000967 + SUB_0205A4B4_OFFSET
_0205AE18: .word 0x0000096B + SUB_0205A4B4_OFFSET
_0205AE1C: .word 0x00000966 + SUB_0205A4B4_OFFSET
_0205AE20: .word _020A34C4
_0205AE24: .word 0x0000096A + SUB_0205A4B4_OFFSET
	arm_func_end sub_0205A4B4

	arm_func_start CreateMonsterSummaryFromTeamMember
CreateMonsterSummaryFromTeamMember: ; 0x0205AE28
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r8, r1
	mov sb, r0
	ldrsh r0, [r8, #8]
	mov r7, r2
	bl GetTeamMember
	mov r4, r0
	mov r1, r4
	add r0, sb, #2
	mov r2, #0x4e
	bl sub_02056084
	ldrsh r0, [r8, #0xc]
	mov r5, #0
	strh r0, [sb]
	ldrsh r0, [r8, #0xe]
	str r0, [sb, #0x24]
	ldrsh r0, [r8, #0xe]
	str r0, [sb, #0x28]
	ldrb r0, [r8, #2]
	str r0, [sb, #0x2c]
	ldr r0, [r8, #0x18]
	str r0, [sb, #0x30]
_0205AE84:
	add r2, r8, r5
	ldrb r0, [r2, #0x12]
	add r6, sb, r5
	mov r1, r5
	strb r0, [r6, #0x34]
	ldrb r0, [r2, #0x14]
	strb r0, [r6, #0x36]
	ldrsh r0, [r8, #0xc]
	bl GetType
	strb r0, [r6, #0x16]
	ldrsh r0, [r8, #0xc]
	mov r1, r5
	bl GetAbility
	add r5, r5, #1
	strb r0, [r6, #0x18]
	cmp r5, #2
	blt _0205AE84
	strb r7, [sb, #0x38]
	mov r0, #0
	strb r0, [sb, #0x39]
	strb r0, [sb, #0x3a]
	strb r0, [sb, #0x3b]
	strb r0, [sb, #0x3c]
	strb r0, [sb, #0x45]
	ldrb r1, [r8, #0x58]
	add r0, r8, #0x4c
	add r3, sb, #0x48
	strb r1, [sb, #0x54]
	ldrh r1, [r8, #0x3e]
	strh r1, [sb, #0x1c]
	ldrh r1, [r8, #0x40]
	strh r1, [sb, #0x1e]
	ldrh r1, [r8, #0x42]
	strh r1, [sb, #0x20]
	ldrsh r1, [r8, #6]
	strh r1, [sb, #0x3e]
	ldrb r1, [r8, #3]
	strb r1, [sb, #0x1a]
	ldrb r1, [r8, #4]
	strb r1, [sb, #0x1b]
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, sb
	bl sub_0205B354
	str r0, [sp]
	ldrsh r1, [sb]
	ldrsh r3, [sb, #0x3e]
	add r0, sp, #4
	add r2, r8, #0x3e
	bl sub_0205B120
	ldrb r2, [sb, #0x39]
	ldrsh r1, [sp, #6]
	ldr r0, _0205B004 ; =0x000003E7
	add r1, r2, r1
	strb r1, [sb, #0x39]
	ldrb r2, [sb, #0x3a]
	ldrsh r1, [sp, #8]
	add r1, r2, r1
	strb r1, [sb, #0x3a]
	ldrb r2, [sb, #0x3b]
	ldrsh r1, [sp, #0xa]
	add r1, r2, r1
	strb r1, [sb, #0x3b]
	ldrb r2, [sb, #0x3c]
	ldrsh r1, [sp, #0xc]
	add r1, r2, r1
	strb r1, [sb, #0x3c]
	ldrsh r1, [sp, #4]
	ldr r2, [sb, #0x24]
	add r1, r2, r1
	str r1, [sb, #0x24]
	cmp r1, r0
	strgt r0, [sb, #0x24]
	ldr r1, [sb, #0x24]
	mov r0, #6
	str r1, [sb, #0x28]
	ldrb r1, [r4, #6]
	strb r1, [sb, #0x42]
	ldrb r1, [r4, #7]
	strb r1, [sb, #0x43]
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	moveq r0, #3
	beq _0205AFDC
	mov r0, r4
	bl GetMonsterEvoStatus
_0205AFDC:
	mov r2, #0
	strb r0, [sb, #0x44]
	mov r1, r2
_0205AFE8:
	add r0, sb, r2
	add r2, r2, #1
	strb r1, [r0, #0x58]
	cmp r2, #0x1f
	blt _0205AFE8
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0205B004: .word 0x000003E7
	arm_func_end CreateMonsterSummaryFromTeamMember
