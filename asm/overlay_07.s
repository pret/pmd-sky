	.include "asm/macros.inc"
	.include "overlay_07.inc"

	.text

	arm_func_start ov07_0233CA80
ov07_0233CA80: ; 0x0233CA80
	stmdb sp!, {r3, lr}
	mov r0, #0x14
	mov r1, #8
	bl MemAlloc
	ldr r1, _0233CAC4 ; =ov07_02341B80
	mov r2, #0
	str r0, [r1]
	str r2, [r0]
	ldr r0, [r1]
	str r2, [r0, #4]
	ldr r0, [r1]
	strb r2, [r0, #8]
	ldr r0, [r1]
	str r2, [r0, #0xc]
	ldr r0, [r1]
	strb r2, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233CAC4: .word ov07_02341B80
	arm_func_end ov07_0233CA80

#ifndef EUROPE
	arm_func_start ov07_0233CAC8
ov07_0233CAC8: ; 0x0233CAC8
	ldr r1, _0233CAE4 ; =ov07_02341B80
	mov r2, #1
	ldr r3, [r1]
	str r0, [r3, #0xc]
	ldr r0, [r1]
	strb r2, [r0, #0x10]
	bx lr
	.align 2, 0
_0233CAE4: .word ov07_02341B80
	arm_func_end ov07_0233CAC8
#endif

	arm_func_start ov07_0233CAE8
ov07_0233CAE8: ; 0x0233CAE8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	mov fp, #4
	mov sl, #2
	mov r7, #5
	mov r6, #3
	mov r8, #1
	ldr r4, _0233CCEC ; =ov07_02341B80
	b _0233CCDC
_0233CB0C:
	ldr r1, [r4]
	mov sb, #1
	ldr r0, [r1]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0233CCDC
_0233CB24: ; jump table
	b _0233CB3C ; case 0
	b _0233CB4C ; case 1
	b _0233CBD0 ; case 2
	b _0233CBE8 ; case 3
	b _0233CC54 ; case 4
	b _0233CCB8 ; case 5
_0233CB3C:
	bl ov01_02338A24
	ldr r0, [r4]
	str r8, [r0]
	b _0233CCDC
_0233CB4C:
	bl ov01_02338EC4
	cmp r0, #1
	beq _0233CB6C
	cmp r0, #4
	beq _0233CB84
	cmp r0, #8
	beq _0233CBB0
	b _0233CCDC
_0233CB6C:
	ldr r0, [r4]
	mov sb, #0
	str r7, [r0]
	ldr r0, [r4]
	str r6, [r0, #4]
	b _0233CCDC
_0233CB84:
	ldr r1, [r4]
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	strne sl, [r1]
	bne _0233CCDC
	mov r0, sb
	mov r1, #0
	bl ov01_02338C28
	ldr r0, [r4]
	str fp, [r0]
	b _0233CCDC
_0233CBB0:
	ldr r1, [r4]
	mov r0, #5
	str r0, [r1]
	ldr r1, [r4]
	mov r0, #4
	mov sb, #0
	str r0, [r1, #4]
	b _0233CCDC
_0233CBD0:
	ldr r1, [r1, #0xc]
	mov r0, #0
	bl ov01_02338C4C
	ldr r1, [r4]
	mov r0, #3
	str r0, [r1]
_0233CBE8:
	bl ov01_02338EC4
	cmp r0, #4
	bne _0233CC3C
	mov r0, #0
	bl ov01_02338E1C
	mov r5, r0
	mov r0, #1
	mov r1, #0
	bl ov01_02338C28
	ldr r2, [r4]
	mov r1, #4
	mov r0, r5
	str r1, [r2]
	bl ov01_0232C578
	cmp r0, #0
	ldr r1, [r4]
	moveq r0, #1
	streq r0, [r1, #4]
	movne r0, #2
	strne r0, [r1, #4]
	b _0233CCDC
_0233CC3C:
	cmp r0, #8
	cmpne r0, #6
	ldreq r1, [r4]
	moveq r0, #4
	streq r0, [r1]
	b _0233CCDC
_0233CC54:
	bl ov01_02338EC4
	cmp r0, #6
	bne _0233CC88
	ldr r1, [r4]
	mov r0, #5
	str r0, [r1]
	ldr r1, [r4]
	ldr r0, [r1, #4]
	cmp r0, #0
	moveq r0, sb
	streq r0, [r1, #4]
	mov sb, #0
	b _0233CCDC
_0233CC88:
	cmp r0, #8
	bne _0233CCDC
	ldr r1, [r4]
	mov r0, #5
	str r0, [r1]
	ldr r1, [r4]
	mov sb, #0
	ldr r0, [r1, #4]
	cmp r0, #0
	moveq r0, #4
	streq r0, [r1, #4]
	b _0233CCDC
_0233CCB8:
	bl ov01_02338EB0
	ldr r1, _0233CCEC ; =ov07_02341B80
	ldr r1, [r1]
	strb r0, [r1, #8]
	bl ov01_02338B08
	ldr r0, _0233CCEC ; =ov07_02341B80
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233CCDC:
	cmp sb, #0
	beq _0233CB0C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233CCEC: .word ov07_02341B80

	arm_func_start ov07_0233CCF0
ov07_0233CCF0: ; 0x0233CCF0
	ldr r0, _0233CD00 ; =ov07_02341B80
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	bx lr
	.align 2, 0
_0233CD00: .word ov07_02341B80
	arm_func_end ov07_0233CCF0

	arm_func_start ov07_0233CD04
ov07_0233CD04: ; 0x0233CD04
	stmdb sp!, {r3, lr}
	ldr r0, _0233CD2C ; =ov07_02341B80
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0233CD2C ; =ov07_02341B80
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233CD2C: .word ov07_02341B80
	arm_func_end ov07_0233CD04

	arm_func_start ov07_0233CD30
ov07_0233CD30: ; 0x0233CD30
	stmdb sp!, {r3, lr}
	mov r0, #4
	mov r1, #8
	bl MemAlloc
	ldr r2, _0233CD64 ; =ov07_02341B60
	mov r1, #4
	str r0, [r2]
	bl MemZero
	ldr r0, _0233CD64 ; =ov07_02341B60
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233CD64: .word ov07_02341B60
	arm_func_end ov07_0233CD30

	arm_func_start ov07_0233CD68
ov07_0233CD68: ; 0x0233CD68
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _0233CF4C ; =ov07_02341B60
	ldr r1, _0233CF50 ; =0x00001001
	ldr r0, [r0]
	ldr r2, [r0]
	cmp r2, r1
	bgt _0233CDB8
	bge _0233CE8C
	cmp r2, #1
	bgt _0233CDAC
	cmp r2, #0
	blt _0233CF38
	beq _0233CDE0
	cmp r2, #1
	beq _0233CE14
	b _0233CF38
_0233CDAC:
	cmp r2, #0x1000
	beq _0233CE78
	b _0233CF38
_0233CDB8:
	add r0, r1, #0x1000
	cmp r2, r0
	bgt _0233CDD4
	bge _0233CEE0
	cmp r2, #0x2000
	beq _0233CEC8
	b _0233CF38
_0233CDD4:
	add r0, r1, #0xe000
	cmp r2, r0
	b _0233CF38
_0233CDE0:
	mov r0, #5
	bl ov01_02337928
	str r0, [sp]
	mov r0, #0
	ldr r2, _0233CF54 ; =ov07_023419FC
	ldr r3, _0233CF58 ; =0x000036F6
	mov r1, r0
	bl ov07_0233F638
	ldr r0, _0233CF4C ; =ov07_02341B60
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0233CF40
_0233CE14:
	bl ov07_0233F678
	mov r4, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #5
	bl ov01_02337938
	cmp r4, #8
	ldreq r0, _0233CF4C ; =ov07_02341B60
	moveq r1, #0x1000
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0233CF40
	cmp r4, #9
	ldreq r0, _0233CF4C ; =ov07_02341B60
	moveq r1, #0x2000
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0233CF40
	cmp r4, #0x15
	ldreq r0, _0233CF4C ; =ov07_02341B60
	ldreq r1, _0233CF5C ; =0x0000F001
	ldreq r0, [r0]
	streq r1, [r0]
	b _0233CF40
_0233CE78:
	bl ov07_0233E9C8
	ldr r0, _0233CF4C ; =ov07_02341B60
	ldr r1, _0233CF50 ; =0x00001001
	ldr r0, [r0]
	str r1, [r0]
_0233CE8C:
	bl sub_02003BFC
	bl ov07_0233EAF4
	cmp r0, #1
	bne _0233CEB4
	bl ov07_0233F60C
	ldr r0, _0233CF4C ; =ov07_02341B60
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	b _0233CF40
_0233CEB4:
	cmp r0, #2
	bne _0233CF40
	bl ov07_0233F60C
	mov r0, #2
	b _0233CF44
_0233CEC8:
	rsb r0, r1, #0x1000
	bl ov07_0233DD58
	ldr r0, _0233CF4C ; =ov07_02341B60
	ldr r1, _0233CF60 ; =0x00002001
	ldr r0, [r0]
	str r1, [r0]
_0233CEE0:
	bl ov07_0233DE60
	cmp r0, #1
	bne _0233CF04
	bl ov07_0233E514
	ldr r0, _0233CF4C ; =ov07_02341B60
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	b _0233CF40
_0233CF04:
	cmp r0, #2
	bne _0233CF24
	bl ov07_0233E514
	ldr r0, _0233CF4C ; =ov07_02341B60
	ldr r1, _0233CF5C ; =0x0000F001
	ldr r0, [r0]
	str r1, [r0]
	b _0233CF40
_0233CF24:
	cmp r0, #3
	bne _0233CF40
	bl ov07_0233E514
	mov r0, #2
	b _0233CF44
_0233CF38:
	mov r0, #1
	b _0233CF44
_0233CF40:
	mov r0, #0
_0233CF44:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0233CF4C: .word ov07_02341B60
_0233CF50: .word 0x00001001
_0233CF54: .word ov07_023419FC
#if defined(EUROPE)
_0233CF58: .word 0x000036F8
#elif defined(JAPAN)
_0233CF58: .word 0x00003378
#else
_0233CF58: .word 0x000036F6
#endif
_0233CF5C: .word 0x0000F001
_0233CF60: .word 0x00002001
	arm_func_end ov07_0233CD68

	arm_func_start ov07_0233CF64
ov07_0233CF64: ; 0x0233CF64
	stmdb sp!, {r3, lr}
	ldr r0, _0233CF8C ; =ov07_02341B60
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0233CF8C ; =ov07_02341B60
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233CF8C: .word ov07_02341B60
	arm_func_end ov07_0233CF64

	arm_func_start ov07_0233CF90
ov07_0233CF90: ; 0x0233CF90
#if defined(EUROPE)
#define OV07_0233CF90_STORE_OFFSET -1
#define OV07_0233CF90_STORE_OFFSET_2 0
#elif defined(JAPAN)
#define OV07_0233CF90_STORE_OFFSET -0x40
#define OV07_0233CF90_STORE_OFFSET_2 -0x40
#else
#define OV07_0233CF90_STORE_OFFSET 0
#define OV07_0233CF90_STORE_OFFSET_2 0
#endif
	stmdb sp!, {r4, lr}
	mov r0, #0x30c + OV07_0233CF90_STORE_OFFSET_2
	mov r1, #8
	bl MemAlloc
	ldr r2, _0233CFEC ; =ov07_02341B64
	mov r4, r0
	mov r1, #0x30c + OV07_0233CF90_STORE_OFFSET_2
	str r4, [r2]
	bl MemZero
	mvn r0, #1
	strb r0, [r4, #4]
	mov r0, #0
	str r0, [r4]
	mov r0, #2
	bl ov01_02337928
	str r0, [r4, #0x1cc + OV07_0233CF90_STORE_OFFSET_2]
	mov r0, #0
	strb r0, [r4, #0x308 + OV07_0233CF90_STORE_OFFSET]
	strb r0, [r4, #0x309 + OV07_0233CF90_STORE_OFFSET]
	str r0, [r4, #0x268 + OV07_0233CF90_STORE_OFFSET_2]
	add r0, r4, #0x304 + OV07_0233CF90_STORE_OFFSET_2
	str r0, [r4, #0x2cc + OV07_0233CF90_STORE_OFFSET_2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233CFEC: .word ov07_02341B64
	arm_func_end ov07_0233CF90

	arm_func_start ov07_0233CFF0
ov07_0233CFF0: ; 0x0233CFF0
#if defined(EUROPE)
#define OV07_0233CFF0_LOAD_OFFSET 2
#define OV07_0233CFF0_LOAD_OFFSET_2 0
#define OV07_0233CFF0_LOAD_OFFSET_3 -1
#elif defined(JAPAN)
#define OV07_0233CFF0_LOAD_OFFSET -0x37E
#define OV07_0233CFF0_LOAD_OFFSET_2 -0x40
#define OV07_0233CFF0_LOAD_OFFSET_3 -0x40
#else
#define OV07_0233CFF0_LOAD_OFFSET 0
#define OV07_0233CFF0_LOAD_OFFSET_2 0
#define OV07_0233CFF0_LOAD_OFFSET_3 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	ldr r0, _0233D8D4 ; =ov07_02341B64
	ldr r3, _0233D8D8 ; =0x00005001
	ldr r6, [r0]
	ldr r0, [r6]
	cmp r0, r3
	bgt _0233D0B0
	bge _0233D64C
	cmp r0, #0x3000
	bgt _0233D074
	bge _0233D358
	cmp r0, #0x1000
	bgt _0233D04C
	bge _0233D17C
	cmp r0, #1
	bgt _0233D8C0
	cmp r0, #0
	blt _0233D8C0
	beq _0233D150
	cmp r0, #1
	beq _0233D168
	b _0233D8C0
_0233D04C:
	ldr r2, _0233D8DC ; =0x00001002
	cmp r0, r2
	bgt _0233D8C0
	sub r1, r2, #1
	cmp r0, r1
	blt _0233D8C0
	beq _0233D18C
	cmp r0, r2
	beq _0233D244
	b _0233D8C0
_0233D074:
	cmp r0, #0x4000
	bgt _0233D090
	bge _0233D50C
	sub r1, r3, #0x2000
	cmp r0, r1
	beq _0233D3F8
	b _0233D8C0
_0233D090:
	sub r1, r3, #0x1000
	cmp r0, r1
	bgt _0233D0A4
	beq _0233D528
	b _0233D8C0
_0233D0A4:
	cmp r0, #0x5000
	beq _0233D56C
	b _0233D8C0
_0233D0B0:
	cmp r0, #0x7000
	bgt _0233D110
	bge _0233D800
	cmp r0, #0x6000
	bgt _0233D100
	bge _0233D750
	add r1, r3, #3
	cmp r0, r1
	bgt _0233D8C0
	add r1, r3, #1
	cmp r0, r1
	blt _0233D8C0
	beq _0233D660
	add r1, r3, #2
	cmp r0, r1
	beq _0233D6F8
	add r1, r3, #3
	cmp r0, r1
	beq _0233D728
	b _0233D8C0
_0233D100:
	add r1, r3, #0x1000
	cmp r0, r1
	beq _0233D7EC
	b _0233D8C0
_0233D110:
	ldr r2, _0233D8E0 ; =0x00007002
	cmp r0, r2
	bgt _0233D130
	bge _0233D854
	sub r1, r2, #1
	cmp r0, r1
	beq _0233D828
	b _0233D8C0
_0233D130:
	add r1, r2, #1
	cmp r0, r1
	bgt _0233D144
	beq _0233D8AC
	b _0233D8C0
_0233D144:
	add r1, r3, #0xa000
	cmp r0, r1
	b _0233D8C0
_0233D150:
	ldr r1, _0233D8E4 ; =0x00003714
	mov r2, #1
	mov r0, #0x1c
	str r2, [r6]
	bl ov07_0233F6AC
	b _0233D8C8
_0233D168:
	bl ov07_0233F6C8
	cmp r0, #0x15
	moveq r0, #0x1000
	streq r0, [r6]
	b _0233D8C8
_0233D17C:
	bl sub_02046D20
	ldr r0, _0233D8E8 ; =0x00001001
	str r0, [r6]
	b _0233D8C8
_0233D18C:
	ldrsb r0, [r6, #4]
	rsb r1, r2, #0x1000
	cmp r0, r1
	bne _0233D234
	mov r7, #0
	mov r5, r7
	mov r4, r7
_0233D1A8:
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov00_022BD0A0
	cmp r0, #0
	addne r0, r6, r5, lsl #2
	strneh r7, [r0, #0xc]
	add r7, r7, #1
	strneb r4, [r0, #0xe]
	addne r5, r5, #1
	cmp r7, #0x10
	blt _0233D1A8
	str r5, [r6, #8]
	ldr r0, [r6, #0x1cc + OV07_0233CFF0_LOAD_OFFSET_2]
	mov r2, #0x10
	str r0, [r6, #0x1d0 + OV07_0233CFF0_LOAD_OFFSET_2]
	ldr r1, _0233D8EC ; =0x00003715
	str r2, [r6, #0x1dc + OV07_0233CFF0_LOAD_OFFSET_2]
	add r0, r6, #0x100
	strh r1, [r0, #0xd8 + OV07_0233CFF0_LOAD_OFFSET_2]
	str r2, [r6, #0x1dc + OV07_0233CFF0_LOAD_OFFSET_2]
	mov r1, #0xd
	ldr r0, _0233D8F0 ; =ov07_0233DAA8
	str r1, [r6, #0x1d4 + OV07_0233CFF0_LOAD_OFFSET_2]
	str r0, [sp]
	ldr r0, [r6, #8]
	mov r2, #8
	str r0, [sp, #4]
	ldr r0, _0233D8F4 ; =ov07_02341AAC
	ldr r1, _0233D8F8 ; =0x00441C37
	ldr r3, _0233D8FC ; =ov07_0233D9DC
	str r2, [sp, #8]
	add r2, r6, #0x1d0 + OV07_0233CFF0_LOAD_OFFSET_2
	bl CreateCollectionMenu
	strb r0, [r6, #4]
	b _0233D238
_0233D234:
	bl sub_0202C620
_0233D238:
	ldr r0, _0233D8DC ; =0x00001002
	str r0, [r6]
	b _0233D8C8
_0233D244:
	ldrsb r0, [r6, #4]
	bl sub_0202C748
	mov r1, r0
	mov r1, r1, lsl #0x18
	str r0, [r6, #0x1cc + OV07_0233CFF0_LOAD_OFFSET_2]
	mov r0, #2
	mov r1, r1, asr #0x18
	bl ov01_02337938
	ldrsb r0, [r6, #4]
	bl IsCollectionMenuActive
	cmp r0, #0
	bne _0233D8C8
	ldrsb r0, [r6, #4]
	bl sub_0202C75C
	ldr r1, _0233D8D4 ; =ov07_02341B64
	mov r4, r0
	ldr r5, [r1]
	mvn r1, #1
	ldrsb r0, [r5, #4]
	cmp r0, r1
	beq _0233D2AC
	bl sub_0202836C
	ldrsb r0, [r5, #4]
	bl CloseCollectionMenu
	mvn r0, #1
	strb r0, [r5, #4]
_0233D2AC:
	cmp r4, #0
	bge _0233D2D0
	ldrb r0, [r6, #0x308 + OV07_0233CFF0_LOAD_OFFSET_3]
	cmp r0, #0
	movne r0, #0x7000
	strne r0, [r6]
	ldreq r0, _0233D900 ; =0x0000F001
	streq r0, [r6]
	b _0233D8C8
_0233D2D0:
	bl ov07_0233D9A0
	cmp r0, #1
	ble _0233D304
	mov r0, #0
	mov r4, #1
	ldr r2, _0233D904 ; =ov07_02341994
	ldr r3, _0233D908 ; =0x0000371F
	mov r1, r0
	str r4, [sp]
	bl ov07_0233F638
	mov r0, #0x5000
	str r0, [r6]
	b _0233D8C8
_0233D304:
	bl ov07_0233D9A0
	cmp r0, #1
	bne _0233D33C
	mov r1, #0
	b _0233D32C
_0233D318:
	add r0, r6, r1, lsl #2
	ldrb r0, [r0, #0xe]
	cmp r0, #0
	strne r1, [r6, #0x1cc + OV07_0233CFF0_LOAD_OFFSET_2]
	add r1, r1, #1
_0233D32C:
	ldr r0, [r6, #8]
	cmp r1, r0
	blt _0233D318
	b _0233D34C
_0233D33C:
	str r4, [r6, #0x1cc + OV07_0233CFF0_LOAD_OFFSET_2]
	add r0, r6, r4, lsl #2
	mov r1, #1
	strb r1, [r0, #0xe]
_0233D34C:
	mov r0, #0x3000
	str r0, [r6]
	b _0233D8C8
_0233D358:
	ldr r1, _0233D90C ; =ov07_02341ABC
	ldr r2, _0233D910 ; =ov07_0233DB50
	add r0, r6, #0x268 + OV07_0233CFF0_LOAD_OFFSET_2
	bl sub_0204707C
	mov r2, #0
#ifdef EUROPE
	mov r0, r2
_0233DAD0:
	add r1, r6, r2
	add r2, r2, #1
	strb r0, [r1, #0x304]
	cmp r2, #3
	blt _0233DAD0
#else
	mov r1, r2
_0233D370:
	add r0, r6, r2
	add r2, r2, #1
	strb r1, [r0, #0x304 + OV07_0233CFF0_LOAD_OFFSET_2]
	cmp r2, #4
	blt _0233D370
	bl ov00_022BD5C8
	cmp r0, #0
	beq _0233D3A8
	ldr r0, [r6, #0x1cc + OV07_0233CFF0_LOAD_OFFSET_2]
	add r0, r6, r0, lsl #2
	ldrh r0, [r0, #0xc]
	bl ov00_022BD2C0
	cmp r0, #0
	bne _0233D3B0
_0233D3A8:
	mov r0, #3
	strb r0, [r6, #0x306 + OV07_0233CFF0_LOAD_OFFSET_2]
_0233D3B0:
	mov r0, #0
#endif
	bl ov01_02337928
	ldr r1, _0233D914 ; =ov07_02341A20
	ldr r2, _0233D918 ; =ov07_02341A1C
	ldr r1, [r1, r0, lsl #3]
	mov r0, #0
	str r1, [r6, #0x26c + OV07_0233CFF0_LOAD_OFFSET_2]
	ldr r1, _0233D91C ; =0x0000371A
	str r2, [sp]
	str r1, [sp, #4]
	ldr r2, _0233D920 ; =0x00000233
	mov r1, r0
	add r3, r6, #0x26c + OV07_0233CFF0_LOAD_OFFSET_2
	str r0, [sp, #8]
	bl ov07_0233F64C
	ldr r0, _0233D924 ; =0x00003001
	str r0, [r6]
	b _0233D8C8
_0233D3F8:
	bl ov07_0233F678
	mov r4, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0
	bl ov01_02337938
	ldr r0, [r6, #0x268 + OV07_0233CFF0_LOAD_OFFSET_2]
	cmp r0, #0
	beq _0233D424
	bl sub_020470D0
_0233D424:
	cmp r4, #0xa
	bne _0233D448
	ldr r0, _0233D8D4 ; =ov07_02341B64
	ldr r0, [r0]
	add r0, r0, #0x268 + OV07_0233CFF0_LOAD_OFFSET_2
	bl sub_02047150
	mov r0, #0x4000
	str r0, [r6]
	b _0233D8C8
_0233D448:
	cmp r4, #0xb
	bne _0233D488
	ldr r0, _0233D8D4 ; =ov07_02341B64
	ldr r0, [r0]
	add r0, r0, #0x268 + OV07_0233CFF0_LOAD_OFFSET_2
	bl sub_02047150
	mov r0, #0
	mov r4, #1
	ldr r2, _0233D928 ; =ov07_02341964
	ldr r3, _0233D92C ; =0x00003722
	mov r1, r0
	str r4, [sp]
	bl ov07_0233F638
	mov r0, #0x5000
	str r0, [r6]
	b _0233D8C8
_0233D488:
#ifndef EUROPE
	cmp r4, #0xc
	bne _0233D4E8
	ldr r0, _0233D8D4 ; =ov07_02341B64
	ldr r0, [r0]
	add r0, r0, #0x268 + OV07_0233CFF0_LOAD_OFFSET_2
	bl sub_02047150
	ldr r0, [r6, #0x1cc + OV07_0233CFF0_LOAD_OFFSET_2]
	add r0, r6, r0, lsl #2
	ldrh r0, [r0, #0xc]
	bl ov00_022BD284
	cmp r0, #0
	ldrne r4, _0233D930 ; =0x0000372C
	mov r0, #1
	ldreq r4, _0233D934 ; =0x0000372A
	bl ov01_02337928
	str r0, [sp]
	ldr r2, _0233D938 ; =ov07_02341934
	mov r3, r4
	mov r0, #0
	mov r1, #8
	bl ov07_0233F638
	mov r0, #0x6000
	str r0, [r6]
	b _0233D8C8
_0233D4E8:
#endif
	cmp r4, #0x15
	bne _0233D8C8
	ldr r0, _0233D8D4 ; =ov07_02341B64
	ldr r0, [r0]
	add r0, r0, #0x268 + OV07_0233CFF0_LOAD_OFFSET_2
	bl sub_02047150
	mov r0, #0x1000
	str r0, [r6]
	b _0233D8C8
_0233D50C:
	ldr r0, [r6, #0x1cc + OV07_0233CFF0_LOAD_OFFSET_2]
	add r0, r6, r0, lsl #2
	ldrh r0, [r0, #0xc]
	bl ov07_0233DD58
	ldr r0, _0233D93C ; =0x00004001
	str r0, [r6]
	b _0233D8C8
_0233D528:
	bl ov07_0233DE60
	sub r1, r0, #1
	cmp r1, #1
	bhi _0233D558
	bl ov07_0233E540
	cmp r0, #0
	movne r0, #1
	strneb r0, [r6, #0x308 + OV07_0233CFF0_LOAD_OFFSET_3]
	bl ov07_0233E514
	mov r0, #0x1000
	str r0, [r6]
	b _0233D8C8
_0233D558:
	cmp r0, #3
	bne _0233D8C8
	bl ov07_0233E514
	mov r0, #2
	b _0233D8CC
_0233D56C:
	bl ov07_0233F678
	cmp r0, #1
	bne _0233D638
	mov r4, #0
	mov r5, r4
#ifdef JAPAN
	add sb, r6, #0x54
	add r8, r6, #0x4c
	mov r7, #0x14
#else
	add sb, r6, #0x58
	add r8, r6, #0x4c
	mov r7, #0x18
#endif
_0233D58C:
	mul r2, r5, r7
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	add r1, sb, r2
	add r2, r8, r2
	bl ov00_022BCF14
	add r5, r5, #1
	cmp r5, #0x10
	blt _0233D58C
	mov r5, #0
	mov r7, #1
	b _0233D5F0
_0233D5BC:
	add r1, r6, r5, lsl #2
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	beq _0233D5EC
	ldrh r8, [r1, #0xc]
	mov r0, r8
	bl ov00_022BD2C0
	cmp r0, #0
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	movne r4, r7
	bl ov00_022BD3B4
_0233D5EC:
	add r5, r5, #1
_0233D5F0:
	ldr r0, [r6, #8]
	cmp r5, r0
	blt _0233D5BC
	cmp r4, #0
	beq _0233D620
	bl ov07_0233CA80
	ldr r2, _0233D8D8 ; =0x00005001
	ldr r1, _0233D940 ; =0x00003727
	mov r0, #0x1c
	str r2, [r6]
	bl ov07_0233F6AC
	b _0233D8C8
_0233D620:
	ldr r1, _0233D944 ; =0x00003725
	mov r0, #0x1c
	bl ov07_0233F6AC
	ldr r0, _0233D948 ; =0x00005003
	str r0, [r6]
	b _0233D8C8
_0233D638:
	cmp r0, #2
	cmpne r0, #0x15
	moveq r0, #0x1000
	streq r0, [r6]
	b _0233D8C8
_0233D64C:
	bl ov07_0233F6C8
	cmp r0, #0x15
	ldreq r0, _0233D94C ; =0x00005002
	streq r0, [r6]
	b _0233D8C8
_0233D660:
	bl ov07_0233CAE8
	cmp r0, #0
	beq _0233D8C8
	cmp r0, #1
	bne _0233D6A0
	bl ov07_0233CCF0
	cmp r0, #0
	beq _0233D6A0
	ldr r1, _0233D944 ; =0x00003725
	mov r0, #0x1c
	bl ov07_0233F6AC
	ldr r1, _0233D950 ; =0x00005004
	mov r0, #1
	str r1, [r6]
	strb r0, [r6, #0x309 + OV07_0233CFF0_LOAD_OFFSET_3]
	b _0233D6F0
_0233D6A0:
	mov r8, #0
#ifdef JAPAN
	add r7, r6, #0x54
	add r5, r6, #0x4c
	mov r4, #0x14
#else
	add r7, r6, #0x58
	add r5, r6, #0x4c
	mov r4, #0x18
#endif
_0233D6B0:
	mul r2, r8, r4
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	add r1, r7, r2
	add r2, r5, r2
	bl ov00_022BCF6C
	add r8, r8, #1
	cmp r8, #0x10
	blt _0233D6B0
	ldr r1, _0233D954 ; =0x00003726
	mov r0, #0x1c
	bl ov07_0233F6AC
	ldr r1, _0233D950 ; =0x00005004
	mov r0, #0
	str r1, [r6]
	strb r0, [r6, #0x309 + OV07_0233CFF0_LOAD_OFFSET_3]
_0233D6F0:
	bl ov07_0233CD04
	b _0233D8C8
_0233D6F8:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _0233D8C8
	mov r0, #1
	strb r0, [r6, #0x308 + OV07_0233CFF0_LOAD_OFFSET_3]
	bl ov00_022BD2F4
	cmp r0, #0
	movne r0, #0x1000
	strne r0, [r6]
	moveq r0, #0x7000
	streq r0, [r6]
	b _0233D8C8
_0233D728:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _0233D8C8
	ldrb r0, [r6, #0x309 + OV07_0233CFF0_LOAD_OFFSET_3]
	cmp r0, #0
	moveq r0, #0x1000
	streq r0, [r6]
	movne r0, #0x7000
	strne r0, [r6]
	b _0233D8C8
_0233D750:
	bl ov07_0233F678
	mov r4, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #1
	bl ov01_02337938
	cmp r4, #1
	bne _0233D7D8
	ldr r0, [r6, #0x1cc + OV07_0233CFF0_LOAD_OFFSET_2]
	add r0, r6, r0, lsl #2
	ldrh r0, [r0, #0xc]
	bl ov00_022BD284
	cmp r0, #0
	ldr r0, [r6, #0x1cc + OV07_0233CFF0_LOAD_OFFSET_2]
	beq _0233D7A8
	add r0, r6, r0, lsl #2
	ldrh r0, [r0, #0xc]
	mov r1, #0
	bl ov00_022BD2A4
	ldr r1, _0233D958 ; =0x0000372D
	b _0233D7BC
_0233D7A8:
	add r0, r6, r0, lsl #2
	ldrh r0, [r0, #0xc]
	mov r1, #1
	bl ov00_022BD2A4
	ldr r1, _0233D95C ; =0x0000372B
_0233D7BC:
	mov r2, #1
	mov r0, #0x1c
	strb r2, [r6, #0x308 + OV07_0233CFF0_LOAD_OFFSET_3]
	bl ov07_0233F6AC
	ldr r0, _0233D960 ; =0x00006001
	str r0, [r6]
	b _0233D8C8
_0233D7D8:
	cmp r4, #2
	cmpne r4, #0x15
	moveq r0, #0x1000
	streq r0, [r6]
	b _0233D8C8
_0233D7EC:
	bl ov07_0233F6C8
	cmp r0, #0x15
	moveq r0, #0x1000
	streq r0, [r6]
	b _0233D8C8
_0233D800:
	bl ov00_022BD780
	ldr r1, _0233D964 ; =0x0000023B
	mov r0, #0
	bl ov07_0233F6AC
	ldr r1, _0233D968 ; =0x00007001
	mov r0, #0
	str r1, [r6]
	strb r0, [r6, #0x309 + OV07_0233CFF0_LOAD_OFFSET_3]
	strb r0, [r6, #0x308 + OV07_0233CFF0_LOAD_OFFSET_3]
	b _0233D8C8
_0233D828:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _0233D8C8
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	ldr r0, _0233D8E0 ; =0x00007002
	str r0, [r6]
	bl sub_02003B94
	b _0233D8C8
_0233D854:
	mov r0, #3
	bl NoteSaveBase
	mov r4, r0
	bl sub_02003BC8
	bl sub_02029FBC
	cmp r4, #0
	bne _0233D888
#ifdef JAPAN
	ldr r1, _0233F1EC ; =0x000004CD
	mov r0, #0x1c
#else
	mov r0, #0x1c
	mov r1, #0x23c
#endif
	bl ov07_0233F6AC
	ldr r0, _0233D96C ; =0x00007003
	str r0, [r6]
	b _0233D8C8
_0233D888:
	cmp r4, #1
	moveq r0, #2
	beq _0233D8CC
	ldr r1, _0233D970 ; =0x00000239
	mov r0, #0x1c
	bl ov07_0233F6AC
	ldr r0, _0233D96C ; =0x00007003
	str r0, [r6]
	b _0233D8C8
_0233D8AC:
	bl ov07_0233F6C8
	cmp r0, #0x15
	ldreq r0, _0233D900 ; =0x0000F001
	streq r0, [r6]
	b _0233D8C8
_0233D8C0:
	mov r0, #1
	b _0233D8CC
_0233D8C8:
	mov r0, #0
_0233D8CC:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0233D8D4: .word ov07_02341B64
_0233D8D8: .word 0x00005001
_0233D8DC: .word 0x00001002
_0233D8E0: .word 0x00007002
_0233D8E4: .word 0x00003714 + OV07_0233CFF0_LOAD_OFFSET
_0233D8E8: .word 0x00001001
_0233D8EC: .word 0x00003715 + OV07_0233CFF0_LOAD_OFFSET
_0233D8F0: .word ov07_0233DAA8
_0233D8F4: .word ov07_02341AAC
_0233D8F8: .word 0x00441C37
_0233D8FC: .word ov07_0233D9DC
_0233D900: .word 0x0000F001
_0233D904: .word ov07_02341994
_0233D908: .word 0x0000371F + OV07_0233CFF0_LOAD_OFFSET
_0233D90C: .word ov07_02341ABC
_0233D910: .word ov07_0233DB50
_0233D914: .word ov07_02341A20
_0233D918: .word ov07_02341A1C
_0233D91C: .word 0x0000371A + OV07_0233CFF0_LOAD_OFFSET
_0233D920: .word 0x00000233
_0233D924: .word 0x00003001
_0233D928: .word ov07_02341964
_0233D92C: .word 0x00003722 + OV07_0233CFF0_LOAD_OFFSET
#ifndef EUROPE
_0233D930: .word 0x0000372C + OV07_0233CFF0_LOAD_OFFSET
_0233D934: .word 0x0000372A + OV07_0233CFF0_LOAD_OFFSET
_0233D938: .word ov07_02341934
#endif
_0233D93C: .word 0x00004001
_0233D940: .word 0x00003727 + OV07_0233CFF0_LOAD_OFFSET
_0233D944: .word 0x00003725 + OV07_0233CFF0_LOAD_OFFSET
_0233D948: .word 0x00005003
_0233D94C: .word 0x00005002
_0233D950: .word 0x00005004
_0233D954: .word 0x00003726 + OV07_0233CFF0_LOAD_OFFSET
_0233D958: .word 0x0000372D + OV07_0233CFF0_LOAD_OFFSET
_0233D95C: .word 0x0000372B + OV07_0233CFF0_LOAD_OFFSET
_0233D960: .word 0x00006001
#ifdef JAPAN
_0233D964: .word 0x000004CC
_0233D968: .word 0x00007001
_0233F1EC: .word 0x000004CD
_0233D96C: .word 0x00007003
_0233D970: .word 0x000004CA
#else
_0233D964: .word 0x0000023B
_0233D968: .word 0x00007001
_0233D96C: .word 0x00007003
_0233D970: .word 0x00000239
#endif
	arm_func_end ov07_0233CFF0

	arm_func_start ov07_0233D974
ov07_0233D974: ; 0x0233D974
	stmdb sp!, {r3, lr}
	ldr r0, _0233D99C ; =ov07_02341B64
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0233D99C ; =ov07_02341B64
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233D99C: .word ov07_02341B64
	arm_func_end ov07_0233D974

	arm_func_start ov07_0233D9A0
ov07_0233D9A0: ; 0x0233D9A0
	ldr r0, _0233D9D8 ; =ov07_02341B64
	mov ip, #0
	ldr r2, [r0]
	mov r0, ip
	ldr r3, [r2, #8]
	b _0233D9CC
_0233D9B8:
	add r1, r2, ip, lsl #2
	ldrb r1, [r1, #0xe]
	add ip, ip, #1
	cmp r1, #0
	addne r0, r0, #1
_0233D9CC:
	cmp ip, r3
	blt _0233D9B8
	bx lr
	.align 2, 0
_0233D9D8: .word ov07_02341B64
	arm_func_end ov07_0233D9A0

	arm_func_start ov07_0233D9DC
ov07_0233D9DC: ; 0x0233D9DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x154
	ldr r3, _0233DA9C ; =ov07_02341B64
	mov r6, r1, lsl #2
	ldr r3, [r3]
	mov r5, r0
	add r7, r3, #0xc
	ldrh r0, [r7, r6]
	mov r4, r2
	add r8, r7, r1, lsl #2
	bl ov00_022BD108
	add r0, sp, #4
	bl InitPreprocessorArgs
	add r0, sp, #0x54
#ifdef JAPAN
	mov r1, #0xc
#else
	mov r1, #0x16
#endif
	bl MemZero
	ldrh r0, [r7, r6]
	bl ov00_022BD0D4
	mov r1, r0
	add r0, sp, #0x54
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpySimpleNoPadSafe
	add r1, sp, #0x54
	str r1, [sp, #0x3c]
	add r0, sp, #4
	str r0, [sp]
	ldr r2, _0233DAA0 ; =0x00003716
	mov r0, r5
	mov r1, #0x100
	mov r3, #0
	bl PreprocessStringFromId
	ldr r1, _0233DAA4 ; =ov07_02341ACC
	mov r0, r5
	bl strcat
	ldrh r1, [r7, r6]
	add r0, sp, #0x54
	bl ov07_0233DC48
	mov r0, r5
	add r1, sp, #0x54
	bl strcat
	ldrb r0, [r8, #2]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	str r0, [r4]
	mov r0, r5
	add sp, sp, #0x154
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0233DA9C: .word ov07_02341B64
#if defined(EUROPE)
_0233DAA0: .word 0x00003718
#elif defined (JAPAN)
_0233DAA0: .word 0x00003398
#else
_0233DAA0: .word 0x00003716
#endif
_0233DAA4: .word ov07_02341ACC
	arm_func_end ov07_0233D9DC

	arm_func_start ov07_0233DAA8
ov07_0233DAA8: ; 0x0233DAA8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0233DB4C ; =ov07_02341B64
	mov r6, r0
	ldr r4, [r1]
	ldrsb r0, [r4, #4]
	bl sub_0202C748
	mov r5, r0
	tst r6, #0x400
	beq _0233DB44
	mov r0, #6
	bl PlaySeVolumeWrapper
	add r2, r4, r5, lsl #2
	ldrb r0, [r2, #0xe]
	cmp r0, #0
	beq _0233DB2C
	mov r1, #0
	strb r1, [r2, #0xe]
	mov r2, #1
	b _0233DB0C
_0233DAF4:
	add r0, r4, r1, lsl #2
	ldrb r0, [r0, #0xe]
	cmp r0, #0
	movne r2, #0
	bne _0233DB14
	add r1, r1, #1
_0233DB0C:
	cmp r1, #0x10
	blt _0233DAF4
_0233DB14:
	cmp r2, #0
	beq _0233DB3C
	ldrsb r0, [r4, #4]
	mov r1, #0
	bl sub_0202D07C
	b _0233DB3C
_0233DB2C:
	mov r1, #1
	strb r1, [r2, #0xe]
	ldrsb r0, [r4, #4]
	bl sub_0202D07C
_0233DB3C:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_0233DB44:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0233DB4C: .word ov07_02341B64
	arm_func_end ov07_0233DAA8

	arm_func_start ov07_0233DB50
ov07_0233DB50: ; 0x0233DB50
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x54
	ldr r1, _0233DC3C ; =ov07_02341B64
	mov r4, r0
	ldr r1, [r1]
#ifdef JAPAN
	ldr r0, [r1, #0x18c]
#else
	ldr r0, [r1, #0x1cc]
#endif
	add r8, r1, #0xc
	mov r7, r0, lsl #2
	ldrh r0, [r8, r7]
	bl ov00_022BD108
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r6, r0
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r5, r0
	add r0, sp, #4
	bl InitPreprocessorArgs
	mov r0, r6
#ifdef JAPAN
	mov r1, #0xc
#else
	mov r1, #0x16
#endif
	bl MemZero
	ldrh r0, [r8, r7]
	bl ov00_022BD0D4
	mov r1, r0
	mov r0, r6
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpySimpleNoPadSafe
	str r6, [sp, #0x3c]
	add r1, sp, #4
	str r1, [sp]
	ldr r2, _0233DC40 ; =0x00003716
	mov r0, r5
	mov r1, #0x100
	mov r3, #0
	bl PreprocessStringFromId
	ldr r1, _0233DC44 ; =ov07_02341ACC
	mov r0, r5
	bl strcat
	ldrh r1, [r8, r7]
	mov r0, r6
	bl ov07_0233DC48
	mov r0, r5
	mov r1, r6
	bl strcat
	mov r0, r4
	mov r1, #4
	mov r2, #2
	mov r3, r5
	bl DrawTextInWindow
	mov r0, r6
	bl MemFree
	mov r0, r5
	bl MemFree
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0233DC3C: .word ov07_02341B64
#if defined(EUROPE)
_0233DC40: .word 0x00003718
#elif defined(JAPAN)
_0233DC40: .word 0x00003398
#else
_0233DC40: .word 0x00003716
#endif
_0233DC44: .word ov07_02341ACC
	arm_func_end ov07_0233DB50

	arm_func_start ov07_0233DC48
ov07_0233DC48: ; 0x0233DC48
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x54
	mov r6, r1
	mov r7, r0
	mov r0, r6
	bl ov00_022BD108
	mov r4, r0
	add r0, sp, #4
	mov r5, r1
	bl InitPreprocessorArgs
	mov r0, r6
	bl ov00_022BD2C0
	cmp r0, #0
	beq _0233DCB0
	mov r0, r6
	bl ov00_022BD284
	cmp r0, #0
	beq _0233DCA0
	ldr r1, _0233DD44 ; =0x00003719
	mov r0, r7
	bl GetStringFromFileVeneer
	b _0233DD3C
_0233DCA0:
	ldr r1, _0233DD48 ; =0x00003718
	mov r0, r7
	bl GetStringFromFileVeneer
	b _0233DD3C
_0233DCB0:
	mov r3, #0
	cmp r5, #0
	cmpeq r4, #0
	streqb r3, [r7]
	beq _0233DD3C
	ldr r2, _0233DD4C ; =0x00002710
	mov r0, r4
	mov r1, r5
	bl _ull_mod
	str r0, [sp, #0x30]
	ldr r2, _0233DD4C ; =0x00002710
	mov r0, r4
	mov r1, r5
	mov r3, #0
	bl _ll_udiv
	ldr r2, _0233DD4C ; =0x00002710
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x2c]
	ldr r2, _0233DD50 ; =0x05F5E100
	mov r0, r4
	mov r1, r5
	mov r3, #0
	bl _ll_udiv
	ldr r2, _0233DD4C ; =0x00002710
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x28]
	add r2, sp, #4
	str r2, [sp]
	ldr r2, _0233DD54 ; =0x00003717
	mov r0, r7
	mov r1, #0x100
	mov r3, #0
	bl PreprocessStringFromId
_0233DD3C:
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV07_0233DC48_OFFSET 2
#elif defined(JAPAN)
#define OV07_0233DC48_OFFSET -0x37E
#else
#define OV07_0233DC48_OFFSET 0
#endif
_0233DD44: .word 0x00003719 + OV07_0233DC48_OFFSET
_0233DD48: .word 0x00003718 + OV07_0233DC48_OFFSET
_0233DD4C: .word 0x00002710
_0233DD50: .word 0x05F5E100
_0233DD54: .word 0x00003717 + OV07_0233DC48_OFFSET
	arm_func_end ov07_0233DC48

	arm_func_start ov07_0233DD58
ov07_0233DD58: ; 0x0233DD58
#ifdef JAPAN
#define OV07_0233DD58_OFFSET_1 -0x18
#define OV07_0233DD58_OFFSET_2 -0x14
#else
#define OV07_0233DD58_OFFSET_1 0
#define OV07_0233DD58_OFFSET_2 0
#endif
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x58 + OV07_0233DD58_OFFSET_1
	mov r1, #8
	bl MemAlloc
	ldr r2, _0233DE58 ; =ov07_02341B68
	mov r1, #0x58 + OV07_0233DD58_OFFSET_1
	str r0, [r2]
	bl MemZero
	ldr r0, _0233DE58 ; =ov07_02341B68
	mov lr, #0
	ldr r1, [r0]
	ldr r3, _0233DE5C ; =0xD4A51000
	str lr, [r1]
	ldr r1, [r0]
	mov r2, #0xe8
	str r4, [r1, #4]
	ldr ip, [r0]
	mov r1, #1
	str r3, [ip, #0x34 + OV07_0233DD58_OFFSET_2]
	str r2, [ip, #0x38 + OV07_0233DD58_OFFSET_2]
	strb lr, [ip, #0x54 + OV07_0233DD58_OFFSET_1]
	ldr r0, [r0]
	cmp r4, #0
	strb r1, [r0, #0x55 + OV07_0233DD58_OFFSET_1]
	ldmltia sp!, {r4, pc}
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov00_022BD108
	cmp r1, #0
	cmpeq r0, #0
	mov r2, #0
	beq _0233DE10
	ldr r3, _0233DE58 ; =ov07_02341B68
	mov r2, r4, lsl #0x10
	ldr r3, [r3]
	str r0, [r3, #0x34 + OV07_0233DD58_OFFSET_2]
	mov r0, r2, lsr #0x10
	str r1, [r3, #0x38 + OV07_0233DD58_OFFSET_2]
	bl ov00_022BD2C0
	cmp r0, #0
	ldrne r0, _0233DE58 ; =ov07_02341B68
	movne r1, #0
	ldrne r0, [r0]
	strneb r1, [r0, #0x55 + OV07_0233DD58_OFFSET_1]
	b _0233DE1C
_0233DE10:
	ldr r0, _0233DE58 ; =ov07_02341B68
	ldr r0, [r0]
	strb r2, [r0, #0x55 + OV07_0233DD58_OFFSET_1]
_0233DE1C:
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov00_022BD0D4
	ldr r2, _0233DE58 ; =ov07_02341B68
	mov r1, r0
	ldr r0, [r2]
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	add r0, r0, #8
	bl MemcpySimple
	ldr r0, _0233DE58 ; =ov07_02341B68
	ldr r1, [r0]
#ifdef JAPAN
	add r0, r1, #0x12
#else
	add r0, r1, #0x1c
#endif
	add r1, r1, #8
	bl StrcpySimple
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233DE58: .word ov07_02341B68
_0233DE5C: .word 0xD4A51000
	arm_func_end ov07_0233DD58

	arm_func_start ov07_0233DE60
ov07_0233DE60: ; 0x0233DE60
#ifdef JAPAN
#define OV07_0233DE60_OFFSET_1 -0x18
#define OV07_0233DE60_OFFSET_2 -0x14
#define OV07_0233DE60_OFFSET_3 -5
#define OV07_0233DE60_OFFSET_4 -0xA
#else
#define OV07_0233DE60_OFFSET_1 0
#define OV07_0233DE60_OFFSET_2 0
#define OV07_0233DE60_OFFSET_3 0
#define OV07_0233DE60_OFFSET_4 0
#endif
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x254
	ldr r0, _0233E4A8 ; =ov07_02341B68
	ldr r3, _0233E4AC ; =0x00002004
	ldr r4, [r0]
	ldr r0, [r4]
	cmp r0, r3
	bgt _0233DEFC
	bge _0233E294
	cmp r0, #0x2000
	bgt _0233DECC
	bge _0233E1C0
	cmp r0, #0
	bgt _0233DEA0
	beq _0233DF84
	b _0233E49C
_0233DEA0:
	sub r1, r0, #0x1000
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	b _0233E49C
_0233DEB0: ; jump table
	b _0233DFE4 ; case 0
	b _0233E49C ; case 1
	b _0233E000 ; case 2
	b _0233E03C ; case 3
	b _0233E124 ; case 4
	b _0233E15C ; case 5
	b _0233E1A4 ; case 6
_0233DECC:
	ldr r1, _0233E4B0 ; =0x00002002
	cmp r0, r1
	bgt _0233DEEC
	bge _0233E220
	sub r1, r1, #1
	cmp r0, r1
	beq _0233E1E0
	b _0233E49C
_0233DEEC:
	add r1, r1, #1
	cmp r0, r1
	beq _0233E26C
	b _0233E49C
_0233DEFC:
	ldr r2, _0233E4B4 ; =0x00003002
	cmp r0, r2
	bgt _0233DF54
	bge _0233E40C
	cmp r0, #0x3000
	bgt _0233DF44
	bge _0233E3C4
	add r1, r3, #2
	cmp r0, r1
	bgt _0233E49C
	add r1, r3, #1
	cmp r0, r1
	blt _0233E49C
	beq _0233E2C8
	add r1, r3, #2
	cmp r0, r1
	beq _0233E39C
	b _0233E49C
_0233DF44:
	sub r1, r2, #1
	cmp r0, r1
	beq _0233E3E0
	b _0233E49C
_0233DF54:
	ldr r1, _0233E4B8 ; =0x0000F001
	cmp r0, r1
	bgt _0233DF74
	bge _0233E478
	add r1, r2, #1
	cmp r0, r1
	beq _0233E464
	b _0233E49C
_0233DF74:
	add r1, r1, #1
	cmp r0, r1
	beq _0233E48C
	b _0233E49C
_0233DF84:
	ldr r0, [r4, #4]
	cmp r0, #0
	bge _0233DFC4
	bl ov00_022BD398
	cmp r0, #0
	beq _0233DFAC
	bl sub_02046D20
	mov r0, #0x1000
	str r0, [r4]
	b _0233E49C
_0233DFAC:
	ldr r1, _0233E4BC ; =0x00003704
	mov r0, #0x1c
	bl ov07_0233F6AC
	ldr r0, _0233E4C0 ; =0x0000F002
	str r0, [r4]
	b _0233E49C
_0233DFC4:
	bl sub_02046D20
	ldrb r0, [r4, #0x55 + OV07_0233DE60_OFFSET_1]
	cmp r0, #0
	movne r0, #0x1000
	strne r0, [r4]
	moveq r0, #0x2000
	streq r0, [r4]
	b _0233E49C
_0233DFE4:
	ldr r1, [r4, #0x34 + OV07_0233DE60_OFFSET_2]
	ldr r2, [r4, #0x38 + OV07_0233DE60_OFFSET_2]
	mov r0, #0
	bl ov01_0233580C
	ldr r0, _0233E4C4 ; =0x00001002
	str r0, [r4]
	b _0233E49C
_0233E000:
	bl ov01_02336014
	cmp r0, #2
	bne _0233E028
	bl ov01_023370AC
	str r0, [r4, #0x34 + OV07_0233DE60_OFFSET_2]
	str r1, [r4, #0x38 + OV07_0233DE60_OFFSET_2]
	bl ov01_02335FA8
	ldr r0, _0233E4C8 ; =0x00001003
	str r0, [r4]
	b _0233E49C
_0233E028:
	cmp r0, #1
	bne _0233E49C
	bl ov01_02335FA8
	mov r0, #1
	b _0233E4A0
_0233E03C:
	ldr r1, [r4, #0x34 + OV07_0233DE60_OFFSET_2]
	ldr r2, [r4, #0x38 + OV07_0233DE60_OFFSET_2]
	add r0, r4, #0x48 + OV07_0233DE60_OFFSET_1
	bl ov00_022BD43C
	cmp r0, #0
	bne _0233E06C
	ldr r1, _0233E4CC ; =0x00003705
	mov r0, #0x1c
	bl ov07_0233F6AC
	ldr r0, _0233E4D0 ; =0x00001004
	str r0, [r4]
	b _0233E49C
_0233E06C:
	mov r1, #0
	mov r2, r1
	add r0, r4, #0x48 + OV07_0233DE60_OFFSET_1
	bl ov00_022BCDBC
	cmp r0, #2
	bne _0233E0D0
	add r0, r4, #0x48 + OV07_0233DE60_OFFSET_1
	bl ov00_022BD02C
	ldr r1, [r4, #4]
	cmp r1, #0
	blt _0233E0B8
	cmp r0, r1
	bne _0233E0B8
	ldr r1, _0233E4D4 ; =0x00003708
	mov r0, #0x1c
	bl ov07_0233F6AC
	ldr r0, _0233E4D8 ; =0x00001006
	str r0, [r4]
	b _0233E49C
_0233E0B8:
	ldr r1, _0233E4DC ; =0x00003706
	mov r0, #0x1c
	bl ov07_0233F6AC
	ldr r0, _0233E4D0 ; =0x00001004
	str r0, [r4]
	b _0233E49C
_0233E0D0:
	cmp r0, #1
	bne _0233E0F0
	ldr r1, _0233E4E0 ; =0x00003707
	mov r0, #0x1c
	bl ov07_0233F6AC
	ldr r0, _0233E4D0 ; =0x00001004
	str r0, [r4]
	b _0233E49C
_0233E0F0:
	cmp r0, #4
	mov r0, #0x1c
	bne _0233E110
	ldr r1, _0233E4CC ; =0x00003705
	bl ov07_0233F6AC
	ldr r0, _0233E4D0 ; =0x00001004
	str r0, [r4]
	b _0233E49C
_0233E110:
	ldr r1, _0233E4D4 ; =0x00003708
	bl ov07_0233F6AC
	ldr r0, _0233E4D8 ; =0x00001006
	str r0, [r4]
	b _0233E49C
_0233E124:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _0233E49C
	mov r0, #4
	bl ov01_02337928
	str r0, [sp]
	mov r0, #0
	ldr r2, _0233E4E4 ; =ov07_023418BC
	ldr r3, _0233E4E8 ; =0x00003709
	mov r1, r0
	bl ov07_0233F638
	ldr r0, _0233E4EC ; =0x00001005
	str r0, [r4]
	b _0233E49C
_0233E15C:
	bl ov07_0233F678
	mov r5, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #4
	bl ov01_02337938
	cmp r5, #1
	bne _0233E190
	bl sub_02046D20
	mov r0, #0x1000
	str r0, [r4]
	b _0233E49C
_0233E190:
	cmp r5, #2
	cmpne r5, #0x15
	bne _0233E49C
	mov r0, #1
	b _0233E4A0
_0233E1A4:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _0233E49C
	bl sub_02046D20
	mov r0, #0x2000
	str r0, [r4]
	b _0233E49C
_0233E1C0:
	add r1, r4, #8
	add r3, r4, #0x1c + OV07_0233DE60_OFFSET_4
	mov r0, #1
	mov r2, #0
	bl ShowKeyboard
	ldr r0, _0233E4F0 ; =0x00002001
	str r0, [r4]
	b _0233E49C
_0233E1E0:
	bl GetKeyboardStatus
	str r0, [r4, #0x30 + OV07_0233DE60_OFFSET_2]
	cmp r0, #3
	bne _0233E210
	bl GetKeyboardStringResult
	mov r1, r0
	add r0, r4, #8
	mov r2, #0x14 + OV07_0233DE60_OFFSET_4
	bl MemcpySimple
	ldr r0, _0233E4B0 ; =0x00002002
	str r0, [r4]
	b _0233E49C
_0233E210:
	cmp r0, #2
	ldreq r0, _0233E4B0 ; =0x00002002
	streq r0, [r4]
	b _0233E49C
_0233E220:
	bl sub_02037468
	cmp r0, #0
	beq _0233E49C
	ldr r0, [r4, #0x30 + OV07_0233DE60_OFFSET_2]
	cmp r0, #3
	ldreq r0, _0233E4F4 ; =0x00002003
	streq r0, [r4]
	beq _0233E49C
	cmp r0, #2
	bne _0233E49C
	ldrb r0, [r4, #0x55 + OV07_0233DE60_OFFSET_1]
	cmp r0, #0
	beq _0233E264
	bl sub_02046D20
	mov r0, #0x1000
	str r0, [r4]
	b _0233E49C
_0233E264:
	mov r0, #1
	b _0233E4A0
_0233E26C:
	add r0, sp, #0x154
	add r1, r4, #8
	mov r2, #0xa + OV07_0233DE60_OFFSET_3
	bl StrncpySimpleNoPadSafe
	add r0, sp, #0x154
	bl sub_0203909C
	bl sub_02039304
	ldr r0, _0233E4AC ; =0x00002004
	str r0, [r4]
	b _0233E49C
_0233E294:
	bl sub_0203931C
	cmp r0, #0
	ldreq r1, _0233E4F8 ; =0x00002005
	moveq r0, #0
	streq r1, [r4]
	streqb r0, [r4, #0x56 + OV07_0233DE60_OFFSET_1]
	beq _0233E49C
	cmp r0, #1
	ldreq r1, _0233E4F8 ; =0x00002005
	moveq r0, #1
	streq r1, [r4]
	streqb r0, [r4, #0x56 + OV07_0233DE60_OFFSET_1]
	b _0233E49C
_0233E2C8:
	bl sub_02039218
	cmp r0, #0
	beq _0233E49C
	ldrb r0, [r4, #0x56 + OV07_0233DE60_OFFSET_1]
	cmp r0, #0
	beq _0233E2F0
	bl sub_02046D20
	mov r0, #0x2000
	str r0, [r4]
	b _0233E49C
_0233E2F0:
	add r0, r4, #0x3c + OV07_0233DE60_OFFSET_2
	add r1, r4, #8
	mov r2, #0xa + OV07_0233DE60_OFFSET_3
	bl MemcpySimple
	ldr r1, [r4, #4]
	cmp r1, #0
	blt _0233E33C
	ldrb r0, [r4, #0x55 + OV07_0233DE60_OFFSET_1]
	cmp r0, #0
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	beq _0233E330
	add r1, r4, #0x48 + OV07_0233DE60_OFFSET_1
	add r2, r4, #0x3c + OV07_0233DE60_OFFSET_2
	bl ov00_022BCF6C
	b _0233E34C
_0233E330:
	add r1, r4, #0x3c + OV07_0233DE60_OFFSET_2
	bl ov00_022BCFD0
	b _0233E34C
_0233E33C:
	add r0, r4, #0x48 + OV07_0233DE60_OFFSET_1
	add r1, r4, #0x3c + OV07_0233DE60_OFFSET_2
	mov r2, #1
	bl ov00_022BCDBC
_0233E34C:
	mov r1, #1
	add r0, sp, #0x104
	strb r1, [r4, #0x54 + OV07_0233DE60_OFFSET_1]
	bl InitPreprocessorArgs
	add r0, sp, #4
	mov r1, #0x16 + OV07_0233DE60_OFFSET_4
	bl MemZero
	add r0, sp, #4
	add r1, r4, #8
	mov r2, #0xa + OV07_0233DE60_OFFSET_3
	bl StrncpySimpleNoPadSafe
	add r3, sp, #4
	ldr r1, _0233E4FC ; =0x0000370C
	add r2, sp, #0x104
	mov r0, #0x1c
	str r3, [sp, #0x13c]
	bl ov07_02046BE8
	ldr r0, _0233E500 ; =0x00002006
	str r0, [r4]
	b _0233E49C
_0233E39C:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _0233E49C
	ldr r0, [r4, #4]
	cmp r0, #0
	movge r0, #1
	bge _0233E4A0
	mov r0, #0x3000
	str r0, [r4]
	b _0233E49C
_0233E3C4:
	bl ov00_022BD780
	ldr r1, _0233E504 ; =0x0000023B
	mov r0, #0
	bl ov07_0233F6AC
	ldr r0, _0233E508 ; =0x00003001
	str r0, [r4]
	b _0233E49C
_0233E3E0:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _0233E49C
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	ldr r0, _0233E4B4 ; =0x00003002
	str r0, [r4]
	bl sub_02003B94
	b _0233E49C
_0233E40C:
	mov r0, #3
	bl NoteSaveBase
	mov r5, r0
	bl sub_02003BC8
	bl sub_02029FBC
	cmp r5, #0
	bne _0233E440
#ifdef JAPAN
	ldr r1, _0233FD90 ; =0x000004CD
	mov r0, #0x1c
#else
	mov r0, #0x1c
	mov r1, #0x23c
#endif
	bl ov07_0233F6AC
	ldr r0, _0233E50C ; =0x00003003
	str r0, [r4]
	b _0233E49C
_0233E440:
	cmp r5, #1
	moveq r0, #3
	beq _0233E4A0
	ldr r1, _0233E510 ; =0x00000239
	mov r0, #0x1c
	bl ov07_0233F6AC
	ldr r0, _0233E50C ; =0x00003003
	str r0, [r4]
	b _0233E49C
_0233E464:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _0233E49C
	mov r0, #1
	b _0233E4A0
_0233E478:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _0233E49C
	mov r0, #1
	b _0233E4A0
_0233E48C:
	bl ov07_0233F6C8
	cmp r0, #0x15
	moveq r0, #2
	beq _0233E4A0
_0233E49C:
	mov r0, #0
_0233E4A0:
	add sp, sp, #0x254
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV07_0233DE60_DATA_OFFSET 2
#elif defined(JAPAN)
#define OV07_0233DE60_DATA_OFFSET -0x37E
#else
#define OV07_0233DE60_DATA_OFFSET 0
#endif
_0233E4A8: .word ov07_02341B68
_0233E4AC: .word 0x00002004
_0233E4B0: .word 0x00002002
_0233E4B4: .word 0x00003002
_0233E4B8: .word 0x0000F001
_0233E4BC: .word 0x00003704 + OV07_0233DE60_DATA_OFFSET
_0233E4C0: .word 0x0000F002
_0233E4C4: .word 0x00001002
_0233E4C8: .word 0x00001003
_0233E4CC: .word 0x00003705 + OV07_0233DE60_DATA_OFFSET
_0233E4D0: .word 0x00001004
_0233E4D4: .word 0x00003708 + OV07_0233DE60_DATA_OFFSET
_0233E4D8: .word 0x00001006
_0233E4DC: .word 0x00003706 + OV07_0233DE60_DATA_OFFSET
_0233E4E0: .word 0x00003707 + OV07_0233DE60_DATA_OFFSET
_0233E4E4: .word ov07_023418BC
_0233E4E8: .word 0x00003709 + OV07_0233DE60_DATA_OFFSET
_0233E4EC: .word 0x00001005
_0233E4F0: .word 0x00002001
_0233E4F4: .word 0x00002003
_0233E4F8: .word 0x00002005
_0233E4FC: .word 0x0000370C + OV07_0233DE60_DATA_OFFSET
_0233E500: .word 0x00002006
#ifdef JAPAN
_0233E504: .word 0x000004CC
_0233E508: .word 0x00003001
_0233FD90: .word 0x000004CD
_0233E50C: .word 0x00003003
_0233E510: .word 0x000004CA
#else
_0233E504: .word 0x0000023B
_0233E508: .word 0x00003001
_0233E50C: .word 0x00003003
_0233E510: .word 0x00000239
#endif
	arm_func_end ov07_0233DE60

	arm_func_start ov07_0233E514
ov07_0233E514: ; 0x0233E514
	stmdb sp!, {r3, lr}
	ldr r0, _0233E53C ; =ov07_02341B68
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0233E53C ; =ov07_02341B68
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233E53C: .word ov07_02341B68
	arm_func_end ov07_0233E514

	arm_func_start ov07_0233E540
ov07_0233E540: ; 0x0233E540
	ldr r0, _0233E550 ; =ov07_02341B68
	ldr r0, [r0]
#ifdef JAPAN
	ldrb r0, [r0, #0x3c]
#else
	ldrb r0, [r0, #0x54]
#endif
	bx lr
	.align 2, 0
_0233E550: .word ov07_02341B68
	arm_func_end ov07_0233E540

	arm_func_start ov07_0233E554
ov07_0233E554: ; 0x0233E554
	stmdb sp!, {r3, lr}
	mov r0, #4
	mov r1, #8
	bl MemAlloc
	ldr r2, _0233E588 ; =ov07_02341B6C
	mov r1, #4
	str r0, [r2]
	bl MemZero
	ldr r0, _0233E588 ; =ov07_02341B6C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233E588: .word ov07_02341B6C
	arm_func_end ov07_0233E554

	arm_func_start ov07_0233E58C
ov07_0233E58C: ; 0x0233E58C
	stmdb sp!, {r3, lr}
	ldr r0, _0233E5C4 ; =ov07_02341B6C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	bl ov00_022BCBAC
	ldr r0, _0233E5C4 ; =ov07_02341B6C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0233E5C4 ; =ov07_02341B6C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233E5C4: .word ov07_02341B6C
	arm_func_end ov07_0233E58C

	arm_func_start ov07_0233E5C8
ov07_0233E5C8: ; 0x0233E5C8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xa4
	ldr r0, _0233E9A8 ; =ov07_02341B6C
	ldr r4, [r0]
	ldr r0, [r4]
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _0233E99C
_0233E5E8: ; jump table
	b _0233E61C ; case 0
	b _0233E644 ; case 1
	b _0233E658 ; case 2
	b _0233E750 ; case 3
	b _0233E764 ; case 4
	b _0233E7A4 ; case 5
	b _0233E7B4 ; case 6
	b _0233E874 ; case 7
	b _0233E8BC ; case 8
	b _0233E904 ; case 9
	b _0233E944 ; case 10
	b _0233E954 ; case 11
	b _0233E984 ; case 12
_0233E61C:
	bl sub_0204A1CC
	bl ov00_022BCA80
	cmp r0, #3
	movne r0, #2
	strne r0, [r4]
	bne _0233E99C
	bl ov01_02339888
	mov r0, #1
	str r0, [r4]
	b _0233E99C
_0233E644:
	bl ov01_023398A4
	cmp r0, #0
	movne r0, #2
	strne r0, [r4]
	b _0233E99C
_0233E658:
	bl ov00_022BCCAC
	cmp r0, #0
	bne _0233E690
	mov r0, #3
	bl ov01_02337928
	str r0, [sp]
	mov r0, #0
	ldr r2, _0233E9AC ; =ov07_0234191C
	ldr r3, _0233E9B0 ; =0x0000370D
	mov r1, r0
	bl ov07_0233F638
	mov r0, #4
	str r0, [r4]
	b _0233E99C
_0233E690:
	bl ov00_022BCCF4
	cmp r0, #0
	bne _0233E6C8
	mov r0, #3
	bl ov01_02337928
	str r0, [sp]
#ifdef JAPAN
	mov r0, #0
	ldr r2, _0233E9B4 ; =ov07_0234197C
	ldr r3, _0233E9B8 ; =0x00003710
	mov r1, r0
#else
	ldr r2, _0233E9B4 ; =ov07_0234197C
	ldr r3, _0233E9B8 ; =0x00003710
	mov r0, #0
	mov r1, #8
#endif
	bl ov07_0233F638
	mov r0, #4
	str r0, [r4]
	b _0233E99C
_0233E6C8:
	add r0, sp, #0x54
	bl InitPreprocessorArgs
	bl ov00_022BCDA4
	ldr r2, _0233E9BC ; =0x00002710
	mov r3, #0
	mov r5, r0
	mov r6, r1
	bl _ull_mod
	str r0, [sp, #0x80]
	ldr r2, _0233E9BC ; =0x00002710
	mov r0, r5
	mov r1, r6
	mov r3, #0
	bl _ll_udiv
	ldr r2, _0233E9BC ; =0x00002710
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x7c]
	ldr r2, _0233E9C0 ; =0x05F5E100
	mov r1, r6
	mov r0, r5
	mov r3, #0
	bl _ll_udiv
	ldr r2, _0233E9BC ; =0x00002710
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x78]
	ldr r1, _0233E9C4 ; =0x00003713
	mov r0, #0x1c
	add r2, sp, #0x54
	bl ov07_02046BE8
	mov r0, #3
	str r0, [r4]
	b _0233E99C
_0233E750:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _0233E99C
	mov r0, #2
	b _0233E9A0
_0233E764:
	bl ov07_0233F678
	mov r5, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #3
	bl ov01_02337938
	cmp r5, #1
	moveq r0, #5
	streq r0, [r4]
	beq _0233E99C
	cmp r5, #2
	cmpne r5, #0x15
	bne _0233E99C
	mov r0, #2
	b _0233E9A0
_0233E7A4:
	bl ov01_02338A24
	mov r0, #6
	str r0, [r4]
	b _0233E99C
_0233E7B4:
	bl ov01_02338EC4
	cmp r0, #1
	beq _0233E7D4
	cmp r0, #4
	beq _0233E7E0
	cmp r0, #8
	beq _0233E868
	b _0233E99C
_0233E7D4:
	bl ov01_02338B08
	mov r0, #2
	b _0233E9A0
_0233E7E0:
	add r0, sp, #4
	bl InitPreprocessorArgs
	bl ov00_022BCDA4
	ldr r2, _0233E9BC ; =0x00002710
	mov r3, #0
	mov r5, r0
	mov r6, r1
	bl _ull_mod
	str r0, [sp, #0x30]
	ldr r2, _0233E9BC ; =0x00002710
	mov r0, r5
	mov r1, r6
	mov r3, #0
	bl _ll_udiv
	ldr r2, _0233E9BC ; =0x00002710
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x2c]
	ldr r2, _0233E9C0 ; =0x05F5E100
	mov r1, r6
	mov r0, r5
	mov r3, #0
	bl _ll_udiv
	ldr r2, _0233E9BC ; =0x00002710
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x28]
	ldr r1, _0233E9C4 ; =0x00003713
	mov r0, #0x1c
	add r2, sp, #4
	bl ov07_02046BE8
	mov r0, #7
	str r0, [r4]
	b _0233E99C
_0233E868:
	bl ov01_02338B08
	mov r0, #2
	b _0233E9A0
_0233E874:
	bl ov01_02338EC4
	mov r5, r0
	bl ov07_0233F6C8
	cmp r5, #5
	bne _0233E89C
	bl sub_02046D20
	bl ov01_02338C34
	mov r0, #0xc
	str r0, [r4]
	b _0233E99C
_0233E89C:
	cmp r0, #0x15
	bne _0233E99C
	mov r0, #1
	mov r1, #0
	bl ov01_02338C28
	mov r0, #9
	str r0, [r4]
	b _0233E99C
_0233E8BC:
	bl ov01_02338EC4
	mov r5, r0
	bl ov07_0233F6C8
	cmp r5, #5
	bne _0233E8E4
	bl sub_02046D20
	bl ov01_02338C34
	mov r0, #0xc
	str r0, [r4]
	b _0233E99C
_0233E8E4:
	cmp r0, #0x15
	bne _0233E99C
	mov r0, #1
	mov r1, #0
	bl ov01_02338C28
	mov r0, #9
	str r0, [r4]
	b _0233E99C
_0233E904:
	bl ov01_02338EC4
	cmp r0, #6
	bne _0233E930
	bl ov01_02338B08
	bl ov00_022BD274
	cmp r0, #0
	movne r0, #0xa
	strne r0, [r4]
	bne _0233E99C
	mov r0, #2
	b _0233E9A0
_0233E930:
	cmp r0, #8
	bne _0233E99C
	bl ov01_02338B08
	mov r0, #2
	b _0233E9A0
_0233E944:
	bl ov01_0233769C
	mov r0, #0xb
	str r0, [r4]
	b _0233E99C
_0233E954:
	bl ov01_02337718
	cmp r0, #1
	cmpne r0, #3
	bne _0233E970
	bl ov01_023376DC
	mov r0, #2
	b _0233E9A0
_0233E970:
	cmp r0, #2
	bne _0233E99C
	bl ov01_023376DC
	mov r0, #2
	b _0233E9A0
_0233E984:
	bl ov01_02338EC4
	cmp r0, #0
	beq _0233E99C
	bl ov01_02338B08
	mov r0, #2
	b _0233E9A0
_0233E99C:
	mov r0, #0
_0233E9A0:
	add sp, sp, #0xa4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV07_0233E5C8_OFFSET 2
#elif defined(JAPAN)
#define OV07_0233E5C8_OFFSET -0x37E
#else
#define OV07_0233E5C8_OFFSET 0
#endif
_0233E9A8: .word ov07_02341B6C
_0233E9AC: .word ov07_0234191C
_0233E9B0: .word 0x0000370D + OV07_0233E5C8_OFFSET
_0233E9B4: .word ov07_0234197C
_0233E9B8: .word 0x00003710 + OV07_0233E5C8_OFFSET
_0233E9BC: .word 0x00002710
_0233E9C0: .word 0x05F5E100
_0233E9C4: .word 0x00003713 + OV07_0233E5C8_OFFSET
	arm_func_end ov07_0233E5C8

	arm_func_start ov07_0233E9C8
ov07_0233E9C8: ; 0x0233E9C8
	stmdb sp!, {r3, lr}
	mov r0, #0xd8
	mov r1, #8
	bl MemAlloc
	ldr r2, _0233EA20 ; =ov07_02341B70
	mov r1, #0xd8
	str r0, [r2]
	bl MemZero
	ldr r0, _0233EA20 ; =ov07_02341B70
	mov r3, #0
	ldr r1, [r0]
	mov r2, #1
	str r3, [r1]
	ldr r1, [r0]
	strb r2, [r1, #0xd4]
	ldr r1, [r0]
	str r3, [r1, #4]
	ldr r1, [r0]
	add r0, r1, #0xb3
	bic r0, r0, #0x1f
	str r0, [r1, #0x90]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233EA20: .word ov07_02341B70
	arm_func_end ov07_0233E9C8

	arm_func_start ov07_0233EA24
ov07_0233EA24: ; 0x0233EA24
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #4
	mov r1, #0xc
	bl ov01_02337B3C
	ldrb r1, [r4, #3]
	cmp r0, r1
	movne r0, #3
	ldmneia sp!,  {r4, pc}
	ldrb r0, [r4]
	cmp r0, #0xc
	movne r0, #2
	moveq r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov07_0233EA24

	arm_func_start ov07_0233EA5C
ov07_0233EA5C: ; 0x0233EA5C
	ldr r0, _0233EA70 ; =ov07_02341B70
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x8e]
	bx lr
	.align 2, 0
_0233EA70: .word ov07_02341B70
	arm_func_end ov07_0233EA5C

	arm_func_start ov07_0233EA74
ov07_0233EA74: ; 0x0233EA74
	stmdb sp!, {r4, lr}
	ldrb r0, [r1]
	cmp r0, #1
	bne _0233EA94
	bl ov01_02337CAC
	ldr r0, _0233EAEC ; =ov07_02341B70
	mov r3, #1
	b _0233EAD4
_0233EA94:
	ldr r0, _0233EAEC ; =ov07_02341B70
	mov r1, #0x10
	ldr r4, [r0]
	add r0, r4, #0x1c
	bl MemZero
	mov r0, #0xc
	strb r0, [r4, #0x1c]
	bl GetLanguageType
	strb r0, [r4, #0x1e]
	add r0, r4, #0x20
	mov r1, #0xc
	bl ov01_02337B3C
	strb r0, [r4, #0x1f]
	bl ov01_02337CAC
	ldr r0, _0233EAEC ; =ov07_02341B70
	mov r3, #0
_0233EAD4:
	ldr r2, [r0]
	ldr r1, _0233EAF0 ; =0x00001002
	strb r3, [r2, #0x8d]
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233EAEC: .word ov07_02341B70
_0233EAF0: .word 0x00001002
	arm_func_end ov07_0233EA74

	arm_func_start ov07_0233EAF4
ov07_0233EAF4: ; 0x0233EAF4
#if defined(EUROPE)
#define OV07_0233EAF4_OFFSET 2
#elif defined(JAPAN)
#define OV07_0233EAF4_OFFSET -0x37E
#else
#define OV07_0233EAF4_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x2d4
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr r2, _0233F594 ; =0x0000E001
	ldr r4, [r0]
	ldr r0, [r4]
	cmp r0, r2
	bgt _0233EB7C
	bge _0233F468
	cmp r0, #0x1000
	bgt _0233EB44
	bge _0233ECB0
	cmp r0, #1
	bgt _0233F57C
	cmp r0, #0
	blt _0233F57C
	beq _0233EBE8
	cmp r0, #1
	beq _0233EC1C
	b _0233F57C
_0233EB44:
	ldr r1, _0233F598 ; =0x00001005
	cmp r0, r1
	bgt _0233EB70
	sub r1, r1, #3
	subs r1, r0, r1
	addpl pc, pc, r1, lsl #2
	b _0233F57C
_0233EB60: ; jump table
	b _0233EE48 ; case 0
	b _0233F0C8 ; case 1
	b _0233F1F4 ; case 2
	b _0233F34C ; case 3
_0233EB70:
	cmp r0, #0xe000
	beq _0233F3F0
	b _0233F57C
_0233EB7C:
	add r1, r2, #4
	cmp r0, r1
	bgt _0233EBCC
	add r1, r2, #3
	cmp r0, r1
	blt _0233EBA8
	beq _0233F4DC
	add r1, r2, #4
	cmp r0, r1
	beq _0233F544
	b _0233F57C
_0233EBA8:
	add r1, r2, #1
	cmp r0, r1
	bgt _0233EBBC
	beq _0233F484
	b _0233F57C
_0233EBBC:
	add r1, r2, #2
	cmp r0, r1
	beq _0233F4A8
	b _0233F57C
_0233EBCC:
	cmp r0, #0xf000
	bgt _0233EBDC
	beq _0233F560
	b _0233F57C
_0233EBDC:
	add r1, r2, #0x1000
	cmp r0, r1
	b _0233F57C
_0233EBE8:
	mov r0, #0x15
	bl ov01_02337928
	str r0, [sp]
	mov r0, #0
	ldr r2, _0233F59C ; =ov07_023419DC
	ldr r3, _0233F5A0 ; =0x000036E9
	mov r1, r0
	bl ov07_0233F638
	ldr r0, _0233F590 ; =ov07_02341B70
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233EC1C:
	bl ov07_0233F678
	mov r4, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0x15
	bl ov01_02337938
	cmp r4, #0xd
	bne _0233EC68
	ldr r0, _0233F590 ; =ov07_02341B70
	mov r3, #0x1000
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r0, [r0]
	strb r2, [r0, #0x8c]
	b _0233F584
_0233EC68:
	cmp r4, #0xe
	bne _0233EC98
	ldr r0, _0233F590 ; =ov07_02341B70
	mov r3, #0x1000
	ldr r1, [r0]
	mov r2, #1
	str r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r0, [r0]
	strb r2, [r0, #0x8c]
	b _0233F584
_0233EC98:
	cmp r4, #0x15
	ldreq r0, _0233F590 ; =ov07_02341B70
	ldreq r1, _0233F5A4 ; =0x0000F001
	ldreq r0, [r0]
	streq r1, [r0]
	b _0233F584
_0233ECB0:
	add r5, r4, #0x1c
	mov r0, r5
	add r6, r4, #0xc
	mov r1, #0x10
	add r7, r4, #0x44
	add r8, r4, #0x2c
	bl MemZero
	mov r0, r6
	mov r1, #0x10
	bl MemZero
	mov r0, r7
	mov r1, #0x18
	bl MemZero
	mov r0, r8
	mov r1, #0x18
	bl MemZero
	ldr r0, _0233F590 ; =ov07_02341B70
	mov sb, #0
	ldr r1, [r0]
	mov r2, #0xc
	ldr r3, [r1, #0x90]
	mov r1, #0x11
	strb sb, [r3]
	ldr r0, [r0]
	ldr r0, [r0, #0x90]
	strb sb, [r0, #1]
	strb r2, [r4, #0x1c]
	strb r1, [r4, #0x44]
	bl GetLanguageType
	strb r0, [r7, #2]
	ldrsb r1, [r7, #2]
	add r0, r7, #4
	strb r1, [r5, #2]
	bl GetMainTeamNameWithCheck
	add r0, r5, #4
	bl ov00_022BCD4C
	add r0, r7, #4
	mov r1, #0x14
	bl ov01_02337B3C
	strb r0, [r7, #3]
	add r0, r5, #4
	mov r1, #0xc
	bl ov01_02337B3C
	strb r0, [r5, #3]
	mov r2, #0x18
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr sb, _0233F5A8 ; =ov01_02337B68
	ldr r1, [r0]
	mov lr, #1
	str r2, [r1, #0x5c]
	ldr r1, [r0]
	mov ip, #0x10
	str r7, [r1, #0x60]
	ldr r1, [r0]
	ldr r4, _0233F5AC ; =ov07_0233EA24
	str r2, [r1, #0x64]
	ldr r2, [r0]
	mov r1, #0
	str r8, [r2, #0x68]
	ldr r3, [r0]
	mov r2, #2
	str sb, [r3, #0x6c]
	ldr r3, [r0]
	strb lr, [r3, #0x70]
	ldr r3, [r0]
	str ip, [r3, #0x74]
	ldr r3, [r0]
	str r5, [r3, #0x78]
	ldr r3, [r0]
	str ip, [r3, #0x7c]
	ldr r3, [r0]
	str r6, [r3, #0x80]
	ldr r3, [r0]
	str r4, [r3, #0x84]
	ldr r3, [r0]
	strb r1, [r3, #0x88]
	str r2, [sp, #0x90]
	ldr r4, [r0]
	add r0, sp, #0x90
	add r2, r4, #0x74
	add r3, r4, #0x5c
	str r2, [sp, #0x98]
	str r3, [sp, #0x94]
	ldr r3, [r4, #8]
	mov r2, #0x20
	str r3, [sp, #0xa0]
	ldrb r3, [r4, #0x8c]
	strb r3, [sp, #0xa4]
	ldr r3, [r4, #0x90]
	str r3, [sp, #0xa8]
	strh r2, [sp, #0xac]
	strb r1, [sp, #0xae]
	str r1, [sp, #0xb0]
	bl ov01_02337BA0
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr r3, _0233F5B0 ; =0x00001002
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2]
	ldr r0, [r0]
	strb r1, [r0, #0x8e]
	b _0233F584
_0233EE48:
	ldrb r0, [r4, #0x8c]
	cmp r0, #0
	mov r0, #1
	beq _0233EE64
	ldr r1, _0233F5B4 ; =ov07_0233EA5C
	bl ov01_0232B5D0
	b _0233EE6C
_0233EE64:
	ldr r1, _0233F5B8 ; =ov07_0233EA74
	bl ov01_0232B5D0
_0233EE6C:
	bl ov01_02337E0C
	mov r4, r0
	cmp r4, #0xf
	bne _0233EEF8
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr r1, [r0]
	ldrb r0, [r1, #0x8c]
	cmp r0, #0
	ldrne r0, _0233F5BC ; =0x00001003
	strne r0, [r1]
	bne _0233F584
	add r0, sp, #0x284
	bl InitPreprocessorArgs
	add r0, sp, #0x63
	mov r1, #0x2a
	bl MemZero
	ldr r1, _0233F590 ; =ov07_02341B70
	add r0, sp, #0x63
	ldr r1, [r1]
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	add r1, r1, #0x30
	bl StrncpySimpleNoPadSafe
	add r3, sp, #0x63
	ldr r1, _0233F5C0 ; =0x000036F7
	add r2, sp, #0x284
	mov r0, #0
	str r3, [sp, #0x2bc]
	bl ov07_02046BE8
	mov r0, #0
	bl ov01_02337D00
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr r1, _0233F598 ; =0x00001005
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233EEF8:
	cmp r4, #0
	beq _0233F584
	bl ov01_02337C54
	cmp r4, #0xe
	addls pc, pc, r4, lsl #2
	b _0233F584
_0233EF10: ; jump table
	b _0233F584 ; case 0
	b _0233F0B4 ; case 1
	b _0233F584 ; case 2
	b _0233F584 ; case 3
	b _0233EF4C ; case 4
	b _0233F0B4 ; case 5
	b _0233F0B4 ; case 6
	b _0233F0B4 ; case 7
	b _0233F0B4 ; case 8
	b _0233F0B4 ; case 9
	b _0233F0B4 ; case 10
	b _0233F0B4 ; case 11
	b _0233F0B4 ; case 12
	b _0233F0B4 ; case 13
	b _0233F0B4 ; case 14
_0233EF4C:
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr r1, [r0]
	ldrb r0, [r1, #0x8d]
	cmp r0, #0
	bne _0233EF98
	ldrb r0, [r1, #0x8c]
	cmp r0, #0
	mov r0, #0x1c
	beq _0233EF7C
#ifdef NORTH_AMERICA
	mov r1, #0x3700
#else
	ldr r1, _0233FC88 ; =0x00003702
#endif
	bl ov07_0233F6AC
	b _0233EF84
_0233EF7C:
	ldr r1, _0233F5C4 ; =0x000036FF
	bl ov07_0233F6AC
_0233EF84:
	ldr r0, _0233F590 ; =ov07_02341B70
	mov r1, #0xf000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233EF98:
	add r0, r1, #0x10
	add r1, r1, #0x30
	mov r2, #0
	bl ov00_022BCDBC
	cmp r0, #2
	bne _0233EFD0
	ldr r1, _0233F5C8 ; =0x00003701
	mov r0, #0x1c
	bl ov07_0233F6AC
	ldr r0, _0233F590 ; =ov07_02341B70
	mov r1, #0xf000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233EFD0:
	cmp r0, #3
	bne _0233EFF8
	ldr r1, _0233F5CC ; =0x00003702
	mov r0, #0x1c
	bl ov07_0233F6AC
	ldr r0, _0233F590 ; =ov07_02341B70
	mov r1, #0xf000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233EFF8:
	cmp r0, #0
	bne _0233F094
	add r0, sp, #0x234
	bl InitPreprocessorArgs
	add r0, sp, #0x39
	mov r1, #0x2a
	bl MemZero
	ldr r1, _0233F590 ; =ov07_02341B70
	add r0, sp, #0x39
	ldr r1, [r1]
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	add r1, r1, #0x30
	bl StrncpySimpleNoPadSafe
	add r1, sp, #0x39
	str r1, [sp, #0x26c]
	add r0, sp, #0x19c
	mov r1, #0x98
	bl MemZero
	mov r0, #0x14
	bl ov01_02337928
	ldr r2, _0233F5D0 ; =ov07_023419C8
	ldr r1, _0233F5D4 ; =ov07_023419C4
	ldr r2, [r2, r0, lsl #3]
	ldr r0, _0233F5D8 ; =0x000036FD
	str r2, [sp, #0x19c]
	str r1, [sp]
	str r0, [sp, #4]
	add r1, sp, #0x234
	mov r0, #0
	str r1, [sp, #8]
	mov r1, r0
	mov r2, #0x13
	add r3, sp, #0x19c
	bl ov07_0233F64C
	ldr r0, _0233F590 ; =ov07_02341B70
	mov r1, #0xe000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233F094:
	ldr r1, _0233F5DC ; =0x00003703
	mov r0, #0x1c
	bl ov07_0233F6AC
	ldr r0, _0233F590 ; =ov07_02341B70
	mov r1, #0xf000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233F0B4:
	ldr r0, _0233F590 ; =ov07_02341B70
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233F0C8:
	bl ov01_02337C90
	cmp r0, #0
	bne _0233F180
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr r0, [r0]
	ldrb r0, [r0, #0x8e]
	cmp r0, #0
	beq _0233F180
	add r0, sp, #0x14c
	bl InitPreprocessorArgs
	add r0, sp, #0xf
	mov r1, #0x2a
	bl MemZero
	ldr r1, _0233F590 ; =ov07_02341B70
	add r0, sp, #0xf
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x30
	bl StrncpySimpleNoPadSafe
	add r1, sp, #0xf
	str r1, [sp, #0x184]
	add r0, sp, #0xb4
	mov r1, #0x98
	bl MemZero
	mov r0, #0x13
	bl ov01_02337928
	ldr r2, _0233F5E0 ; =ov07_023418D8
	ldr r1, _0233F5E4 ; =ov07_023418D4
	ldr r2, [r2, r0, lsl #3]
	ldr r0, _0233F5E8 ; =0x000036F8
	str r2, [sp, #0xb4]
	str r1, [sp]
	str r0, [sp, #4]
	add r1, sp, #0x14c
	mov r0, #0
	str r1, [sp, #8]
	mov r1, r0
	mov r2, #0x31
	add r3, sp, #0xb4
	bl ov07_0233F64C
	mov r0, #0
	bl ov01_02337D00
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr r1, _0233F5EC ; =0x00001004
	ldr r0, [r0]
	str r1, [r0]
_0233F180:
	bl ov01_02337E0C
	movs r4, r0
	cmpne r4, #0xf
	beq _0233F584
	bl ov01_02337C54
	cmp r4, #0xf
	addls pc, pc, r4, lsl #2
	b _0233F584
_0233F1A0: ; jump table
	b _0233F584 ; case 0
	b _0233F1E0 ; case 1
	b _0233F584 ; case 2
	b _0233F584 ; case 3
	b _0233F584 ; case 4
	b _0233F1E0 ; case 5
	b _0233F1E0 ; case 6
	b _0233F1E0 ; case 7
	b _0233F1E0 ; case 8
	b _0233F1E0 ; case 9
	b _0233F1E0 ; case 10
	b _0233F1E0 ; case 11
	b _0233F1E0 ; case 12
	b _0233F1E0 ; case 13
	b _0233F1E0 ; case 14
	b _0233F584 ; case 15
_0233F1E0:
	ldr r0, _0233F590 ; =ov07_02341B70
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233F1F4:
	bl ov01_02337C90
	cmp r0, #0
	bne _0233F2D8
	bl ov07_0233F678
	mov r4, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0x13
	bl ov01_02337938
	cmp r4, #1
	bne _0233F25C
	ldr r1, _0233F590 ; =ov07_02341B70
	mov r0, #1
	ldr r3, [r1]
	strb r0, [sp, #0xe]
	add r2, sp, #0xe
	mov r1, r0
	strb r0, [r3, #0x8d]
	bl ov01_0232B540
	bl ov01_02337CAC
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr r1, _0233F5B0 ; =0x00001002
	ldr r0, [r0]
	str r1, [r0]
	b _0233F2D8
_0233F25C:
	cmp r4, #2
	cmpne r4, #0x15
	bne _0233F2D8
	ldr r0, _0233F590 ; =ov07_02341B70
	mov r2, #0
	ldr r4, [r0]
	mov r1, #0x10
	add r0, r4, #0x1c
	strb r2, [sp, #0xd]
	bl MemZero
	mov r0, #0xc
	strb r0, [r4, #0x1c]
	bl GetLanguageType
	strb r0, [r4, #0x1e]
	add r0, r4, #0x20
	mov r1, #0xc
	bl ov01_02337B3C
	strb r0, [r4, #0x1f]
	ldr r1, _0233F590 ; =ov07_02341B70
	mov r0, #1
	ldr r3, [r1]
	mov r4, #0
	add r2, sp, #0xd
	mov r1, r0
	strb r4, [r3, #0x8d]
	bl ov01_0232B540
	bl ov01_02337CAC
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr r1, _0233F5B0 ; =0x00001002
	ldr r0, [r0]
	str r1, [r0]
_0233F2D8:
	bl ov01_02337E0C
	movs r4, r0
	cmpne r4, #0xf
	beq _0233F584
	bl ov01_02337C54
	cmp r4, #0xf
	addls pc, pc, r4, lsl #2
	b _0233F584
_0233F2F8: ; jump table
	b _0233F584 ; case 0
	b _0233F338 ; case 1
	b _0233F584 ; case 2
	b _0233F584 ; case 3
	b _0233F584 ; case 4
	b _0233F338 ; case 5
	b _0233F338 ; case 6
	b _0233F338 ; case 7
	b _0233F338 ; case 8
	b _0233F338 ; case 9
	b _0233F338 ; case 10
	b _0233F338 ; case 11
	b _0233F338 ; case 12
	b _0233F338 ; case 13
	b _0233F338 ; case 14
	b _0233F584 ; case 15
_0233F338:
	ldr r0, _0233F590 ; =ov07_02341B70
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233F34C:
	bl ov01_02337C90
	cmp r0, #0
	bne _0233F380
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _0233F380
	mov r0, #1
	add r2, sp, #0xc
	mov r1, r0
	strb r0, [sp, #0xc]
	bl ov01_0232B540
	cmp r0, #0
	beq _0233F584
_0233F380:
	bl ov01_02337E0C
	movs r4, r0
	cmpne r4, #0xf
	beq _0233F584
	bl ov01_02337C54
	cmp r4, #0xe
	addls pc, pc, r4, lsl #2
	b _0233F584
_0233F3A0: ; jump table
	b _0233F584 ; case 0
	b _0233F3DC ; case 1
	b _0233F584 ; case 2
	b _0233F584 ; case 3
	b _0233F584 ; case 4
	b _0233F3DC ; case 5
	b _0233F3DC ; case 6
	b _0233F3DC ; case 7
	b _0233F3DC ; case 8
	b _0233F3DC ; case 9
	b _0233F3DC ; case 10
	b _0233F3DC ; case 11
	b _0233F3DC ; case 12
	b _0233F3DC ; case 13
	b _0233F3DC ; case 14
_0233F3DC:
	ldr r0, _0233F590 ; =ov07_02341B70
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233F3F0:
	bl ov07_0233F678
	mov r4, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0x14
	bl ov01_02337938
	cmp r4, #0xf
	bne _0233F44C
	ldr r0, _0233F590 ; =ov07_02341B70
	mov r2, #1
	ldr r1, [r0]
	add r0, r1, #0x10
	add r1, r1, #0x30
	bl ov00_022BCDBC
#ifdef NORTH_AMERICA
	ldr r1, _0233F5F0 ; =0x000036FE
	mov r0, #0x1c
#else
	mov r0, #0x1c
	mov r1, #0x36FE + OV07_0233EAF4_OFFSET
#endif
	bl ov07_0233F6AC
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr r1, _0233F594 ; =0x0000E001
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233F44C:
	cmp r4, #0x15
	cmpne r4, #0x10
	ldreq r0, _0233F590 ; =ov07_02341B70
	ldreq r1, _0233F5A4 ; =0x0000F001
	ldreq r0, [r0]
	streq r1, [r0]
	b _0233F584
_0233F468:
	bl ov07_0233F6C8
	cmp r0, #0x15
	ldreq r0, _0233F590 ; =ov07_02341B70
	ldreq r1, _0233F5F4 ; =0x0000E002
	ldreq r0, [r0]
	streq r1, [r0]
	b _0233F584
_0233F484:
	bl ov00_022BD780
	ldr r1, _0233F5F8 ; =0x0000023B
	mov r0, #0
	bl ov07_0233F6AC
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr r1, _0233F5FC ; =0x0000E003
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233F4A8:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _0233F584
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr r1, _0233F600 ; =0x0000E004
	ldr r0, [r0]
	str r1, [r0]
	bl sub_02003B94
	b _0233F584
_0233F4DC:
	mov r0, #3
	bl NoteSaveBase
	mov r4, r0
	bl sub_02003BC8
	bl sub_02029FBC
	cmp r4, #0
	bne _0233F518
#ifdef JAPAN
	ldr r1, _02340E8C ; =0x000004CD
	mov r0, #0x1c
#else
	mov r0, #0x1c
	mov r1, #0x23c
#endif
	bl ov07_0233F6AC
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr r1, _0233F604 ; =0x0000E005
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233F518:
	cmp r4, #1
	moveq r0, #2
	beq _0233F588
	ldr r1, _0233F608 ; =0x00000239
	mov r0, #0x1c
	bl ov07_0233F6AC
	ldr r0, _0233F590 ; =ov07_02341B70
	ldr r1, _0233F604 ; =0x0000E005
	ldr r0, [r0]
	str r1, [r0]
	b _0233F584
_0233F544:
	bl ov07_0233F6C8
	cmp r0, #0x15
	ldreq r0, _0233F590 ; =ov07_02341B70
	ldreq r1, _0233F5A4 ; =0x0000F001
	ldreq r0, [r0]
	streq r1, [r0]
	b _0233F584
_0233F560:
	bl ov07_0233F6C8
	cmp r0, #0x15
	ldreq r0, _0233F590 ; =ov07_02341B70
	moveq r1, #0
	ldreq r0, [r0]
	streq r1, [r0]
	b _0233F584
_0233F57C:
	mov r0, #1
	b _0233F588
_0233F584:
	mov r0, #0
_0233F588:
	add sp, sp, #0x2d4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0233F590: .word ov07_02341B70
_0233F594: .word 0x0000E001
_0233F598: .word 0x00001005
_0233F59C: .word ov07_023419DC
_0233F5A0: .word 0x000036E9 + OV07_0233EAF4_OFFSET
_0233F5A4: .word 0x0000F001
_0233F5A8: .word ov01_02337B68
_0233F5AC: .word ov07_0233EA24
_0233F5B0: .word 0x00001002
_0233F5B4: .word ov07_0233EA5C
_0233F5B8: .word ov07_0233EA74
_0233F5BC: .word 0x00001003
_0233F5C0: .word 0x000036F7 + OV07_0233EAF4_OFFSET
#ifndef NORTH_AMERICA
_0233FC88: .word 0x00003700 + OV07_0233EAF4_OFFSET
#endif
_0233F5C4: .word 0x000036FF + OV07_0233EAF4_OFFSET
_0233F5C8: .word 0x00003701 + OV07_0233EAF4_OFFSET
_0233F5CC: .word 0x00003702 + OV07_0233EAF4_OFFSET
_0233F5D0: .word ov07_023419C8
_0233F5D4: .word ov07_023419C4
_0233F5D8: .word 0x000036FD + OV07_0233EAF4_OFFSET
_0233F5DC: .word 0x00003703 + OV07_0233EAF4_OFFSET
_0233F5E0: .word ov07_023418D8
_0233F5E4: .word ov07_023418D4
_0233F5E8: .word 0x000036F8 + OV07_0233EAF4_OFFSET
_0233F5EC: .word 0x00001004
#ifdef NORTH_AMERICA
_0233F5F0: .word 0x000036FE
#endif
_0233F5F4: .word 0x0000E002
#ifdef JAPAN
_0233F5F8: .word 0x000004CC
_0233F5FC: .word 0x0000E003
_0233F600: .word 0x0000E004
_02340E8C: .word 0x000004CD
_0233F604: .word 0x0000E005
_0233F608: .word 0x000004CA
#else
_0233F5F8: .word 0x0000023B
_0233F5FC: .word 0x0000E003
_0233F600: .word 0x0000E004
_0233F604: .word 0x0000E005
_0233F608: .word 0x00000239
#endif
	arm_func_end ov07_0233EAF4

	arm_func_start ov07_0233F60C
ov07_0233F60C: ; 0x0233F60C
	stmdb sp!, {r3, lr}
	ldr r0, _0233F634 ; =ov07_02341B70
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0233F634 ; =ov07_02341B70
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233F634: .word ov07_02341B70
	arm_func_end ov07_0233F60C

	arm_func_start ov07_0233F638
ov07_0233F638: ; 0x0233F638
	stmdb sp!, {r3, lr}
	ldrsb ip, [sp, #8]
	str ip, [sp]
	bl sub_02046A9C
	ldmia sp!, {r3, pc}
	arm_func_end ov07_0233F638

	arm_func_start ov07_0233F64C
ov07_0233F64C: ; 0x0233F64C
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, [sp, #0x10]
	ldrh lr, [sp, #0x14]
	str ip, [sp]
	ldr ip, [sp, #0x18]
	str lr, [sp, #4]
	str ip, [sp, #8]
	bl sub_02046A20
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ov07_0233F64C

	arm_func_start ov07_0233F678
ov07_0233F678: ; 0x0233F678
	stmdb sp!, {r3, lr}
	bl sub_02046B04
	mvn r1, #1
	cmp r0, r1
	moveq r0, #0x15
	ldmeqia sp!, {r3, pc}
	add r1, r1, #1
	cmp r0, r1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov07_0233F678

	arm_func_start ov07_02046BA0
ov07_02046BA0: ; 0x0233F6A0
	ldr ip, _0233F6A8 ; =sub_02046BA0
	bx ip
	.align 2, 0
_0233F6A8: .word sub_02046BA0
	arm_func_end ov07_02046BA0

	arm_func_start ov07_0233F6AC
ov07_0233F6AC: ; 0x0233F6AC
	ldr ip, _0233F6B8 ; =sub_02046BE8
	mov r2, #0
	bx ip
	.align 2, 0
_0233F6B8: .word sub_02046BE8
	arm_func_end ov07_0233F6AC

	arm_func_start ov07_02046BE8
ov07_02046BE8: ; 0x0233F6BC
	ldr ip, _0233F6C4 ; =sub_02046BE8
	bx ip
	.align 2, 0
_0233F6C4: .word sub_02046BE8
	arm_func_end ov07_02046BE8

	arm_func_start ov07_0233F6C8
ov07_0233F6C8: ; 0x0233F6C8
	stmdb sp!, {r3, lr}
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0x15
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov07_0233F6C8

	arm_func_start ov07_0233F6E0
ov07_0233F6E0: ; 0x0233F6E0
	stmdb sp!, {r3, lr}
	mov r0, #0xa4
	mov r1, #8
	bl MemAlloc
	ldr r2, _0233F750 ; =ov07_02341B74
	mov r1, #0xa4
	str r0, [r2]
	bl MemZero
	mov r2, #0
	ldr r0, _0233F750 ; =ov07_02341B74
	mov ip, r2
_0233F70C:
	ldr r1, [r0]
	add r1, r1, r2
	add r2, r2, #1
	strb ip, [r1, #4]
#ifdef EUROPE
	cmp r2, #5
#else
	cmp r2, #6
#endif
	blt _0233F70C
	ldr r1, _0233F750 ; =ov07_02341B74
	ldr r0, _0233F754 ; =ov07_02341B84
	ldr r3, [r1]
	add r2, r3, #4
	str r2, [r3, #0x6c]
	ldr r1, [r1]
	str ip, [r1]
	str ip, [r0]
	bl sub_02046D20
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233F750: .word ov07_02341B74
_0233F754: .word ov07_02341B84
	arm_func_end ov07_0233F6E0

	arm_func_start ov07_0233F758
ov07_0233F758: ; 0x0233F758
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
#ifdef EUROPE
	ldr r2, _0233FC9C ; =0x023404F4
	ldr r0, [r2]
	ldr r3, [r0]
	cmp r3, #0x3000
	bgt _0233FEB0
	bge _0233FAB8
	ldr r1, _0233FCA4 ; =0x00001002
	cmp r3, r1
	bgt _0233FE90
	sub r0, r1, #1
	cmp r3, r0
	blt _0233FE64
	beq _0233F990
	cmp r3, r1
	beq _0233FA3C
	b _0233FC90
_0233FE64:
	cmp r3, #1
	bgt _0233FE84
	cmp r3, #0
	blt _0233FC90
	beq _0233F85C
	cmp r3, #1
	beq _0233F8A4
	b _0233FC90
_0233FE84:
	cmp r3, #0x1000
	beq _0233F8C0
	b _0233FC90
_0233FE90:
	cmp r3, #0x2000
	bgt _0233FEA0
	beq _0233FA58
	b _0233FC90
_0233FEA0:
	ldr r0, _0233FCC0 ; =0x00002001
	cmp r3, r0
	beq _0233FA7C
	b _0233FC90
_0233FEB0:
	ldr r1, _0233FCC4 ; =0x00004001
	cmp r3, r1
	bgt _0233FEE0
	bge _0233FB3C
	sub r0, r1, #0x1000
	cmp r3, r0
	bgt _0233FED4
	beq _0233FADC
	b _0233FC90
_0233FED4:
	cmp r3, #0x4000
	beq _0233FB18
	b _0233FC90
_0233FEE0:
	add r0, r1, #0x1000
	cmp r3, r0
	bgt _0233FEFC
	bge _0233FC1C
	cmp r3, #0x5000
	beq _0233FBC8
	b _0233FC90
_0233FEFC:
	ldr r0, _0233FCA8 ; =0x00005002
	cmp r3, r0
	beq _0233FC7C
	b _0233FC90
#else
	ldr ip, _0233FC9C ; =ov07_02341B74
	ldr r3, _0233FCA0 ; =0x00003001
	ldr r0, [ip]
	ldr r0, [r0]
	cmp r0, r3
	bgt _0233F7F8
	bge _0233FADC
	ldr r2, _0233FCA4 ; =0x00001002
	cmp r0, r2
	bgt _0233F7D0
	sub r1, r2, #1
	cmp r0, r1
	blt _0233F7A4
	beq _0233F990
	cmp r0, r2
	beq _0233FA3C
	b _0233FC90
_0233F7A4:
	cmp r0, #1
	bgt _0233F7C4
	cmp r0, #0
	blt _0233FC90
	beq _0233F85C
	cmp r0, #1
	beq _0233F8A4
	b _0233FC90
_0233F7C4:
	cmp r0, #0x1000
	beq _0233F8C0
	b _0233FC90
_0233F7D0:
	sub r1, r3, #0x1000
	cmp r0, r1
	bgt _0233F7EC
	bge _0233FA7C
	cmp r0, #0x2000
	beq _0233FA58
	b _0233FC90
_0233F7EC:
	cmp r0, #0x3000
	beq _0233FAB8
	b _0233FC90
_0233F7F8:
	add r1, r3, #0x2000
	cmp r0, r1
	bgt _0233F830
	bge _0233FC1C
	add r1, r3, #0x1000
	cmp r0, r1
	bgt _0233F824
	bge _0233FB3C
	cmp r0, #0x4000
	beq _0233FB18
	b _0233FC90
_0233F824:
	cmp r0, #0x5000
	beq _0233FBC8
	b _0233FC90
_0233F830:
	cmp r0, #0x6000
	bgt _0233F84C
	bge _0233FB64
	ldr r1, _0233FCA8 ; =0x00005002
	cmp r0, r1
	beq _0233FC7C
	b _0233FC90
_0233F84C:
	add r1, r3, #0x3000
	cmp r0, r1
	beq _0233FB88
	b _0233FC90
#endif
_0233F85C:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233FC90
	bl ov01_0232F3F4
	bl sub_0204A1CC
	bl ov00_022BCA80
	cmp r0, #3
	ldrne r0, _0233FC9C ; =ov07_02341B74
	movne r1, #0x1000
	ldrne r0, [r0]
	strne r1, [r0]
	bne _0233FC90
	bl ov01_02339888
	ldr r0, _0233FC9C ; =ov07_02341B74
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0233FC90
_0233F8A4:
	bl ov01_023398A4
	cmp r0, #0
	ldrne r0, _0233FC9C ; =ov07_02341B74
	movne r1, #0x1000
	ldrne r0, [r0]
	strne r1, [r0]
	b _0233FC90
_0233F8C0:
#ifdef EUROPE
	mov r3, #0
	mov r1, r3
_0233F8C8:
	ldr r0, [r2]
	add r0, r0, r3
	add r3, r3, #1
	strb r1, [r0, #4]
	cmp r3, #5
#else
	mov r2, #0
	mov r1, r2
_0233F8C8:
	ldr r0, [ip]
	add r0, r0, r2
	add r2, r2, #1
	strb r1, [r0, #4]
	cmp r2, #6
#endif
	blt _0233F8C8
	bl sub_02048480
	cmp r0, #0
	beq _0233F908
	bl ov00_022BD2F4
	cmp r0, #0
	ldreq r0, _0233FC9C ; =ov07_02341B74
	moveq r1, #3
	ldreq r0, [r0]
	streqb r1, [r0, #5]
	b _0233F930
_0233F908:
	ldr r0, _0233FC9C ; =ov07_02341B74
	mov r2, #3
	ldr r1, [r0]
	strb r2, [r1, #4]
	ldr r1, [r0]
	strb r2, [r1, #5]
#ifdef EUROPE
	ldr r0, [r0]
	strb r2, [r0, #6]
#else
	ldr r1, [r0]
	strb r2, [r1, #6]
	ldr r0, [r0]
	strb r2, [r0, #7]
#endif
_0233F930:
	bl sub_02046D20
	mov r0, #0x11
	bl ov01_02337928
	ldr r2, _0233FCAC ; =ov07_02341A78
	ldr r1, _0233FC9C ; =ov07_02341B74
	ldr r4, [r2, r0, lsl #3]
	ldr r2, [r1]
	mov r0, #0
	ldr r3, _0233FCB0 ; =ov07_02341A74
	str r4, [r2, #0xc]
	ldr r2, _0233FCB4 ; =0x000036E9
	str r3, [sp]
	str r2, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [r1]
	ldr r2, _0233FCB8 ; =0x00000233
	mov r1, r0
	add r3, r3, #0xc
	bl ov07_0233F64C
	ldr r0, _0233FC9C ; =ov07_02341B74
	ldr r1, _0233FCBC ; =0x00001001
	ldr r0, [r0]
	str r1, [r0]
	b _0233FC90
_0233F990:
	bl ov07_0233F678
	mov r4, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0x11
	bl ov01_02337938
	cmp r4, #3
	ldreq r0, _0233FC9C ; =ov07_02341B74
	moveq r1, #0x2000
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0233FC90
	cmp r4, #4
	ldreq r0, _0233FC9C ; =ov07_02341B74
	moveq r1, #0x3000
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0233FC90
	cmp r4, #5
	ldreq r0, _0233FC9C ; =ov07_02341B74
	moveq r1, #0x4000
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0233FC90
	cmp r4, #7
	ldreq r0, _0233FC9C ; =ov07_02341B74
	moveq r1, #0x5000
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0233FC90
	cmp r4, #0x15
	ldreq r0, _0233FC9C ; =ov07_02341B74
	ldreq r1, _0233FCA4 ; =0x00001002
#ifndef EUROPE
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0233FC90
	cmp r4, #6
	ldreq r0, _0233FC9C ; =ov07_02341B74
	moveq r1, #0x6000
#endif
	ldreq r0, [r0]
	streq r1, [r0]
	b _0233FC90
_0233FA3C:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233FC90
	mov r0, #0x10
	bl ov01_023310B8
	mov r0, #3
	b _0233FC94
_0233FA58:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233FC90
	bl ov07_0233CD30
	ldr r0, _0233FC9C ; =ov07_02341B74
	ldr r1, _0233FCC0 ; =0x00002001
	ldr r0, [r0]
	str r1, [r0]
	b _0233FC90
_0233FA7C:
	bl ov07_0233CD68
	cmp r0, #1
	bne _0233FAA0
	bl ov07_0233CF64
	ldr r0, _0233FC9C ; =ov07_02341B74
	mov r1, #0x1000
	ldr r0, [r0]
	str r1, [r0]
	b _0233FC90
_0233FAA0:
	cmp r0, #2
	bne _0233FC90
	bl ov07_0233CF64
	bl sub_0204A018
	mov r0, #3
	b _0233FC94
_0233FAB8:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233FC90
	bl ov07_0233CF90
	ldr r0, _0233FC9C ; =ov07_02341B74
	ldr r1, _0233FCA0 ; =0x00003001
	ldr r0, [r0]
	str r1, [r0]
	b _0233FC90
_0233FADC:
	bl ov07_0233CFF0
	cmp r0, #1
	bne _0233FB00
	bl ov07_0233D974
	ldr r0, _0233FC9C ; =ov07_02341B74
	mov r1, #0x1000
	ldr r0, [r0]
	str r1, [r0]
	b _0233FC90
_0233FB00:
	cmp r0, #2
	bne _0233FC90
	bl ov07_0233D974
	bl sub_0204A018
	mov r0, #3
	b _0233FC94
_0233FB18:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233FC90
	bl ov07_0233E554
	ldr r0, _0233FC9C ; =ov07_02341B74
	ldr r1, _0233FCC4 ; =0x00004001
	ldr r0, [r0]
	str r1, [r0]
	b _0233FC90
_0233FB3C:
	bl sub_02003BFC
	bl ov07_0233E5C8
	cmp r0, #2
	bne _0233FC90
	bl ov07_0233E58C
	ldr r0, _0233FC9C ; =ov07_02341B74
	mov r1, #0x1000
	ldr r0, [r0]
	str r1, [r0]
	b _0233FC90
#ifndef EUROPE
_0233FB64:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233FC90
	bl ov07_0233FD18
	ldr r0, _0233FC9C ; =ov07_02341B74
	ldr r1, _0233FCC8 ; =0x00006001
	ldr r0, [r0]
	str r1, [r0]
	b _0233FC90
_0233FB88:
	bl sub_02003BFC
	bl ov07_0233FDF8
	cmp r0, #2
	bne _0233FBB0
	bl ov07_0233FDCC
	ldr r0, _0233FC9C ; =ov07_02341B74
	mov r1, #0x1000
	ldr r0, [r0]
	str r1, [r0]
	b _0233FC90
_0233FBB0:
	cmp r0, #3
	bne _0233FC90
	bl ov07_0233FDCC
	bl sub_0204A018
	mov r0, #3
	b _0233FC94
#endif
_0233FBC8:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233FC90
	bl ov01_0232C0CC
	mov r0, #0xe0
	mov r1, #0xa0
	mov r2, #1
	bl ov01_0232C148
	mov r0, #0x12
	bl ov01_02337928
	str r0, [sp]
	mov r0, #0
	ldr r2, _0233FCCC ; =ov07_023419AC
	mov r1, r0
	ldr r3, _0233FCD0 ; =0x000036EF
	bl ov07_0233F638
	ldr r0, _0233FC9C ; =ov07_02341B74
	ldr r1, _0233FCD4 ; =0x00005001
	ldr r0, [r0]
	str r1, [r0]
	b _0233FC90
_0233FC1C:
	bl ov07_0233F678
	mov r4, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0x12
	bl ov01_02337938
	cmp r4, #1
	bne _0233FC58
	bl sub_02046D20
	ldr r0, _0233FC9C ; =ov07_02341B74
	ldr r1, _0233FCA8 ; =0x00005002
	ldr r0, [r0]
	str r1, [r0]
	b _0233FC90
_0233FC58:
	cmp r4, #2
	cmpne r4, #0x15
	bne _0233FC90
	bl ov01_0232C10C
	ldr r0, _0233FC9C ; =ov07_02341B74
	mov r1, #0x1000
	ldr r0, [r0]
	str r1, [r0]
	b _0233FC90
_0233FC7C:
	mov r0, #0x15
	bl ov00_022BE4A8
	bl ov01_0232C10C
	mov r0, #4
	b _0233FC94
_0233FC90:
	mov r0, #1
_0233FC94:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV07_0233F758_OFFSET 2
#elif defined(JAPAN)
#define OV07_0233F758_OFFSET -0x37E
#else
#define OV07_0233F758_OFFSET 0
#endif
_0233FC9C: .word ov07_02341B74
#ifndef EUROPE
_0233FCA0: .word 0x00003001
_0233FCA4: .word 0x00001002
#else
_0233FCA4: .word 0x00001002
_0233FCC0: .word 0x00002001
_0233FCC4: .word 0x00004001
#endif
_0233FCA8: .word 0x00005002
_0233FCAC: .word ov07_02341A78
_0233FCB0: .word ov07_02341A74
_0233FCB4: .word 0x000036E9 + OV07_0233F758_OFFSET
_0233FCB8: .word 0x00000233
_0233FCBC: .word 0x00001001
#ifdef EUROPE
_0233FCA0: .word 0x00003001
#else
_0233FCC0: .word 0x00002001
_0233FCC4: .word 0x00004001
_0233FCC8: .word 0x00006001
#endif
_0233FCCC: .word ov07_023419AC
_0233FCD0: .word 0x000036EF + OV07_0233F758_OFFSET
_0233FCD4: .word 0x00005001
	arm_func_end ov07_0233F758

	arm_func_start ov07_0233FCD8
ov07_0233FCD8: ; 0x0233FCD8
	stmdb sp!, {r3, lr}
	ldr r0, _0233FD14 ; =ov07_02341B74
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	bl ov00_022BCBAC
	bl sub_02046D20
	ldr r0, _0233FD14 ; =ov07_02341B74
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0233FD14 ; =ov07_02341B74
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233FD14: .word ov07_02341B74
	arm_func_end ov07_0233FCD8

#ifndef EUROPE
	arm_func_start ov07_0233FD18
ov07_0233FD18: ; 0x0233FD18
	stmdb sp!, {r3, lr}
	ldr r0, _0233FDC0 ; =0x0000046C
	mov r1, #8
	bl MemAlloc
	ldr r2, _0233FDC4 ; =ov07_02341B78
	ldr r1, _0233FDC0 ; =0x0000046C
	str r0, [r2]
	bl MemZero
	ldr r2, _0233FDC4 ; =ov07_02341B78
	mov r0, #0
	ldr r1, [r2]
	sub r3, r0, #2
	str r0, [r1]
	ldr r1, [r2]
	ldr lr, _0233FDC8 ; =0x0000374A
	strb r3, [r1, #0x2b8]
	ldr r1, [r2]
	mov ip, #0x10
	strb r3, [r1, #0x469]
	ldr r1, [r2]
	mov r3, #0xd
	add r1, r1, #0x200
	strh lr, [r1, #0xec]
	ldr r1, [r2]
	str ip, [r1, #0x2f0]
	ldr r1, [r2]
	str r3, [r1, #0x2e8]
	ldr r1, [r2]
	str r0, [r1, #0x2e4]
	ldr r3, [r2]
	add r1, r3, #0x14
	add r1, r1, #0x400
	str r1, [r3, #0x3dc]
	ldr r3, [r2]
	add r1, r3, #0xaf
	bic r1, r1, #0x1f
	str r1, [r3, #0x2b0]
	ldr r1, [r2]
	strb r0, [r1, #0x419]
	ldr r1, [r2]
	strb r0, [r1, #0x468]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233FDC0: .word 0x0000046C
_0233FDC4: .word ov07_02341B78
#ifdef JAPAN
_0233FDC8: .word 0x000033CC
#else
_0233FDC8: .word 0x0000374A
#endif
	arm_func_end ov07_0233FD18

	arm_func_start ov07_0233FDCC
ov07_0233FDCC: ; 0x0233FDCC
	stmdb sp!, {r3, lr}
	ldr r0, _0233FDF4 ; =ov07_02341B78
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0233FDF4 ; =ov07_02341B78
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233FDF4: .word ov07_02341B78
	arm_func_end ov07_0233FDCC

	arm_func_start ov07_0233FDF8
ov07_0233FDF8: ; 0x0233FDF8
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
#else
	stmdb sp!, {r3, r4, r5, r6, lr}
#endif
	sub sp, sp, #0x2cc
	sub sp, sp, #0x400
	ldr r0, _02340D64 ; =ov07_02341B78
	ldr r4, [r0]
	ldr r0, [r4]
	cmp r0, #0x36
	addls pc, pc, r0, lsl #2
	b _023414B4
_0233FE1C: ; jump table
	b _0233FEF8 ; case 0
	b _02340004 ; case 1
	b _0234017C ; case 2
	b _023401E0 ; case 3
	b _023401F0 ; case 4
	b _0234020C ; case 5
	b _02340220 ; case 6
	b _02340288 ; case 7
	b _023402B4 ; case 8
	b _023402D0 ; case 9
	b _023402FC ; case 10
	b _02340358 ; case 11
	b _023404A4 ; case 12
	b _02340518 ; case 13
	b _0234052C ; case 14
	b _0234053C ; case 15
	b _023405D0 ; case 16
	b _023405F8 ; case 17
	b _02340620 ; case 18
	b _023406E4 ; case 19
	b _023407A0 ; case 20
	b _02340880 ; case 21
	b _023408E0 ; case 22
	b _023408FC ; case 23
	b _023409B0 ; case 24
	b _02340A74 ; case 25
	b _02340B04 ; case 26
	b _02340B84 ; case 27
	b _02340BE4 ; case 28
	b _02340C44 ; case 29
	b _02340CC4 ; case 30
	b _02340D00 ; case 31
	b _02340D28 ; case 32
	b _02340D50 ; case 33
	b _02340DD0 ; case 34
	b _02340E78 ; case 35
	b _02340EC8 ; case 36
	b _02340F28 ; case 37
	b _02340F6C ; case 38
	b _02340FFC ; case 39
	b _02341140 ; case 40
	b _023411DC ; case 41
	b _02341234 ; case 42
	b _0234126C ; case 43
	b _023412BC ; case 44
	b _023412F8 ; case 45
	b _0234130C ; case 46
	b _02341368 ; case 47
	b _02341390 ; case 48
	b _023413BC ; case 49
	b _023413E8 ; case 50
	b _02341450 ; case 51
	b _02341464 ; case 52
	b _02341478 ; case 53
	b _02341484 ; case 54
_0233FEF8:
	ldr r1, _02340D68 ; =0xD4A51000
	add r0, r4, #0x20
	str r1, [r4, #0xc]
	mov r2, #0xe8
	mov r1, #0x36
	str r2, [r4, #0x10]
	bl MemZero
	bl ov00_022BD5EC
#ifdef JAPAN
	mov r7, #0
	add r8, r4, #0x20
	mov fp, #5
	mov sl, #4
	mov r1, #0x11
	mov r2, #1
	mov r3, #7
	mov ip, #0xb
	mov lr, #0x10
	mov r6, r7
	b _02341958
_023417D0:
	cmp sb, #0
	moveq r5, r6
	beq _0234194C
	cmp sb, #0x30
	blt _023417F0
	cmp sb, #0x39
	suble r5, sb, #0x12
	ble _0234194C
_023417F0:
	cmp sb, #0x41
	blt _0234180C
	cmp sb, #0x5a
	suble r5, sb, #0x2d
	movle r5, r5, lsl #1
	addle r5, r5, #1
	ble _0234194C
_0234180C:
	cmp sb, #0x61
	blt _02341824_JP
	cmp sb, #0x7a
	suble r5, sb, #0x4d
	movle r5, r5, lsl #1
	ble _0234194C
_02341824_JP:
	cmp sb, #0x40
	bgt _023418BC
	subs r5, sb, #0x20
	addpl pc, pc, r5, lsl #2
	b _02341948
_02341838: ; jump table
	b _02341940 ; case 0
	b _02341948 ; case 1
	b _02341948 ; case 2
	b _023418F0 ; case 3
	b _023418F8 ; case 4
	b _02341900 ; case 5
	b _023418D8 ; case 6
	b _02341948 ; case 7
	b _02341948 ; case 8
	b _02341948 ; case 9
	b _02341918 ; case 10
	b _02341920 ; case 11
	b _02341948 ; case 12
	b _023418E0 ; case 13
	b _023418D0 ; case 14
	b _02341948 ; case 15
	b _02341948 ; case 16
	b _02341948 ; case 17
	b _02341948 ; case 18
	b _02341948 ; case 19
	b _02341948 ; case 20
	b _02341948 ; case 21
	b _02341948 ; case 22
	b _02341948 ; case 23
	b _02341948 ; case 24
	b _02341948 ; case 25
	b _02341908 ; case 26
	b _02341910 ; case 27
	b _02341928 ; case 28
	b _02341930 ; case 29
	b _02341938 ; case 30
	b _02341948 ; case 31
	b _023418C8 ; case 32
_023418BC:
	cmp sb, #0x5f
	beq _023418E8
	b _02341948
_023418C8:
	mov r5, lr
	b _0234194C
_023418D0:
	mov r5, ip
	b _0234194C
_023418D8:
	mov r5, r3
	b _0234194C
_023418E0:
	mov r5, r2
	b _0234194C
_023418E8:
	mov r5, r1
	b _0234194C
_023418F0:
	mov r5, sl
	b _0234194C
_023418F8:
	mov r5, fp
	b _0234194C
_02341900:
	mov r5, #6
	b _0234194C
_02341908:
	mov r5, #0xd
	b _0234194C
_02341910:
	mov r5, #0xe
	b _0234194C
_02341918:
	mov r5, #0xa
	b _0234194C
_02341920:
	mov r5, #0x16
	b _0234194C
_02341928:
	mov r5, #0x17
	b _0234194C
_02341930:
	mov r5, #0x18
	b _0234194C
_02341938:
	mov r5, #0x19
	b _0234194C
_02341940:
	mov r5, #2
	b _0234194C
_02341948:
	mov r5, #0
_0234194C:
	strb r5, [r8], #1
	add r0, r0, #1
	add r7, r7, #1
_02341958:
	ldrsb sb, [r0]
	cmp sb, #0
	beq _0234196C
	cmp r7, #0x36
	blt _023417D0
_0234196C:
	cmp r7, #0x36
	movlt r0, #0
	strltb r0, [r8]
#else
	mov r2, #0
	add r3, r4, #0x20
	mov r1, r2
	b _0233FF3C
_0233FF28:
	cmp r5, #0
	moveq r5, r1
	strb r5, [r3], #1
	add r0, r0, #1
	add r2, r2, #1
_0233FF3C:
	ldrsb r5, [r0]
	cmp r5, #0
	beq _0233FF50
	cmp r2, #0x36
	blt _0233FF28
_0233FF50:
	cmp r2, #0x36
	movlt r0, #0
	strltb r0, [r3]
#endif
	add r0, r4, #0x56
	mov r1, #0x36
	bl MemZero
	bl ov00_022BD6E0
	strb r0, [r4, #0x2b4]
	bl ov00_022BD6F4
	strb r0, [r4, #0x2b5]
	bl ov00_022BD708
	strb r0, [r4, #0x2b6]
	bl ov00_022BD71C
	mov r2, #0
	strb r0, [r4, #0x2b7]
	mov r1, r2
_0233FF90:
	add r0, r4, r2
	add r2, r2, #1
	strb r1, [r0, #0x414]
	cmp r2, #5
	blt _0233FF90
	bl ov00_022BD5C8
	cmp r0, #0
	moveq r0, #3
	streqb r0, [r4, #0x414]
	streqb r0, [r4, #0x416]
	streqb r0, [r4, #0x417]
	mov r0, #6
	bl ov01_02337928
	ldr r1, _02340D6C ; =ov07_02341A48
	ldr r2, _02340D70 ; =ov07_02341A44
	ldr r1, [r1, r0, lsl #3]
	mov r0, #0
	str r1, [r4, #0x37c]
	str r2, [sp]
	ldr r1, _02340D74 ; =0x0000372E
	ldr r2, _02340D78 ; =0x00000233
	str r1, [sp, #4]
	mov r1, r0
	add r3, r4, #0x37c
	str r0, [sp, #8]
	bl ov07_0233F64C
	mov r0, #1
	str r0, [r4]
	b _023414B4
_02340004:
	bl ov07_0233F678
	mov r5, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #6
	bl ov01_02337938
	cmp r5, #0x11
	bne _023400B4
	bl ov00_022BD5C8
	cmp r0, #0
	beq _0234009C
	bl ov00_022BD600
	cmp r0, #0
	beq _02340054
	mov r0, #1
	bl ov07_023414FC
	mov r0, #2
	str r0, [r4]
	b _023414B4
_02340054:
	add r0, sp, #0x600
	add r0, r0, #0x7c
	bl InitPreprocessorArgs
	add r0, sp, #0x500
	add r0, r0, #0x7c
	add r1, r4, #0x20
	bl ov07_02341660
	add r3, sp, #0x500
	add r2, sp, #0x600
	add r3, r3, #0x7c
	ldr r1, _02340D7C ; =0x00003734
	add r2, r2, #0x7c
	mov r0, #0x1c
	str r3, [sp, #0x6b4]
	bl ov07_02046BE8
	mov r0, #3
	str r0, [r4]
	b _023414B4
_0234009C:
	ldr r1, _02340D80 ; =0x00003733
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #5
	str r0, [r4]
	b _023414B4
_023400B4:
	cmp r5, #0x12
	bne _02340120
	mov r2, #0
	add r0, r4, #0x20
	mov r1, #0x36
	str r2, [r4, #0x8c]
	bl MemZero
	bl ov00_022BD5C8
	cmp r0, #0
	beq _02340108
	mov r0, #9
	bl ov01_02337928
	str r0, [sp]
	mov r0, #0
	ldr r2, _02340D84 ; =ov07_0234194C
	ldr r3, _02340D88 ; =0x00003735
	mov r1, r0
	bl ov07_0233F638
	mov r0, #6
	str r0, [r4]
	b _023414B4
_02340108:
	ldr r1, _02340D8C ; =0x00003737
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #8
	str r0, [r4]
	b _023414B4
_02340120:
	cmp r5, #0x13
	bne _02340138
	bl sub_02046D20
	mov r0, #0x26
	str r0, [r4]
	b _023414B4
_02340138:
	cmp r5, #0x14
	bne _02340168
	mov r0, #0
	mov r5, #1
	ldr r2, _02340D90 ; =ov07_023418EC
	ldr r3, _02340D94 ; =0x00003753
	mov r1, r0
	str r5, [sp]
	bl ov07_0233F638
	mov r0, #0x2b
	str r0, [r4]
	b _023414B4
_02340168:
	cmp r5, #2
	cmpne r5, #0x15
	bne _023414B4
	mov r0, #2
	b _023414B8
_0234017C:
	bl ov07_0234151C
	cmp r0, #1
	bne _023401D0
	add r0, sp, #0x500
	add r0, r0, #0x2c
	bl InitPreprocessorArgs
	add r0, sp, #0x400
	add r0, r0, #0x2c
	add r1, r4, #0x20
	bl ov07_02341660
	add r3, sp, #0x400
	add r2, sp, #0x500
	add r3, r3, #0x2c
	ldr r1, _02340D7C ; =0x00003734
	add r2, r2, #0x2c
	mov r0, #0x1c
	str r3, [sp, #0x564]
	bl ov07_02046BE8
	mov r0, #3
	str r0, [r4]
	b _023414B4
_023401D0:
	cmp r0, #2
	moveq r0, #0
	streq r0, [r4]
	b _023414B4
_023401E0:
	mov r0, #0
	bl ov07_02341738
	mov r0, #4
	str r0, [r4]
_023401F0:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _023414B4
	bl ov07_023417A8
	mov r0, #0
	str r0, [r4]
	b _023414B4
_0234020C:
	bl ov07_0233F6C8
	cmp r0, #0x15
	moveq r0, #0
	streq r0, [r4]
	b _023414B4
_02340220:
	bl ov07_0233F678
	mov r5, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #9
	bl ov01_02337938
	cmp r5, #1
	bne _02340274
	bl ov00_022BD600
	cmp r0, #0
	beq _02340264
	mov r0, #1
	bl ov07_023414FC
	mov r0, #7
	str r0, [r4]
	b _023414B4
_02340264:
	bl sub_02046D20
	mov r0, #9
	str r0, [r4]
	b _023414B4
_02340274:
	cmp r5, #2
	cmpne r5, #0x15
	moveq r0, #0
	streq r0, [r4]
	b _023414B4
_02340288:
	bl ov07_0234151C
	cmp r0, #1
	bne _023402A4
	bl sub_02046D20
	mov r0, #9
	str r0, [r4]
	b _023414B4
_023402A4:
	cmp r0, #2
	moveq r0, #0
	streq r0, [r4]
	b _023414B4
_023402B4:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _023414B4
	bl sub_02046D20
	mov r0, #9
	str r0, [r4]
	b _023414B4
_023402D0:
	ldr r2, [r4, #0x8c]
	add r1, r4, #0x20
	mov r0, #0x36
	mla r1, r2, r0, r1
	mov r2, #0
	mov r3, r2
	mov r0, #8
	bl ShowKeyboard
	mov r0, #0xa
	str r0, [r4]
	b _023414B4
_023402FC:
	bl GetKeyboardStatus
	cmp r0, #3
	bne _02340330
	bl GetKeyboardStringResult
	ldr r3, [r4, #0x8c]
	add r5, r4, #0x20
	mov r2, #0x36
	mov r1, r0
	mla r0, r3, r2, r5
	bl MemcpySimple
	mov r0, #0xb
	str r0, [r4]
	b _023414B4
_02340330:
	cmp r0, #2
	bne _023414B4
	ldr r1, [r4, #0x8c]
	mov r0, #0x36
	mla r0, r1, r0, r4
	mov r1, #0
	strb r1, [r0, #0x20]
	mov r0, #0xb
	str r0, [r4]
	b _023414B4
_02340358:
	bl sub_02037468
	cmp r0, #1
	bne _023414B4
	ldr r1, [r4, #0x8c]
	mov r0, #0x36
	mla r0, r1, r0, r4
	ldrb r0, [r0, #0x20]
	cmp r0, #0
	beq _02340498
	cmp r1, #0
	bne _023403A8
	ldr r1, _02340D98 ; =0x00003738
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #8
	str r0, [r4]
	ldr r0, [r4, #0x8c]
	add r0, r0, #1
	str r0, [r4, #0x8c]
	b _023414B4
_023403A8:
	mov r1, #0
	b _023403CC
_023403B0:
	cmp r2, #0
	beq _023403C4
	add r1, r1, #1
	cmp r1, #0x36
	blt _023403CC
_023403C4:
	mov r0, #0
	b _023403E8
_023403CC:
	add r0, r4, r1
	ldrb r2, [r0, #0x20]
	ldrb r0, [r0, #0x56]
	cmp r2, r0
	beq _023403B0
	mvnlo r0, #0
	movhs r0, #1
_023403E8:
	cmp r0, #0
	bne _0234046C
	add r0, sp, #0x3dc
	bl InitPreprocessorArgs
	add r0, sp, #0x2dc
	add r1, r4, #0x20
	bl ov07_02341660
	add r2, sp, #0x2dc
	add r0, sp, #0x244
	mov r1, #0x98
	str r2, [sp, #0x414]
	bl MemZero
	mov r0, #7
	bl ov01_02337928
	ldr r2, _02340D9C ; =ov07_023418F0
	ldr r1, _02340D90 ; =ov07_023418EC
	ldr r2, [r2, r0, lsl #3]
	ldr r0, _02340DA0 ; =0x00003739
	str r2, [sp, #0x244]
	str r1, [sp]
	str r0, [sp, #4]
	add r1, sp, #0x3dc
	str r1, [sp, #8]
	mov r0, #0
	mov r1, #8
	mov r2, #0x13
	add r3, sp, #0x244
	bl ov07_0233F64C
	mov r0, #0xc
	str r0, [r4]
	mov r0, #0
	bl ov07_02341738
	b _023414B4
_0234046C:
	mov r2, #0
	add r0, r4, #0x56
	mov r1, #0x36
	str r2, [r4, #0x8c]
	bl MemZero
	ldr r1, _02340DA4 ; =0x0000373A
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #8
	str r0, [r4]
	b _023414B4
_02340498:
	mov r0, #0
	str r0, [r4]
	b _023414B4
_023404A4:
	bl ov07_0233F678
	mov r5, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #7
	bl ov01_02337938
	cmp r5, #1
	bne _023404E4
	bl ov07_023417A8
	ldr r1, _02340DA8 ; =0x0000373B
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #0xd
	str r0, [r4]
	b _023414B4
_023404E4:
	cmp r5, #2
	cmpne r5, #0x15
	bne _023414B4
	bl ov07_023417A8
	mov r2, #0
	add r0, r4, #0x56
	mov r1, #0x36
	str r2, [r4, #0x8c]
	bl MemZero
	bl sub_02046D20
	mov r0, #9
	str r0, [r4]
	b _023414B4
_02340518:
	bl ov07_0233F6C8
	cmp r0, #0x15
	moveq r0, #0xe
	streq r0, [r4]
	b _023414B4
_0234052C:
	bl ov01_02338A24
	mov r0, #0xf
	str r0, [r4]
	b _023414B4
_0234053C:
	bl sub_02003BFC
	bl ov01_02338EC4
	cmp r0, #1
	beq _023405B4
	cmp r0, #4
	beq _02340560
	cmp r0, #8
	beq _023405B4
	b _023414B4
_02340560:
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	add r1, r4, #0x20
	mov r2, #0x36
	bl ov07_02341614
	ldr r5, [r4, #0x2b0]
	bl sub_0205BD78
	mov r2, r0
	mov r0, r5
	mov r1, #1
	bl ov01_0232C5C8
	strh r0, [r4, #0x1e]
	mov r0, #0
	ldr r1, [r4, #0x2b0]
	bl ov01_02338C4C
	mov r0, #0x12
	str r0, [r4]
	b _023414B4
_023405B4:
	bl ov01_02338B08
	ldr r1, _02340DAC ; =0x0000373C
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #0x11
	str r0, [r4]
	b _023414B4
_023405D0:
	bl ov01_02338EC4
	cmp r0, #0
	beq _023414B4
	bl ov01_02338B08
	ldr r1, _02340DAC ; =0x0000373C
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #0x11
	str r0, [r4]
	b _023414B4
_023405F8:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _023414B4
	bl ov00_022BD274
	cmp r0, #0
	movne r0, #0x35
	strne r0, [r4]
	moveq r0, #0
	streq r0, [r4]
	b _023414B4
_02340620:
	bl ov01_02338EC4
	cmp r0, #4
	bne _023406A0
	mov r0, #0
	bl ov01_02338E1C
	bl ov01_0232C8B4
	cmp r0, #1
	bne _0234066C
	mov r0, #0xa
	bl ov01_02337928
	str r0, [sp]
	ldr r2, _02340DB0 ; =ov07_02341904
	ldr r3, _02340DB4 ; =0x0000373D
	mov r0, #0
	mov r1, #8
	bl ov07_0233F638
	mov r0, #0x13
	str r0, [r4]
	b _023414B4
_0234066C:
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	mov r0, #1
	mov r1, #0
	bl ov01_02338BEC
	mov r0, #0x10
	str r0, [r4]
	b _023414B4
_023406A0:
	cmp r0, #8
	cmpne r0, #6
	bne _023414B4
	bl ov01_02338B08
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	ldr r1, _02340DAC ; =0x0000373C
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #0x11
	str r0, [r4]
	b _023414B4
_023406E4:
	bl ov01_02339988
	bl ov01_02338EC4
	mov r6, r0
	bl ov07_0233F678
	mov r5, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0xa
	bl ov01_02337938
	cmp r6, #5
	bne _02340748
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	bl sub_02046BB4
	bl sub_02046D20
	bl ov01_02338C34
	mov r0, #0x10
	str r0, [r4]
	b _023414B4
_02340748:
	cmp r5, #1
	bne _02340768
	ldr r1, _02340DB8 ; =0x00003741
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #0x15
	str r0, [r4]
	b _023414B4
_02340768:
	cmp r5, #2
	cmpne r5, #0x15
	bne _023414B4
	mov r0, #0xb
	bl ov01_02337928
	str r0, [sp]
	mov r0, #0
	ldr r2, _02340D90 ; =ov07_023418EC
#ifdef JAPAN
	ldr r3, _02342658 ; =0x000033C2
	mov r1, r0
#else
	mov r1, r0
	mov r3, #0x3740
#endif
	bl ov07_0233F638
	mov r0, #0x14
	str r0, [r4]
	b _023414B4
_023407A0:
	bl ov01_02339988
	bl ov01_02338EC4
	mov r6, r0
	bl ov07_0233F678
	mov r5, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0xb
	bl ov01_02337938
	cmp r6, #5
	bne _02340804
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	bl sub_02046BB4
	bl sub_02046D20
	bl ov01_02338C34
	mov r0, #0x10
	str r0, [r4]
	b _023414B4
_02340804:
	cmp r5, #1
	bne _02340848
	mov r0, #0
	strb r0, [r4, #0x1c]
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	mov r0, #1
	mov r1, #0
	bl ov01_02338BEC
	mov r0, #0x1d
	str r0, [r4]
	b _023414B4
_02340848:
	cmp r5, #2
	cmpne r5, #0x15
	bne _023414B4
	mov r0, #0xa
	bl ov01_02337928
	str r0, [sp]
	ldr r2, _02340DB0 ; =ov07_02341904
	ldr r3, _02340DB4 ; =0x0000373D
	mov r0, #0
	mov r1, #8
	bl ov07_0233F638
	mov r0, #0x13
	str r0, [r4]
	b _023414B4
_02340880:
	bl ov01_02339988
	bl ov01_02338EC4
	mov r5, r0
	bl ov07_0233F6C8
	cmp r5, #5
	bne _023408C8
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	bl sub_02046D20
	bl ov01_02338C34
	mov r0, #0x10
	str r0, [r4]
	b _023414B4
_023408C8:
	cmp r0, #0x15
	bne _023414B4
	bl sub_02046D20
	mov r0, #0x16
	str r0, [r4]
	b _023414B4
_023408E0:
	ldrsh r3, [r4, #0x1e]
	ldr r1, [r4, #0x14]
	ldr r2, [r4, #0x18]
	mov r0, #4
	bl ov01_02335848
	mov r0, #0x17
	str r0, [r4]
_023408FC:
	bl ov01_02339988
	bl ov01_02338EC4
	mov r5, r0
	bl ov01_02336014
	cmp r5, #5
	bne _02340948
	bl ov01_02335FA8
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	bl sub_02046D20
	bl ov01_02338C34
	mov r0, #0x10
	str r0, [r4]
	b _023414B4
_02340948:
	cmp r0, #2
	bne _02340978
	bl ov01_023370AC
	str r0, [r4, #0x14]
	str r1, [r4, #0x18]
	bl ov01_02335FA8
	ldr r1, _02340DBC ; =0x00003742
	mov r0, #0
	bl ov07_0233F6AC
	mov r0, #0x19
	str r0, [r4]
	b _023414B4
_02340978:
	cmp r0, #1
	bne _023414B4
	bl ov01_02335FA8
	mov r0, #0xc
	bl ov01_02337928
	str r0, [sp]
	mov r0, #0
	ldr r2, _02340D90 ; =ov07_023418EC
#ifdef JAPAN
	ldr r3, _02342658 ; =0x000033C2
	mov r1, r0
#else
	mov r1, r0
	mov r3, #0x3740
#endif
	bl ov07_0233F638
	mov r0, #0x18
	str r0, [r4]
	b _023414B4
_023409B0:
	bl ov01_02339988
	bl ov01_02338EC4
	mov r6, r0
	bl ov07_0233F678
	mov r5, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0xc
	bl ov01_02337938
	cmp r6, #5
	bne _02340A14
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	bl sub_02046BB4
	bl sub_02046D20
	bl ov01_02338C34
	mov r0, #0x10
	str r0, [r4]
	b _023414B4
_02340A14:
	cmp r5, #1
	bne _02340A58
	mov r0, #0
	strb r0, [r4, #0x1c]
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	mov r0, #1
	mov r1, #0
	bl ov01_02338BEC
	mov r0, #0x1d
	str r0, [r4]
	b _023414B4
_02340A58:
	cmp r5, #2
	cmpne r5, #0x15
	bne _023414B4
	bl sub_02046D20
	mov r0, #0x16
	str r0, [r4]
	b _023414B4
_02340A74:
	bl ov01_02339988
	bl ov01_02338EC4
	mov r5, r0
	bl ov07_0233F6C8
	cmp r5, #5
	bne _02340ABC
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	bl sub_02046D20
	bl ov01_02338C34
	mov r0, #0x10
	str r0, [r4]
	b _023414B4
_02340ABC:
	cmp r0, #0x15
	bne _023414B4
	ldr r0, [r4, #0x14]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov00_022BD6A8
	ldr r5, [r4, #0x2b0]
	bl sub_0205BD78
	mov r2, r0
	mov r0, r5
	mov r1, #1
	bl ov01_0232C5C8
	ldr r1, [r4, #0x2b0]
	mov r0, #0
	bl ov01_02338C4C
	mov r0, #0x1a
	str r0, [r4]
	b _023414B4
_02340B04:
	bl ov01_02338EC4
	cmp r0, #4
	bne _02340B40
	mov r0, #0
	bl ov01_02338E1C
	bl ov01_0232C8B4
	cmp r0, #0
	mov r0, #0x1c
	streq r0, [r4]
	beq _023414B4
	ldr r1, _02340DC0 ; =0x00003743
	bl ov07_0233F6AC
	mov r0, #0x1b
	str r0, [r4]
	b _023414B4
_02340B40:
	cmp r0, #8
	cmpne r0, #6
	bne _023414B4
	bl ov01_02338B08
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	ldr r1, _02340DAC ; =0x0000373C
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #0x11
	str r0, [r4]
	b _023414B4
_02340B84:
	bl ov01_02339988
	bl ov01_02338EC4
	mov r5, r0
	bl ov07_0233F6C8
	cmp r5, #5
	bne _02340BCC
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	bl sub_02046D20
	bl ov01_02338C34
	mov r0, #0x10
	str r0, [r4]
	b _023414B4
_02340BCC:
	cmp r0, #0x15
	bne _023414B4
	bl sub_02046D20
	mov r0, #0x16
	str r0, [r4]
	b _023414B4
#ifdef JAPAN
	.align 2, 0
_02340D64: .word ov07_02341B78
_02340D68: .word 0xD4A51000
_02340D6C: .word ov07_02341A48
_02340D70: .word ov07_02341A44
_02340D74: .word 0x000033B0
_02340D78: .word 0x00000233
_02340D7C: .word 0x000033B6
_02340D80: .word 0x000033B5
_02340D84: .word ov07_0234194C
_02340D88: .word 0x000033B7
_02340D8C: .word 0x000033B9
_02340D90: .word ov07_023418EC
_02340D94: .word 0x000033D5
_02340D98: .word 0x000033BA
_02340D9C: .word ov07_023418F0
_02340DA0: .word 0x000033BB
_02340DA4: .word 0x000033BC
_02340DA8: .word 0x000033BD
_02340DAC: .word 0x000033BE
_02340DB0: .word ov07_02341904
_02340DB4: .word 0x000033BF
_02340DB8: .word 0x000033C3
_02342658: .word 0x000033C2
_02340DBC: .word 0x000033C4
_02340DC0: .word 0x000033C5
#endif
_02340BE4:
	bl ov01_02339988
	bl ov01_02338EC4
	cmp r0, #5
	bne _02340C28
	bl ov07_023417A8
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	bl sub_02046D20
	bl ov01_02338C34
	mov r0, #0x10
	str r0, [r4]
	b _023414B4
_02340C28:
	mov r0, #1
	mov r1, #0
	strb r0, [r4, #0x1c]
	bl ov01_02338BEC
	mov r0, #0x1d
	str r0, [r4]
	b _023414B4
_02340C44:
	bl ov01_02338EC4
	cmp r0, #6
	bne _02340C84
	bl ov01_02338B08
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	movne r0, #0x1e
	strne r0, [r4]
	bne _023414B4
	bl ov00_022BD274
	cmp r0, #0
	movne r0, #0x35
	strne r0, [r4]
	moveq r0, #0
	streq r0, [r4]
	b _023414B4
_02340C84:
	cmp r0, #8
	bne _023414B4
	bl ov01_02338B08
	bl ov00_022BD6C0
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	ldr r1, _02340DAC ; =0x0000373C
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #0x11
	str r0, [r4]
	b _023414B4
_02340CC4:
	add r0, sp, #0x1f4
	bl InitPreprocessorArgs
	add r0, sp, #0xf4
	add r1, r4, #0x20
	bl ov07_02341660
	add r3, sp, #0xf4
	ldr r1, _02340DC4 ; =0x00003744
	add r2, sp, #0x1f4
	mov r0, #0x1c
	str r3, [sp, #0x22c]
	bl ov07_02046BE8
	mov r1, #0x1f
	mov r0, #1
	str r1, [r4]
	bl ov07_02341738
_02340D00:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _023414B4
	bl ov07_023417A8
	ldr r1, _02340DC8 ; =0x00003745
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #0x20
	str r0, [r4]
	b _023414B4
_02340D28:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _023414B4
	ldr r1, _02340D68 ; =0xD4A51000
	mov r0, #0xe8
	str r1, [r4, #0xc]
	str r0, [r4, #0x10]
	mov r0, #0x21
	str r0, [r4]
	b _023414B4
_02340D50:
	mov r0, #0
	bl ov07_023414FC
	mov r0, #0x22
	str r0, [r4]
	b _023414B4
#ifndef JAPAN
	.align 2, 0
_02340D64: .word ov07_02341B78
_02340D68: .word 0xD4A51000
_02340D6C: .word ov07_02341A48
_02340D70: .word ov07_02341A44
_02340D74: .word 0x0000372E
_02340D78: .word 0x00000233
_02340D7C: .word 0x00003734
_02340D80: .word 0x00003733
_02340D84: .word ov07_0234194C
_02340D88: .word 0x00003735
_02340D8C: .word 0x00003737
_02340D90: .word ov07_023418EC
_02340D94: .word 0x00003753
_02340D98: .word 0x00003738
_02340D9C: .word ov07_023418F0
_02340DA0: .word 0x00003739
_02340DA4: .word 0x0000373A
_02340DA8: .word 0x0000373B
_02340DAC: .word 0x0000373C
_02340DB0: .word ov07_02341904
_02340DB4: .word 0x0000373D
_02340DB8: .word 0x00003741
_02340DBC: .word 0x00003742
_02340DC0: .word 0x00003743
_02340DC4: .word 0x00003744
_02340DC8: .word 0x00003745
_02340DCC: .word 0x00003747
#endif
_02340DD0:
	bl ov07_0234151C
	cmp r0, #1
	bne _02340E44
	add r0, sp, #0xa4
	bl InitPreprocessorArgs
	ldr r2, [r4, #0xc]
	add r0, sp, #0xc
	mov r1, #0x98
	str r2, [sp, #0xc8]
	bl MemZero
	mov r0, #8
	bl ov01_02337928
	ldr r2, _02340D9C ; =ov07_023418F0
	ldr r1, _02340D90 ; =ov07_023418EC
	ldr r2, [r2, r0, lsl #3]
	ldr r0, _02340DCC ; =0x00003747
	str r2, [sp, #0xc]
	str r1, [sp]
	str r0, [sp, #4]
	add r1, sp, #0xa4
	mov r0, #0
	str r1, [sp, #8]
	mov r1, r0
	mov r2, #0x13
	add r3, sp, #0xc
	bl ov07_0233F64C
	mov r0, #0x23
	str r0, [r4]
	b _023414B4
_02340E44:
	cmp r0, #2
	bne _023414B4
	mov r0, #0xd
	bl ov01_02337928
	str r0, [sp]
	mov r0, #0
	ldr r2, _02340D90 ; =ov07_023418EC
	ldr r3, _023414C4 ; =0x00003746
	mov r1, r0
	bl ov07_0233F638
	mov r0, #0x24
	str r0, [r4]
	b _023414B4
_02340E78:
	bl ov07_0233F678
	mov r5, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #8
	bl ov01_02337938
	cmp r5, #1
	bne _02340EB4
	ldr r1, _023414C8 ; =0x00003749
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #0x25
	str r0, [r4]
	b _023414B4
_02340EB4:
	cmp r5, #2
	cmpne r5, #0x15
	moveq r0, #0x21
	streq r0, [r4]
	b _023414B4
_02340EC8:
	bl ov07_0233F678
	mov r5, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0xd
	bl ov01_02337938
	cmp r5, #1
	bne _02340F14
	ldr r0, _023414CC ; =0x00003FFF
	ldr r1, _023414C8 ; =0x00003749
	str r0, [r4, #0xc]
	mov r2, #0
	mov r0, #0x1c
	str r2, [r4, #0x10]
	bl ov07_0233F6AC
	mov r0, #0x25
	str r0, [r4]
	b _023414B4
_02340F14:
	cmp r5, #2
	cmpne r5, #0x15
	moveq r0, #0x21
	streq r0, [r4]
	b _023414B4
_02340F28:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _023414B4
	bl ov00_022BD5EC
	mov r1, #0x36
	bl MemZero
	bl ov00_022BD5EC
	add r1, r4, #0x20
	mov r2, #0x36
	bl ov07_02341614
	ldr r0, [r4, #0xc]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov00_022BD648
	mov r0, #0x30
	str r0, [r4]
	b _023414B4
_02340F6C:
	ldrb r0, [r4, #0x2b4]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	str r0, [r4, #0x2bc]
	ldrb r0, [r4, #0x2b5]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	str r0, [r4, #0x2c0]
	ldrb r0, [r4, #0x2b6]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	str r0, [r4, #0x2c4]
	ldrb r0, [r4, #0x2b7]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	str r0, [r4, #0x2c8]
	mov r0, #0x10
	bl ov01_02337928
	str r0, [r4, #0x2e4]
	mov r0, #3
	str r0, [sp]
	add r2, r4, #0x2bc
	str r2, [sp, #4]
	ldr r0, _023414D0 ; =ov07_02341B10
	ldr r1, _023414D4 ; =0x00441C33
	ldr r3, _023414D8 ; =ov07_02341B20
	add r2, r4, #0x2e4
	bl CreateOptionsMenu
	strb r0, [r4, #0x2b8]
	mov r0, #0x27
	str r0, [r4]
	b _023414B4
_02340FFC:
	add r0, r4, #0x200
	ldrsb r0, [r0, #0xb8]
	bl sub_0202D59C
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0x10
	bl ov01_02337938
	add r0, r4, #0x200
	ldrsb r0, [r0, #0xb8]
	bl IsOptionsMenuActive
	cmp r0, #0
	bne _023410A0
	add r0, r4, #0x200
	ldrsb r0, [r0, #0xb8]
	bl GetOptionsMenuResult
	cmp r0, #0
	beq _02341098
	ldr r0, [r4, #0x2bc]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [r4, #0x2b4]
	ldr r0, [r4, #0x2c0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [r4, #0x2b5]
	ldr r0, [r4, #0x2c4]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [r4, #0x2b6]
	ldr r0, [r4, #0x2c8]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [r4, #0x2b7]
	mov r0, #1
	b _023410A4
_02341098:
	mov r0, #2
	b _023410A4
_023410A0:
	mov r0, #0
_023410A4:
	cmp r0, #1
	bne _02341128
	bl ov07_023416FC
	bl ov00_022BD6E0
	ldrb r1, [r4, #0x2b4]
	cmp r1, r0
	bne _023410F0
	bl ov00_022BD6F4
	ldrb r1, [r4, #0x2b5]
	cmp r1, r0
	bne _023410F0
	bl ov00_022BD708
	ldrb r1, [r4, #0x2b6]
	cmp r1, r0
	bne _023410F0
	bl ov00_022BD71C
	ldrb r1, [r4, #0x2b7]
	cmp r1, r0
	beq _0234111C
_023410F0:
	mov r0, #0xe
	bl ov01_02337928
	str r0, [sp]
	mov r0, #0
	ldr r2, _02340D90 ; =ov07_023418EC
	ldr r3, _023414DC ; =0x00003750
	mov r1, r0
	bl ov07_0233F638
	mov r0, #0x28
	str r0, [r4]
	b _023414B4
_0234111C:
	mov r0, #0
	str r0, [r4]
	b _023414B4
_02341128:
	cmp r0, #2
	bne _023414B4
	bl ov07_023416FC
	mov r0, #0
	str r0, [r4]
	b _023414B4
_02341140:
	bl ov07_0233F678
	mov r5, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0xe
	bl ov01_02337938
	cmp r5, #1
	bne _023411C0
	ldrb r0, [r4, #0x2b7]
	cmp r0, #0
	beq _023411A8
	bl ov00_022BD71C
	cmp r0, #0
	bne _023411A8
	mov r0, #0xf
	bl ov01_02337928
	str r0, [sp]
	mov r0, #0
	ldr r2, _02340D90 ; =ov07_023418EC
	ldr r3, _023414E0 ; =0x00003751
	mov r1, r0
	bl ov07_0233F638
	mov r0, #0x29
	str r0, [r4]
	b _023414B4
_023411A8:
	ldr r1, _023414E4 ; =0x00003752
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #0x2a
	str r0, [r4]
	b _023414B4
_023411C0:
	cmp r5, #2
	cmpne r5, #0x15
	bne _023414B4
	bl sub_02046D20
	mov r0, #0x26
	str r0, [r4]
	b _023414B4
_023411DC:
	bl ov07_0233F678
	mov r5, r0
	bl ov07_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0xf
	bl ov01_02337938
	cmp r5, #1
	bne _02341218
	ldr r1, _023414E4 ; =0x00003752
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #0x2a
	str r0, [r4]
	b _023414B4
_02341218:
	cmp r5, #2
	cmpne r5, #0x15
	bne _023414B4
	bl sub_02046D20
	mov r0, #0x26
	str r0, [r4]
	b _023414B4
_02341234:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _023414B4
	ldrb r0, [r4, #0x2b4]
	bl ov00_022BD730
	ldrb r0, [r4, #0x2b5]
	bl ov00_022BD744
	ldrb r0, [r4, #0x2b6]
	bl ov00_022BD758
	ldrb r0, [r4, #0x2b7]
	bl ov00_022BD76C
	mov r0, #0x30
	str r0, [r4]
	b _023414B4
_0234126C:
	bl ov07_0233F678
	cmp r0, #1
	bne _023412A8
	ldr r0, _02340D64 ; =ov07_02341B78
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x468]
	ldr r0, [r0]
	add r0, r0, #0x1a
	add r0, r0, #0x400
	bl ov00_022BD578
	bl ov00_022BD4EC
	mov r0, #0x2c
	str r0, [r4]
	b _023414B4
_023412A8:
	cmp r0, #2
	cmpne r0, #0x15
	moveq r0, #0
	streq r0, [r4]
	b _023414B4
_023412BC:
	bl ov07_0233CA80
	ldr r5, [r4, #0x2b0]
	bl sub_0205BD78
	mov r2, r0
	mov r0, r5
	mov r1, #1
	bl ov01_0232C5C8
	ldr r0, [r4, #0x2b0]
	bl ov07_0233CAC8
	ldr r1, _023414E8 ; =0x00003754
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #0x2d
	str r0, [r4]
	b _023414B4
_023412F8:
	bl ov07_0233F6C8
	cmp r0, #0x15
	moveq r0, #0x2e
	streq r0, [r4]
	b _023414B4
_0234130C:
	bl ov07_0233CAE8
	movs r5, r0
	beq _023414B4
	bl ov07_0233CD04
	cmp r5, #1
	bne _0234133C
	ldr r1, _023414EC ; =0x00003755
	mov r2, #1
	mov r0, #0x1c
	strb r2, [r4, #0x468]
	bl ov07_0233F6AC
	b _0234135C
_0234133C:
	ldr r0, _02340D64 ; =ov07_02341B78
	ldr r0, [r0]
	add r0, r0, #0x1a
	add r0, r0, #0x400
	bl ov00_022BD5A0
	ldr r1, _023414F0 ; =0x00003756
	mov r0, #0x1c
	bl ov07_0233F6AC
_0234135C:
	mov r0, #0x2f
	str r0, [r4]
	b _023414B4
_02341368:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _023414B4
	ldrb r0, [r4, #0x468]
	cmp r0, #0
	movne r0, #0x30
	strne r0, [r4]
	moveq r0, #0
	streq r0, [r4]
	b _023414B4
_02341390:
	bl ov00_022BD780
	ldr r1, _023414F4 ; =0x0000023B
	mov r0, #0
	bl ov07_0233F6AC
	mov r1, #0x31
	ldr r0, _02340D64 ; =ov07_02341B78
	str r1, [r4]
	ldr r1, [r0]
	mov r0, #0
	strb r0, [r1, #0x419]
	bl ov00_022BD264
_023413BC:
	bl ov07_0233F6C8
	cmp r0, #0x15
	bne _023414B4
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	mov r0, #0x32
	str r0, [r4]
	bl sub_02003B94
	b _023414B4
_023413E8:
	mov r0, #3
	bl NoteSaveBase
	mov r5, r0
	bl sub_02003BC8
	bl sub_02029FBC
	cmp r5, #0
	bne _0234142C
#ifdef JAPAN
	ldr r1, _02342F18 ; =0x000004CD
	mov r0, #0x1c
#else
	mov r0, #0x1c
	mov r1, #0x23c
#endif
	bl ov07_0233F6AC
	ldr r0, _02340D64 ; =ov07_02341B78
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0x33
	strb r2, [r1, #0x419]
	str r0, [r4]
	b _023414B4
_0234142C:
	cmp r5, #1
	moveq r0, #3
	beq _023414B8
	ldr r1, _023414F8 ; =0x00000239
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #0x34
	str r0, [r4]
	b _023414B4
_02341450:
	bl ov07_0233F6C8
	cmp r0, #0x15
	moveq r0, #0
	streq r0, [r4]
	b _023414B4
_02341464:
	bl ov07_0233F6C8
	cmp r0, #0x15
	moveq r0, #0
	streq r0, [r4]
	b _023414B4
_02341478:
	bl ov01_0233769C
	mov r0, #0x36
	str r0, [r4]
_02341484:
	bl ov01_02337718
	cmp r0, #1
	cmpne r0, #3
	bne _023414A0
	bl ov01_023376DC
	mov r0, #2
	b _023414B8
_023414A0:
	cmp r0, #2
	bne _023414B4
	bl ov01_023376DC
	mov r0, #3
	b _023414B8
_023414B4:
	mov r0, #0
_023414B8:
	add sp, sp, #0x2cc
	add sp, sp, #0x400
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, pc}
#endif
	.align 2, 0
#ifdef JAPAN
#define OV07_0233FDF8_OFFSET -0x37E
#else
#define OV07_0233FDF8_OFFSET 0
#endif
#ifdef JAPAN
_02340DC4: .word 0x000033C6
_02340DC8: .word 0x000033C7
_02340DCC: .word 0x000033C9
#endif
_023414C4: .word 0x00003746 + OV07_0233FDF8_OFFSET
_023414C8: .word 0x00003749 + OV07_0233FDF8_OFFSET
_023414CC: .word 0x00003FFF
_023414D0: .word ov07_02341B10
_023414D4: .word 0x00441C33
_023414D8: .word ov07_02341B20
_023414DC: .word 0x00003750 + OV07_0233FDF8_OFFSET
_023414E0: .word 0x00003751 + OV07_0233FDF8_OFFSET
_023414E4: .word 0x00003752 + OV07_0233FDF8_OFFSET
_023414E8: .word 0x00003754 + OV07_0233FDF8_OFFSET
_023414EC: .word 0x00003755 + OV07_0233FDF8_OFFSET
_023414F0: .word 0x00003756 + OV07_0233FDF8_OFFSET
#ifdef JAPAN
_023414F4: .word 0x000004CC
_02342F18: .word 0x000004CD
_023414F8: .word 0x000004CA
#else
_023414F4: .word 0x0000023B
_023414F8: .word 0x00000239
#endif
	arm_func_end ov07_0233FDF8

	arm_func_start ov07_023414FC
ov07_023414FC: ; 0x023414FC
	ldr r1, _02341518 ; =ov07_02341B78
	mov r3, #0
	ldr r2, [r1]
	str r3, [r2, #4]
	ldr r1, [r1]
	strb r0, [r1, #8]
	bx lr
	.align 2, 0
_02341518: .word ov07_02341B78
	arm_func_end ov07_023414FC

	arm_func_start ov07_0234151C
ov07_0234151C: ; 0x0234151C
	stmdb sp!, {r4, lr}
	ldr r0, _02341600 ; =ov07_02341B78
	ldr r4, [r0]
	ldr r0, [r4, #4]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _023415F8
_02341538: ; jump table
	b _02341548 ; case 0
	b _02341558 ; case 1
	b _02341574 ; case 2
	b _023415E8 ; case 3
_02341548:
	bl sub_02046D20
	mov r0, #1
	str r0, [r4, #4]
	b _023415F8
_02341558:
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	mov r0, #3
	bl ov01_0233580C
	mov r0, #2
	str r0, [r4, #4]
	b _023415F8
_02341574:
	bl ov01_02336014
	cmp r0, #2
	bne _023415D4
	bl ov01_023370AC
	str r0, [r4, #0xc]
	str r1, [r4, #0x10]
	bl ov01_02335FA8
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _023415B4
	bl ov00_022BD630
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0xc]
	cmp r1, r0, asr #31
	cmpeq r2, r0
	bne _023415BC
_023415B4:
	mov r0, #1
	ldmia sp!, {r4, pc}
_023415BC:
	ldr r1, _02341604 ; =0x00003748
	mov r0, #0x1c
	bl ov07_0233F6AC
	mov r0, #3
	str r0, [r4, #4]
	b _023415F8
_023415D4:
	cmp r0, #1
	bne _023415F8
	bl ov01_02335FA8
	mov r0, #2
	ldmia sp!, {r4, pc}
_023415E8:
	bl ov07_0233F6C8
	cmp r0, #0x15
	moveq r0, #0
	streq r0, [r4, #4]
_023415F8:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02341600: .word ov07_02341B78
#ifdef JAPAN
_02341604: .word 0x000033CA
#else
_02341604: .word 0x00003748
#endif
	arm_func_end ov07_0234151C

	arm_func_start ov07_02341608
ov07_02341608: ; 0x02341608
	cmp r0, #0
	moveq r0, #0
#ifdef JAPAN
	bxeq lr
	cmp r0, #0x1e
	blt _0234304C
	cmp r0, #0x27
	addle r0, r0, #0x12
	bxle lr
_0234304C:
	cmp r0, #0x28
	blt _02343070
	cmp r0, #0x5b
	bgt _02343070
	tst r0, #1
	mov r0, r0, asr #1
	addne r0, r0, #0x2d
	addeq r0, r0, #0x4d
	bx lr
_02343070:
	cmp r0, #0x19
	addls pc, pc, r0, lsl #2
	b _02343164
_0234307C: ; jump table
	b _02343164 ; case 0
	b _023430FC ; case 1
	b _0234315C ; case 2
	b _02343164 ; case 3
	b _0234310C ; case 4
	b _02343114 ; case 5
	b _0234311C ; case 6
	b _023430F4 ; case 7
	b _02343164 ; case 8
	b _02343164 ; case 9
	b _02343134 ; case 10
	b _023430EC ; case 11
	b _02343164 ; case 12
	b _02343124 ; case 13
	b _0234312C ; case 14
	b _02343164 ; case 15
	b _023430E4 ; case 16
	b _02343104 ; case 17
	b _02343164 ; case 18
	b _02343164 ; case 19
	b _02343164 ; case 20
	b _02343164 ; case 21
	b _0234313C ; case 22
	b _02343144 ; case 23
	b _0234314C ; case 24
	b _02343154 ; case 25
_023430E4:
	mov r0, #0x40
	bx lr
_023430EC:
	mov r0, #0x2e
	bx lr
_023430F4:
	mov r0, #0x26
	bx lr
_023430FC:
	mov r0, #0x2d
	bx lr
_02343104:
	mov r0, #0x5f
	bx lr
_0234310C:
	mov r0, #0x23
	bx lr
_02343114:
	mov r0, #0x24
	bx lr
_0234311C:
	mov r0, #0x25
	bx lr
_02343124:
	mov r0, #0x3a
	bx lr
_0234312C:
	mov r0, #0x3b
	bx lr
_02343134:
	mov r0, #0x2a
	bx lr
_0234313C:
	mov r0, #0x2b
	bx lr
_02343144:
	mov r0, #0x3c
	bx lr
_0234314C:
	mov r0, #0x3d
	bx lr
_02343154:
	mov r0, #0x3e
	bx lr
_0234315C:
	mov r0, #0x20
	bx lr
_02343164:
	mov r0, #0
#endif
	bx lr
	arm_func_end ov07_02341608

	arm_func_start ov07_02341614
ov07_02341614: ; 0x02341614
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, #0
	b _0234163C
_0234162C:
	bl ov07_02341608
	strb r0, [r7], #1
	add r6, r6, #1
	add r4, r4, #1
_0234163C:
	ldrb r0, [r6]
	cmp r0, #0
	beq _02341650
	cmp r4, r5
	blt _0234162C
_02341650:
	cmp r4, r5
	movlt r0, #0
	strltb r0, [r7]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov07_02341614

	arm_func_start ov07_02341660
ov07_02341660: ; 0x02341660
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r8, #0
	mov sl, r0
	mov sb, r1
	mov r7, r8
	mov r6, #0xa
	mov r5, #0x5b
	mov r4, #0x43
	mov fp, #0x4e
	b _023416E4
_02341688:
	ldrb r0, [sb, r7]
	add r7, r7, #1
	bl ov07_02341608
	strb r0, [sl, r8]
	cmp r7, #0x36
	add r8, r8, #1
	bge _023416F0
	mov r0, r7
	mov r1, #0x1b
	bl _s32_div_f
	cmp r1, #0
	bne _023416E4
	strb r6, [sl, r8]
	add r0, r8, #1
	strb r5, [sl, r0]
	add r0, r8, #2
	strb r4, [sl, r0]
	add r0, r8, #3
	add r1, r8, #4
	strb fp, [sl, r0]
	mov r0, #0x5d
	strb r0, [sl, r1]
	add r8, r8, #5
_023416E4:
	ldrb r0, [sb, r7]
	cmp r0, #0
	bne _02341688
_023416F0:
	mov r0, #0
	strb r0, [sl, r8]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov07_02341660

	arm_func_start ov07_023416FC
ov07_023416FC: ; 0x023416FC
	stmdb sp!, {r3, lr}
	ldr r0, _02341734 ; =ov07_02341B78
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0xb8]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl CloseOptionsMenu
	ldr r0, _02341734 ; =ov07_02341B78
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x2b8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02341734: .word ov07_02341B78
	arm_func_end ov07_023416FC

	arm_func_start ov07_02341738
ov07_02341738: ; 0x02341738
	stmdb sp!, {r3, lr}
	ldr r1, _02341798 ; =ov07_02341B78
	mvn r2, #1
	ldr r1, [r1]
	add r1, r1, #0x400
	ldrsb r1, [r1, #0x69]
	cmp r1, r2
	ldmneia sp!,  {r3, pc}
	cmp r0, #0
	beq _0234177C
	ldr r0, _0234179C ; =ov07_02341B00
	ldr r1, _023417A0 ; =ov07_02341800
	bl CreateTextBox
	ldr r1, _02341798 ; =ov07_02341B78
	ldr r1, [r1]
	strb r0, [r1, #0x469]
	ldmia sp!, {r3, pc}
_0234177C:
	ldr r0, _023417A4 ; =ov07_02341AF0
	ldr r1, _023417A0 ; =ov07_02341800
	bl CreateTextBox
	ldr r1, _02341798 ; =ov07_02341B78
	ldr r1, [r1]
	strb r0, [r1, #0x469]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02341798: .word ov07_02341B78
_0234179C: .word ov07_02341B00
_023417A0: .word ov07_02341800
_023417A4: .word ov07_02341AF0
	arm_func_end ov07_02341738

	arm_func_start ov07_023417A8
ov07_023417A8: ; 0x023417A8
	stmdb sp!, {r3, lr}
	ldr r0, _023417FC ; =ov07_02341B78
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x69]
	cmp r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0202F954
	ldr r0, _023417FC ; =ov07_02341B78
	ldr r0, [r0]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x69]
	bl CloseTextBox
	ldr r0, _023417FC ; =ov07_02341B78
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1, #0x469]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023417FC: .word ov07_02341B78
	arm_func_end ov07_023417A8

	arm_func_start ov07_02341800
ov07_02341800: ; 0x02341800
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x108
	mov sl, r0
	bl sub_02027B1C
	mov r7, #0
	ldr fp, _023418B8 ; =ov07_02341B78
	mov r8, r7
	mov r4, #0x17
	add r6, sp, #8
_02341824:
	mov r0, r6
	mov r1, #0x100
	bl MemZero
	ldr r1, [fp]
	mov r0, r6
	add r1, r1, #0x20
	mov r2, #0x12
	add r1, r1, r7
	bl StrncpySimpleNoPadSafe
	mov r0, #0xd
	mul r5, r8, r0
	str r6, [sp, #4]
	mov sb, #0
	b _02341888
_0234185C:
	add r0, sp, #4
	bl sub_0202065C
	mov r1, #0xd
	mul r1, sb, r1
	mov r3, r0
	mov r0, sl
	add r1, r1, #4
	add r2, r5, #2
	str r4, [sp]
	bl sub_020264F8
	add sb, sb, #1
_02341888:
	ldr r0, [sp, #4]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0234185C
	add r8, r8, #1
	cmp r8, #3
	add r7, r7, #0x12
	blt _02341824
	mov r0, sl
	bl UpdateWindow
	add sp, sp, #0x108
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023418B8: .word ov07_02341B78
	arm_func_end ov07_02341800
	; 0x023418BC
#endif

	.rodata
	.global ov07_023418BC
ov07_023418BC:
#if defined(EUROPE)
#define OV07_DATA_OFFSET 2
#elif defined(JAPAN)
#define OV07_DATA_OFFSET -0x37E
#else
#define OV07_DATA_OFFSET 0
#endif
	.word 0x370A + OV07_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x370B + OV07_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov07_023418D4
ov07_023418D4:
	.word 0x36F9 + OV07_DATA_OFFSET
	.global ov07_023418D8
ov07_023418D8:
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x36FA + OV07_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
#ifndef EUROPE
	.global ov07_023418EC
ov07_023418EC:
	.word 0x3757 + OV07_DATA_OFFSET
	.global ov07_023418F0
ov07_023418F0:
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x3758 + OV07_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov07_02341904
ov07_02341904:
	.word 0x373E + OV07_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x373F + OV07_DATA_OFFSET
	.byte 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
#endif
	.global ov07_0234191C
ov07_0234191C:
	.word 0x370E + OV07_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x370F + OV07_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
#ifndef EUROPE
	.global ov07_02341934
ov07_02341934:
	.word 0x3728 + OV07_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x3729 + OV07_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov07_0234194C
ov07_0234194C:
	.word 0x3736 + OV07_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x3759 + OV07_DATA_OFFSET
	.byte 0x15, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
#endif
	.global ov07_02341964
ov07_02341964:
	.word 0x3723 + OV07_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x3724 + OV07_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov07_0234197C
ov07_0234197C:
	.word 0x3711 + OV07_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x3712 + OV07_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov07_02341994
ov07_02341994:
	.word 0x3720 + OV07_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x3721 + OV07_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov07_023419AC
ov07_023419AC:
	.word 0x36E6 + OV07_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x36E7 + OV07_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov07_023419C4
ov07_023419C4:
	.word 0x36FB + OV07_DATA_OFFSET
	.global ov07_023419C8
ov07_023419C8:
	.byte 0x0F, 0x00, 0x00, 0x00
	.word 0x36FC + OV07_DATA_OFFSET
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov07_023419DC
ov07_023419DC:
	.word 0x36F3 + OV07_DATA_OFFSET
	.byte 0x0E, 0x00, 0x00, 0x00
	.word 0x36F4 + OV07_DATA_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.word 0x36F5 + OV07_DATA_OFFSET
	.byte 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
#ifndef EUROPE
	.global ov07_023419FC
ov07_023419FC:
	.word 0x36F0 + OV07_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x36F1 + OV07_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0x36F2 + OV07_DATA_OFFSET
	.byte 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
#endif
	.global ov07_02341A1C
ov07_02341A1C:
	.word 0x371B + OV07_DATA_OFFSET
	.global ov07_02341A20
ov07_02341A20:
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x371C + OV07_DATA_OFFSET
	.byte 0x0B, 0x00, 0x00, 0x00
#ifndef EUROPE
	.word 0x371D + OV07_DATA_OFFSET
	.byte 0x0C, 0x00, 0x00, 0x00
#endif
	.word 0x371E + OV07_DATA_OFFSET
	.byte 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
#ifdef EUROPE
	.global ov07_023419FC
ov07_023419FC:
	.byte 0xF2, 0x36, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0xF3, 0x36, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0xF4, 0x36, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
#else
	.global ov07_02341A44
ov07_02341A44:
	.word 0x372F + OV07_DATA_OFFSET
	.global ov07_02341A48
ov07_02341A48:
	.byte 0x11, 0x00, 0x00, 0x00
	.word 0x3730 + OV07_DATA_OFFSET
	.byte 0x12, 0x00, 0x00, 0x00
	.word 0x3731 + OV07_DATA_OFFSET
	.byte 0x13, 0x00, 0x00, 0x00
	.word 0x3732 + OV07_DATA_OFFSET
	.byte 0x14, 0x00, 0x00, 0x00
	.word 0x3759 + OV07_DATA_OFFSET
	.byte 0x15, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
#endif
	.global ov07_02341A74
ov07_02341A74:
	.word 0x36EA + OV07_DATA_OFFSET
	.global ov07_02341A78
ov07_02341A78:
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x36EB + OV07_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x36EC + OV07_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
#ifndef EUROPE
	.word 0x36ED + OV07_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
#endif
	.word 0x36EE + OV07_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x36E8 + OV07_DATA_OFFSET
	.byte 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov07_02341AAC
ov07_02341AAC:
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x02, 0x1A, 0x11, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov07_02341ABC
ov07_02341ABC:
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x03, 0x1A, 0x02, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov07_02341ACC
ov07_02341ACC:
	.byte 0x5B, 0x43, 0x4C, 0x55, 0x4D, 0x5F, 0x53, 0x45, 0x54, 0x3A, 0x38, 0x30, 0x5D, 0x00, 0x00, 0x00
#ifndef EUROPE
	.byte 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.global ov07_02341AE8
ov07_02341AE8:
	.hword 0x374E + OV07_DATA_OFFSET, 0x374F + OV07_DATA_OFFSET
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov07_02341AF0
ov07_02341AF0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x1E, 0x05, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov07_02341B00
ov07_02341B00:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x06, 0x1E, 0x05, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov07_02341B10
ov07_02341B10:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov07_02341B20
ov07_02341B20:
	.word 0x374B + OV07_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word ov07_02341AE8
	.word 0x374D + OV07_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word ov07_02341AE8
	.word 0x374C + OV07_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word ov07_02341AE8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
#endif

	.data
	.global ov07_02341B60
ov07_02341B60:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov07_02341B64
ov07_02341B64:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov07_02341B68
ov07_02341B68:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov07_02341B6C
ov07_02341B6C:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov07_02341B70
ov07_02341B70:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov07_02341B74
ov07_02341B74:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov07_02341B78
ov07_02341B78:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss
	.global ov07_02341B80
ov07_02341B80:
	.space 0x4
	.global ov07_02341B84
ov07_02341B84:
	.space 0x1C
