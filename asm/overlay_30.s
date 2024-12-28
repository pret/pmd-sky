	.include "asm/macros.inc"
	.include "overlay_30.inc"

	.text

	arm_func_start ov30_02382820
ov30_02382820: ; 0x02382820
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r0, #0x10
	mov r1, #5
	mov r4, r2
	bl MemAlloc
	ldr r1, _02382870 ; =ov30_023860A0
	mov r2, #0
	str r0, [r1]
	str r6, [r0, #4]
	ldr r0, [r1]
	str r5, [r0, #8]
	ldr r0, [r1]
	strb r2, [r0, #0xc]
	ldr r0, [r1]
	strb r4, [r0, #0xd]
	ldr r0, [r1]
	str r2, [r0]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02382870: .word ov30_023860A0
	arm_func_end ov30_02382820

	arm_func_start ov30_02382874
ov30_02382874: ; 0x02382874
	stmdb sp!, {r3, lr}
	ldr r0, _02382974 ; =ov30_023860A0
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0238296C
_02382890: ; jump table
	b _023828A0 ; case 0
	b _02382948 ; case 1
	b _0238296C ; case 2
	b _02382964 ; case 3
_023828A0:
	ldmib r1, {r0, r1}
	bl ReadQuickSaveInfo
	cmp r0, #0
	bne _023828D4
	ldr r2, _02382974 ; =ov30_023860A0
	ldr r1, _02382978 ; =0x21061522
	ldr r3, [r2]
	ldr r2, [r3, #8]
	ldr r3, [r3, #4]
	sub r2, r2, #4
	ldr r2, [r3, r2]
	cmp r2, r1
	movne r0, #4
_023828D4:
	cmp r0, #0
	bne _023828FC
	ldr r0, _02382974 ; =ov30_023860A0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #3
	strb r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0]
	b _0238296C
_023828FC:
	cmp r0, #1
	mov r2, #0
	bne _02382928
	ldr r0, _0238297C ; =0x0000040C
#ifdef JAPAN
	add r1, r0, #0xcc
#else
	ldr r1, _02382980 ; =0x00000247
#endif
	bl sub_02034EB4
	ldr r0, _02382974 ; =ov30_023860A0
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _0238296C
_02382928:
	ldr r0, _02382984 ; =0x0000061C
	ldr r1, _02382988 ; =0x0000024D
	bl sub_02034EB4
	ldr r0, _02382974 ; =ov30_023860A0
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0238296C
_02382948:
	bl sub_02034DA8
	cmp r0, #0
	ldreq r0, _02382974 ; =ov30_023860A0
	moveq r1, #3
	ldreq r0, [r0]
	streq r1, [r0]
	b _0238296C
_02382964:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0238296C:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02382974: .word ov30_023860A0
#ifdef JAPAN
_02382978: .word 0x20111122
_0238297C: .word 0x0000040C
_02382984: .word 0x0000061C
_02382988: .word 0x000004DE
#else
_02382978: .word 0x21061522
_0238297C: .word 0x0000040C
_02382980: .word 0x00000247
_02382984: .word 0x0000061C
_02382988: .word 0x0000024D
#endif
	arm_func_end ov30_02382874

	arm_func_start ov30_0238298C
ov30_0238298C: ; 0x0238298C
	ldr r0, _0238299C ; =ov30_023860A0
	ldr r0, [r0]
	ldrb r0, [r0, #0xc]
	bx lr
	.align 2, 0
_0238299C: .word ov30_023860A0
	arm_func_end ov30_0238298C

	arm_func_start ov30_023829A0
ov30_023829A0: ; 0x023829A0
	stmdb sp!, {r3, lr}
	ldr r0, _023829C8 ; =ov30_023860A0
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _023829C8 ; =ov30_023860A0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023829C8: .word ov30_023860A0
	arm_func_end ov30_023829A0

	arm_func_start ov30_023829CC
ov30_023829CC: ; 0x023829CC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r0, #0x14
	mov r1, #5
	mov r4, r2
	bl MemAlloc
	ldr r1, _02382A2C ; =ov30_023860A4
	ldr r3, _02382A30 ; =0x21061522
	str r0, [r1]
	str r6, [r0, #4]
	ldr r0, [r1]
	mov r2, #0
	str r5, [r0, #8]
	ldr r0, [r1]
	strb r4, [r0, #0xc]
	ldr ip, [r1]
	ldr r0, [ip, #8]
	ldr ip, [ip, #4]
	sub r0, r0, #4
	str r3, [ip, r0]
	ldr r0, [r1]
	str r2, [r0]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02382A2C: .word ov30_023860A4
#ifdef JAPAN
_02382A30: .word 0x20111122
#else
_02382A30: .word 0x21061522
#endif
	arm_func_end ov30_023829CC

	arm_func_start ov30_02382A34
ov30_02382A34: ; 0x02382A34
	stmdb sp!, {r3, lr}
	ldr r0, _02382C0C ; =ov30_023860A4
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02382C04
_02382A50: ; jump table
	b _02382A68 ; case 0
	b _02382AA4 ; case 1
	b _02382AFC ; case 2
	b _02382BD4 ; case 3
	b _02382C04 ; case 4
	b _02382BF0 ; case 5
_02382A68:
	ldrb r0, [r1, #0xc]
	mov r2, #0
	cmp r0, #0
	ldr r0, _02382C10 ; =0x00000408
	beq _02382A88
#ifdef JAPAN
	add r1, r0, #0xca
#else
	ldr r1, _02382C14 ; =0x00000241
#endif
	bl sub_02034EB4
	b _02382A90
_02382A88:
#ifdef JAPAN
	add r1, r0, #0xcb
#else
	ldr r1, _02382C18 ; =0x00000242
#endif
	bl sub_02034EB4
_02382A90:
	ldr r0, _02382C0C ; =ov30_023860A4
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _02382C04
_02382AA4:
	bl sub_02034DA8
	cmp r0, #0
	bne _02382C04
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	bl sub_02003B94
	ldr r0, _02382C1C ; =0x000F1209
	bl sub_02048DC4
	ldr r0, _02382C0C ; =ov30_023860A4
	ldr r1, [r0]
	ldmib r1, {r0, r1}
	bl WriteQuickSaveInfo
	ldr r1, _02382C0C ; =ov30_023860A4
	mov r2, #2
	ldr r3, [r1]
	str r0, [r3, #0x10]
	ldr r1, [r1]
	mov r0, #1
	str r2, [r1]
	ldmia sp!, {r3, pc}
_02382AFC:
	ldr r0, [r1, #0x10]
	cmp r0, #0
	bne _02382B40
	mov r0, #2
	bl NoteSaveBase
	ldr r1, _02382C0C ; =ov30_023860A4
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r0, [r1]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _02382B40
	ldr r0, _02382C20 ; =0x000F1207
	bl sub_02048DC4
	ldr r1, _02382C0C ; =ov30_023860A4
	ldr r1, [r1]
	str r0, [r1, #0x10]
_02382B40:
	bl sub_02003BC8
	bl sub_02029FBC
	ldr r0, _02382C0C ; =ov30_023860A4
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02382B68
	cmp r0, #1
	beq _02382B8C
	b _02382BB0
_02382B68:
	ldr r0, _02382C24 ; =0x0000041C
#ifdef JAPAN
	mov r2, #0
	add r1, r0, #0xb9
#else
	mov r1, #0x244
	mov r2, #0
#endif
	bl sub_02034EB4
	ldr r0, _02382C0C ; =ov30_023860A4
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	b _02382C04
_02382B8C:
	ldr r0, _02382C28 ; =0x0000040C
#ifdef JAPAN
	mov r2, #0
	add r1, r0, #0xbd
#else
	mov r1, #0x238
	mov r2, #0
#endif
	bl sub_02034EB4
	ldr r0, _02382C0C ; =ov30_023860A4
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0]
	b _02382C04
_02382BB0:
	ldr r0, _02382C24 ; =0x0000041C
#ifdef JAPAN
	mov r2, #0
	add r1, r0, #0xae
#else
	ldr r1, _02382C2C ; =0x00000239
	mov r2, #0
#endif
	bl sub_02034EB4
	ldr r0, _02382C0C ; =ov30_023860A4
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	b _02382C04
_02382BD4:
	bl sub_02034DA8
	cmp r0, #0
	ldreq r0, _02382C0C ; =ov30_023860A4
	moveq r1, #5
	ldreq r0, [r0]
	streq r1, [r0]
	b _02382C04
_02382BF0:
	ldr r0, [r1, #0x10]
	cmp r0, #0
	moveq r0, #2
	movne r0, #3
	ldmia sp!, {r3, pc}
_02382C04:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02382C0C: .word ov30_023860A4
_02382C10: .word 0x00000408
#ifndef JAPAN
_02382C14: .word 0x00000241
_02382C18: .word 0x00000242
#endif
_02382C1C: .word 0x000F1209
_02382C20: .word 0x000F1207
_02382C24: .word 0x0000041C
_02382C28: .word 0x0000040C
#ifndef JAPAN
_02382C2C: .word 0x00000239
#endif
	arm_func_end ov30_02382A34

	arm_func_start ov30_02382C30
ov30_02382C30: ; 0x02382C30
	stmdb sp!, {r3, lr}
	ldr r0, _02382C64 ; =ov30_023860A4
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_02034D0C
	ldr r0, _02382C64 ; =ov30_023860A4
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02382C64 ; =ov30_023860A4
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02382C64: .word ov30_023860A4
	arm_func_end ov30_02382C30

	arm_func_start WriteQuicksaveData
WriteQuicksaveData: ; 0x02382C68
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #4
	mov r1, r3
	bl ov30_02385C3C
	mov r3, #0
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #4
	str r3, [sp]
	bl ov30_02385C54
	ldr r1, _02382D6C ; =OVERLAY30_JP_STRING_1
	add r0, sp, #4
	bl ov30_02385CE0
	ldr r1, _02382D70 ; =DUNGEON_PTR
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0xac
	add r1, r1, #0x348
	add r1, r1, #0x400
	bl ov30_02385C54
	ldr r1, _02382D6C ; =OVERLAY30_JP_STRING_1
	add r0, sp, #4
	bl ov30_02385CE0
	ldr r2, _02382D70 ; =DUNGEON_PTR
	ldr r1, _02382D74 ; =0x0002C9E6
	ldr r2, [r2]
	add r0, sp, #4
	ldrsh r1, [r2, r1]
	bl ov30_02385D34
	ldr r5, _02382D70 ; =DUNGEON_PTR
	ldr r4, _02382D78 ; =0x0002C9EA
	mov r7, #0
	add r6, sp, #4
_02382CF8:
	ldr r1, [r5]
	mov r0, r6
	add r1, r1, r7, lsl #1
	ldrh r1, [r1, r4]
	bl ov30_02385D14
	add r7, r7, #1
	cmp r7, #0x10
	blt _02382CF8
	add r0, sp, #4
	bl ov30_02383C70
	add r0, sp, #4
	bl ov30_0238409C
	add r0, sp, #4
	bl ov30_02384208
	add r0, sp, #4
	bl ov30_02382D80
	add r0, sp, #4
	bl ov30_02382E94
	add r0, sp, #4
	bl ov30_02382FB8
	add r0, sp, #4
	bl ov30_02383084
	ldr r1, _02382D7C ; =OVERLAY30_JP_STRING_2
	add r0, sp, #4
	bl ov30_02385CE0
	add r0, sp, #4
	bl ov30_02385CDC
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02382D6C: .word OVERLAY30_JP_STRING_1
_02382D70: .word DUNGEON_PTR
#ifdef JAPAN
_02382D74: .word 0x0002C942
_02382D78: .word 0x0002C946
#else
_02382D74: .word 0x0002C9E6
_02382D78: .word 0x0002C9EA
#endif
_02382D7C: .word OVERLAY30_JP_STRING_2
	arm_func_end WriteQuicksaveData

	arm_func_start ov30_02382D80
ov30_02382D80: ; 0x02382D80
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r2, #0
	mov sl, r0
	mov r1, r2
	add r0, sp, #0
_02382D98:
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #5
	blt _02382D98
	ldr r1, _02382E8C ; =OVERLAY30_JP_STRING_1
	mov r0, sl
	bl ov30_02385CE0
	mov sb, #0
	mov r5, #1
	ldr r4, _02382E90 ; =DUNGEON_PTR
	mov fp, r5
	mov r7, sb
_02382DC8:
	ldr r0, [r4]
	mov r1, r7
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xb24]
#else
	ldr r8, [r0, #0xbc8]
#endif
	cmp r8, #0
	beq _02382E60
	ldr r0, [r8]
	cmp r0, #3
	bne _02382E60
	mov r0, r8
	bl GetItemInfo
	mov r6, r0
	mov r0, sl
	mov r1, r6
	mov r2, r5
	bl ov30_02385C54
	mov r0, sl
	add r1, r6, #1
	mov r2, fp
	bl ov30_02385C54
	mov r0, sl
	add r1, r6, #2
	mov r2, #2
	bl ov30_02385C54
	add r1, r6, #4
	mov r0, sl
	mov r2, #2
	bl ov30_02385C54
	mov r0, sl
	add r1, r8, #4
	mov r2, #1
	bl ov30_02385C54
	add r1, r8, #6
	mov r0, sl
	mov r2, #1
	bl ov30_02385C54
	mov r1, #1
_02382E60:
	cmp r1, #0
	bne _02382E78
	mov r0, sl
	add r1, sp, #0
	mov r2, #8
	bl ov30_02385C54
_02382E78:
	add sb, sb, #1
	cmp sb, #0x40
	blt _02382DC8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02382E8C: .word OVERLAY30_JP_STRING_1
_02382E90: .word DUNGEON_PTR
	arm_func_end ov30_02382D80

	arm_func_start ov30_02382E94
ov30_02382E94: ; 0x02382E94
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov r2, #0
	mov r1, #0xff
	add r0, sp, #0
_02382EAC:
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #7
	blt _02382EAC
	ldr r1, _02382FB0 ; =OVERLAY30_JP_STRING_1
	mov r0, sl
	bl ov30_02385CE0
	mov sb, #0
	mov r5, #1
	ldr r4, _02382FB4 ; =DUNGEON_PTR
	mov fp, r5
	mov r7, sb
_02382EDC:
	ldr r0, [r4]
	mov r1, r7
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xc24]
#else
	ldr r8, [r0, #0xcc8]
#endif
	cmp r8, #0
	beq _02382F84
	ldr r0, [r8]
	cmp r0, #2
	bne _02382F84
	mov r0, r8
	bl GetTrapInfo
	mov r6, r0
	mov r0, sl
	mov r1, r6
	mov r2, r5
	bl ov30_02385C54
	mov r0, sl
	add r1, r6, #1
	mov r2, fp
	bl ov30_02385C54
	mov r0, sl
	add r1, r6, #2
	mov r2, #1
	bl ov30_02385C54
	add r1, r6, #3
	mov r0, sl
	mov r2, #1
	bl ov30_02385C54
	mov r0, sl
	add r1, r8, #0x20
	mov r2, #1
	bl ov30_02385C54
	mov r0, sl
	add r1, r8, #4
	mov r2, #1
	bl ov30_02385C54
	add r1, r8, #6
	mov r0, sl
	mov r2, #1
	bl ov30_02385C54
	mov r1, #1
_02382F84:
	cmp r1, #0
	bne _02382F9C
	mov r0, sl
	add r1, sp, #0
	mov r2, #7
	bl ov30_02385C54
_02382F9C:
	add sb, sb, #1
	cmp sb, #0x40
	blt _02382EDC
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02382FB0: .word OVERLAY30_JP_STRING_1
_02382FB4: .word DUNGEON_PTR
	arm_func_end ov30_02382E94

	arm_func_start ov30_02382FB8
ov30_02382FB8: ; 0x02382FB8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0238307C ; =DUNGEON_PTR
	ldr r1, _02383080 ; =OVERLAY30_JP_STRING_1
	ldr r2, [r2]
	mov r5, r0
#ifdef JAPAN
	add r2, r2, #0x388
	add r4, r2, #0x19400
#else
	add r2, r2, #0x2c
	add r4, r2, #0x19800
#endif
	bl ov30_02385CE0
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4]
	mov r2, #1
	cmp r0, #5
	bne _02383034
	add r1, sp, #1
	mov r0, r5
	strb r2, [sp, #1]
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #0x20
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #4
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #6
	mov r2, #1
	bl ov30_02385C54
	ldmia sp!, {r3, r4, r5, pc}
_02383034:
	mov r3, #0
	add r1, sp, #0
	mov r0, r5
	strb r3, [sp]
	bl ov30_02385C54
	add r1, sp, #0
	mov r0, r5
	mov r2, #1
	bl ov30_02385C54
	add r1, sp, #0
	mov r0, r5
	mov r2, #1
	bl ov30_02385C54
	add r1, sp, #0
	mov r0, r5
	mov r2, #1
	bl ov30_02385C54
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238307C: .word DUNGEON_PTR
_02383080: .word OVERLAY30_JP_STRING_1
	arm_func_end ov30_02382FB8

	arm_func_start ov30_02383084
ov30_02383084: ; 0x02383084
#ifdef JAPAN
#define OV30_02383084_OFFSET -0xA4
#else
#define OV30_02383084_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _023831E0 ; =OVERLAY30_JP_STRING_1
	mov r4, r0
	bl ov30_02385CE0
	ldr r1, _023831E4 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldr r1, [r1, #0xe2c + OV30_02383084_OFFSET]
	bl ov30_02385D74
	ldr r1, _023831E4 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldr r1, [r1, #0xe30 + OV30_02383084_OFFSET]
	bl ov30_02385D74
	ldr r1, _023831E4 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe34 + OV30_02383084_OFFSET]
	bl ov30_02385DD4
	ldr r1, _023831E4 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe35 + OV30_02383084_OFFSET]
	bl ov30_02385DD4
	ldr r1, _023831E4 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe36 + OV30_02383084_OFFSET]
	bl ov30_02385DD4
	ldr r1, _023831E4 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe37 + OV30_02383084_OFFSET]
	bl ov30_02385DD4
	ldr r1, _023831E4 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe38 + OV30_02383084_OFFSET]
	bl ov30_02385DD4
	ldr r1, _023831E4 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe39 + OV30_02383084_OFFSET]
	bl ov30_02385DD4
	ldr r1, _023831E4 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe3c + OV30_02383084_OFFSET]
	bl ov30_02385DD4
	ldr r1, _023831E4 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
#ifdef JAPAN
	add r1, r1, #0x3d00
	ldrh r1, [r1, #0x96]
#else
	add r1, r1, #0x3e00
	ldrh r1, [r1, #0x3a + OV30_02383084_OFFSET]
#endif
	bl ov30_02385D14
	ldr r5, _023831E4 ; =DUNGEON_PTR
	mov r6, #0
_0238318C:
	ldr r1, [r5]
	mov r0, r4
	add r1, r1, r6, lsl #2
	add r1, r1, #0x12000
	ldr r1, [r1, #0xb28 + OV30_02383084_OFFSET]
	bl ov30_023831E8
	add r6, r6, #1
	cmp r6, #4
	blt _0238318C
	ldr r5, _023831E4 ; =DUNGEON_PTR
	mov r6, #0
_023831B8:
	ldr r1, [r5]
	mov r0, r4
	add r1, r1, r6, lsl #2
	add r1, r1, #0x12000
	ldr r1, [r1, #0xb38 + OV30_02383084_OFFSET]
	bl ov30_023831E8
	add r6, r6, #1
	cmp r6, #0x10
	blt _023831B8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023831E0: .word OVERLAY30_JP_STRING_1
_023831E4: .word DUNGEON_PTR
	arm_func_end ov30_02383084

	arm_func_start ov30_023831E8
ov30_023831E8: ; 0x023831E8
#ifdef JAPAN
#define OV30_023831E8_OFFSET -4
#else
#define OV30_023831E8_OFFSET 0
#endif
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
#endif
	sub sp, sp, #0x25c + OV30_023831E8_OFFSET
	mov r4, r1
	mov r3, #0
	mov r2, #1
	mov r8, r0
	mov r1, #0xaa
	str r3, [sp, #0x18]
	str r2, [sp, #0x14]
	bl ov30_02385D54
	mov r0, r8
	mov r1, #0x55
	bl ov30_02385D54
	cmp r4, #0
	moveq r0, #0
	beq _0238323C
	ldr r0, [r4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_0238323C:
	cmp r0, #0
	beq _0238329C
	add r1, sp, #0x14
	mov r0, r8
	mov r2, #1
	ldr r6, [r4, #0xb4]
	bl ov30_02385C54
	mov r0, r8
	add r1, r4, #4
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	add r1, r4, #6
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	add r1, r4, #0x20
	mov r2, #1
	bl ov30_02385C54
	add r1, r4, #0x26
	mov r0, r8
	mov r2, #2
	bl ov30_02385C54
	b _02383300
_0238329C:
	add r0, sp, #0x1c
	mov r1, #0
	mov r2, #0x240 + OV30_023831E8_OFFSET
	bl memset
	add r1, sp, #0x18
	mov r0, r8
	mov r2, #1
	add r6, sp, #0x1c
	bl ov30_02385C54
	add r1, sp, #0x18
	mov r0, r8
	mov r2, #1
	bl ov30_02385C54
	add r1, sp, #0x18
	mov r0, r8
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	add r1, sp, #0x18
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	add r1, sp, #0x18
	mov r2, #2
	bl ov30_02385C54
_02383300:
	ldrh r1, [r6]
	mov r0, r8
	bl ov30_02385D14
	ldrsh r2, [r6, #4]
	add r1, sp, #0xc
	mov r0, r8
	strh r2, [sp, #0xc]
	mov r2, #2
	bl ov30_02385C54
	ldrsh r2, [r6, #2]
	add r1, sp, #0xa
	mov r0, r8
	strh r2, [sp, #0xa]
	mov r2, #2
	bl ov30_02385C54
	ldrb r1, [r6, #6]
	mov r0, r8
	bl ov30_02385DD4
	ldrb r1, [r6, #7]
	mov r0, r8
	bl ov30_02385DD4
	ldrb r1, [r6, #8]
	mov r0, r8
	bl ov30_02385DD4
	ldrb r1, [r6, #9]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0xa]
	mov r0, r8
	bl ov30_02385D54
	ldrsh r1, [r6, #0xc]
	mov r0, r8
	and r1, r1, #0xff
	bl ov30_02385D54
	ldrb r1, [r6, #0x48]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0x49]
	mov r0, r8
	bl ov30_02385D54
	ldrsh r1, [r6, #0xe]
	mov r0, r8
	bl ov30_02385D34
	ldrsh r1, [r6, #0x10]
	mov r0, r8
	bl ov30_02385D34
	ldrsh r1, [r6, #0x12]
	mov r0, r8
	bl ov30_02385D34
	ldrsh r1, [r6, #0x16]
	mov r0, r8
	bl ov30_02385D34
	ldrsh r1, [r6, #0x14]
	mov r0, r8
	bl ov30_02385D34
	ldrb r1, [r6, #0x1a]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0x1b]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0x1c]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0x1d]
	mov r0, r8
	bl ov30_02385D54
	ldr r1, [r6, #0x20]
	mov r0, r8
	bl ov30_02385D74
	ldrsh r1, [r6, #0x24]
	mov r0, r8
	bl ov30_02385D34
	ldrsh r1, [r6, #0x26]
	mov r0, r8
	bl ov30_02385D34
	ldrsh r1, [r6, #0x28]
	mov r0, r8
	bl ov30_02385D34
	ldrsh r1, [r6, #0x2a]
	mov r0, r8
	bl ov30_02385D34
	ldrsh r1, [r6, #0x2c]
	mov r0, r8
	bl ov30_02385D34
	ldrsh r1, [r6, #0x2e]
	mov r0, r8
	bl ov30_02385D34
	ldrsh r1, [r6, #0x30]
	mov r0, r8
	bl ov30_02385D34
	ldr r1, [r6, #0x34]
	mov r0, r8
	bl ov30_02385DB4
	ldr r1, [r6, #0x38]
	mov r0, r8
	bl ov30_02385DB4
	ldr r1, [r6, #0x3c]
	mov r0, r8
	bl ov30_02385DB4
	ldr r1, [r6, #0x40]
	mov r0, r8
	bl ov30_02385DB4
	mov r0, r8
	add r1, r6, #0x4c
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	add r1, r6, #0x5a
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	add r1, r6, #0x5c
	mov r2, #1
	bl ov30_02385C54
	ldrb r2, [r6, #0x5e]
	mov r0, r8
	add r1, sp, #7
	strb r2, [sp, #7]
	mov r2, #1
	bl ov30_02385C54
	ldrb r2, [r6, #0x5f]
	mov r0, r8
	add r1, sp, #6
	strb r2, [sp, #6]
	mov r2, #1
	bl ov30_02385C54
	ldrb r2, [r6, #0x60]
	mov r0, r8
	add r1, sp, #5
	strb r2, [sp, #5]
	mov r2, #1
	bl ov30_02385C54
	ldrb r2, [r6, #0x61]
	mov r0, r8
	add r1, sp, #4
	strb r2, [sp, #4]
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	add r1, r6, #0x62
	bl ov30_02384268
	ldrsh r2, [r6, #0x68]
	mov r0, r8
	add r1, sp, #8
	strh r2, [sp, #8]
	mov r2, #2
	bl ov30_02385C54
	mov r5, #0
	add r4, r6, #0x6a
_02383558:
	mov r0, r8
	add r1, r4, r5, lsl #2
	bl ov30_02385DF8
	add r5, r5, #1
	cmp r5, #4
	blt _02383558
	mov r0, r8
	add r1, r6, #0x7c
	mov r2, #1
	bl ov30_02385C54
	ldrb r1, [r6, #0x7d]
	mov r0, r8
	bl ov30_02385DD4
	ldrb r1, [r6, #0x7e]
	mov r0, r8
	bl ov30_02385DD4
	ldrb r1, [r6, #0x7f]
	mov r0, r8
	bl ov30_02385DD4
	ldrh r1, [r6, #0x80]
	mov r0, r8
	bl ov30_02385D14
	mov r0, r8
	add r1, r6, #0x8c
	bl ov30_02385DF8
	mov r0, r8
	add r1, r6, #0x90
	mov r2, #0x45
	bl ov30_02385C54
	mov r0, r8
	add r1, r6, #0x9c
	mov r2, #0x45
	bl ov30_02385C54
	ldrb r2, [r6, #0xa8]
	mov r0, r8
	add r1, sp, #3
	strb r2, [sp, #3]
	mov r2, #1
	bl ov30_02385C54
	ldrsh r1, [r6, #0x44]
	mov r0, r8
	bl ov30_02385D34
	ldrb r2, [r6, #0x46]
	mov r0, r8
	add r1, sp, #2
	strb r2, [sp, #2]
	mov r2, #1
	bl ov30_02385C54
	ldr r1, [r6, #0xb0]
	mov r0, r8
	bl ov30_02385D74
	ldr r1, [r6, #0xb4]
	mov r0, r8
	bl ov30_02385D74
	ldr r1, [r6, #0xb8]
	mov r0, r8
	bl ov30_02385D74
	mov r0, r8
	add r1, r6, #0xbd
	mov r2, #1
	bl ov30_02385C54
	ldrb r1, [r6, #0xbe]
	mov r0, r8
	bl ov30_02385D54
	mov r0, r8
	add r1, r6, #0xbf
	mov r2, #1
	bl ov30_02385C54
	ldrb r1, [r6, #0xc0]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0xc1]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0xc2]
	mov r0, r8
	bl ov30_02385D54
	mov r0, r8
	add r1, r6, #0xc4
	mov r2, #1
	bl ov30_02385C54
	ldrb r1, [r6, #0xcc]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0xcd]
	mov r0, r8
	bl ov30_02385D54
	ldr r1, [r6, #0xc8]
	mov r0, r8
	bl ov30_02385D74
	mov r0, r8
	add r1, r6, #0xd0
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	ldrb r1, [r6, #0xd1]
	bl ov30_02385D54
	mov r0, r8
	add r1, r6, #0xd2
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	ldrb r1, [r6, #0xd3]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0xd4]
	bl ov30_02385D54
	mov r0, r8
	add r1, r6, #0xd5
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	ldrb r1, [r6, #0xd6]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0xd7]
	bl ov30_02385D54
	mov r0, r8
	add r1, r6, #0xd8
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	ldrb r1, [r6, #0xd9]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0xda]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0xdb]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0xdc]
	bl ov30_02385D54
	mov r0, r8
	add r1, r6, #0xe0
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	ldr r1, [r6, #0xe4]
	bl ov30_02385D74
	mov r0, r8
	ldrb r1, [r6, #0xe8]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0xe9]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0xea]
	bl ov30_02385D54
	mov r0, r8
	add r1, r6, #0xec
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	ldrb r1, [r6, #0xed]
	bl ov30_02385D54
	mov r0, r8
	add r1, r6, #0xee
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	add r1, r6, #0xef
	mov r2, #1
	bl ov30_02385C54
	ldrb r1, [r6, #0xf0]
	mov r0, r8
	bl ov30_02385D54
	mov r0, r8
	add r1, r6, #0xf1
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	ldrb r1, [r6, #0xf2]
	bl ov30_02385D54
	mov r0, r8
	add r1, r6, #0xf3
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	ldrb r1, [r6, #0xf4]
	bl ov30_02385D54
	mov r0, r8
	add r1, r6, #0xf5
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	ldrb r1, [r6, #0xf6]
	bl ov30_02385D54
	mov r0, r8
	add r1, r6, #0xf7
	mov r2, #1
	bl ov30_02385C54
	mov r0, r8
	ldrb r1, [r6, #0xf8]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0xf9]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0xfa]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0xfb]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0xfc]
	bl ov30_02385DD4
	mov r0, r8
#ifdef JAPAN
	ldrb r1, [r6, #0xfd]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x107]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0xfe]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0xff]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x100]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x103]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0x104]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0x108]
	bl ov30_02385DD4
	ldrb r1, [r6, #0x105]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0x106]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0x109]
	mov r0, r8
	bl ov30_02385D54
	ldrb r2, [r6, #0x10a]
	add r1, sp, #1
	mov r0, r8
	strb r2, [sp, #1]
	mov r2, #1
	bl ov30_02385C54
	ldrb r2, [r6, #0x10b]
	mov r0, r8
	add r1, sp, #0
	strb r2, [sp]
	mov r2, #1
	bl ov30_02385C54
	ldr r1, [r6, #0x10c]
	mov r0, r8
	str r1, [sp, #0x10]
	add r1, sp, #0x10
	mov r2, #4
	bl ov30_02385C54
	mov r0, r8
	add r1, r6, #0x110
	mov r2, #5
	bl ov30_02385EB8
	add r1, r6, #0x15
	mov r0, r8
	add r1, r1, #0x100
	mov r2, #5
	bl ov30_02385EB8
	ldrb r1, [r6, #0x11a]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0x11b]
	mov r0, r8
	bl ov30_02385D54
	ldr r1, [r6, #0x11c]
	mov r0, r8
	and r1, r1, #0xff
	bl ov30_02385D54
	mov r7, #0
	add r5, r6, #0x120
#else
	ldrb r1, [r6, #0x103]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0xfd]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x108]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0xfe]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0xff]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x100]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x104]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0x105]
	bl ov30_02385D54
	ldrb r1, [r6, #0x109]
	mov r0, r8
	bl ov30_02385DD4
	ldrb r1, [r6, #0x106]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0x107]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0x10a]
	mov r0, r8
	bl ov30_02385D54
	ldrb r2, [r6, #0x10b]
	mov r0, r8
	add r1, sp, #1
	strb r2, [sp, #1]
	mov r2, #1
	bl ov30_02385C54
	ldrb r2, [r6, #0x10c]
	mov r0, r8
	add r1, sp, #0
	strb r2, [sp]
	mov r2, #1
	bl ov30_02385C54
	ldr r1, [r6, #0x110]
	mov r0, r8
	str r1, [sp, #0x10]
	add r1, sp, #0x10
	mov r2, #4
	bl ov30_02385C54
	mov r0, r8
	add r1, r6, #0x114
	mov r2, #5
	bl ov30_02385EB8
	add r1, r6, #0x19
	mov r0, r8
	add r1, r1, #0x100
	mov r2, #5
	bl ov30_02385EB8
	ldrb r1, [r6, #0x11e]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0x11f]
	mov r0, r8
	bl ov30_02385D54
	ldr r1, [r6, #0x120]
	mov r0, r8
	and r1, r1, #0xff
	bl ov30_02385D54
	mov r7, #0
	add r5, r6, #0x124
#endif
	mov r4, #2
_023839C4:
	add r0, r6, r7, lsl #3
	ldrb r1, [r0, #0x124 + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D54
	add r0, r6, r7, lsl #3
	add r0, r0, #0x100
	ldrh r1, [r0, #0x26 + OV30_023831E8_OFFSET]
	mov r0, r8
	and r1, r1, #0xff
	bl ov30_02385D54
	add r1, r5, r7, lsl #3
	mov r0, r8
	mov r2, r4
	add r1, r1, #4
	bl ov30_02385C54
	add r0, r6, r7, lsl #3
	ldrb r1, [r0, #0x12a + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D54
	mov r0, r8
	add r1, r6, r7, lsl #3
	ldrb r1, [r1, #0x12b + OV30_023831E8_OFFSET]
	bl ov30_02385D54
	add r7, r7, #1
	cmp r7, #4
	blt _023839C4
	ldrb r1, [r6, #0x144 + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D54
	add r0, r6, #0x100
	ldrsh r1, [r0, #0x46 + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D34
	add r0, r6, #0x100
	ldrsh r1, [r0, #0x48 + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D34
	add r0, r6, #0x100
	ldrsh r1, [r0, #0x4a + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D34
	add r0, r6, #0x100
	ldrsh r1, [r0, #0x4c + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D34
	ldrb r1, [r6, #0x14e + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x14f + OV30_023831E8_OFFSET]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x151 + OV30_023831E8_OFFSET]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x150 + OV30_023831E8_OFFSET]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x152 + OV30_023831E8_OFFSET]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x153 + OV30_023831E8_OFFSET]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x154 + OV30_023831E8_OFFSET]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x155 + OV30_023831E8_OFFSET]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x156 + OV30_023831E8_OFFSET]
	bl ov30_02385DD4
	mov r0, r8
	add r1, r6, #0x100
	ldrh r1, [r1, #0x58 + OV30_023831E8_OFFSET]
	bl ov30_02385D14
	mov r0, r8
	add r1, r6, #0x100
	ldrh r1, [r1, #0x5a + OV30_023831E8_OFFSET]
	bl ov30_02385D14
	mov r0, r8
	ldrb r1, [r6, #0x15c + OV30_023831E8_OFFSET]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x15d + OV30_023831E8_OFFSET]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0x15e + OV30_023831E8_OFFSET]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x15f + OV30_023831E8_OFFSET]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x160 + OV30_023831E8_OFFSET]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x177 + OV30_023831E8_OFFSET]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0x178 + OV30_023831E8_OFFSET]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0x179 + OV30_023831E8_OFFSET]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0x17a + OV30_023831E8_OFFSET]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0x17b + OV30_023831E8_OFFSET]
	bl ov30_02385D54
	ldrb r1, [r6, #0x17c + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D54
	add r1, r6, #0x7e + OV30_023831E8_OFFSET
	mov r0, r8
	add r1, r1, #0x100
	bl ov30_02385DF8
	ldr r1, [r6, #0x188 + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385DB4
	add r0, r6, #0x100
	ldrh r1, [r0, #0x92 + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D14
	ldr r1, [r6, #0x18c + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D94
	add r0, r6, #0x100
	ldrh r1, [r0, #0x90 + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D14
	add r1, r6, #0x200
	ldrsh r1, [r1, #0x10 + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D34
	add r1, r6, #0x200
	ldrsh r1, [r1, #0x12 + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D34
	ldr r1, [r6, #0x214 + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D74
	ldrb r1, [r6, #0xbc]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0x166 + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0x167 + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D54
	add r1, r6, #0x100
	ldrsh r1, [r1, #0x68 + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D34
	ldrsh r1, [r6, #0xac]
	mov r0, r8
	bl ov30_02385D34
	ldrb r1, [r6, #0x16a + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D54
	mov r4, #0
_02383C4C:
	add r0, r6, r4
	ldrb r1, [r0, #0x16b + OV30_023831E8_OFFSET]
	mov r0, r8
	bl ov30_02385D54
	add r4, r4, #1
	cmp r4, #5
	blt _02383C4C
	add sp, sp, #0x25c + OV30_023831E8_OFFSET
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
#endif
	arm_func_end ov30_023831E8

	arm_func_start ov30_02383C70
ov30_02383C70: ; 0x02383C70
#ifdef JAPAN
#define OV30_02383C70_OFFSET -0xA4
#else
#define OV30_02383C70_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _02384090 ; =OVERLAY30_JP_STRING_1
	mov sl, r0
	bl ov30_02385CE0
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc4 + OV30_02383C70_OFFSET]
	bl ov30_02385DD4
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc5 + OV30_02383C70_OFFSET]
	bl ov30_02385DD4
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc6 + OV30_02383C70_OFFSET]
	bl ov30_02385DD4
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc7 + OV30_02383C70_OFFSET]
	bl ov30_02385DD4
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc8 + OV30_02383C70_OFFSET]
	bl ov30_02385DD4
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc9 + OV30_02383C70_OFFSET]
	bl ov30_02385D54
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xca + OV30_02383C70_OFFSET]
	bl ov30_02385D54
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldr r1, [r1, #0xcc + OV30_02383C70_OFFSET]
	and r1, r1, #0xff
	bl ov30_02385D54
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldr r1, [r1, #0xd0 + OV30_02383C70_OFFSET]
	and r1, r1, #0xff
	bl ov30_02385D54
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrsh r1, [r1, #0xd4 + OV30_02383C70_OFFSET]
	bl ov30_02385D34
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrsh r1, [r1, #0xd6 + OV30_02383C70_OFFSET]
	bl ov30_02385D34
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrsh r1, [r1, #0xd8 + OV30_02383C70_OFFSET]
	bl ov30_02385D34
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xda + OV30_02383C70_OFFSET]
	bl ov30_02385D34
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrsh r1, [r1, #0xde + OV30_02383C70_OFFSET]
	bl ov30_02385D34
	mov r8, #0
	ldr r6, _02384094 ; =DUNGEON_PTR
	mov fp, r8
	mov r4, #0x14
	mov r5, #0x460
_02383DEC:
	mul sb, r8, r5
	mov r7, fp
_02383DF4:
	ldr r1, [r6]
	mov r0, sl
	add r1, r1, #0xe0 + OV30_02383C70_OFFSET
	add r1, r1, #0x4000
	add r1, r1, sb
	mla r1, r7, r4, r1
	bl ov30_023842B0
	add r7, r7, #1
	cmp r7, #0x38
	blt _02383DF4
	add r8, r8, #1
	cmp r8, #0x20
	blt _02383DEC
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
#ifdef JAPAN
	add r1, r1, #0x3c
	add r1, r1, #0xcc00
#else
	add r1, r1, #0xce0
	add r1, r1, #0xc000
#endif
	bl ov30_02385DF8
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
#ifdef JAPAN
	add r1, r1, #0xc40
	add r1, r1, #0xc000
#else
	add r1, r1, #0xe4
	add r1, r1, #0xcc00
#endif
	bl ov30_02385DF8
	ldr r0, _02384094 ; =DUNGEON_PTR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0xcc00
	ldrh r2, [r0, #0xe8 + OV30_02383C70_OFFSET]
	strh r2, [sp]
	ldrh r2, [r0, #0xea + OV30_02383C70_OFFSET]
	ldrsh r0, [sp]
	strh r2, [sp, #2]
	cmp r0, r1
	moveq r0, #0xff
	streqh r0, [sp]
	ldrsh r1, [sp, #2]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #0xff
	streqh r0, [sp, #2]
	add r1, sp, #0
	mov r0, sl
	bl ov30_02385DF8
	ldr r4, _02384094 ; =DUNGEON_PTR
	mov r5, #0
_02383EB0:
	ldr r1, [r4]
	mov r0, sl
	add r1, r1, #0xec + OV30_02383C70_OFFSET
	add r1, r1, #0xcc00
	add r1, r1, r5, lsl #2
	bl ov30_02385E20
	add r5, r5, #1
	cmp r5, #8
	blt _02383EB0
	ldr r4, _02384094 ; =DUNGEON_PTR
	mov r5, #0
_02383EDC:
	ldr r1, [r4]
	mov r0, sl
	add r1, r1, r5
	add r1, r1, #0xc000
	ldrb r1, [r1, #0xd0c + OV30_02383C70_OFFSET]
	bl ov30_02385D54
	add r5, r5, #1
	cmp r5, #8
	blt _02383EDC
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
#ifdef JAPAN
	add r1, r1, #0xc70
	add r1, r1, #0xc000
#else
	add r1, r1, #0x114
	add r1, r1, #0xcc00
#endif
	bl ov30_02385E48
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
#ifdef JAPAN
	add r1, r1, #0xc80
	add r1, r1, #0xc000
#else
	add r1, r1, #0x124
	add r1, r1, #0xcc00
#endif
	bl ov30_02385E48
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
#ifdef JAPAN
	add r1, r1, #0xc90
	add r1, r1, #0xc000
#else
	add r1, r1, #0x134
	add r1, r1, #0xcc00
#endif
	bl ov30_02385E90
	mov r8, #0
	ldr r6, _02384094 ; =DUNGEON_PTR
	mov fp, r8
	mov r4, #0x14
	mov r5, #0xa0
_02383F5C:
	mul r7, r8, r5
	mov sb, fp
_02383F64:
	ldr r1, [r6]
	mov r0, sl
#ifdef JAPAN
	add r1, r1, #0xbc
	add r1, r1, #0xcc00
#else
	add r1, r1, #0xd60
	add r1, r1, #0xc000
#endif
	add r1, r1, r7
	mla r1, sb, r4, r1
	bl ov30_023842B0
	ldr r1, [r6]
	mov r0, sl
	add r1, r1, r8, lsl #4
	add r1, r1, sb, lsl #1
#ifdef JAPAN
	add r1, r1, #0xd100
	ldrsh r1, [r1, #0xbc]
#else
	add r1, r1, #0xd200
	ldrsh r1, [r1, #0x60]
#endif
	bl ov30_02385D34
	add sb, sb, #1
	cmp sb, #8
	blt _02383F64
	add r8, r8, #1
	cmp r8, #8
	blt _02383F5C
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	mov r2, #1
	add r1, r1, #0x138 + OV30_02383C70_OFFSET
	add r4, r1, #0xcc00
	mov r1, r4
	bl ov30_02385C54
	mov r0, sl
	add r1, r4, #1
	mov r2, #1
	bl ov30_02385C54
	mov r5, #0
_02383FE8:
	add r0, r4, r5, lsl #1
	ldrh r1, [r0, #2]
	mov r0, sl
	bl ov30_02385D14
	add r0, r4, r5, lsl #1
	ldrh r1, [r0, #0x12]
	mov r0, sl
	bl ov30_02385D14
	add r5, r5, #1
	cmp r5, #8
	blt _02383FE8
	ldrb r1, [r4, #0x22]
	mov r0, sl
	bl ov30_02385D54
	ldrb r1, [r4, #0x23]
	mov r0, sl
	bl ov30_02385D54
	ldrb r1, [r4, #0x24]
	mov r0, sl
	bl ov30_02385D54
	ldrb r1, [r4, #0x25]
	mov r0, sl
	bl ov30_02385DD4
	ldr r1, _02384094 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	mov r2, #1
	add r1, r1, #0x2fc + OV30_02383C70_OFFSET
	add r4, r1, #0x12800
	mov r1, r4
	bl ov30_02385C54
	add r1, r4, #1
	mov r0, sl
	mov r2, #1
	bl ov30_02385C54
	mov r0, sl
	ldr r2, _02384094 ; =DUNGEON_PTR
	ldr r1, _02384098 ; =0x00012AFE
	ldr r2, [r2]
	ldrsh r1, [r2, r1]
	bl ov30_02385D34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02384090: .word OVERLAY30_JP_STRING_1
_02384094: .word DUNGEON_PTR
_02384098: .word 0x00012AFE + OV30_02383C70_OFFSET
	arm_func_end ov30_02383C70

	arm_func_start ov30_0238409C
ov30_0238409C: ; 0x0238409C
#ifdef JAPAN
#define OV30_0238409C_OFFSET -0xA4
#else
#define OV30_0238409C_OFFSET 0
#endif
	stmdb sp!, {r4, lr}
	ldr r1, _02384200 ; =OVERLAY30_JP_STRING_1
	mov r4, r0
	bl ov30_02385CE0
	ldr r1, _02384204 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x23c + OV30_0238409C_OFFSET]
	bl ov30_02385D54
	ldr r1, _02384204 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x23d + OV30_0238409C_OFFSET]
	bl ov30_02385D54
	ldr r1, _02384204 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x23e + OV30_0238409C_OFFSET]
	bl ov30_02385DD4
	ldr r1, _02384204 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x23f + OV30_0238409C_OFFSET]
	bl ov30_02385DD4
	ldr r1, _02384204 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x240 + OV30_0238409C_OFFSET]
	bl ov30_02385DD4
	ldr r1, _02384204 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x242 + OV30_0238409C_OFFSET]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x24f + OV30_0238409C_OFFSET]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x243 + OV30_0238409C_OFFSET]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x24e + OV30_0238409C_OFFSET]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x250 + OV30_0238409C_OFFSET]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x244 + OV30_0238409C_OFFSET]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x245 + OV30_0238409C_OFFSET]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x246 + OV30_0238409C_OFFSET]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x248 + OV30_0238409C_OFFSET]
	bl ov30_02385DD4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02384200: .word OVERLAY30_JP_STRING_1
_02384204: .word DUNGEON_PTR
	arm_func_end ov30_0238409C

	arm_func_start ov30_02384208
ov30_02384208: ; 0x02384208
	stmdb sp!, {r4, lr}
	ldr r2, _02384258 ; =DUNGEON_PTR
	ldr r1, _0238425C ; =0x0002CB02
	ldr r2, [r2]
	mov r4, r0
	ldrsh r1, [r2, r1]
	bl ov30_02385D34
	ldr r0, _02384258 ; =DUNGEON_PTR
	ldr r1, _02384260 ; =0x0002CB04
	ldr r2, [r0]
	mov r0, r4
	ldrsh r1, [r2, r1]
	bl ov30_02385D34
	ldr r0, _02384258 ; =DUNGEON_PTR
	ldr r1, _02384264 ; =0x0002CB06
	ldr r2, [r0]
	mov r0, r4
	ldrsh r1, [r2, r1]
	bl ov30_02385D34
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
#define OV30_02384208_OFFSET -0xA4
#else
#define OV30_02384208_OFFSET 0
#endif
_02384258: .word DUNGEON_PTR
_0238425C: .word 0x0002CB02 + OV30_02384208_OFFSET
_02384260: .word 0x0002CB04 + OV30_02384208_OFFSET
_02384264: .word 0x0002CB06 + OV30_02384208_OFFSET
	arm_func_end ov30_02384208

	arm_func_start ov30_02384268
ov30_02384268: ; 0x02384268
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #1
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #2
	mov r2, #2
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #4
	mov r2, #2
	bl ov30_02385C54
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02384268

	arm_func_start ov30_023842B0
ov30_023842B0: ; 0x023842B0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrh r1, [r4]
	mov r5, r0
	bl ov30_02385D14
	ldrh r1, [r4, #2]
	mov r0, r5
	bl ov30_02385D14
	mov r0, r5
	add r1, r4, #7
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #6
	mov r2, #1
	bl ov30_02385C54
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_023842B0

	arm_func_start ov30_023842F4
ov30_023842F4: ; 0x023842F4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #4
	mov r1, r3
	bl ov30_02385C8C
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #4
	bl ov30_02385CA4
	ldr r1, _023843F0 ; =OVERLAY30_JP_STRING_1
	add r0, sp, #4
	bl ov30_02385CF0
	ldr r1, _023843F4 ; =DUNGEON_PTR
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0xac
	add r1, r1, #0x348
	add r1, r1, #0x400
	bl ov30_02385CA4
	ldr r1, _023843F0 ; =OVERLAY30_JP_STRING_1
	add r0, sp, #4
	bl ov30_02385CF0
	add r0, sp, #4
	bl ov30_02385EDC
	ldr r6, _023843F4 ; =DUNGEON_PTR
	ldr r1, _023843F8 ; =0x0002C9E6
	ldr r2, [r6]
	mov r4, #0
	strh r0, [r2, r1]
	add r5, r1, #4
	add r7, sp, #4
_02384378:
	mov r0, r7
	bl ov30_02385EC4
	ldr r1, [r6]
	add r1, r1, r4, lsl #1
	add r4, r4, #1
	strh r0, [r1, r5]
	cmp r4, #0x10
	blt _02384378
	add r0, sp, #4
	bl ov30_02384400
	add r0, sp, #4
	bl ov30_023848A0
	add r0, sp, #4
	bl ov30_02384A20
	add r0, sp, #4
	bl ov30_02384A94
	add r0, sp, #4
	bl ov30_02384B84
	add r0, sp, #4
	bl ov30_02384C6C
	add r0, sp, #4
	bl ov30_02384CD4
	ldr r1, _023843FC ; =OVERLAY30_JP_STRING_2
	add r0, sp, #4
	bl ov30_02385CF0
	add r0, sp, #4
	bl ov30_02385CDC
#ifdef EUROPE
	mov r0, #0
#endif
	bl ov29_022FB920
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023843F0: .word OVERLAY30_JP_STRING_1
_023843F4: .word DUNGEON_PTR
#ifdef JAPAN
_023843F8: .word 0x0002C942
#else
_023843F8: .word 0x0002C9E6
#endif
_023843FC: .word OVERLAY30_JP_STRING_2
	arm_func_end ov30_023842F4

	arm_func_start ov30_02384400
ov30_02384400: ; 0x02384400
#ifdef JAPAN
#define OV30_02384400_OFFSET -0xA4
#else
#define OV30_02384400_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _02384830 ; =OVERLAY30_JP_STRING_1
	mov sl, r0
	bl ov30_02385CF0
	mov r0, sl
	bl ov30_02385F54
	ldr r1, _02384834 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xc4 + OV30_02384400_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	ldr r1, _02384834 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xc5 + OV30_02384400_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	ldr r1, _02384834 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xc6 + OV30_02384400_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	ldr r1, _02384834 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xc7 + OV30_02384400_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	ldr r1, _02384834 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xc8 + OV30_02384400_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	ldr r1, _02384834 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xc9 + OV30_02384400_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	ldr r1, _02384834 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xca + OV30_02384400_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	ldr r1, _02384834 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	str r0, [r1, #0xcc + OV30_02384400_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	ldr r1, _02384834 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	str r0, [r1, #0xd0 + OV30_02384400_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	ldr r1, _02384834 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	strh r0, [r1, #0xd4 + OV30_02384400_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	ldr r1, _02384834 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	strh r0, [r1, #0xd6 + OV30_02384400_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	ldr r1, _02384834 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	strh r0, [r1, #0xd8 + OV30_02384400_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	ldr r1, _02384834 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xda + OV30_02384400_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	ldr r6, _02384834 ; =DUNGEON_PTR
	mov r8, #0
	ldr r1, [r6]
	mov fp, r8
	add r1, r1, #0x4000
	strh r0, [r1, #0xde + OV30_02384400_OFFSET]
	mov r4, #0x14
	mov r5, #0x460
_02384570:
	mul sb, r8, r5
	mov r7, fp
_02384578:
	ldr r1, [r6]
	mov r0, sl
	add r1, r1, #0xe0 + OV30_02384400_OFFSET
	add r1, r1, #0x4000
	add r1, r1, sb
	mla r1, r7, r4, r1
	bl ov30_0238483C
	add r7, r7, #1
	cmp r7, #0x38
	blt _02384578
	add r8, r8, #1
	cmp r8, #0x20
	blt _02384570
	ldr r1, _02384834 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
#ifdef JAPAN
	add r1, r1, #0x3c
	add r1, r1, #0xcc00
#else
	add r1, r1, #0xce0
	add r1, r1, #0xc000
#endif
	bl ov30_02385F7C
	ldr r1, _02384834 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
#ifdef JAPAN
	add r1, r1, #0xc40
	add r1, r1, #0xc000
#else
	add r1, r1, #0xe4
	add r1, r1, #0xcc00
#endif
	bl ov30_02385F7C
	ldr r1, _02384834 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0xe8 + OV30_02384400_OFFSET
	add r1, r1, #0xcc00
	bl ov30_02385F7C
	ldr r0, _02384834 ; =DUNGEON_PTR
	ldr r4, _02384834 ; =DUNGEON_PTR
	ldr r0, [r0]
	mov r5, #0
	add r0, r0, #0xcc00
	ldrsh r1, [r0, #0xe8 + OV30_02384400_OFFSET]
	cmp r1, #0xff
	mvneq r1, #0
	streqh r1, [r0, #0xe8 + OV30_02384400_OFFSET]
	ldr r0, _02384834 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xcc00
	ldrsh r1, [r0, #0xea + OV30_02384400_OFFSET]
	cmp r1, #0xff
	mvneq r1, #0
	streqh r1, [r0, #0xea + OV30_02384400_OFFSET]
_02384634:
	ldr r1, [r4]
	mov r0, sl
	add r1, r1, #0xec + OV30_02384400_OFFSET
	add r1, r1, #0xcc00
	add r1, r1, r5, lsl #2
	bl ov30_02385FB0
	add r5, r5, #1
	cmp r5, #8
	blt _02384634
	ldr r4, _02384834 ; =DUNGEON_PTR
	mov r5, #0
_02384660:
	mov r0, sl
	bl ov30_02385EF4
	ldr r1, [r4]
	add r1, r1, r5
	add r1, r1, #0xc000
	add r5, r5, #1
	strb r0, [r1, #0xd0c + OV30_02384400_OFFSET]
	cmp r5, #8
	blt _02384660
	ldr r1, _02384834 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
#ifdef JAPAN
	add r1, r1, #0xc70
	add r1, r1, #0xc000
#else
	add r1, r1, #0x114
	add r1, r1, #0xcc00
#endif
	bl ov30_02385FE4
	ldr r1, _02384834 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
#ifdef JAPAN
	add r1, r1, #0xc80
	add r1, r1, #0xc000
#else
	add r1, r1, #0x124
	add r1, r1, #0xcc00
#endif
	bl ov30_02385FE4
	ldr r1, _02384834 ; =DUNGEON_PTR
	mov r0, sl
	ldr r1, [r1]
#ifdef JAPAN
	add r1, r1, #0xc90
	add r1, r1, #0xc000
#else
	add r1, r1, #0x134
	add r1, r1, #0xcc00
#endif
	bl ov30_02386040
	mov r8, #0
	ldr r6, _02384834 ; =DUNGEON_PTR
	mov fp, r8
	mov r4, #0x14
	mov r5, #0xa0
_023846E0:
	mul r7, r8, r5
	mov sb, fp
_023846E8:
	ldr r1, [r6]
	mov r0, sl
#ifdef JAPAN
	add r1, r1, #0xbc
	add r1, r1, #0xcc00
#else
	add r1, r1, #0xd60
	add r1, r1, #0xc000
#endif
	add r1, r1, r7
	mla r1, sb, r4, r1
	bl ov30_0238483C
	mov r0, sl
	bl ov30_02385EDC
	ldr r1, [r6]
	add r1, r1, r8, lsl #4
	add r1, r1, sb, lsl #1
#ifdef JAPAN
	add r1, r1, #0xd100
	add sb, sb, #1
	strh r0, [r1, #0xbc]
#else
	add r1, r1, #0xd200
	add sb, sb, #1
	strh r0, [r1, #0x60]
#endif
	cmp sb, #8
	blt _023846E8
	add r8, r8, #1
	cmp r8, #8
	blt _023846E0
	ldr r0, _02384834 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x26
	add r0, r0, #0x138 + OV30_02384400_OFFSET
	add r4, r0, #0xcc00
	mov r0, r4
	bl memset
	mov r0, sl
	mov r1, r4
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	add r1, r4, #1
	mov r2, #1
	bl ov30_02385CA4
	mov r5, #0
_0238477C:
	mov r0, sl
	bl ov30_02385EC4
	add r1, r4, r5, lsl #1
	strh r0, [r1, #2]
	mov r0, sl
	bl ov30_02385EC4
	add r1, r4, r5, lsl #1
	add r5, r5, #1
	strh r0, [r1, #0x12]
	cmp r5, #8
	blt _0238477C
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [r4, #0x22]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [r4, #0x23]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [r4, #0x24]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [r4, #0x25]
	ldr r0, _02384834 ; =DUNGEON_PTR
	mov r1, #2
	ldr r0, [r0]
	add r0, r0, #0x2fc + OV30_02384400_OFFSET
	add r4, r0, #0x12800
	mov r0, r4
	bl MemZero
	mov r0, sl
	mov r1, r4
	mov r2, #1
	bl ov30_02385CA4
	add r1, r4, #1
	mov r0, sl
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EDC
	ldr r2, _02384834 ; =DUNGEON_PTR
	ldr r1, _02384838 ; =0x00012AFE
	ldr r2, [r2]
	strh r0, [r2, r1]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02384830: .word OVERLAY30_JP_STRING_1
_02384834: .word DUNGEON_PTR
_02384838: .word 0x00012AFE + OV30_02384400_OFFSET
	arm_func_end ov30_02384400

	arm_func_start ov30_0238483C
ov30_0238483C: ; 0x0238483C

	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, #0
	mov r2, #0x14
	bl memset
	mov r0, r5
	bl ov30_02385EC4
	strh r0, [r4]
	mov r0, r5
	bl ov30_02385EC4
	strh r0, [r4, #2]
	mov r0, r5
	add r1, r4, #7
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #6
	mov r2, #1
	bl ov30_02385CA4
	mov r0, #0
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_0238483C

	arm_func_start ov30_023848A0
ov30_023848A0: ; 0x023848A0
#ifdef JAPAN
#define OV30_023848A0_OFFSET -0xA4
#else
#define OV30_023848A0_OFFSET 0
#endif
	stmdb sp!, {r4, lr}
	ldr r1, _02384A18 ; =OVERLAY30_JP_STRING_1
	mov r4, r0
	bl ov30_02385CF0
	ldr r1, _02384A1C ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0x1a000
	str r2, [r1, #0x22c + OV30_023848A0_OFFSET]
	bl ov30_02385EF4
	ldr r1, _02384A1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x23c + OV30_023848A0_OFFSET]
	mov r0, r4
	bl ov30_02385EF4
	ldr r1, _02384A1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x23d + OV30_023848A0_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x23e + OV30_023848A0_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x23f + OV30_023848A0_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x240 + OV30_023848A0_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x242 + OV30_023848A0_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x24f + OV30_023848A0_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x243 + OV30_023848A0_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x24e + OV30_023848A0_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x250 + OV30_023848A0_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x244 + OV30_023848A0_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x245 + OV30_023848A0_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x246 + OV30_023848A0_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x248 + OV30_023848A0_OFFSET]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02384A18: .word OVERLAY30_JP_STRING_1
_02384A1C: .word DUNGEON_PTR
	arm_func_end ov30_023848A0

	arm_func_start ov30_02384A20
ov30_02384A20: ; 0x02384A20
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov30_02385EDC
	ldr r2, _02384A80 ; =DUNGEON_PTR
	ldr r1, _02384A84 ; =0x0002CB02
	ldr r2, [r2]
	strh r0, [r2, r1]
	mov r0, r4
	bl ov30_02385EDC
	ldr r2, _02384A80 ; =DUNGEON_PTR
	ldr r1, _02384A88 ; =0x0002CB04
	ldr r2, [r2]
	strh r0, [r2, r1]
	mov r0, r4
	bl ov30_02385EDC
	ldr r2, _02384A80 ; =DUNGEON_PTR
	ldr r1, _02384A8C ; =0x0002CB06
	ldr ip, [r2]
	ldr r3, _02384A90 ; =0x000003E7
	strh r0, [ip, r1]
	ldr r2, [r2]
	sub r0, r1, #2
	strh r3, [r2, r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
#define OV30_02384A20_OFFSET -0xA4
#else
#define OV30_02384A20_OFFSET 0
#endif
_02384A80: .word DUNGEON_PTR
_02384A84: .word 0x0002CB02 + OV30_02384A20_OFFSET
_02384A88: .word 0x0002CB04 + OV30_02384A20_OFFSET
_02384A8C: .word 0x0002CB06 + OV30_02384A20_OFFSET
_02384A90: .word 0x000003E7
	arm_func_end ov30_02384A20

	arm_func_start ov30_02384A94
ov30_02384A94: ; 0x02384A94
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xc
	mov r7, r0
	bl ov29_02344B1C
	ldr r1, _02384B20 ; =OVERLAY30_JP_STRING_1
	mov r0, r7
	bl ov30_02385CF0
	mov r6, #0
	mov sb, r6
	mov sl, #1
	add r4, sp, #0
	add r5, sp, #4
	mov r8, r6
_02384AC8:
	mov r0, r7
	mov r1, r5
	bl ov30_02384B24
	mov r0, r7
	mov r1, r4
	bl ov30_02385F7C
	ldrb r0, [sp, #4]
	tst r0, #1
	movne r0, sl
	moveq r0, sb
	tst r0, #0xff
	beq _02384B08
	mov r0, r4
	mov r1, r5
	mov r2, r8
	bl SpawnItem
_02384B08:
	add r6, r6, #1
	cmp r6, #0x40
	blt _02384AC8
	bl ov29_02344B30
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02384B20: .word OVERLAY30_JP_STRING_1
	arm_func_end ov30_02384A94

	arm_func_start ov30_02384B24
ov30_02384B24: ; 0x02384B24
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, #0
	mov r2, #6
	bl memset
	mov r0, r5
	mov r1, r4
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #1
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #2
	mov r2, #2
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #4
	mov r2, #2
	bl ov30_02385CA4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02384B24

	arm_func_start ov30_02384B84
ov30_02384B84: ; 0x02384B84
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r1, _02384C68 ; =OVERLAY30_JP_STRING_1
	mov sl, r0
	bl ov30_02385CF0
	mov sb, #0
	mov r8, #6
	mov r7, sb
	add r6, sp, #3
	mov fp, #1
_02384BAC:
	mov r0, sl
	mov r1, r6
	mov r2, fp
	strb r8, [sp, #3]
	strb r7, [sp, #2]
	strb r7, [sp, #1]
	bl ov30_02385CA4
	mov r0, sl
	add r1, sp, #2
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	add r1, sp, #1
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	add r1, sp, #0
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385F54
	mov r5, r0
	mov r0, sl
	add r1, sp, #4
	bl ov30_02385F7C
	ldrb r0, [sp, #3]
	cmp r0, #0xff
	beq _02384C54
	ldrsh r0, [sp, #4]
	ldrsh r1, [sp, #6]
	bl GetTileSafe
	mov r4, r0
	ldrb r0, [sp, #3]
	ldrb r2, [sp, #2]
	add r1, sp, #4
	mov r3, #0
	bl SpawnTrap
	movs r1, r0
	beq _02384C54
	mov r0, r4
	mov r2, r5
	bl BindTrapToTile
_02384C54:
	add sb, sb, #1
	cmp sb, #0x40
	blt _02384BAC
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02384C68: .word OVERLAY30_JP_STRING_1
	arm_func_end ov30_02384B84

	arm_func_start ov30_02384C6C
ov30_02384C6C: ; 0x02384C6C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _02384CCC ; =OVERLAY30_JP_STRING_1
	mov r6, r0
	bl ov30_02385CF0
	mov r0, r6
	bl ov30_02385F54
	mov r5, r0
	mov r0, r6
	bl ov30_02385F54
	mov r4, r0
	add r1, sp, #0
	mov r0, r6
	bl ov30_02385F7C
	cmp r5, #0
	beq _02384CC4
	add r0, sp, #0
	bl ov29_02338768
	ldr r0, _02384CD0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x19000
#ifdef JAPAN
	strb r4, [r0, #0x7a8]
#else
	strb r4, [r0, #0x84c]
#endif
_02384CC4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02384CCC: .word OVERLAY30_JP_STRING_1
_02384CD0: .word DUNGEON_PTR
	arm_func_end ov30_02384C6C

	arm_func_start ov30_02384CD4
ov30_02384CD4: ; 0x02384CD4
#ifdef JAPAN
#define OV30_02384CD4_OFFSET -0xA4
#else
#define OV30_02384CD4_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02384E20 ; =OVERLAY30_JP_STRING_1
	mov r4, r0
	bl ov30_02385CF0
	mov r0, r4
	bl ov30_02385F0C
	ldr r1, _02384E24 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x3000
	str r0, [r1, #0xe2c + OV30_02384CD4_OFFSET]
	mov r0, r4
	bl ov30_02385F0C
	ldr r1, _02384E24 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x3000
	str r0, [r1, #0xe30 + OV30_02384CD4_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384E24 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x3000
	strb r0, [r1, #0xe34 + OV30_02384CD4_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384E24 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x3000
	strb r0, [r1, #0xe35 + OV30_02384CD4_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384E24 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x3000
	strb r0, [r1, #0xe36 + OV30_02384CD4_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384E24 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x3000
	strb r0, [r1, #0xe37 + OV30_02384CD4_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384E24 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x3000
	strb r0, [r1, #0xe38 + OV30_02384CD4_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384E24 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x3000
	strb r0, [r1, #0xe39 + OV30_02384CD4_OFFSET]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384E24 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x3000
	strb r0, [r1, #0xe3c + OV30_02384CD4_OFFSET]
	mov r0, r4
	bl ov30_02385EC4
	ldr r1, _02384E24 ; =DUNGEON_PTR
	mov r6, #0
	ldr r1, [r1]
	mov r5, #1
#ifdef JAPAN
	add r1, r1, #0x3d00
	strh r0, [r1, #0x96]
#else
	add r1, r1, #0x3e00
	strh r0, [r1, #0x3a]
#endif
_02384DDC:
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl ov30_02384E28
	add r6, r6, #1
	cmp r6, #4
	blt _02384DDC
	mov r6, #0
	mov r5, r6
_02384E00:
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl ov30_02384E28
	add r6, r6, #1
	cmp r6, #0x10
	blt _02384E00
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02384E20: .word OVERLAY30_JP_STRING_1
_02384E24: .word DUNGEON_PTR
	arm_func_end ov30_02384CD4

	arm_func_start ov30_02384E28
ov30_02384E28: ; 0x02384E28
#ifdef JAPAN
#define OV30_02384E28_OFFSET -4
#define OV30_02384E28_OFFSET_2 -1
#else
#define OV30_02384E28_OFFSET 0
#define OV30_02384E28_OFFSET_2 0
#endif
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
#endif
	sub sp, sp, #0x258 + OV30_02384E28_OFFSET
	mov sl, r0
	mov sb, r1
	mov r8, r2
	add r0, sp, #0x18
	mov r1, #0
	mov r2, #0x240 + OV30_02384E28_OFFSET
	bl memset
	mov r0, sl
	bl ov30_02385EF4
	mov r0, sl
	bl ov30_02385EF4
	mov r0, sl
	bl ov30_02385EF4
	mov fp, r0
	mov r0, sl
	add r1, sp, #0x14
	bl ov30_02385F7C
	mov r0, sl
	bl ov30_02385F54
	mov r5, r0
	mov r0, sl
	bl ov30_02385EC4
	mov r6, r0
	ldr r1, _023859D8 ; =LEADER_PTR
	mov r2, #0
	mov r0, sl
	str r2, [r1]
	bl ov30_02385EC4
	strh r0, [sp, #0x18]
	add r0, sp, #0xe
	mov r1, #0
	mov r2, #2
	bl memset
	mov r0, sl
	add r1, sp, #0xe
	mov r2, #2
	bl ov30_02385CA4
	ldrsh r2, [sp, #0xe]
	add r0, sp, #0xc
	mov r1, #0
	strh r2, [sp, #0x1c]
	mov r2, #2
	bl memset
	mov r0, sl
	add r1, sp, #0xc
	mov r2, #2
	bl ov30_02385CA4
	ldrsh r1, [sp, #0xc]
	mov r0, sl
	strh r1, [sp, #0x1a]
	bl ov30_02385F54
	strb r0, [sp, #0x1e]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x1f]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x20]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x21]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x22]
	mov r0, sl
	bl ov30_02385EF4
	strh r0, [sp, #0x24]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x60]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x61]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x26]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x28]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x2a]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x2e]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x2c]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x32]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x33]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x34]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x35]
	mov r0, sl
	bl ov30_02385F0C
	str r0, [sp, #0x38]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x3c]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x3e]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x40]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x42]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x44]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x46]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x48]
	mov r0, sl
	bl ov30_02385F3C
	str r0, [sp, #0x4c]
	mov r0, sl
	bl ov30_02385F3C
	str r0, [sp, #0x50]
	mov r0, sl
	bl ov30_02385F3C
	str r0, [sp, #0x54]
	mov r0, sl
	bl ov30_02385F3C
	str r0, [sp, #0x58]
	mov r0, #0
	strh r0, [sp, #0x62]
	mov r0, sl
	add r1, sp, #0x64
	mov r2, #1
	bl ov30_02385CA4
	mov r0, #7
	strb r0, [sp, #0x65]
	mov r0, sl
	add r1, sp, #0x72
	bl ov30_02385F7C
	add r0, sp, #8
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #8
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #8]
	add r0, sp, #7
	mov r1, #0
	strb r2, [sp, #0x76]
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #7
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #7]
	add r0, sp, #6
	mov r1, #0
	strb r2, [sp, #0x77]
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #6
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #6]
	add r0, sp, #5
	mov r1, #0
	strb r2, [sp, #0x78]
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #5
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #5]
	mov r0, sl
	add r1, sp, #0x7a
	strb r2, [sp, #0x79]
	bl ov30_02384B24
	add r0, sp, #0xa
	mov r1, #0
	mov r2, #2
	bl memset
	add r1, sp, #0xa
	mov r0, sl
	mov r2, #2
	bl ov30_02385CA4
	ldrsh r0, [sp, #0xa]
	mov r4, #0
	add r7, sp, #0x82
	strh r0, [sp, #0x80]
_02385158:
	mov r0, sl
	add r1, r7, r4, lsl #2
	bl ov30_02385F7C
	add r4, r4, #1
	cmp r4, #4
	blt _02385158
	add r1, sp, #0x94
	mov r0, sl
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x95]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x96]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x97]
	mov r0, sl
	bl ov30_02385EC4
	strh r0, [sp, #0x98]
	mov r0, #0
	str r0, [sp, #0x9c]
	str r0, [sp, #0xa0]
	mov r0, sl
	add r1, sp, #0xa4
	bl ov30_02385F7C
	mov r0, sl
	add r1, sp, #0xa8
	mov r2, #0x45
	bl ov30_02385CA4
	mov r0, sl
	add r1, sp, #0xb4
	mov r2, #0x45
	bl ov30_02385CA4
	add r0, sp, #4
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #4
	mov r2, #1
	bl ov30_02385CA4
	ldrb r1, [sp, #4]
	mov r0, sl
	strb r1, [sp, #0xc0]
	bl ov30_02385EDC
	strh r0, [sp, #0x5c]
	add r0, sp, #3
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #3
	mov r2, #1
	bl ov30_02385CA4
	ldrb r1, [sp, #3]
	mov r0, sl
	strb r1, [sp, #0x5e]
	bl ov30_02385F0C
	str r0, [sp, #0xc8]
	mov r0, sl
	bl ov30_02385F0C
	str r0, [sp, #0xcc]
	mov r0, sl
	bl ov30_02385F0C
	str r0, [sp, #0xd0]
	mov r0, sl
	add r1, sp, #0xd5
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xd6]
	add r1, sp, #0xd7
	mov r0, sl
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xd8]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xd9]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xda]
	mov r0, sl
	add r1, sp, #0xdc
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xe4]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xe5]
	mov r0, sl
	bl ov30_02385F0C
	str r0, [sp, #0xe0]
	mov r0, sl
	add r1, sp, #0xe8
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xe9]
	mov r0, sl
	add r1, sp, #0xea
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xeb]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xec]
	mov r0, sl
	add r1, sp, #0xed
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xee]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xef]
	mov r0, sl
	add r1, sp, #0xf0
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0xf1]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0xf2]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xf3]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xf4]
	mov r0, sl
	add r1, sp, #0xf8
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385F0C
	str r0, [sp, #0xfc]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x100]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x101]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x102]
	mov r0, sl
	add r1, sp, #0x104
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x105]
	mov r0, sl
	add r1, r1, #6
	mov r2, #1
	bl ov30_02385CA4
	add r1, sp, #0x100
	mov r0, sl
	add r1, r1, #7
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x108]
	mov r0, sl
	add r1, r1, #9
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x10a]
	mov r0, sl
	add r1, r1, #0xb
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x10c]
	mov r0, sl
	add r1, r1, #0xd
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x10e]
	add r1, r1, #0xf
	mov r0, sl
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x110]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x111]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x112]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x113]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x114]
	mov r0, sl
	bl ov30_02385F54
#ifndef JAPAN
	strb r0, [sp, #0x11b]
	mov r0, sl
	bl ov30_02385F54
#endif
	strb r0, [sp, #0x115]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x120 + OV30_02384E28_OFFSET_2]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x116]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x117]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x118]
	mov r0, sl
	bl ov30_02385EF4
#ifdef JAPAN
	strb r0, [sp, #0x11b]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x11c]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x120]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x11d]
	mov r0, sl
	bl ov30_02385EF4
#else
	strb r0, [sp, #0x11c]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x11d]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x121]
	mov r0, sl
	bl ov30_02385EF4
#endif
	strb r0, [sp, #0x11e]
	mov r0, sl
	bl ov30_02385EF4
#ifndef JAPAN
	strb r0, [sp, #0x11f]
	mov r0, sl
	bl ov30_02385EF4
#endif
	strb r0, [sp, #0x122 + OV30_02384E28_OFFSET_2]
	add r0, sp, #2
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #2
	mov r2, #1
	bl ov30_02385CA4
	ldrb r3, [sp, #2]
	add r0, sp, #1
	mov r1, #0
	mov r2, #1
	strb r3, [sp, #0x123 + OV30_02384E28_OFFSET_2]
	bl memset
	add r1, sp, #1
	mov r0, sl
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #1]
	add r0, sp, #0x10
	mov r1, #0
	strb r2, [sp, #0x124 + OV30_02384E28_OFFSET_2]
	mov r2, #4
	bl memset
	mov r0, sl
	add r1, sp, #0x10
	mov r2, #4
	bl ov30_02385CA4
	ldr r1, [sp, #0x10]
	mov r0, sl
	str r1, [sp, #0x128 + OV30_02384E28_OFFSET]
	add r1, sp, #0x12c + OV30_02384E28_OFFSET
	mov r2, #5
	bl ov30_02386074
	add r1, sp, #0x100
	mov r0, sl
	add r1, r1, #0x31 + OV30_02384E28_OFFSET
	mov r2, #5
	bl ov30_02386074
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x136 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x137 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	str r0, [sp, #0x138 + OV30_02384E28_OFFSET]
	mov r7, #0
	add r4, sp, #0x18
_02385630:
	mov r0, sl
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	strb r0, [r1, #0x124 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	add r1, r1, #0x100
	strh r0, [r1, #0x26 + OV30_02384E28_OFFSET]
	add r1, sp, #0x13c + OV30_02384E28_OFFSET
	add r1, r1, r7, lsl #3
	mov r0, sl
	add r1, r1, #4
	mov r2, #2
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	strb r0, [r1, #0x12a + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	add r7, r7, #1
	strb r0, [r1, #0x12b + OV30_02384E28_OFFSET]
	cmp r7, #4
	blt _02385630
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x15c + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x5e + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x60 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x62 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x64 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x166 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x167 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x169 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x168 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16a + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16b + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16c + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16d + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16e + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0x70 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0x72 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x174 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x175 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x176 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x177 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x178 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x18f + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x190 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x191 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x192 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x193 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x194 + OV30_02384E28_OFFSET]
	mov r0, sl
	add r1, r1, #0x96 + OV30_02384E28_OFFSET
	bl ov30_02385F7C
	mov r0, sl
	bl ov30_02385F3C
	str r0, [sp, #0x1a0 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0xaa + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F24
	str r0, [sp, #0x1a4 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0xa8 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x200
	strh r0, [r1, #0x28 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x200
	strh r0, [r1, #0x2a + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F0C
	str r0, [sp, #0x22c + OV30_02384E28_OFFSET]
	add r0, sp, #0
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #0
	mov r2, #1
	bl ov30_02385CA4
	ldrb r1, [sp]
	mov r0, sl
	strb r1, [sp, #0xd4]
	bl ov30_02385EF4
	strb r0, [sp, #0x17e + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x17f + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x80 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0xc4]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x182 + OV30_02384E28_OFFSET]
	mov r4, #0
	add r7, sp, #0x18
_023858D8:
	mov r0, sl
	bl ov30_02385EF4
	add r1, r7, r4
	add r4, r4, #1
	strb r0, [r1, #0x16b + OV30_02384E28_OFFSET]
	cmp r4, #5
	blt _023858D8
	ldr r0, _023859D8 ; =LEADER_PTR
	mov r1, #0
	str r1, [r0]
	cmp fp, #0
	beq _023859D0
	cmp sb, #0
	beq _02385924
	ldrsh r0, [sp, #0x1a]
	ldrsh r1, [sp, #0x1c]
	mov r2, r8
	bl ov30_023859DC
	b _02385934
_02385924:
	ldrsh r0, [sp, #0x1a]
	ldrsh r1, [sp, #0x1c]
	mov r2, r8
	bl ov30_02385B10
_02385934:
	mov r7, r0
	cmp r7, #0
	beq _023859D0
	ldrsh r0, [sp, #0x14]
	ldrsh r1, [sp, #0x16]
	ldr r4, [r7, #0xb4]
	bl GetTileSafe
	ldrh r1, [sp, #0x14]
	add sl, sp, #0x18
	mov sb, r4
	strh r1, [r7, #8]
	ldrh r1, [sp, #0x16]
	mov r8, #0x24 + OV30_02384E28_OFFSET_2
	strh r1, [r7, #0xa]
	ldrh r1, [sp, #0x14]
	strh r1, [r7, #4]
	ldrh r1, [sp, #0x16]
	strh r1, [r7, #6]
	str r7, [r0, #0xc]
	strb r5, [r7, #0x20]
	strh r6, [r7, #0x26]
_02385988:
	ldmia sl!, {r0, r1, r2, r3}
	stmia sb!, {r0, r1, r2, r3}
	subs r8, r8, #1
	bne _02385988
#ifdef JAPAN
	ldmia sl, {r0, r1, r2}
	stmia sb, {r0, r1, r2}
#endif
	ldr r0, _023859D8 ; =LEADER_PTR
	mov r1, #0
	str r1, [r0]
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _023859BC
	ldrsh r0, [r7, #4]
	ldrsh r1, [r7, #6]
	bl ov29_02338F24
_023859BC:
	mov r0, r7
	bl ov29_023021F0
	mov r0, r7
	mov r1, #0
	bl UpdateEntityPixelPos
_023859D0:
	add sp, sp, #0x258 + OV30_02384E28_OFFSET
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#endif
	.align 2, 0
_023859D8: .word LEADER_PTR
	arm_func_end ov30_02384E28

	arm_func_start ov30_023859DC
ov30_023859DC: ; 0x023859DC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov sb, r0
	mov r8, r1
	mov r0, #1
	mov r7, r2
	bl ov29_022DEA10
	mov r5, r0
	mov r0, r8
	bl DungeonGetSpriteIndex
	mov r4, r0
	add r0, sp, #8
	add r1, sp, #4
	mov r2, r8
	mov r3, r4
	str r5, [sp]
	bl ov29_022E1C84
	cmp r0, #0
	moveq r0, #0
	beq _02385B04
	ldr r2, _02385B0C ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r2]
#ifdef JAPAN
	mov r3, #0x23c
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xa84]
#else
	add r3, r7, r7, lsl #3
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb28]
#endif
	mov r0, #0
	str r1, [r6]
	strb r7, [r6, #0x24]
	ldr r2, [r2]
#ifdef JAPAN
	mov ip, #7
	add r2, r2, #0x3f4
	add r2, r2, #0x400
	mla r2, r7, r3, r2
#else
	mov r7, #7
	add r2, r2, #0x3f4
	add r2, r2, #0x400
	add r2, r2, r3, lsl #6
#endif
	str r2, [r6, #0xb4]
	strh sb, [r2, #2]
	ldr r3, [r6, #0xb4]
	mov r2, #0xff
	strh r8, [r3, #4]
	ldr r3, [r6, #0xb4]
	strb r0, [r3, #6]
	ldr r3, [r6, #0xb4]
	strb r0, [r3, #8]
	strh r4, [r6, #0xa8]
	ldr r3, [sp, #8]
	add r3, r3, #0x1a
	strh r3, [r6, #0xac]
#ifdef JAPAN
	strb ip, [r6, #0xae]
#else
	strb r7, [r6, #0xae]
#endif
	strb r0, [r6, #0xb0]
	strb r2, [r6, #0xaf]
	strb r1, [r6, #0xb1]
	strb r1, [r6, #0xb3]
	str r0, [r6, #0x1c]
	bl PopulateActiveMonsterPtrs
	ldr r1, [sp, #8]
	ldr r0, [r6, #0xb4]
#ifdef JAPAN
	strb r1, [r0, #0x176]
	ldr r1, [sp, #4]
	ldr r0, [r6, #0xb4]
	strb r1, [r0, #0x177]
#else
	strb r1, [r0, #0x17a]
	ldr r1, [sp, #4]
	ldr r0, [r6, #0xb4]
	strb r1, [r0, #0x17b]
#endif
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	bl ov29_022E1AF4
	and r0, r5, #0xff
	strb r5, [r6, #0xaa]
	bl ov29_022DE9F8
	mov r1, #0
	mov r0, r6
	strb r1, [r6, #0x28]
_02385B04:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02385B0C: .word DUNGEON_PTR
	arm_func_end ov30_023859DC

	arm_func_start ov30_02385B10
ov30_02385B10: ; 0x02385B10
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov sb, r0
	mov r8, r1
	mov r0, #2
	mov r7, r2
	bl ov29_022DEA10
	mov r5, r0
	mov r0, r8
	bl DungeonGetSpriteIndex
	mov r4, r0
	add r0, sp, #8
	add r1, sp, #4
	mov r2, r8
	mov r3, r4
	str r5, [sp]
	bl ov29_022E2018
	cmp r0, #0
	mov r0, #0
	beq _02385C30
	ldr ip, _02385C38 ; =DUNGEON_PTR
	mov r1, #1
	ldr r2, [ip]
#ifdef JAPAN
	mov r3, #0x23c
	add r2, r2, r7, lsl #2
	add r2, r2, #0x12000
	ldr r6, [r2, #0xa94]
#else
	add r3, r7, r7, lsl #3
	add r2, r2, r7, lsl #2
	add r2, r2, #0x12000
	ldr r6, [r2, #0xb38]
#endif
	str r1, [r6]
	strb r7, [r6, #0x24]
	strb r0, [r6, #0x22]
	ldr r2, [ip]
#ifdef JAPAN
	mov ip, #7
	add r2, r2, #0xe4
	add r2, r2, #0x1000
	mla r2, r7, r3, r2
#else
	mov r7, #7
	add r2, r2, #0xf4
	add r2, r2, #0x1000
	add r2, r2, r3, lsl #6
#endif
	str r2, [r6, #0xb4]
	strh sb, [r2, #2]
	ldr r3, [r6, #0xb4]
	mov r2, #0xff
	strh r8, [r3, #4]
	ldr r3, [r6, #0xb4]
	strb r1, [r3, #6]
	strh r4, [r6, #0xa8]
	ldr r3, [sp, #8]
	add r3, r3, #0x62
	strh r3, [r6, #0xac]
#ifdef JAPAN
	strb ip, [r6, #0xae]
#else
	strb r7, [r6, #0xae]
#endif
	strb r0, [r6, #0xb0]
	strb r2, [r6, #0xaf]
	strb r1, [r6, #0xb1]
	strb r1, [r6, #0xb3]
	str r0, [r6, #0x1c]
	ldr r1, [sp, #8]
	ldr r0, [r6, #0xb4]
#ifdef JAPAN
	strb r1, [r0, #0x176]
	ldr r1, [sp, #4]
	ldr r0, [r6, #0xb4]
	strb r1, [r0, #0x177]
#else
	strb r1, [r0, #0x17a]
	ldr r1, [sp, #4]
	ldr r0, [r6, #0xb4]
	strb r1, [r0, #0x17b]
#endif
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	bl ov29_022E1EC4
	bl PopulateActiveMonsterPtrs
	and r0, r5, #0xff
	strb r5, [r6, #0xaa]
	bl ov29_022DE9F8
	mov r1, #0
	mov r0, r6
	strb r1, [r6, #0x28]
_02385C30:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02385C38: .word DUNGEON_PTR
	arm_func_end ov30_02385B10

	arm_func_start ov30_02385C3C
ov30_02385C3C: ; 0x02385C3C
	str r1, [r0]
	mov r3, #0
	str r3, [r0, #8]
	add r1, r1, r2
	str r1, [r0, #4]
	bx lr
	arm_func_end ov30_02385C3C

	arm_func_start ov30_02385C54
ov30_02385C54: ; 0x02385C54
	b _02385C80
_02385C58:
	ldrb ip, [r1], #1
	ldr r3, [r0]
	sub r2, r2, #1
	strb ip, [r3]
	ldr r3, [r0]
	add r3, r3, #1
	str r3, [r0]
	ldr r3, [r0, #8]
	add r3, r3, #1
	str r3, [r0, #8]
	arm_func_end ov30_02385C54
_02385C80:
	cmp r2, #0
	bne _02385C58
	bx lr

	arm_func_start ov30_02385C8C
ov30_02385C8C: ; 0x02385C8C
	str r1, [r0]
	mov r3, #0
	str r3, [r0, #8]
	add r1, r1, r2
	str r1, [r0, #4]
	bx lr
	arm_func_end ov30_02385C8C

	arm_func_start ov30_02385CA4
ov30_02385CA4: ; 0x02385CA4
	b _02385CD0
_02385CA8:
	ldr r3, [r0]
	sub r2, r2, #1
	ldrb r3, [r3]
	strb r3, [r1], #1
	ldr r3, [r0]
	add r3, r3, #1
	str r3, [r0]
	ldr r3, [r0, #8]
	add r3, r3, #1
	str r3, [r0, #8]
	arm_func_end ov30_02385CA4
_02385CD0:
	cmp r2, #0
	bne _02385CA8
	bx lr

	arm_func_start ov30_02385CDC
ov30_02385CDC: ; 0x02385CDC
	bx lr
	arm_func_end ov30_02385CDC

	arm_func_start ov30_02385CE0
ov30_02385CE0: ; 0x02385CE0
	ldr ip, _02385CEC ; =ov30_02385C54
	mov r2, #8
	bx ip
	.align 2, 0
_02385CEC: .word ov30_02385C54
	arm_func_end ov30_02385CE0

	arm_func_start ov30_02385CF0
ov30_02385CF0: ; 0x02385CF0
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	add r1, sp, #0
	mov r2, #8
	bl ov30_02385CA4
	mov r0, #0
	strb r0, [sp, #8]
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ov30_02385CF0

	arm_func_start ov30_02385D14
ov30_02385D14: ; 0x02385D14
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	mov r2, #2
	bl ov30_02385C54
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov30_02385D14

	arm_func_start ov30_02385D34
ov30_02385D34: ; 0x02385D34
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	mov r2, #2
	bl ov30_02385C54
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov30_02385D34

	arm_func_start ov30_02385D54
ov30_02385D54: ; 0x02385D54
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	mov r2, #1
	bl ov30_02385C54
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov30_02385D54

	arm_func_start ov30_02385D74
ov30_02385D74: ; 0x02385D74
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	mov r2, #4
	bl ov30_02385C54
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov30_02385D74

	arm_func_start ov30_02385D94
ov30_02385D94: ; 0x02385D94
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	mov r2, #4
	bl ov30_02385C54
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov30_02385D94

	arm_func_start ov30_02385DB4
ov30_02385DB4: ; 0x02385DB4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	mov r2, #4
	bl ov30_02385C54
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov30_02385DB4

	arm_func_start ov30_02385DD4
ov30_02385DD4: ; 0x02385DD4
	stmdb sp!, {r3, lr}
	cmp r1, #0
	movne r3, #0xff
	moveq r3, #0
	add r1, sp, #0
	mov r2, #1
	strb r3, [sp]
	bl ov30_02385C54
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385DD4

	arm_func_start ov30_02385DF8
ov30_02385DF8: ; 0x02385DF8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #2
	mov r2, #1
	bl ov30_02385C54
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385DF8

	arm_func_start ov30_02385E20
ov30_02385E20: ; 0x02385E20
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #2
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #2
	mov r2, #2
	bl ov30_02385C54
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385E20

	arm_func_start ov30_02385E48
ov30_02385E48: ; 0x02385E48
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #4
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #8
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #0xc
	mov r2, #1
	bl ov30_02385C54
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385E48

	arm_func_start ov30_02385E90
ov30_02385E90: ; 0x02385E90
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #2
	mov r2, #1
	bl ov30_02385C54
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385E90

	arm_func_start ov30_02385EB8
ov30_02385EB8: ; 0x02385EB8
	ldr ip, _02385EC0 ; =ov30_02385C54
	bx ip
	.align 2, 0
_02385EC0: .word ov30_02385C54
	arm_func_end ov30_02385EB8

	arm_func_start ov30_02385EC4
ov30_02385EC4: ; 0x02385EC4
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #2
	bl ov30_02385CA4
	ldrh r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385EC4

	arm_func_start ov30_02385EDC
ov30_02385EDC: ; 0x02385EDC
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #2
	bl ov30_02385CA4
	ldrsh r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385EDC

	arm_func_start ov30_02385EF4
ov30_02385EF4: ; 0x02385EF4
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #1
	bl ov30_02385CA4
	ldrb r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385EF4

	arm_func_start ov30_02385F0C
ov30_02385F0C: ; 0x02385F0C
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #4
	bl ov30_02385CA4
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385F0C

	arm_func_start ov30_02385F24
ov30_02385F24: ; 0x02385F24
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #4
	bl ov30_02385CA4
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385F24

	arm_func_start ov30_02385F3C
ov30_02385F3C: ; 0x02385F3C
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #4
	bl ov30_02385CA4
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385F3C

	arm_func_start ov30_02385F54
ov30_02385F54: ; 0x02385F54
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #1
	bl ov30_02385CA4
	ldrb r0, [sp]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385F54

	arm_func_start ov30_02385F7C
ov30_02385F7C: ; 0x02385F7C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r3, #0
	strh r3, [r4]
	mov r5, r0
	mov r2, #1
	strh r3, [r4, #2]
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #2
	mov r2, #1
	bl ov30_02385CA4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385F7C

	arm_func_start ov30_02385FB0
ov30_02385FB0: ; 0x02385FB0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r3, #0
	strh r3, [r4]
	mov r5, r0
	mov r2, #2
	strh r3, [r4, #2]
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #2
	mov r2, #2
	bl ov30_02385CA4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385FB0

	arm_func_start ov30_02385FE4
ov30_02385FE4: ; 0x02385FE4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r3, #0
	str r3, [r4]
	str r3, [r4, #4]
	str r3, [r4, #8]
	mov r5, r0
	mov r2, #1
	str r3, [r4, #0xc]
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #4
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #8
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #0xc
	mov r2, #1
	bl ov30_02385CA4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385FE4

	arm_func_start ov30_02386040
ov30_02386040: ; 0x02386040
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r3, #0
	strh r3, [r4]
	mov r5, r0
	mov r2, #1
	strh r3, [r4, #2]
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #2
	mov r2, #1
	bl ov30_02385CA4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02386040

	arm_func_start ov30_02386074
ov30_02386074: ; 0x02386074
	ldr ip, _0238607C ; =ov30_02385CA4
	bx ip
	.align 2, 0
_0238607C: .word ov30_02385CA4
	arm_func_end ov30_02386074
	; 0x02386080

	.rodata
	.global OVERLAY30_JP_STRING_1
OVERLAY30_JP_STRING_1:
	.byte 0x82, 0xDD, 0x82, 0xB3, 0x82, 0xAB, 0x97, 0x6C, 0x00, 0x00, 0x00, 0x00
	.global OVERLAY30_JP_STRING_2
OVERLAY30_JP_STRING_2:
	.byte 0x82, 0xE2, 0x82, 0xE6
	.byte 0x82, 0xA2, 0x97, 0x6C, 0x00, 0x00, 0x00, 0x00

	.data
	.global ov30_023860A0
ov30_023860A0:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov30_023860A4
ov30_023860A4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
