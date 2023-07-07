	.include "asm/macros.inc"
	.include "overlay_30.inc"
	.include "global.inc"

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
	ldr r1, _02382870 ; =0x023860A0
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
	ldmdb sp!, {r4, r5, r6, pc}
	.align 2, 0
_02382870: .word 0x023860A0
	arm_func_end ov30_02382820

	arm_func_start ov30_02382874
ov30_02382874: ; 0x02382874
	stmdb sp!, {r3, lr}
	ldr r0, _02382974 ; =0x023860A0
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
	ldr r2, _02382974 ; =0x023860A0
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
	ldr r0, _02382974 ; =0x023860A0
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
	ldr r1, _02382980 ; =0x00000247
	bl sub_02034EB4
	ldr r0, _02382974 ; =0x023860A0
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _0238296C
_02382928:
	ldr r0, _02382984 ; =0x0000061C
	ldr r1, _02382988 ; =0x0000024D
	bl sub_02034EB4
	ldr r0, _02382974 ; =0x023860A0
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0238296C
_02382948:
	bl sub_02034DA8
	cmp r0, #0
	ldreq r0, _02382974 ; =0x023860A0
	moveq r1, #3
	ldreq r0, [r0]
	streq r1, [r0]
	b _0238296C
_02382964:
	mov r0, #0
	ldmdb sp!, {r3, pc}
_0238296C:
	mov r0, #1
	ldmdb sp!, {r3, pc}
	.align 2, 0
_02382974: .word 0x023860A0
_02382978: .word 0x21061522
_0238297C: .word 0x0000040C
_02382980: .word 0x00000247
_02382984: .word 0x0000061C
_02382988: .word 0x0000024D
	arm_func_end ov30_02382874

	arm_func_start ov30_0238298C
ov30_0238298C: ; 0x0238298C
	ldr r0, _0238299C ; =0x023860A0
	ldr r0, [r0]
	ldrb r0, [r0, #0xc]
	bx lr
	.align 2, 0
_0238299C: .word 0x023860A0
	arm_func_end ov30_0238298C

	arm_func_start ov30_023829A0
ov30_023829A0: ; 0x023829A0
	stmdb sp!, {r3, lr}
	ldr r0, _023829C8 ; =0x023860A0
	ldr r0, [r0]
	cmp r0, #0
	ldmeqdb sp!, {r3, pc}
	bl MemFree
	ldr r0, _023829C8 ; =0x023860A0
	mov r1, #0
	str r1, [r0]
	ldmdb sp!, {r3, pc}
	.align 2, 0
_023829C8: .word 0x023860A0
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
	ldr r1, _02382A2C ; =0x023860A4
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
	ldmdb sp!, {r4, r5, r6, pc}
	.align 2, 0
_02382A2C: .word 0x023860A4
_02382A30: .word 0x21061522
	arm_func_end ov30_023829CC

	arm_func_start ov30_02382A34
ov30_02382A34: ; 0x02382A34
	stmdb sp!, {r3, lr}
	ldr r0, _02382C0C ; =0x023860A4
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
	ldr r1, _02382C14 ; =0x00000241
	bl sub_02034EB4
	b _02382A90
_02382A88:
	ldr r1, _02382C18 ; =0x00000242
	bl sub_02034EB4
_02382A90:
	ldr r0, _02382C0C ; =0x023860A4
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
	ldr r0, _02382C0C ; =0x023860A4
	ldr r1, [r0]
	ldmib r1, {r0, r1}
	bl WriteQuickSaveInfo
	ldr r1, _02382C0C ; =0x023860A4
	mov r2, #2
	ldr r3, [r1]
	str r0, [r3, #0x10]
	ldr r1, [r1]
	mov r0, #1
	str r2, [r1]
	ldmdb sp!, {r3, pc}
_02382AFC:
	ldr r0, [r1, #0x10]
	cmp r0, #0
	bne _02382B40
	mov r0, #2
	bl NoteSaveBase
	ldr r1, _02382C0C ; =0x023860A4
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r0, [r1]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _02382B40
	ldr r0, _02382C20 ; =0x000F1207
	bl sub_02048DC4
	ldr r1, _02382C0C ; =0x023860A4
	ldr r1, [r1]
	str r0, [r1, #0x10]
_02382B40:
	bl sub_02003BC8
	bl sub_02029FBC
	ldr r0, _02382C0C ; =0x023860A4
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02382B68
	cmp r0, #1
	beq _02382B8C
	b _02382BB0
_02382B68:
	ldr r0, _02382C24 ; =0x0000041C
	mov r1, #0x244
	mov r2, #0
	bl sub_02034EB4
	ldr r0, _02382C0C ; =0x023860A4
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	b _02382C04
_02382B8C:
	ldr r0, _02382C28 ; =0x0000040C
	mov r1, #0x238
	mov r2, #0
	bl sub_02034EB4
	ldr r0, _02382C0C ; =0x023860A4
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0]
	b _02382C04
_02382BB0:
	ldr r0, _02382C24 ; =0x0000041C
	ldr r1, _02382C2C ; =0x00000239
	mov r2, #0
	bl sub_02034EB4
	ldr r0, _02382C0C ; =0x023860A4
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	b _02382C04
_02382BD4:
	bl sub_02034DA8
	cmp r0, #0
	ldreq r0, _02382C0C ; =0x023860A4
	moveq r1, #5
	ldreq r0, [r0]
	streq r1, [r0]
	b _02382C04
_02382BF0:
	ldr r0, [r1, #0x10]
	cmp r0, #0
	moveq r0, #2
	movne r0, #3
	ldmdb sp!, {r3, pc}
_02382C04:
	mov r0, #0
	ldmdb sp!, {r3, pc}
	.align 2, 0
_02382C0C: .word 0x023860A4
_02382C10: .word 0x00000408
_02382C14: .word 0x00000241
_02382C18: .word 0x00000242
_02382C1C: .word 0x000F1209
_02382C20: .word 0x000F1207
_02382C24: .word 0x0000041C
_02382C28: .word 0x0000040C
_02382C2C: .word 0x00000239
	arm_func_end ov30_02382A34

	arm_func_start ov30_02382C30
ov30_02382C30: ; 0x02382C30
	stmdb sp!, {r3, lr}
	ldr r0, _02382C64 ; =0x023860A4
	ldr r0, [r0]
	cmp r0, #0
	ldmeqdb sp!, {r3, pc}
	bl sub_02034D0C
	ldr r0, _02382C64 ; =0x023860A4
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02382C64 ; =0x023860A4
	mov r1, #0
	str r1, [r0]
	ldmdb sp!, {r3, pc}
	.align 2, 0
_02382C64: .word 0x023860A4
	arm_func_end ov30_02382C30

	arm_func_start ov30_02382C68
ov30_02382C68: ; 0x02382C68
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	arm_func_end ov30_02382C68

	arm_func_start WriteQuicksaveData
WriteQuicksaveData: ; 0x02382C6C
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
	ldr r1, _02382D6C ; =0x02386080
	add r0, sp, #4
	bl ov30_02385CE0
	ldr r1, _02382D70 ; =0x02353538
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0xac
	add r1, r1, #0x348
	add r1, r1, #0x400
	bl ov30_02385C54
	ldr r1, _02382D6C ; =0x02386080
	add r0, sp, #4
	bl ov30_02385CE0
	ldr r2, _02382D70 ; =0x02353538
	ldr r1, _02382D74 ; =0x0002C9E6
	ldr r2, [r2]
	add r0, sp, #4
	ldrsh r1, [r2, r1]
	bl ov30_02385D34
	ldr r5, _02382D70 ; =0x02353538
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
	bl ov31_02382D80
	add r0, sp, #4
	bl ov30_02382E94
	add r0, sp, #4
	bl ov30_02382FB8
	add r0, sp, #4
	bl ov30_02383084
	ldr r1, _02382D7C ; =0x0238608C
	add r0, sp, #4
	bl ov30_02385CE0
	add r0, sp, #4
	bl ov30_02385CDC
	add sp, sp, #0x10
	ldmdb sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02382D6C: .word 0x02386080
_02382D70: .word 0x02353538
_02382D74: .word 0x0002C9E6
_02382D78: .word 0x0002C9EA
_02382D7C: .word 0x0238608C
	arm_func_end WriteQuicksaveData

	arm_func_start ov31_02382D80
ov31_02382D80: ; 0x02382D80
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
	ldr r1, _02382E8C ; =0x02386080
	mov r0, sl
	bl ov30_02385CE0
	mov sb, #0
	mov r5, #1
	ldr r4, _02382E90 ; =0x02353538
	mov fp, r5
	mov r7, sb
_02382DC8:
	ldr r0, [r4]
	mov r1, r7
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xbc8]
	cmp r8, #0
	beq _02382E60
	ldr r0, [r8]
	cmp r0, #3
	bne _02382E60
	mov r0, r8
	bl ov29_022E1610
	mov r6, r0
	mov r0, sl
	mov r1, r6
	mov r2, r5
	arm_func_end ov31_02382D80

	arm_func_start ov30_02382E08
ov30_02382E08: ; 0x02382E08
	bl ov30_02385C54
	mov r0, sl
	add r1, r6, #1
	mov r2, fp
	arm_func_end ov30_02382E08

	arm_func_start ov30_02382E18
ov30_02382E18: ; 0x02382E18
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
	ldmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02382E8C: .word 0x02386080
_02382E90: .word 0x02353538
	arm_func_end ov30_02382E18

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
	ldr r1, _02382FB0 ; =0x02386080
	mov r0, sl
	bl ov30_02385CE0
	mov sb, #0
	mov r5, #1
	ldr r4, _02382FB4 ; =0x02353538
	mov fp, r5
	mov r7, sb
_02382EDC:
	ldr r0, [r4]
	mov r1, r7
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xcc8]
	cmp r8, #0
	beq _02382F84
	ldr r0, [r8]
	cmp r0, #2
	bne _02382F84
	mov r0, r8
	bl ov29_022E1608
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
	ldmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02382FB0: .word 0x02386080
_02382FB4: .word 0x02353538
	arm_func_end ov30_02382E94

	arm_func_start ov30_02382FB8
ov30_02382FB8: ; 0x02382FB8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0238307C ; =0x02353538
	ldr r1, _02383080 ; =0x02386080
	ldr r2, [r2]
	mov r5, r0
	add r2, r2, #0x2c
	add r4, r2, #0x19800
	bl ov30_02385CE0
	cmp r4, #0
	ldmeqdb sp!, {r3, r4, r5, pc}
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
	ldmdb sp!, {r3, r4, r5, pc}
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
	ldmdb sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238307C: .word 0x02353538
_02383080: .word 0x02386080
	arm_func_end ov30_02382FB8

	arm_func_start ov30_02383084
ov30_02383084: ; 0x02383084
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _023831E0 ; =0x02386080
	mov r4, r0
	bl ov30_02385CE0
	ldr r1, _023831E4 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldr r1, [r1, #0xe2c]
	bl ov30_02385D74
	ldr r1, _023831E4 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldr r1, [r1, #0xe30]
	bl ov30_02385D74
	ldr r1, _023831E4 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe34]
	bl ov30_02385DD4
	ldr r1, _023831E4 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe35]
	bl ov30_02385DD4
	ldr r1, _023831E4 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe36]
	bl ov30_02385DD4
	ldr r1, _023831E4 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe37]
	bl ov30_02385DD4
	ldr r1, _023831E4 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe38]
	bl ov30_02385DD4
	ldr r1, _023831E4 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe39]
	bl ov30_02385DD4
	ldr r1, _023831E4 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldrb r1, [r1, #0xe3c]
	bl ov30_02385DD4
	ldr r1, _023831E4 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x3e00
	ldrh r1, [r1, #0x3a]
	bl ov30_02385D14
	ldr r5, _023831E4 ; =0x02353538
	mov r6, #0
_0238318C:
	ldr r1, [r5]
	mov r0, r4
	add r1, r1, r6, lsl #2
	add r1, r1, #0x12000
	ldr r1, [r1, #0xb28]
	bl ov30_023831E8
	add r6, r6, #1
	cmp r6, #4
	blt _0238318C
	ldr r5, _023831E4 ; =0x02353538
	mov r6, #0
_023831B8:
	ldr r1, [r5]
	mov r0, r4
	add r1, r1, r6, lsl #2
	add r1, r1, #0x12000
	ldr r1, [r1, #0xb38]
	bl ov30_023831E8
	add r6, r6, #1
	cmp r6, #0x10
	blt _023831B8
	ldmdb sp!, {r4, r5, r6, pc}
	.align 2, 0
_023831E0: .word 0x02386080
_023831E4: .word 0x02353538
	arm_func_end ov30_02383084

	arm_func_start ov30_023831E8
ov30_023831E8: ; 0x023831E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x25c
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
	mov r2, #0x240
	bl Memset
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
	arm_func_end ov30_023831E8

	arm_func_start ov30_023833D8
ov30_023833D8: ; 0x023833D8
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
	arm_func_end ov30_023833D8

	arm_func_start ov30_02383434
ov30_02383434: ; 0x02383434
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
	arm_func_end ov30_02383434

	arm_func_start ov30_0238367C
ov30_0238367C: ; 0x0238367C
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
	arm_func_end ov30_0238367C

	arm_func_start ov30_023838E4
ov30_023838E4: ; 0x023838E4
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
	mov r4, #2
_023839C4:
	add r0, r6, r7, lsl #3
	ldrb r1, [r0, #0x124]
	mov r0, r8
	bl ov30_02385D54
	add r0, r6, r7, lsl #3
	add r0, r0, #0x100
	ldrh r1, [r0, #0x26]
	mov r0, r8
	and r1, r1, #0xff
	bl ov30_02385D54
	add r1, r5, r7, lsl #3
	mov r0, r8
	mov r2, r4
	add r1, r1, #4
	bl ov30_02385C54
	add r0, r6, r7, lsl #3
	ldrb r1, [r0, #0x12a]
	mov r0, r8
	bl ov30_02385D54
	mov r0, r8
	add r1, r6, r7, lsl #3
	ldrb r1, [r1, #0x12b]
	bl ov30_02385D54
	add r7, r7, #1
	cmp r7, #4
	blt _023839C4
	ldrb r1, [r6, #0x144]
	mov r0, r8
	bl ov30_02385D54
	add r0, r6, #0x100
	ldrsh r1, [r0, #0x46]
	mov r0, r8
	bl ov30_02385D34
	add r0, r6, #0x100
	ldrsh r1, [r0, #0x48]
	mov r0, r8
	bl ov30_02385D34
	add r0, r6, #0x100
	ldrsh r1, [r0, #0x4a]
	mov r0, r8
	bl ov30_02385D34
	add r0, r6, #0x100
	ldrsh r1, [r0, #0x4c]
	mov r0, r8
	bl ov30_02385D34
	ldrb r1, [r6, #0x14e]
	mov r0, r8
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x14f]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x151]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x150]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x152]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x153]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x154]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x155]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x156]
	bl ov30_02385DD4
	mov r0, r8
	add r1, r6, #0x100
	ldrh r1, [r1, #0x58]
	bl ov30_02385D14
	mov r0, r8
	add r1, r6, #0x100
	ldrh r1, [r1, #0x5a]
	bl ov30_02385D14
	mov r0, r8
	ldrb r1, [r6, #0x15c]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x15d]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0x15e]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x15f]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x160]
	bl ov30_02385DD4
	mov r0, r8
	ldrb r1, [r6, #0x177]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0x178]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0x179]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0x17a]
	bl ov30_02385D54
	mov r0, r8
	ldrb r1, [r6, #0x17b]
	bl ov30_02385D54
	ldrb r1, [r6, #0x17c]
	mov r0, r8
	bl ov30_02385D54
	add r1, r6, #0x7e
	mov r0, r8
	add r1, r1, #0x100
	bl ov30_02385DF8
	ldr r1, [r6, #0x188]
	mov r0, r8
	bl ov30_02385DB4
	add r0, r6, #0x100
	ldrh r1, [r0, #0x92]
	mov r0, r8
	bl ov30_02385D14
	ldr r1, [r6, #0x18c]
	mov r0, r8
	bl ov30_02385D94
	add r0, r6, #0x100
	ldrh r1, [r0, #0x90]
	mov r0, r8
	bl ov30_02385D14
	add r1, r6, #0x200
	ldrsh r1, [r1, #0x10]
	mov r0, r8
	bl ov30_02385D34
	add r1, r6, #0x200
	ldrsh r1, [r1, #0x12]
	mov r0, r8
	bl ov30_02385D34
	ldr r1, [r6, #0x214]
	mov r0, r8
	bl ov30_02385D74
	ldrb r1, [r6, #0xbc]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0x166]
	mov r0, r8
	bl ov30_02385D54
	ldrb r1, [r6, #0x167]
	mov r0, r8
	bl ov30_02385D54
	add r1, r6, #0x100
	ldrsh r1, [r1, #0x68]
	mov r0, r8
	bl ov30_02385D34
	ldrsh r1, [r6, #0xac]
	mov r0, r8
	bl ov30_02385D34
	ldrb r1, [r6, #0x16a]
	mov r0, r8
	bl ov30_02385D54
	mov r4, #0
_02383C4C:
	add r0, r6, r4
	ldrb r1, [r0, #0x16b]
	mov r0, r8
	bl ov30_02385D54
	add r4, r4, #1
	cmp r4, #5
	blt _02383C4C
	add sp, sp, #0x25c
	ldmdb sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov30_023838E4

	arm_func_start ov30_02383C70
ov30_02383C70: ; 0x02383C70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _02384090 ; =0x02386080
	mov sl, r0
	bl ov30_02385CE0
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc4]
	bl ov30_02385DD4
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc5]
	bl ov30_02385DD4
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc6]
	bl ov30_02385DD4
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc7]
	bl ov30_02385DD4
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc8]
	bl ov30_02385DD4
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc9]
	bl ov30_02385D54
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xca]
	bl ov30_02385D54
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldr r1, [r1, #0xcc]
	and r1, r1, #0xff
	bl ov30_02385D54
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldr r1, [r1, #0xd0]
	and r1, r1, #0xff
	bl ov30_02385D54
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrsh r1, [r1, #0xd4]
	bl ov30_02385D34
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrsh r1, [r1, #0xd6]
	bl ov30_02385D34
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrsh r1, [r1, #0xd8]
	bl ov30_02385D34
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xda]
	bl ov30_02385D34
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrsh r1, [r1, #0xde]
	bl ov30_02385D34
	mov r8, #0
	ldr r6, _02384094 ; =0x02353538
	mov fp, r8
	mov r4, #0x14
	mov r5, #0x460
_02383DEC:
	mul sb, r8, r5
	mov r7, fp
_02383DF4:
	ldr r1, [r6]
	mov r0, sl
	add r1, r1, #0xe0
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
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0xce0
	add r1, r1, #0xc000
	bl ov30_02385DF8
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0xe4
	add r1, r1, #0xcc00
	bl ov30_02385DF8
	ldr r0, _02384094 ; =0x02353538
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0xcc00
	ldrh r2, [r0, #0xe8]
	strh r2, [sp]
	ldrh r2, [r0, #0xea]
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
	ldr r4, _02384094 ; =0x02353538
	mov r5, #0
_02383EB0:
	ldr r1, [r4]
	mov r0, sl
	add r1, r1, #0xec
	add r1, r1, #0xcc00
	add r1, r1, r5, lsl #2
	bl ov30_02385E20
	add r5, r5, #1
	cmp r5, #8
	blt _02383EB0
	ldr r4, _02384094 ; =0x02353538
	mov r5, #0
_02383EDC:
	ldr r1, [r4]
	mov r0, sl
	add r1, r1, r5
	add r1, r1, #0xc000
	ldrb r1, [r1, #0xd0c]
	bl ov30_02385D54
	add r5, r5, #1
	cmp r5, #8
	blt _02383EDC
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x114
	add r1, r1, #0xcc00
	bl ov30_02385E48
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x124
	add r1, r1, #0xcc00
	bl ov30_02385E48
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x134
	add r1, r1, #0xcc00
	bl ov30_02385E90
	mov r8, #0
	ldr r6, _02384094 ; =0x02353538
	mov fp, r8
	mov r4, #0x14
	mov r5, #0xa0
_02383F5C:
	mul r7, r8, r5
	mov sb, fp
_02383F64:
	ldr r1, [r6]
	mov r0, sl
	add r1, r1, #0xd60
	add r1, r1, #0xc000
	add r1, r1, r7
	mla r1, sb, r4, r1
	bl ov30_023842B0
	ldr r1, [r6]
	mov r0, sl
	add r1, r1, r8, lsl #4
	add r1, r1, sb, lsl #1
	add r1, r1, #0xd200
	ldrsh r1, [r1, #0x60]
	bl ov30_02385D34
	add sb, sb, #1
	cmp sb, #8
	blt _02383F64
	add r8, r8, #1
	cmp r8, #8
	blt _02383F5C
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	mov r2, #1
	add r1, r1, #0x138
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
	ldr r1, _02384094 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	mov r2, #1
	add r1, r1, #0x2fc
	add r4, r1, #0x12800
	mov r1, r4
	bl ov30_02385C54
	add r1, r4, #1
	mov r0, sl
	mov r2, #1
	bl ov30_02385C54
	mov r0, sl
	ldr r2, _02384094 ; =0x02353538
	ldr r1, _02384098 ; =0x00012AFE
	ldr r2, [r2]
	ldrsh r1, [r2, r1]
	bl ov30_02385D34
	ldmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02384090: .word 0x02386080
_02384094: .word 0x02353538
_02384098: .word 0x00012AFE
	arm_func_end ov30_02383C70

	arm_func_start ov30_0238409C
ov30_0238409C: ; 0x0238409C
	stmdb sp!, {r4, lr}
	ldr r1, _02384200 ; =0x02386080
	mov r4, r0
	bl ov30_02385CE0
	ldr r1, _02384204 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x23c]
	bl ov30_02385D54
	ldr r1, _02384204 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x23d]
	bl ov30_02385D54
	ldr r1, _02384204 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x23e]
	bl ov30_02385DD4
	ldr r1, _02384204 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x23f]
	bl ov30_02385DD4
	ldr r1, _02384204 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x240]
	bl ov30_02385DD4
	ldr r1, _02384204 ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x242]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x24f]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x243]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x24e]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x250]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x244]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x245]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x246]
	bl ov30_02385DD4
	mov r0, r4
	ldr r1, _02384204 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r1, [r1, #0x248]
	bl ov30_02385DD4
	ldmdb sp!, {r4, pc}
	.align 2, 0
_02384200: .word 0x02386080
_02384204: .word 0x02353538
	arm_func_end ov30_0238409C

	arm_func_start ov30_02384208
ov30_02384208: ; 0x02384208
	stmdb sp!, {r4, lr}
	ldr r2, _02384258 ; =0x02353538
	ldr r1, _0238425C ; =0x0002CB02
	ldr r2, [r2]
	mov r4, r0
	ldrsh r1, [r2, r1]
	bl ov30_02385D34
	ldr r0, _02384258 ; =0x02353538
	ldr r1, _02384260 ; =0x0002CB04
	ldr r2, [r0]
	mov r0, r4
	ldrsh r1, [r2, r1]
	bl ov30_02385D34
	ldr r0, _02384258 ; =0x02353538
	ldr r1, _02384264 ; =0x0002CB06
	ldr r2, [r0]
	mov r0, r4
	ldrsh r1, [r2, r1]
	bl ov30_02385D34
	ldmdb sp!, {r4, pc}
	.align 2, 0
_02384258: .word 0x02353538
_0238425C: .word 0x0002CB02
_02384260: .word 0x0002CB04
_02384264: .word 0x0002CB06
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
	ldmdb sp!, {r3, r4, r5, pc}
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
	ldmdb sp!, {r3, r4, r5, pc}
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
	ldr r1, _023843F0 ; =0x02386080
	add r0, sp, #4
	bl ov30_02385CF0
	ldr r1, _023843F4 ; =0x02353538
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0xac
	add r1, r1, #0x348
	add r1, r1, #0x400
	bl ov30_02385CA4
	ldr r1, _023843F0 ; =0x02386080
	add r0, sp, #4
	bl ov30_02385CF0
	add r0, sp, #4
	bl ov30_02385EDC
	ldr r6, _023843F4 ; =0x02353538
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
	ldr r1, _023843FC ; =0x0238608C
	add r0, sp, #4
	bl ov30_02385CF0
	add r0, sp, #4
	bl ov30_02385CDC
	bl ov29_022FB920
	add sp, sp, #0x10
	ldmdb sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023843F0: .word 0x02386080
_023843F4: .word 0x02353538
_023843F8: .word 0x0002C9E6
_023843FC: .word 0x0238608C
	arm_func_end ov30_023842F4

	arm_func_start ov30_02384400
ov30_02384400: ; 0x02384400
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _02384830 ; =0x02386080
	mov sl, r0
	bl ov30_02385CF0
	mov r0, sl
	bl ov30_02385F54
	ldr r1, _02384834 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xc4]
	mov r0, sl
	bl ov30_02385F54
	ldr r1, _02384834 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xc5]
	mov r0, sl
	bl ov30_02385F54
	ldr r1, _02384834 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xc6]
	mov r0, sl
	bl ov30_02385F54
	ldr r1, _02384834 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xc7]
	mov r0, sl
	bl ov30_02385F54
	ldr r1, _02384834 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xc8]
	mov r0, sl
	bl ov30_02385EF4
	ldr r1, _02384834 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xc9]
	mov r0, sl
	bl ov30_02385EF4
	ldr r1, _02384834 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xca]
	mov r0, sl
	bl ov30_02385EF4
	ldr r1, _02384834 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x4000
	str r0, [r1, #0xcc]
	mov r0, sl
	bl ov30_02385EF4
	ldr r1, _02384834 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x4000
	str r0, [r1, #0xd0]
	mov r0, sl
	bl ov30_02385EDC
	ldr r1, _02384834 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x4000
	strh r0, [r1, #0xd4]
	mov r0, sl
	bl ov30_02385EDC
	ldr r1, _02384834 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x4000
	strh r0, [r1, #0xd6]
	mov r0, sl
	bl ov30_02385EDC
	ldr r1, _02384834 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x4000
	strh r0, [r1, #0xd8]
	mov r0, sl
	bl ov30_02385EDC
	ldr r1, _02384834 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x4000
	strb r0, [r1, #0xda]
	mov r0, sl
	bl ov30_02385EDC
	ldr r6, _02384834 ; =0x02353538
	mov r8, #0
	ldr r1, [r6]
	mov fp, r8
	add r1, r1, #0x4000
	strh r0, [r1, #0xde]
	mov r4, #0x14
	mov r5, #0x460
_02384570:
	mul sb, r8, r5
	mov r7, fp
_02384578:
	ldr r1, [r6]
	mov r0, sl
	add r1, r1, #0xe0
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
	ldr r1, _02384834 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0xce0
	add r1, r1, #0xc000
	bl ov30_02385F7C
	ldr r1, _02384834 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0xe4
	add r1, r1, #0xcc00
	bl ov30_02385F7C
	ldr r1, _02384834 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0xe8
	add r1, r1, #0xcc00
	bl ov30_02385F7C
	ldr r0, _02384834 ; =0x02353538
	ldr r4, _02384834 ; =0x02353538
	ldr r0, [r0]
	mov r5, #0
	add r0, r0, #0xcc00
	ldrsh r1, [r0, #0xe8]
	cmp r1, #0xff
	mvneq r1, #0
	streqh r1, [r0, #0xe8]
	ldr r0, _02384834 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0xcc00
	ldrsh r1, [r0, #0xea]
	cmp r1, #0xff
	mvneq r1, #0
	streqh r1, [r0, #0xea]
_02384634:
	ldr r1, [r4]
	mov r0, sl
	add r1, r1, #0xec
	add r1, r1, #0xcc00
	add r1, r1, r5, lsl #2
	bl ov30_02385FB0
	add r5, r5, #1
	cmp r5, #8
	blt _02384634
	ldr r4, _02384834 ; =0x02353538
	mov r5, #0
_02384660:
	mov r0, sl
	bl ov30_02385EF4
	ldr r1, [r4]
	add r1, r1, r5
	add r1, r1, #0xc000
	add r5, r5, #1
	strb r0, [r1, #0xd0c]
	cmp r5, #8
	blt _02384660
	ldr r1, _02384834 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x114
	add r1, r1, #0xcc00
	bl ov30_02385FE4
	ldr r1, _02384834 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x124
	add r1, r1, #0xcc00
	bl ov30_02385FE4
	ldr r1, _02384834 ; =0x02353538
	mov r0, sl
	ldr r1, [r1]
	add r1, r1, #0x134
	add r1, r1, #0xcc00
	bl ov30_02386040
	mov r8, #0
	ldr r6, _02384834 ; =0x02353538
	mov fp, r8
	mov r4, #0x14
	mov r5, #0xa0
_023846E0:
	mul r7, r8, r5
	mov sb, fp
_023846E8:
	ldr r1, [r6]
	mov r0, sl
	add r1, r1, #0xd60
	add r1, r1, #0xc000
	add r1, r1, r7
	mla r1, sb, r4, r1
	bl ov30_0238483C
	mov r0, sl
	bl ov30_02385EDC
	ldr r1, [r6]
	add r1, r1, r8, lsl #4
	add r1, r1, sb, lsl #1
	add r1, r1, #0xd200
	add sb, sb, #1
	strh r0, [r1, #0x60]
	cmp sb, #8
	blt _023846E8
	add r8, r8, #1
	cmp r8, #8
	blt _023846E0
	ldr r0, _02384834 ; =0x02353538
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x26
	add r0, r0, #0x138
	add r4, r0, #0xcc00
	mov r0, r4
	bl Memset
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
	ldr r0, _02384834 ; =0x02353538
	mov r1, #2
	ldr r0, [r0]
	add r0, r0, #0x2fc
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
	ldr r2, _02384834 ; =0x02353538
	ldr r1, _02384838 ; =0x00012AFE
	ldr r2, [r2]
	strh r0, [r2, r1]
	ldmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02384830: .word 0x02386080
_02384834: .word 0x02353538
_02384838: .word 0x00012AFE
	arm_func_end ov30_02384400

	arm_func_start ov30_0238483C
ov30_0238483C: ; 0x0238483C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, #0
	mov r2, #0x14
	bl Memset
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
	ldmdb sp!, {r3, r4, r5, pc}
	arm_func_end ov30_0238483C

	arm_func_start ov30_023848A0
ov30_023848A0: ; 0x023848A0
	stmdb sp!, {r4, lr}
	ldr r1, _02384A18 ; =0x02386080
	mov r4, r0
	bl ov30_02385CF0
	ldr r1, _02384A1C ; =0x02353538
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0x1a000
	str r2, [r1, #0x22c]
	bl ov30_02385EF4
	ldr r1, _02384A1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x23c]
	mov r0, r4
	bl ov30_02385EF4
	ldr r1, _02384A1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x23d]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x23e]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x23f]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x240]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x242]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x24f]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x243]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x24e]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x250]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x244]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x245]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x246]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384A1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x248]
	ldmdb sp!, {r4, pc}
	.align 2, 0
_02384A18: .word 0x02386080
_02384A1C: .word 0x02353538
	arm_func_end ov30_023848A0

	arm_func_start ov30_02384A20
ov30_02384A20: ; 0x02384A20
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov30_02385EDC
	ldr r2, _02384A80 ; =0x02353538
	ldr r1, _02384A84 ; =0x0002CB02
	ldr r2, [r2]
	strh r0, [r2, r1]
	mov r0, r4
	bl ov30_02385EDC
	ldr r2, _02384A80 ; =0x02353538
	ldr r1, _02384A88 ; =0x0002CB04
	ldr r2, [r2]
	strh r0, [r2, r1]
	mov r0, r4
	bl ov30_02385EDC
	ldr r2, _02384A80 ; =0x02353538
	ldr r1, _02384A8C ; =0x0002CB06
	ldr ip, [r2]
	ldr r3, _02384A90 ; =0x000003E7
	strh r0, [ip, r1]
	ldr r2, [r2]
	sub r0, r1, #2
	strh r3, [r2, r0]
	ldmdb sp!, {r4, pc}
	.align 2, 0
_02384A80: .word 0x02353538
_02384A84: .word 0x0002CB02
_02384A88: .word 0x0002CB04
_02384A8C: .word 0x0002CB06
_02384A90: .word 0x000003E7
	arm_func_end ov30_02384A20

	arm_func_start ov30_02384A94
ov30_02384A94: ; 0x02384A94
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xc
	mov r7, r0
	bl ov29_02344B1C
	ldr r1, _02384B20 ; =0x02386080
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
	bl ov02_02345538
_02384B08:
	add r6, r6, #1
	cmp r6, #0x40
	blt _02384AC8
	bl ov29_02344B30
	add sp, sp, #0xc
	ldmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02384B20: .word 0x02386080
	arm_func_end ov30_02384A94

	arm_func_start ov30_02384B24
ov30_02384B24: ; 0x02384B24
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, #0
	mov r2, #6
	bl Memset
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
	ldmdb sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02384B24

	arm_func_start ov30_02384B84
ov30_02384B84: ; 0x02384B84
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r1, _02384C68 ; =0x02386080
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
	bl ov29_022E2260
	movs r1, r0
	beq _02384C54
	mov r0, r4
	mov r2, r5
	bl ov29_022ED858
_02384C54:
	add sb, sb, #1
	cmp sb, #0x40
	blt _02384BAC
	add sp, sp, #8
	ldmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02384C68: .word 0x02386080
	arm_func_end ov30_02384B84

	arm_func_start ov30_02384C6C
ov30_02384C6C: ; 0x02384C6C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _02384CCC ; =0x02386080
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
	ldr r0, _02384CD0 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x19000
	strb r4, [r0, #0x84c]
_02384CC4:
	add sp, sp, #4
	ldmdb sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02384CCC: .word 0x02386080
_02384CD0: .word 0x02353538
	arm_func_end ov30_02384C6C

	arm_func_start ov30_02384CD4
ov30_02384CD4: ; 0x02384CD4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02384E20 ; =0x02386080
	mov r4, r0
	bl ov30_02385CF0
	mov r0, r4
	bl ov30_02385F0C
	ldr r1, _02384E24 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x3000
	str r0, [r1, #0xe2c]
	mov r0, r4
	bl ov30_02385F0C
	ldr r1, _02384E24 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x3000
	str r0, [r1, #0xe30]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384E24 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x3000
	strb r0, [r1, #0xe34]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384E24 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x3000
	strb r0, [r1, #0xe35]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384E24 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x3000
	strb r0, [r1, #0xe36]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384E24 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x3000
	strb r0, [r1, #0xe37]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384E24 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x3000
	strb r0, [r1, #0xe38]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384E24 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x3000
	strb r0, [r1, #0xe39]
	mov r0, r4
	bl ov30_02385F54
	ldr r1, _02384E24 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x3000
	strb r0, [r1, #0xe3c]
	mov r0, r4
	bl ov30_02385EC4
	ldr r1, _02384E24 ; =0x02353538
	mov r6, #0
	ldr r1, [r1]
	mov r5, #1
	add r1, r1, #0x3e00
	strh r0, [r1, #0x3a]
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
	ldmdb sp!, {r4, r5, r6, pc}
	.align 2, 0
_02384E20: .word 0x02386080
_02384E24: .word 0x02353538
	arm_func_end ov30_02384CD4

	arm_func_start ov30_02384E28
ov30_02384E28: ; 0x02384E28
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x258
	mov sl, r0
	mov sb, r1
	mov r8, r2
	add r0, sp, #0x18
	mov r1, #0
	mov r2, #0x240
	bl Memset
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
	ldr r1, _023859D8 ; =0x0235355C
	mov r2, #0
	mov r0, sl
	str r2, [r1]
	bl ov30_02385EC4
	strh r0, [sp, #0x18]
	add r0, sp, #0xe
	mov r1, #0
	mov r2, #2
	bl Memset
	mov r0, sl
	add r1, sp, #0xe
	mov r2, #2
	bl ov30_02385CA4
	ldrsh r2, [sp, #0xe]
	add r0, sp, #0xc
	mov r1, #0
	strh r2, [sp, #0x1c]
	mov r2, #2
	bl Memset
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
	bl Memset
	mov r0, sl
	add r1, sp, #8
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #8]
	add r0, sp, #7
	mov r1, #0
	strb r2, [sp, #0x76]
	mov r2, #1
	bl Memset
	mov r0, sl
	add r1, sp, #7
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #7]
	add r0, sp, #6
	mov r1, #0
	strb r2, [sp, #0x77]
	mov r2, #1
	bl Memset
	mov r0, sl
	add r1, sp, #6
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #6]
	add r0, sp, #5
	mov r1, #0
	strb r2, [sp, #0x78]
	mov r2, #1
	bl Memset
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
	bl Memset
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
	arm_func_end ov30_02384E28

	arm_func_start ov30_023851C0
ov30_023851C0: ; 0x023851C0
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
	bl Memset
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
	bl Memset
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
	arm_func_end ov30_023851C0

	arm_func_start ov30_023853BC
ov30_023853BC: ; 0x023853BC
	strb r0, [sp, #0x100]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x101]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x102]
	mov r0, sl
	add r1, sp, #0x104
	arm_func_end ov30_023853BC

	arm_func_start ov30_023853E0
ov30_023853E0: ; 0x023853E0
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
	strb r0, [sp, #0x11b]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x115]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x120]
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
	strb r0, [sp, #0x11c]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x11d]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x121]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x11e]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x11f]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x122]
	add r0, sp, #2
	mov r1, #0
	mov r2, #1
	bl Memset
	mov r0, sl
	add r1, sp, #2
	mov r2, #1
	bl ov30_02385CA4
	ldrb r3, [sp, #2]
	add r0, sp, #1
	mov r1, #0
	mov r2, #1
	strb r3, [sp, #0x123]
	bl Memset
	add r1, sp, #1
	mov r0, sl
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #1]
	add r0, sp, #0x10
	mov r1, #0
	strb r2, [sp, #0x124]
	mov r2, #4
	bl Memset
	mov r0, sl
	add r1, sp, #0x10
	mov r2, #4
	bl ov30_02385CA4
	ldr r1, [sp, #0x10]
	mov r0, sl
	str r1, [sp, #0x128]
	add r1, sp, #0x12c
	mov r2, #5
	bl ov30_02386074
	add r1, sp, #0x100
	mov r0, sl
	add r1, r1, #0x31
	mov r2, #5
	bl ov30_02386074
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x136]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x137]
	mov r0, sl
	bl ov30_02385EF4
	str r0, [sp, #0x138]
	mov r7, #0
	add r4, sp, #0x18
_02385630:
	mov r0, sl
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	strb r0, [r1, #0x124]
	mov r0, sl
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	add r1, r1, #0x100
	strh r0, [r1, #0x26]
	add r1, sp, #0x13c
	add r1, r1, r7, lsl #3
	mov r0, sl
	add r1, r1, #4
	mov r2, #2
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	strb r0, [r1, #0x12a]
	mov r0, sl
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	add r7, r7, #1
	strb r0, [r1, #0x12b]
	cmp r7, #4
	blt _02385630
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x15c]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x5e]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x60]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x62]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x64]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x166]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x167]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x169]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x168]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16a]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16b]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16c]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16d]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16e]
	mov r0, sl
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0x70]
	mov r0, sl
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0x72]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x174]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x175]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x176]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x177]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x178]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x18f]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x190]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x191]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x192]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x193]
	mov r0, sl
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x194]
	mov r0, sl
	add r1, r1, #0x96
	bl ov30_02385F7C
	mov r0, sl
	bl ov30_02385F3C
	str r0, [sp, #0x1a0]
	mov r0, sl
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0xaa]
	mov r0, sl
	bl ov30_02385F24
	str r0, [sp, #0x1a4]
	mov r0, sl
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0xa8]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x200
	strh r0, [r1, #0x28]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x200
	strh r0, [r1, #0x2a]
	mov r0, sl
	bl ov30_02385F0C
	str r0, [sp, #0x22c]
	add r0, sp, #0
	mov r1, #0
	mov r2, #1
	bl Memset
	mov r0, sl
	add r1, sp, #0
	mov r2, #1
	bl ov30_02385CA4
	ldrb r1, [sp]
	mov r0, sl
	strb r1, [sp, #0xd4]
	bl ov30_02385EF4
	strb r0, [sp, #0x17e]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x17f]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x80]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0xc4]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x182]
	mov r4, #0
	add r7, sp, #0x18
_023858D8:
	mov r0, sl
	bl ov30_02385EF4
	add r1, r7, r4
	add r4, r4, #1
	strb r0, [r1, #0x16b]
	cmp r4, #5
	blt _023858D8
	ldr r0, _023859D8 ; =0x0235355C
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
	mov r8, #0x24
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
	ldr r0, _023859D8 ; =0x0235355C
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
	bl ov29_022E1A40
_023859D0:
	add sp, sp, #0x258
	ldmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023859D8: .word 0x0235355C
	arm_func_end ov30_023853E0

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
	bl GetSpriteIndex
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
	ldr r2, _02385B0C ; =0x02353538
	mov r1, #1
	ldr r0, [r2]
	add r3, r7, r7, lsl #3
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb28]
	mov r0, #0
	str r1, [r6]
	strb r7, [r6, #0x24]
	ldr r2, [r2]
	mov r7, #7
	add r2, r2, #0x3f4
	add r2, r2, #0x400
	add r2, r2, r3, lsl #6
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
	strb r7, [r6, #0xae]
	strb r0, [r6, #0xb0]
	strb r2, [r6, #0xaf]
	strb r1, [r6, #0xb1]
	strb r1, [r6, #0xb3]
	str r0, [r6, #0x1c]
	bl ov29_022E2978
	ldr r1, [sp, #8]
	ldr r0, [r6, #0xb4]
	strb r1, [r0, #0x17a]
	ldr r1, [sp, #4]
	ldr r0, [r6, #0xb4]
	strb r1, [r0, #0x17b]
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
	ldmdb sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02385B0C: .word 0x02353538
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
	bl GetSpriteIndex
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
	ldr ip, _02385C38 ; =0x02353538
	mov r1, #1
	ldr r2, [ip]
	add r3, r7, r7, lsl #3
	add r2, r2, r7, lsl #2
	add r2, r2, #0x12000
	ldr r6, [r2, #0xb38]
	str r1, [r6]
	strb r7, [r6, #0x24]
	strb r0, [r6, #0x22]
	ldr r2, [ip]
	mov r7, #7
	add r2, r2, #0xf4
	add r2, r2, #0x1000
	add r2, r2, r3, lsl #6
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
	strb r7, [r6, #0xae]
	strb r0, [r6, #0xb0]
	strb r2, [r6, #0xaf]
	strb r1, [r6, #0xb1]
	strb r1, [r6, #0xb3]
	str r0, [r6, #0x1c]
	ldr r1, [sp, #8]
	ldr r0, [r6, #0xb4]
	strb r1, [r0, #0x17a]
	ldr r1, [sp, #4]
	ldr r0, [r6, #0xb4]
	strb r1, [r0, #0x17b]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	bl ov29_022E1EC4
	bl ov29_022E2978
	and r0, r5, #0xff
	strb r5, [r6, #0xaa]
	bl ov29_022DE9F8
	mov r1, #0
	mov r0, r6
	strb r1, [r6, #0x28]
_02385C30:
	add sp, sp, #0xc
	ldmdb sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02385C38: .word 0x02353538
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
	ldmdb sp!, {r3, lr}
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
	ldmdb sp!, {r3, lr}
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
	ldmdb sp!, {r3, lr}
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
	ldmdb sp!, {r3, lr}
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
	ldmdb sp!, {r3, lr}
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
	ldmdb sp!, {r3, lr}
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
	ldmdb sp!, {r3, pc}
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
	ldmdb sp!, {r3, r4, r5, pc}
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
	ldmdb sp!, {r3, r4, r5, pc}
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
	ldmdb sp!, {r3, r4, r5, pc}
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
	ldmdb sp!, {r3, r4, r5, pc}
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
	ldmdb sp!, {r3, pc}
	arm_func_end ov30_02385EC4

	arm_func_start ov30_02385EDC
ov30_02385EDC: ; 0x02385EDC
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #2
	bl ov30_02385CA4
	ldrsh r0, [sp]
	ldmdb sp!, {r3, pc}
	arm_func_end ov30_02385EDC

	arm_func_start ov30_02385EF4
ov30_02385EF4: ; 0x02385EF4
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #1
	bl ov30_02385CA4
	ldrb r0, [sp]
	ldmdb sp!, {r3, pc}
	arm_func_end ov30_02385EF4

	arm_func_start ov30_02385F0C
ov30_02385F0C: ; 0x02385F0C
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #4
	bl ov30_02385CA4
	ldr r0, [sp]
	ldmdb sp!, {r3, pc}
	arm_func_end ov30_02385F0C

	arm_func_start ov30_02385F24
ov30_02385F24: ; 0x02385F24
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #4
	bl ov30_02385CA4
	ldr r0, [sp]
	ldmdb sp!, {r3, pc}
	arm_func_end ov30_02385F24

	arm_func_start ov30_02385F3C
ov30_02385F3C: ; 0x02385F3C
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #4
	bl ov30_02385CA4
	ldr r0, [sp]
	ldmdb sp!, {r3, pc}
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
	ldmdb sp!, {r3, pc}
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
	ldmdb sp!, {r3, r4, r5, pc}
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
	arm_func_end ov30_02385FB0

	arm_func_start ov30_02385FE0
ov30_02385FE0: ; 0x02385FE0
	ldmdb sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385FE0

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
	ldmdb sp!, {r3, r4, r5, pc}
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
	ldmdb sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02386040

	arm_func_start ov30_02386074
ov30_02386074: ; 0x02386074
	ldr ip, _0238607C ; =ov30_02385CA4
	bx ip
	.align 2, 0
_0238607C: .word ov30_02385CA4
	arm_func_end ov30_02386074
	; 0x02386080
