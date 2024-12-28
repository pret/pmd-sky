	.include "asm/macros.inc"
	.include "overlay_04.inc"

	.text

	arm_func_start ov04_0233CA80
ov04_0233CA80: ; 0x0233CA80
	ldr ip, _0233CA90 ; =MemZero
	ldr r0, _0233CA94 ; =ov04_0233F660
	mov r1, #0x10
	bx ip
	.align 2, 0
_0233CA90: .word MemZero
_0233CA94: .word ov04_0233F660
	arm_func_end ov04_0233CA80

	arm_func_start ov04_0233CA98
ov04_0233CA98: ; 0x0233CA98
	ldr r1, _0233CAA4 ; =ov04_0233F660
	str r0, [r1]
	bx lr
	.align 2, 0
_0233CAA4: .word ov04_0233F660
	arm_func_end ov04_0233CA98

	arm_func_start ov04_0233CAA8
ov04_0233CAA8: ; 0x0233CAA8
	ldr r0, _0233CAB4 ; =ov04_0233F660
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0233CAB4: .word ov04_0233F660
	arm_func_end ov04_0233CAA8

	arm_func_start ov04_0233CAB8
ov04_0233CAB8: ; 0x0233CAB8
	ldr r1, _0233CAC4 ; =ov04_0233F660
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_0233CAC4: .word ov04_0233F660
	arm_func_end ov04_0233CAB8

	arm_func_start ov04_0233CAC8
ov04_0233CAC8: ; 0x0233CAC8
	ldr r0, _0233CAD4 ; =ov04_0233F660
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_0233CAD4: .word ov04_0233F660
	arm_func_end ov04_0233CAC8

	arm_func_start ov04_0233CAD8
ov04_0233CAD8: ; 0x0233CAD8
	ldr r1, _0233CAE4 ; =ov04_0233F660
	strb r0, [r1, #0xc]
	bx lr
	.align 2, 0
_0233CAE4: .word ov04_0233F660
	arm_func_end ov04_0233CAD8

	arm_func_start ov04_0233CAE8
ov04_0233CAE8: ; 0x0233CAE8
	ldr r0, _0233CAF4 ; =ov04_0233F660
	ldrb r0, [r0, #0xc]
	bx lr
	.align 2, 0
_0233CAF4: .word ov04_0233F660
	arm_func_end ov04_0233CAE8

	arm_func_start ov04_0233CAF8
ov04_0233CAF8: ; 0x0233CAF8
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, [sp, #0x10]
	ldrh lr, [sp, #0x14]
	str ip, [sp]
	mov ip, #0
	arm_func_end ov04_0233CAF8

	arm_func_start ov04_0233CB10
ov04_0233CB10: ; 0x0233CB10
	str lr, [sp, #4]
	str ip, [sp, #8]
	bl sub_02046A20
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ov04_0233CB10

	arm_func_start ov04_0233CB24
ov04_0233CB24: ; 0x0233CB24
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, [sp, #0x10]
	ldrh lr, [sp, #0x14]
	str ip, [sp]
	ldr ip, [sp, #0x18]
	arm_func_end ov04_0233CB24

	arm_func_start ov04_0233CB3C
ov04_0233CB3C: ; 0x0233CB3C
	str lr, [sp, #4]
	str ip, [sp, #8]
	bl sub_02046A20
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ov04_0233CB3C

	arm_func_start ov04_0233CB50
ov04_0233CB50: ; 0x0233CB50
	stmdb sp!, {r3, lr}
	bl sub_02046B04
	mvn r1, #1
	cmp r0, r1
	moveq r0, #8
	ldmeqia sp!, {r3, pc}
	add r1, r1, #1
	cmp r0, r1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov04_0233CB50

	arm_func_start ov04_02046BA0
ov04_02046BA0: ; 0x0233CB78
	ldr ip, _0233CB80 ; =sub_02046BA0
	bx ip
	.align 2, 0
_0233CB80: .word sub_02046BA0
	arm_func_end ov04_02046BA0

	arm_func_start ov04_0233CB84
ov04_0233CB84: ; 0x0233CB84
	ldr ip, _0233CB90 ; =sub_02046BE8
	mov r2, #0
	bx ip
	.align 2, 0
_0233CB90: .word sub_02046BE8
	arm_func_end ov04_0233CB84

	arm_func_start ov04_02046BE8
ov04_02046BE8: ; 0x0233CB94
	ldr ip, _0233CB9C ; =sub_02046BE8
	bx ip
	.align 2, 0
_0233CB9C: .word sub_02046BE8
	arm_func_end ov04_02046BE8

	arm_func_start ov04_0233CBA0
ov04_0233CBA0: ; 0x0233CBA0
	stmdb sp!, {r3, lr}
	bl sub_02046C78
	cmp r0, #0
	movne r0, #8
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov04_0233CBA0

	arm_func_start ov04_0233CBB8
ov04_0233CBB8: ; 0x0233CBB8
	stmdb sp!, {r3, lr}
	mov r0, #0xb8
	mov r1, #8
	bl MemAlloc
	ldr r2, _0233CC44 ; =ov04_0233F670
	mov r1, #0xb8
	str r0, [r2]
	bl MemZero
	mov r2, #0
	ldr r0, _0233CC44 ; =ov04_0233F670
	mov ip, r2
_0233CBE4:
	ldr r1, [r0]
	add r1, r1, r2
	add r2, r2, #1
	strb ip, [r1, #0x14]
	cmp r2, #3
	blt _0233CBE4
	ldr r0, _0233CC44 ; =ov04_0233F670
	mov r1, #0x10
	ldr r3, [r0]
	add r2, r3, #0x14
	str r2, [r3, #0x78]
	ldr r2, [r0]
	str ip, [r2, #0x10]
	ldr r0, [r0]
	bl MemZero
	ldr r0, _0233CC44 ; =ov04_0233F670
	mov r1, #0
	str r1, [r0, #4]
	bl sub_02046D20
	ldr r0, _0233CC48 ; =ov04_0233F640
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233CC44: .word ov04_0233F670
_0233CC48: .word ov04_0233F640
	arm_func_end ov04_0233CBB8

	arm_func_start ov04_0233CC4C
ov04_0233CC4C: ; 0x0233CC4C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r0, _0233D154 ; =ov04_0233F670
	ldr r0, [r0]
	ldr r1, [r0, #0x10]
	cmp r1, #0x2000
	bgt _0233CCC4
	bge _0233CFE0
	cmp r1, #0x1000
	bgt _0233CCA0
	bge _0233CE28
	cmp r1, #2
	bgt _0233D148
	cmp r1, #0
	blt _0233D148
	beq _0233CD04
	cmp r1, #1
	beq _0233CD8C
	cmp r1, #2
	beq _0233CE0C
	b _0233D148
_0233CCA0:
	ldr r0, _0233D158 ; =0x00001001
	cmp r1, r0
	bgt _0233CCB4
	beq _0233CED8
	b _0233D148
_0233CCB4:
	add r0, r0, #1
	cmp r1, r0
	beq _0233CFC4
	b _0233D148
_0233CCC4:
	ldr r0, _0233D15C ; =0x00002002
	cmp r1, r0
	bgt _0233CCE4
	bge _0233D064
	sub r0, r0, #1
	cmp r1, r0
	beq _0233D000
	b _0233D148
_0233CCE4:
	cmp r1, #0x3000
	bgt _0233CCF4
	beq _0233D0CC
	b _0233D148
_0233CCF4:
	ldr r0, _0233D160 ; =0x00003001
	cmp r1, r0
	beq _0233D0EC
	b _0233D148
_0233CD04:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233D148
	bl ov01_0232F3F4
	bl ov04_0233CA80
	mov r3, #0
	ldr r1, _0233D154 ; =ov04_0233F670
	mov r0, r3
_0233CD24:
	ldr r2, [r1]
	add r2, r2, r3
	add r3, r3, #1
	strb r0, [r2, #0x14]
	cmp r3, #3
	blt _0233CD24
	bl ov01_02337648
	ldr r2, _0233D164 ; =ov04_0233F5BC
	ldr r1, _0233D154 ; =ov04_0233F670
	ldr r2, [r2, r0, lsl #3]
	ldr r0, [r1]
	ldr r3, _0233D168 ; =ov04_0233F5B8
	str r2, [r0, #0x18]
	mov r0, #0
	ldr r2, _0233D16C ; =0x000037B9
	str r3, [sp]
	str r2, [sp, #4]
	ldr r3, [r1]
	ldr r2, _0233D170 ; =0x00000233
	mov r1, r0
	add r3, r3, #0x18
	bl ov04_0233CAF8
	ldr r0, _0233D154 ; =ov04_0233F670
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x10]
_0233CD8C:
	bl ov04_0233CB50
	mov r4, r0
	bl ov04_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0
	bl ov01_02337658
	cmp r4, #1
	bne _0233CDCC
	mov r0, #1
	bl ov04_0233CAB8
	ldr r0, _0233D154 ; =ov04_0233F670
	mov r1, #0x1000
	ldr r0, [r0]
	str r1, [r0, #0x10]
	arm_func_end ov04_0233CC4C

	arm_func_start ov04_0233CDC8
ov04_0233CDC8: ; 0x0233CDC8
	b _0233D148
_0233CDCC:
	cmp r4, #2
	bne _0233CDF0
	mov r0, #0
	arm_func_end ov04_0233CDC8

	arm_func_start ov04_0233CDD8
ov04_0233CDD8: ; 0x0233CDD8
	bl ov04_0233CAB8
	ldr r0, _0233D154 ; =ov04_0233F670
	mov r1, #0x1000
	arm_func_end ov04_0233CDD8

	arm_func_start ov04_0233CDE4
ov04_0233CDE4: ; 0x0233CDE4
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _0233D148
_0233CDF0:
	sub r0, r4, #7
	cmp r0, #1
	ldrls r0, _0233D154 ; =ov04_0233F670
	movls r1, #2
	ldrls r0, [r0]
	strls r1, [r0, #0x10]
	b _0233D148
_0233CE0C:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233D148
	mov r0, #0x11
	bl ov01_023310B8
	mov r0, #3
	b _0233D14C
_0233CE28:
	bl ov04_0233CAC8
	cmp r0, #0
#ifdef EUROPE
	moveq r0, #0x37c0
#else
	ldreq r0, _0233D174 ; =0x000037BE
#endif
	ldrne r0, _0233D178 ; =0x000037BD
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	bl ov04_0233CAC8
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bl sub_0204316C
	bl sub_02043320
	cmp r0, #0
	ldrne r0, _0233D154 ; =ov04_0233F670
	movne r1, #3
	ldreq r0, _0233D154 ; =ov04_0233F670
	moveq r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	mov r0, #1
	bl ov01_02337648
	ldr r2, _0233D17C ; =ov04_0233F59C
	ldr r1, _0233D154 ; =ov04_0233F670
	ldr r2, [r2, r0, lsl #3]
	ldr r1, [r1]
	mov r0, #0
	str r2, [r1, #0x18]
	bl ov04_0233CAD8
	ldr r1, _0233D180 ; =ov04_0233F598
	mov r0, #0
	str r1, [sp]
	ldr r1, _0233D154 ; =ov04_0233F670
	str r4, [sp, #4]
	ldr r3, [r1]
	ldr r2, _0233D170 ; =0x00000233
	mov r1, r0
	add r3, r3, #0x18
	bl ov04_0233CAF8
	ldr r0, _0233D154 ; =ov04_0233F670
	ldr r1, _0233D158 ; =0x00001001
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _0233D148
_0233CED8:
	bl ov04_0233CB50
	mov r4, r0
	bl ov04_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #1
	bl ov01_02337658
	cmp r4, #3
	bne _0233CF18
	mov r0, #0
	bl ov04_0233CA98
	ldr r0, _0233D154 ; =ov04_0233F670
	mov r1, #0x3000
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _0233D148
_0233CF18:
	cmp r4, #4
	bne _0233CFA8
	bl ov04_0233CAC8
	cmp r0, #1
	moveq r0, #6
	beq _0233CF48
	bl ov04_0233CAC8
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bl sub_0204316C
_0233CF48:
	bl sub_02043380
	cmp r0, #0
	beq _0233CF74
	ldr r1, _0233D184 ; =0x000037BF
	mov r0, #0x1c
	bl ov04_0233CB84
	ldr r0, _0233D154 ; =ov04_0233F670
	ldr r1, _0233D188 ; =0x00001002
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _0233D148
_0233CF74:
	mov r0, #1
	bl ov04_0233CA98
	bl ov04_0233CAC8
	cmp r0, #0
	ldreq r0, _0233D154 ; =ov04_0233F670
	moveq r1, #0x2000
	ldreq r0, [r0]
	streq r1, [r0, #0x10]
	ldrne r0, _0233D154 ; =ov04_0233F670
	movne r1, #0x3000
	ldrne r0, [r0]
	strne r1, [r0, #0x10]
	b _0233D148
_0233CFA8:
	sub r0, r4, #7
	cmp r0, #1
	ldrls r0, _0233D154 ; =ov04_0233F670
	movls r1, #0
	ldrls r0, [r0]
	strls r1, [r0, #0x10]
	b _0233D148
_0233CFC4:
	bl ov04_0233CBA0
	cmp r0, #8
	ldreq r0, _0233D154 ; =ov04_0233F670
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #0x10]
	b _0233D148
_0233CFE0:
	ldr r1, _0233D18C ; =0x000037D6
	mov r0, #0x1c
	bl ov04_0233CB84
	ldr r0, _0233D154 ; =ov04_0233F670
	ldr r1, _0233D190 ; =0x00002001
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _0233D148
_0233D000:
	bl ov04_0233CBA0
	cmp r0, #8
	bne _0233D148
	mov r0, #2
	bl ov01_02337648
	ldr r2, _0233D194 ; =ov04_0233F584
	ldr r1, _0233D154 ; =ov04_0233F670
	ldr r2, [r2, r0, lsl #3]
	ldr r0, [r1]
	ldr r3, _0233D198 ; =ov04_0233F580
	str r2, [r0, #0x18]
	mov r0, #0
	ldr r2, _0233D19C ; =0x000037D7
	str r3, [sp]
	str r2, [sp, #4]
	ldr r2, [r1]
	mov r1, r0
	add r3, r2, #0x18
	mov r2, #0x33
	bl ov04_0233CAF8
	ldr r0, _0233D154 ; =ov04_0233F670
	ldr r1, _0233D15C ; =0x00002002
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _0233D148
_0233D064:
	bl ov04_0233CB50
	mov r4, r0
	bl ov04_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #2
	bl ov01_02337658
	cmp r4, #6
	bne _0233D0A4
	mov r0, #1
	bl ov04_0233CAD8
	ldr r0, _0233D154 ; =ov04_0233F670
	mov r1, #0x3000
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _0233D148
_0233D0A4:
	sub r0, r4, #7
	cmp r0, #1
	bhi _0233D148
	mov r0, #0
	bl ov04_0233CAD8
	ldr r0, _0233D154 ; =ov04_0233F670
	mov r1, #0x3000
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _0233D148
_0233D0CC:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233D148
	bl ov04_0233D1D8
	ldr r0, _0233D154 ; =ov04_0233F670
	ldr r1, _0233D160 ; =0x00003001
	ldr r0, [r0]
	str r1, [r0, #0x10]
_0233D0EC:
	bl sub_02003BFC
	bl ov04_0233D2F8
	cmp r0, #1
	bne _0233D114
	bl ov04_0233D2B4
	ldr r0, _0233D154 ; =ov04_0233F670
	mov r1, #0x1000
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _0233D148
_0233D114:
	cmp r0, #2
	bne _0233D130
	bl ov04_0233D2B4
	mov r0, #0x11
	bl ov01_023310B8
	mov r0, #3
	b _0233D14C
_0233D130:
	cmp r0, #3
	bne _0233D148
	bl ov04_0233D2B4
	bl sub_0204A018
	mov r0, #3
	b _0233D14C
_0233D148:
	mov r0, #1
_0233D14C:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV04_0233CDE4_OFFSET 2
#elif defined(JAPAN)
#define OV04_0233CDE4_OFFSET 0x164
#else
#define OV04_0233CDE4_OFFSET 0
#endif
_0233D154: .word ov04_0233F670
_0233D158: .word 0x00001001
_0233D15C: .word 0x00002002
_0233D160: .word 0x00003001
_0233D164: .word ov04_0233F5BC
_0233D168: .word ov04_0233F5B8
_0233D16C: .word 0x000037B9 + OV04_0233CDE4_OFFSET
_0233D170: .word 0x00000233
#ifndef EUROPE
_0233D174: .word 0x000037BE + OV04_0233CDE4_OFFSET
#endif
_0233D178: .word 0x000037BD + OV04_0233CDE4_OFFSET
_0233D17C: .word ov04_0233F59C
_0233D180: .word ov04_0233F598
_0233D184: .word 0x000037BF + OV04_0233CDE4_OFFSET
_0233D188: .word 0x00001002
_0233D18C: .word 0x000037D6 + OV04_0233CDE4_OFFSET
_0233D190: .word 0x00002001
_0233D194: .word ov04_0233F584
_0233D198: .word ov04_0233F580
_0233D19C: .word 0x000037D7 + OV04_0233CDE4_OFFSET
	arm_func_end ov04_0233CDE4

	arm_func_start ov04_0233D1A0
ov04_0233D1A0: ; 0x0233D1A0
	stmdb sp!, {r3, lr}
	ldr r0, _0233D1D4 ; =ov04_0233F670
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_02046D20
	ldr r0, _0233D1D4 ; =ov04_0233F670
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0233D1D4 ; =ov04_0233F670
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233D1D4: .word ov04_0233F670
	arm_func_end ov04_0233D1A0

	arm_func_start ov04_0233D1D8
ov04_0233D1D8: ; 0x0233D1D8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	bl sub_02044094
	bl sub_020440DC
	bl sub_02043218
	ldr r0, _0233D2A4 ; =0x00001D28
	mov r1, #8
	bl MemAlloc
	ldr r2, _0233D2A8 ; =ov04_0233F644
	ldr r1, _0233D2A4 ; =0x00001D28
	str r0, [r2]
	bl MemZero
	ldr r0, _0233D2A8 ; =ov04_0233F644
	mov r3, #0
	ldr r1, [r0]
	sub r2, r3, #2
	str r3, [r1]
	ldr r1, [r0]
	strb r2, [r1, #8]
	ldr r1, [r0]
	add r0, r1, #0x37
	bic r0, r0, #0x1f
	str r0, [r1, #0x14]
	bl ov04_0233CAC8
	cmp r0, #1
	ldr r3, _0233D2A8 ; =ov04_0233F644
	moveq r2, #1
	ldr r1, [r3]
	movne r2, #0
	add r1, r1, #0x1000
	strb r2, [r1, #0x928]
	ldr r2, [r3]
	mov ip, #0
	add r2, r2, #0x1000
	strb ip, [r2, #0xd24]
	ldr r3, [r3]
	ldr r1, _0233D2AC ; =ov04_0233F624
	add r3, r3, #0x1000
	ldr r2, _0233D2B0 ; =0x0000030F
	add r0, sp, #0
	strb ip, [r3, #0x92d]
	bl LoadFileFromRom
	ldr r0, _0233D2A8 ; =ov04_0233F644
	ldr r2, [sp]
	ldr r0, [r0]
	ldr r1, [sp, #4]
	add r0, r0, #0x1000
	str r2, [r0, #0xd1c]
	str r1, [r0, #0xd20]
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233D2A4: .word 0x00001D28
_0233D2A8: .word ov04_0233F644
_0233D2AC: .word ov04_0233F624
_0233D2B0: .word 0x0000030F
	arm_func_end ov04_0233D1D8

	arm_func_start ov04_0233D2B4
ov04_0233D2B4: ; 0x0233D2B4
	stmdb sp!, {r3, lr}
	ldr r0, _0233D2F4 ; =ov04_0233F644
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #0x11c
	add r0, r0, #0x1c00
	bl UnloadFile
	ldr r0, _0233D2F4 ; =ov04_0233F644
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0233D2F4 ; =ov04_0233F644
	mov r1, #0
	str r1, [r0]
	bl sub_020440B8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233D2F4: .word ov04_0233F644
	arm_func_end ov04_0233D2B4

	arm_func_start ov04_0233D2F8
ov04_0233D2F8: ; 0x0233D2F8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xa4
	sub sp, sp, #0x400
	ldr r0, _0233E25C ; =ov04_0233F644
	ldr r2, _0233E260 ; =0x00002020
	ldr r4, [r0]
	ldr r0, [r4]
	cmp r0, r2
	bgt _0233D414
	bge _0233E9D4
	sub r1, r2, #0x1f
	cmp r0, r1
	bgt _0233D3B0
	bge _0233DFC8
	ldr r2, _0233E264 ; =0x00001001
	cmp r0, r2
	bgt _0233D370
	bge _0233D820
	cmp r0, #2
	bgt _0233D364
	cmp r0, #0
	blt _0233EEB4
	beq _0233D4FC
	cmp r0, #1
	cmpne r0, #2
	beq _0233D7F0
	b _0233EEB4
_0233D364:
	cmp r0, #0x1000
	beq _0233D804
	b _0233EEB4
_0233D370:
	add r1, r2, #6
	cmp r0, r1
	bgt _0233D3A4
	add r1, r2, #1
	subs r1, r0, r1
	addpl pc, pc, r1, lsl #2
	b _0233EEB4
_0233D38C: ; jump table
	b _0233D874 ; case 0
	b _0233DAC4 ; case 1
	b _0233DCCC ; case 2
	b _0233DD54 ; case 3
	b _0233DDA8 ; case 4
	b _0233DDC4 ; case 5
_0233D3A4:
	cmp r0, #0x2000
	beq _0233DDF4
	b _0233EEB4
_0233D3B0:
	sub r1, r2, #0xd
	cmp r0, r1
	bgt _0233D3E4
	bge _0233E560
	sub r1, r2, #0xf
	cmp r0, r1
	bgt _0233D3D4
	beq _0233E23C
	b _0233EEB4
_0233D3D4:
	sub r1, r2, #0xe
	cmp r0, r1
	beq _0233E43C
	b _0233EEB4
_0233D3E4:
	sub r1, r2, #0xb
	cmp r0, r1
	bgt _0233D404
	bge _0233E74C
	sub r1, r2, #0xc
	cmp r0, r1
	beq _0233E670
	b _0233EEB4
_0233D404:
	sub r1, r2, #0xa
	cmp r0, r1
	beq _0233E774
	b _0233EEB4
_0233D414:
	ldr r2, _0233E268 ; =0x00005001
	cmp r0, r2
	bgt _0233D47C
	bge _0233ECB4
	ldr r1, _0233E26C ; =0x00003002
	cmp r0, r1
	bgt _0233D454
	bge _0233EB98
	cmp r0, #0x3000
	bgt _0233D444
	beq _0233EA00
	b _0233EEB4
_0233D444:
	sub r1, r1, #1
	cmp r0, r1
	beq _0233EB20
	b _0233EEB4
_0233D454:
	cmp r0, #0x4000
	bgt _0233D470
	bge _0233EBD8
	add r1, r1, #1
	cmp r0, r1
	beq _0233EBAC
	b _0233EEB4
_0233D470:
	cmp r0, #0x5000
	beq _0233EBEC
	b _0233EEB4
_0233D47C:
	add r1, r2, #3
	cmp r0, r1
	bgt _0233D4B0
	bge _0233ED70
	add r1, r2, #1
	cmp r0, r1
	bgt _0233D4A0
	beq _0233ED0C
	b _0233EEB4
_0233D4A0:
	add r1, r2, #2
	cmp r0, r1
	beq _0233ED28
	b _0233EEB4
_0233D4B0:
	add r1, r2, #5
	cmp r0, r1
	bgt _0233D4D0
	bge _0233EDB0
	add r1, r2, #4
	cmp r0, r1
	beq _0233ED90
	b _0233EEB4
_0233D4D0:
	add r1, r2, #7
	cmp r0, r1
	bgt _0233EEB4
	add r1, r2, #6
	cmp r0, r1
	blt _0233EEB4
	beq _0233EDD4
	add r1, r2, #7
	cmp r0, r1
	beq _0233EE90
	b _0233EEB4
_0233D4FC:
	bl ov04_0233CAC8
	cmp r0, #0
	bne _0233D648
	bl ov04_0233CAA8
	cmp r0, #1
	bne _0233D5AC
	ldr r0, _0233E25C ; =ov04_0233F644
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #1
	strne r0, [r1, #4]
	add r0, r4, #0x58
	mov r1, #0x1e
	bl MemZero
	add r0, r4, #0x3ec
	add r0, r0, #0x1400
	mov r1, #0x18
	bl MemZero
	add r0, r4, #0x3ec
	add r1, r4, #0x1000
	mov r3, #0x18
	str r3, [r1, #0x838]
	add r0, r0, #0x1400
	str r0, [r1, #0x83c]
	mov r0, #0x1e
	str r0, [r1, #0x840]
	add r0, r4, #0x58
	str r0, [r1, #0x844]
	mov r3, #0
	ldr r0, _0233E270 ; =ov04_0233EF8C
	strb r3, [r1, #0x84c]
	str r0, [r1, #0x848]
	mov r0, #1
	strb r0, [r1, #0x850]
	add r2, r4, #0x7f0
	add r0, r2, #0x1000
	strb r3, [r1, #0x851]
	bl GetMainTeamNameWithCheck
	ldr r1, _0233E274 ; =0x000037C1
	mov r0, #0x1c
	bl ov04_0233CB84
	mov r0, #1
	str r0, [r4]
	b _0233EEB4
_0233D5AC:
	bl ov04_0233CAA8
	cmp r0, #0
	bne _0233EEB4
	ldr r0, _0233E25C ; =ov04_0233F644
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #4]
	add r0, r4, #0x58
	mov r1, #0x1e
	bl MemZero
	add r0, r4, #0x3ec
	add r0, r0, #0x1400
	mov r1, #0x18
	bl MemZero
	add r0, r4, #0x3ec
	add r1, r4, #0x1000
	mov r2, #0x1e
	str r2, [r1, #0x838]
	add r2, r4, #0x58
	str r2, [r1, #0x83c]
	mov r2, #0x18
	str r2, [r1, #0x840]
	add r0, r0, #0x1400
	str r0, [r1, #0x844]
	mov r2, #0
	ldr r0, _0233E278 ; =ov01_02337B68
	strb r2, [r1, #0x84c]
	str r0, [r1, #0x848]
	strb r2, [r1, #0x850]
	add r0, r4, #0x5c
	strb r2, [r1, #0x851]
	bl GetMainTeamNameWithCheck
	ldr r1, _0233E27C ; =0x000037C2
	mov r0, #0x1c
	bl ov04_0233CB84
	mov r0, #0x1000
	str r0, [r4]
	b _0233EEB4
_0233D648:
	bl ov04_0233CAA8
	cmp r0, #1
	bne _0233D734
	ldr r0, _0233E25C ; =ov04_0233F644
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #1
	strne r0, [r1, #4]
	ldr r1, _0233E280 ; =0x00001776
	add r0, r4, #0x76
	bl MemZero
	add r0, r4, #4
	add r0, r0, #0x1800
	mov r1, #0x1a
	bl MemZero
	add r0, r4, #0x3ec
	add r6, r0, #0x1400
	add r1, r4, #4
	add r0, r4, #0x7f0
	add r2, r4, #0x1000
	mov r7, #0x18
	str r7, [r2, #0x820]
	str r6, [r2, #0x824]
	mov r3, #0x1a
	str r3, [r2, #0x828]
	add r1, r1, #0x1800
	str r1, [r2, #0x82c]
	mov r5, #1
	ldr r1, _0233E284 ; =ov04_0233F0A8
	strb r5, [r2, #0x834]
	str r1, [r2, #0x830]
	str r7, [r2, #0x838]
	ldr r1, _0233E280 ; =0x00001776
	str r6, [r2, #0x83c]
	str r1, [r2, #0x840]
	add r1, r4, #0x76
	str r1, [r2, #0x844]
	mov r3, #0
	ldr r1, _0233E288 ; =ov04_0233F0E0
	strb r3, [r2, #0x84c]
	str r1, [r2, #0x848]
	strb r5, [r2, #0x850]
	add r0, r0, #0x1000
	strb r3, [r2, #0x851]
	bl GetMainTeamNameWithCheck
	add r0, sp, #0xec
	bl InitPreprocessorArgs
	bl sub_0200FD48
	mov r5, r0
	bl CountNbOfItemsInStorage
	sub r0, r5, r0
	str r0, [sp, #0x110]
#if defined(EUROPE)
	ldr r1, _0233EA08 ; =0x000037C2
	mov r0, #0x1c
#elif defined(JAPAN)
	mov r0, #0x1c
	rsb r1, r0, #0x3940
#else
	mov r0, #0x1c
	mov r1, #0x37c0
#endif
	add r2, sp, #0xec
	bl ov04_02046BE8
	mov r0, #2
	str r0, [r4]
	b _0233EEB4
_0233D734:
	bl ov04_0233CAA8
	cmp r0, #0
	bne _0233EEB4
	ldr r0, _0233E25C ; =ov04_0233F644
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #4]
	add r0, r4, #0x3ec
	add r0, r0, #0x1400
	mov r1, #0x18
	bl MemZero
	add r0, r4, #4
	add r1, r4, #0x3ec
	add r5, r1, #0x1400
	add r2, r4, #0x1000
	mov r3, #0x1a
	str r3, [r2, #0x820]
	add r0, r0, #0x1800
	str r0, [r2, #0x824]
	mov r6, #0x18
	str r6, [r2, #0x828]
	add r0, r4, #8
	str r5, [r2, #0x82c]
	mov r1, #1
	strb r1, [r2, #0x834]
	ldr r3, _0233E278 ; =ov01_02337B68
	ldr r1, _0233E280 ; =0x00001776
	str r3, [r2, #0x830]
	str r1, [r2, #0x838]
	add r1, r4, #0x76
	str r1, [r2, #0x83c]
	str r6, [r2, #0x840]
	str r5, [r2, #0x844]
	mov r1, #0
	strb r1, [r2, #0x84c]
	str r3, [r2, #0x848]
	strb r1, [r2, #0x850]
	add r0, r0, #0x1800
	strb r1, [r2, #0x851]
	bl GetMainTeamNameWithCheck
	ldr r1, _0233E27C ; =0x000037C2
	mov r0, #0x1c
	bl ov04_0233CB84
	mov r0, #0x1000
	str r0, [r4]
	b _0233EEB4
_0233D7F0:
	bl ov04_0233CBA0
	cmp r0, #8
	moveq r0, #0x2000
	streq r0, [r4]
	b _0233EEB4
_0233D804:
	bl ov04_0233CBA0
	cmp r0, #8
	bne _0233EEB4
	bl sub_02046D20
	ldr r0, _0233E264 ; =0x00001001
	str r0, [r4]
	b _0233EEB4
_0233D820:
	bl ov04_0233CAC8
	cmp r0, #0
	movne r5, #6
	bne _0233D848
	ldr r0, _0233E25C ; =ov04_0233F644
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x928]
	bl sub_0204316C
	mov r5, r0
_0233D848:
	ldr r0, _0233E28C ; =ov01_0233C1DC
	ldrsh r0, [r0]
	bl sub_0204322C
	mov r0, r5
	mov r1, #0
	mov r2, #8
	bl sub_02042CF0
	ldr r1, _0233E290 ; =0x00001002
	strb r0, [r4, #8]
	str r1, [r4]
	b _0233EEB4
_0233D874:
	bl sub_02043468
	mov r5, r0
	bl sub_02043400
	cmp r0, #0
	bne _0233DA6C
	mvn r0, #0
	cmp r5, r0
	bne _0233D8A8
	bl sub_0204317C
	mvn r0, #1
	strb r0, [r4, #8]
	mov r0, #1
	b _0233EEB8
_0233D8A8:
	bl sub_020434FC
	mov r6, r0
	mov r0, r5
	bl sub_02043254
	ldr r1, _0233E28C ; =ov01_0233C1DC
	cmp r6, #1
	strh r0, [r1]
	ble _0233D9A4
	add r0, r4, #0x84
	add r0, r0, #0x1800
	mov r1, #0x98
	str r5, [r4, #0xc]
	bl MemZero
	mov r1, #0
	mov r5, r1
_0233D8E4:
	add r0, r4, r1
	add r0, r0, #0x1000
	add r1, r1, #1
	strb r5, [r0, #0x91c]
	cmp r1, #5
	blt _0233D8E4
	add r0, r4, #0x11c
	add r7, r0, #0x1800
	add r6, r4, #0x1000
	str r7, [r6, #0x8e4]
	mov r0, #3
	strb r0, [r7, #1]
	b _0233D954
_0233D918:
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02043568
	tst r0, #1
	beq _0233D950
	mov r0, r5
	bl sub_0204329C
	bl sub_02010044
	ldrb r1, [r6, #0x928]
	bl CanSendItem
	cmp r0, #0
	moveq r0, #3
	streqb r0, [r7]
	beq _0233D95C
_0233D950:
	add r5, r5, #1
_0233D954:
	cmp r5, #0x3e8
	blt _0233D918
_0233D95C:
	mov r0, #3
	bl ov01_02337648
	ldr r1, _0233E294 ; =ov04_0233F5DC
	add r3, r4, #0x84
	ldr r2, [r1, r0, lsl #3]
	add r0, r4, #0x1000
	ldr r1, _0233E298 ; =ov04_0233F5D8
	str r2, [r0, #0x884]
	ldr r0, _0233E29C ; =ov04_0233F604
	ldr r2, _0233E2A0 ; =0x00000233
	str r1, [sp]
	mov r1, #0
	add r3, r3, #0x1800
	str r1, [sp, #4]
	bl ov04_0233CAF8
	ldr r0, _0233E2A4 ; =0x00001003
	str r0, [r4]
	b _0233EEB4
_0233D9A4:
	cmp r6, #1
	bne _0233D9B4
	bl sub_0204352C
	b _0233D9B8
_0233D9B4:
	bl sub_02043468
_0233D9B8:
	mov r5, r0
	add r0, r4, #0x84
	add r0, r0, #0x1800
	mov r1, #0x98
	str r5, [r4, #0xc]
	bl MemZero
	mov r2, #0
	mov r1, r2
_0233D9D8:
	add r0, r4, r2
	add r0, r0, #0x1000
	add r2, r2, #1
	strb r1, [r0, #0x91c]
	cmp r2, #5
	blt _0233D9D8
	add r0, r4, #0x11c
	mov r2, r5, lsl #0x10
	add r5, r0, #0x1800
	add r1, r4, #0x1000
	mov r0, r2, asr #0x10
	str r5, [r1, #0x8e4]
	bl sub_02010044
	add r1, r4, #0x1000
	ldrb r1, [r1, #0x928]
	bl CanSendItem
	cmp r0, #0
	moveq r0, #3
	streqb r0, [r5]
	mov r0, #3
	bl ov01_02337648
	ldr r1, _0233E294 ; =ov04_0233F5DC
	add r3, r4, #0x84
	ldr r2, [r1, r0, lsl #3]
	add r0, r4, #0x1000
	str r2, [r0, #0x884]
	ldr r1, _0233E298 ; =ov04_0233F5D8
	ldr r0, _0233E29C ; =ov04_0233F604
	str r1, [sp]
	mov r1, #0
	ldr r2, _0233E2A0 ; =0x00000233
	add r3, r3, #0x1800
	str r1, [sp, #4]
	bl ov04_0233CAF8
	ldr r0, _0233E2A4 ; =0x00001003
	str r0, [r4]
	b _0233EEB4
_0233DA6C:
	bl sub_02043434
	cmp r0, #0
	beq _0233EEB4
	add r1, sp, #0x10
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp, #0x10]
	tst r0, #8
	beq _0233EEB4
	mov r0, #0
	bl PlaySeVolumeWrapper
	mov r0, r5
	bl sub_02043254
	ldr r1, _0233E28C ; =ov01_0233C1DC
	strh r0, [r1]
	str r5, [r4, #0xc]
	bl sub_0204317C
	mvn r1, #1
	ldr r0, _0233E2A8 ; =0x00001004
	strb r1, [r4, #8]
	str r0, [r4]
	b _0233EEB4
_0233DAC4:
	bl ov04_0233CB50
	mov r5, r0
	bl ov04_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #3
	bl ov01_02337658
	cmp r5, #3
	bne _0233DC88
	bl sub_020434FC
	mov r3, #0
	ldr r5, [r4, #0xc]
	mov r2, r3
	b _0233DB0C
_0233DAFC:
	add r1, r4, r3
	add r1, r1, #0x1000
	strb r2, [r1, #0x92e]
	add r3, r3, #1
_0233DB0C:
	cmp r3, r0
	blt _0233DAFC
	add r1, r4, #0x1000
	mov r8, #0
	str r8, [r1, #0xd18]
	cmp r0, #0
	ble _0233DBD4
	add r0, r4, #0x118
	mov sb, r8
	add r5, r0, #0x1c00
	add r7, r4, #0x7c
	mov r6, #1
	mov fp, #6
_0233DB40:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02043568
	tst r0, #1
	beq _0233DBB0
	mul sl, r8, fp
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	add r1, r7, sl
	bl ConvertStorageItemAtIdxToItem
	cmp r0, #0
	beq _0233DBB0
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemAtIdxInStorage
	add r0, r4, sl
	ldrsh r0, [r0, #0x80]
	cmp r0, #0xb4
	bne _0233DBAC
	add r0, r7, sl
	bl ov04_0233F4B0
	add r0, r4, r8
	add r0, r0, #0x1000
	strb r6, [r0, #0x92e]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0233DBAC:
	add r8, r8, #1
_0233DBB0:
	add sb, sb, #1
	cmp sb, #0x3e8
	blt _0233DB40
	bl sub_0201007C
	strh r8, [r4, #0x7a]
	ldrh r1, [r4, #0x7a]
	add r0, r4, #0x1800
	strh r1, [r0, #0x1c]
	b _0233DC70
_0233DBD4:
	bl ov04_0233CAC8
	cmp r0, #0
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bne _0233DC20
	add r1, r4, #0x70
	bl ConvertStorageItemAtIdxToItem
	ldrsh r0, [r4, #0x74]
	cmp r0, #0xb4
	bne _0233DC64
	add r0, r4, #0x70
	bl ov04_0233F4B0
	add r0, r4, #0x1000
	mov r1, #1
	strb r1, [r0, #0x92e]
	ldr r1, [r0, #0xd18]
	add r1, r1, #1
	str r1, [r0, #0xd18]
	b _0233DC64
_0233DC20:
	add r1, r4, #0x7c
	bl ConvertStorageItemAtIdxToItem
	mov r1, #1
	strh r1, [r4, #0x7a]
	add r0, r4, #0x1800
	strh r1, [r0, #0x1c]
	ldrsh r0, [r4, #0x80]
	cmp r0, #0xb4
	bne _0233DC64
	add r0, r4, #0x7c
	bl ov04_0233F4B0
	add r0, r4, #0x1000
	mov r1, #1
	strb r1, [r0, #0x92e]
	ldr r1, [r0, #0xd18]
	add r1, r1, #1
	str r1, [r0, #0xd18]
_0233DC64:
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010154
_0233DC70:
	bl sub_0204317C
	mvn r1, #1
	ldr r0, _0233E2AC ; =0x00001006
	strb r1, [r4, #8]
	str r0, [r4]
	b _0233EEB4
_0233DC88:
	cmp r5, #5
	bne _0233DCA8
	bl sub_0204317C
	mvn r1, #1
	ldr r0, _0233E2A8 ; =0x00001004
	strb r1, [r4, #8]
	str r0, [r4]
	b _0233EEB4
_0233DCA8:
	sub r0, r5, #7
	cmp r0, #1
	bhi _0233EEB4
	bl sub_020433C0
	mvn r1, #0
	ldr r0, _0233E290 ; =0x00001002
	str r1, [r4, #0xc]
	str r0, [r4]
	b _0233EEB4
_0233DCCC:
	ldrsb r1, [r4, #8]
	mvn r0, #1
	cmp r1, r0
	bne _0233DD48
	ldr r0, [r4, #0xc]
	add r1, sp, #0x12
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ConvertStorageItemAtIdxToBulkItem
	add r0, sp, #0x9c
	bl InitPreprocessorArgs
	ldrsh r2, [sp, #0x12]
	ldrh r1, [sp, #0x14]
	add r5, sp, #0x9c
#if defined(EUROPE)
	add r0, r2, #0xd3
	add r0, r0, #0x2900
#elif defined(JAPAN)
	add r0, r2, #0xce
	add r0, r0, #0x4100
#else
	add r0, r2, #0xd1
	add r0, r0, #0x2900
#endif
	mov r0, r0, lsl #0x10
	str r2, [sp, #0xac]
	str r1, [sp, #0xc0]
	str r5, [sp]
	mov r0, r0, lsr #0x10
	str r0, [sp, #4]
	ldr r0, _0233E2B0 ; =ov04_0233F614
	ldr r1, _0233E2B4 ; =0x00001013
	ldr r3, _0233E2B8 ; =0x000008E4
	mov r2, #0
	str r5, [sp, #8]
	bl CreateScrollBoxSingle
	ldr r1, _0233E25C ; =ov04_0233F644
	ldr r1, [r1]
	strb r0, [r1, #8]
_0233DD48:
	ldr r0, _0233E2BC ; =0x00001005
	str r0, [r4]
	b _0233EEB4
_0233DD54:
	ldrsb r0, [r4, #8]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0233EEB4
	ldr r0, _0233E25C ; =ov04_0233F644
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	beq _0233DD90
	bl CloseScrollBox
	ldr r0, _0233E25C ; =ov04_0233F644
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
_0233DD90:
	mvn r0, #0
	str r0, [r4, #0xc]
	bl sub_02046D20
	ldr r0, _0233E264 ; =0x00001001
	str r0, [r4]
	b _0233EEB4
_0233DDA8:
	mov r0, #0
	bl ov04_0233F294
	ldr r0, _0233E25C ; =ov04_0233F644
	ldr r1, _0233E2C0 ; =0x00001007
	ldr r0, [r0]
	str r1, [r0]
	b _0233EEB4
_0233DDC4:
	bl ov04_0233F2BC
	cmp r0, #1
	moveq r0, #0x2000
	streq r0, [r4]
	beq _0233EEB4
	cmp r0, #3
	moveq r0, #3
	beq _0233EEB8
	cmp r0, #2
	bne _0233EEB4
	mov r0, #2
	b _0233EEB8
_0233DDF4:
	bl ov04_0233CAC8
	cmp r0, #0
	bne _0233DED4
	ldr r2, [r4, #0x14]
	mov r0, #5
	strb r0, [r2]
	mov r1, #1
	strb r1, [r2, #1]
	mov r1, #0xf
	add r0, r4, #0x3ec
	strb r1, [r4, #0x58]
	add r1, r4, #0x1000
	mov r2, #0x11
	strb r2, [r1, #0x7ec]
	add r5, r0, #0x1400
	bl GetLanguageType
	strb r0, [r5, #2]
	ldrsb r2, [r5, #2]
	add r0, r4, #0x5c
	mov r1, #0x1a
	strb r2, [r4, #0x5a]
	bl ov01_02337B3C
	strb r0, [r4, #0x5b]
	add r0, r5, #4
	mov r1, #0x14
	bl ov01_02337B3C
	add r1, r4, #0x38
	strb r0, [r5, #3]
	add r0, r1, #0x1800
	mov r1, #1
	str r0, [sp, #0x7c]
	str r1, [sp, #0x78]
	ldr r1, [r4, #4]
	add r0, r4, #0x1000
	str r1, [sp, #0x88]
	ldrb r1, [r0, #0x850]
	mov r0, #0x20
	strb r1, [sp, #0x8c]
	ldr r1, [r4, #0x14]
	str r1, [sp, #0x90]
	strh r0, [sp, #0x94]
	bl ov04_0233CAA8
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	mov r2, #0
	strb r0, [sp, #0x96]
	str r2, [sp, #0x98]
	add r0, r4, #0x1900
	strh r2, [r0, #0x2a]
	add r0, r4, #0x1000
	strb r2, [r0, #0x92c]
	ldr r1, _0233E2C4 ; =0x00002001
	strb r2, [r0, #0x92d]
	str r1, [r4]
	b _0233DFB0
_0233DED4:
	ldr r1, [r4, #0x14]
	mov r0, #8
	strb r0, [r1]
	mov r0, #0
	strb r0, [r1, #1]
	mov r2, #0x13
	strb r2, [r4, #0x76]
	add r1, r4, #0x3ec
	add r0, r4, #4
	add r2, r4, #0x1000
	mov r3, #0x14
	strb r3, [r2, #0x804]
	mov r3, #0x11
	strb r3, [r2, #0x7ec]
	add r6, r1, #0x1400
	add r5, r0, #0x1800
	bl GetLanguageType
	strb r0, [r6, #2]
	ldrsb r2, [r6, #2]
	ldr r1, _0233E2C8 ; =0x00001772
	add r0, r4, #0x7a
	strb r2, [r5, #2]
	strb r2, [r4, #0x78]
	bl ov01_02337B3C
	strb r0, [r4, #0x79]
	add r0, r5, #4
	mov r1, #0x16
	bl ov01_02337B3C
	strb r0, [r5, #3]
	add r0, r6, #4
	mov r1, #0x14
	bl ov01_02337B3C
	add r1, r4, #0x820
	add r2, r4, #0x38
	strb r0, [r6, #3]
	add r0, r2, #0x1800
	mov r2, #2
	add r1, r1, #0x1000
	str r2, [sp, #0x78]
	str r0, [sp, #0x80]
	str r1, [sp, #0x7c]
	ldr r1, [r4, #4]
	add r0, r4, #0x1000
	str r1, [sp, #0x88]
	ldrb r0, [r0, #0x850]
	mov r2, #0x20
	mov r1, #1
	strb r0, [sp, #0x8c]
	ldr r3, [r4, #0x14]
	ldr r0, _0233E2CC ; =0x00002011
	str r3, [sp, #0x90]
	strh r2, [sp, #0x94]
	strb r1, [sp, #0x96]
	str r1, [sp, #0x98]
	str r0, [r4]
_0233DFB0:
	add r0, sp, #0x78
	add r1, r4, #0x1000
	mov r2, #0
	strb r2, [r1, #0x853]
	bl ov01_02337BA0
	b _0233EEB4
_0233DFC8:
	bl ov01_02337E0C
	movs r5, r0
	beq _0233EEB4
	add r0, sp, #0x400
	add r1, r4, #0x3ec
	add r0, r0, #0x54
	add r7, r1, #0x1400
	bl InitPreprocessorArgs
	cmp r5, #0xe
	addls pc, pc, r5, lsl #2
	b _0233EEB4
_0233DFF4: ; jump table
	b _0233EEB4 ; case 0
	b _0233E1B4 ; case 1
	b _0233EEB4 ; case 2
	b _0233EEB4 ; case 3
	b _0233E030 ; case 4
	b _0233E1B4 ; case 5
	b _0233E1B4 ; case 6
	b _0233E1B4 ; case 7
	b _0233E1B4 ; case 8
	b _0233E1B4 ; case 9
	b _0233E1B4 ; case 10
	b _0233E1B4 ; case 11
	b _0233E1B4 ; case 12
	b _0233E1B4 ; case 13
	b _0233E1B4 ; case 14
_0233E030:
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r5, r0
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r6, r0
	bl ov04_0233CAA8
	cmp r0, #0
	bne _0233E114
	bl ov04_0233F534
	add r0, r4, #0x1000
	ldrb r0, [r0, #0x92e]
	cmp r0, #0
	beq _0233E084
	add r0, sp, #0x1c
	mov r1, #0xb4
	mov r2, #0
	bl InitStandardItem
	b _0233E09C
_0233E084:
	ldrh r0, [r4, #0x70]
	strh r0, [sp, #0x1c]
	ldrh r0, [r4, #0x72]
	strh r0, [sp, #0x1e]
	ldrh r0, [r4, #0x74]
	strh r0, [sp, #0x20]
_0233E09C:
	bl ov01_02337C54
	bl GetLanguageType
	ldrsb r1, [r7, #2]
	cmp r1, r0
	bne _0233E0C4
	mov r0, r5
	add r1, r7, #4
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0233E0D0
_0233E0C4:
	ldr r1, _0233E2D0 ; =0x000038C9
	mov r0, r5
	bl GetStringFromFileVeneer
_0233E0D0:
	ldr r2, _0233E2D4 ; =ov04_0233F5F8
	mov r7, #0
	add r1, sp, #0x1c
	mov r0, r6
	mov r3, #1
	str r7, [sp]
	bl sub_0200D310
	add r2, sp, #0x400
	ldr r1, _0233E2D8 ; =0x000037CC
	add r2, r2, #0x54
	mov r0, #0x1c
	str r5, [sp, #0x48c]
	str r6, [sp, #0x490]
	bl ov04_02046BE8
	mov r0, #0x4000
	str r0, [r4]
	b _0233E1A0
_0233E114:
	bl ov04_0233CAA8
	cmp r0, #1
	bne _0233E1A0
	bl GetLanguageType
	ldrsb r1, [r4, #0x5a]
	cmp r1, r0
	bne _0233E144
	mov r0, r5
	add r1, r4, #0x5c
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0233E150
_0233E144:
	ldr r1, _0233E2D0 ; =0x000038C9
	mov r0, r5
	bl GetStringFromFileVeneer
_0233E150:
	mov r1, #0
	str r1, [sp]
	ldr r2, _0233E2D4 ; =ov04_0233F5F8
	mov r0, r6
	add r1, r4, #0x70
	mov r3, #1
	bl sub_0200D310
	add r2, sp, #0x400
	str r5, [sp, #0x48c]
	str r6, [sp, #0x490]
	add r0, r4, #0x1000
	mov r3, #1
	strb r3, [r0, #0x851]
	mov r0, #0
	ldr r1, _0233E2DC ; =0x000037CE
	add r2, r2, #0x54
	str r0, [r4, #0x10]
	bl ov04_02046BE8
	mov r0, #0x5000
	str r0, [r4]
_0233E1A0:
	mov r0, r5
	bl MemFree
	mov r0, r6
	bl MemFree
	b _0233EEB4
_0233E1B4:
	bl ov01_02337C54
	bl ov04_0233CAA8
	cmp r0, #0
	moveq r0, #0x3000
	streq r0, [r4]
	beq _0233EEB4
	add r0, r4, #0x1900
	ldrh r0, [r0, #0x2a]
	cmp r0, #0
	beq _0233E234
	add r0, sp, #0x400
	add r0, r0, #4
	bl InitPreprocessorArgs
	add r0, r4, #0x1900
	ldrh r1, [r0, #0x2a]
	add r0, r4, #0x1000
	str r1, [sp, #0x428]
	ldrb r1, [r0, #0x92c]
	cmp r1, #0
	ldrne r1, _0233E2E0 ; =0x000037D3
	bne _0233E218
	ldrb r0, [r0, #0x92d]
	cmp r0, #0
	ldrne r1, _0233E2E4 ; =0x000037D2
	ldreq r1, _0233E2E8 ; =0x000037D1
_0233E218:
	add r2, sp, #0x400
	add r2, r2, #4
	mov r0, #0x1c
	bl ov04_02046BE8
	ldr r0, _0233E2EC ; =0x00005008
	str r0, [r4]
	b _0233EEB4
_0233E234:
	mov r0, #1
	b _0233EEB8
_0233E23C:
	add r0, r4, #0x1000
	ldrb r0, [r0, #0x850]
	cmp r0, #0
	mov r0, #1
	bne _0233E2FC
	ldr r1, _0233E2F0 ; =ov04_0233EF28
	bl ov01_0232B5D0
	b _0233E304
	.align 2, 0
#if defined(EUROPE)
#define OV04_0233D2F8_OFFSET 2
#elif defined(JAPAN)
#define OV04_0233D2F8_OFFSET 0x164
#else
#define OV04_0233D2F8_OFFSET 0
#endif
_0233E25C: .word ov04_0233F644
_0233E260: .word 0x00002020
_0233E264: .word 0x00001001
_0233E268: .word 0x00005001
_0233E26C: .word 0x00003002
_0233E270: .word ov04_0233EF8C
_0233E274: .word 0x000037C1 + OV04_0233D2F8_OFFSET
_0233E278: .word ov01_02337B68
_0233E27C: .word 0x000037C2 + OV04_0233D2F8_OFFSET
_0233E280: .word 0x00001776
_0233E284: .word ov04_0233F0A8
_0233E288: .word ov04_0233F0E0
#ifdef EUROPE
_0233EA08: .word 0x000037C2
#endif
_0233E28C: .word ov01_0233C1DC
_0233E290: .word 0x00001002
_0233E294: .word ov04_0233F5DC
_0233E298: .word ov04_0233F5D8
_0233E29C: .word ov04_0233F604
_0233E2A0: .word 0x00000233
_0233E2A4: .word 0x00001003
_0233E2A8: .word 0x00001004
_0233E2AC: .word 0x00001006
_0233E2B0: .word ov04_0233F614
_0233E2B4: .word 0x00001013
#ifdef JAPAN
_0233E2B8: .word 0x00001D3C
#else
_0233E2B8: .word 0x000008E4
#endif
_0233E2BC: .word 0x00001005
_0233E2C0: .word 0x00001007
_0233E2C4: .word 0x00002001
_0233E2C8: .word 0x00001772
_0233E2CC: .word 0x00002011
#ifdef JAPAN
_0233E2D0: .word 0x00003507
#else
_0233E2D0: .word 0x000038C9 + OV04_0233D2F8_OFFSET
#endif
_0233E2D4: .word ov04_0233F5F8
_0233E2D8: .word 0x000037CC + OV04_0233D2F8_OFFSET
_0233E2DC: .word 0x000037CE + OV04_0233D2F8_OFFSET
_0233E2E0: .word 0x000037D3 + OV04_0233D2F8_OFFSET
_0233E2E4: .word 0x000037D2 + OV04_0233D2F8_OFFSET
_0233E2E8: .word 0x000037D1 + OV04_0233D2F8_OFFSET
_0233E2EC: .word 0x00005008
_0233E2F0: .word ov04_0233EF28
_0233E2F4: .word ov04_0233EF54
_0233E2F8: .word 0x00002012
_0233E2FC:
	ldr r1, _0233E2F4 ; =ov04_0233EF54
	bl ov01_0232B5D0
_0233E304:
	bl ov01_02337E0C
	cmp r0, #0xf
	bne _0233E37C
	add r0, r4, #0x1000
	ldrb r0, [r0, #0x850]
	cmp r0, #0
	ldreq r0, _0233E2F8 ; =0x00002012
	streq r0, [r4]
	beq _0233EEB4
	add r0, sp, #0x3b4
	bl InitPreprocessorArgs
	add r0, sp, #0x4c
	mov r1, #0x2a
	bl MemZero
	add r1, r4, #8
	add r0, sp, #0x4c
	add r1, r1, #0x1800
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpySimpleNoPadSafe
	add r3, sp, #0x4c
	ldr r1, _0233EEC4 ; =0x000037C9
	add r2, sp, #0x3b4
	mov r0, #0
	str r3, [sp, #0x3ec]
	bl ov04_02046BE8
	mov r0, #0
	bl ov01_02337D00
	ldr r0, _0233EEC8 ; =0x00002014
	str r0, [r4]
	b _0233EEB4
_0233E37C:
	cmp r0, #0
	beq _0233EEB4
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _0233EEB4
_0233E390: ; jump table
	b _0233EEB4 ; case 0
	b _0233E41C ; case 1
	b _0233EEB4 ; case 2
	b _0233EEB4 ; case 3
	b _0233E3CC ; case 4
	b _0233E41C ; case 5
	b _0233E41C ; case 6
	b _0233E41C ; case 7
	b _0233E41C ; case 8
	b _0233E41C ; case 9
	b _0233E41C ; case 10
	b _0233E41C ; case 11
	b _0233E41C ; case 12
	b _0233E41C ; case 13
	b _0233E41C ; case 14
_0233E3CC:
	add r0, r4, #0x1000
	ldrb r1, [r0, #0x852]
	cmp r1, #0
	bne _0233E40C
	ldrb r0, [r0, #0x850]
	cmp r0, #0
	mov r0, #0x1c
	beq _0233E3F8
	ldr r1, _0233EECC ; =0x000037CB
	bl ov04_0233CB84
	b _0233E400
_0233E3F8:
	ldr r1, _0233EED0 ; =0x000037CA
	bl ov04_0233CB84
_0233E400:
	ldr r0, _0233EED4 ; =0x00002015
	str r0, [r4]
	b _0233EEB4
_0233E40C:
	bl ov01_02337DD0
	ldr r0, _0233EED8 ; =0x00002016
	str r0, [r4]
	b _0233EEB4
_0233E41C:
	bl ov01_02337C54
	bl ov04_0233CAA8
	cmp r0, #0
	moveq r0, #0x3000
	streq r0, [r4]
	beq _0233EEB4
	mov r0, #1
	b _0233EEB8
_0233E43C:
	bl ov01_02337C90
	cmp r0, #0
	bne _0233E4E4
	add r0, r4, #0x1000
	ldrb r0, [r0, #0x853]
	cmp r0, #0
	beq _0233E4E4
	add r0, sp, #0x364
	bl InitPreprocessorArgs
	add r0, sp, #0x22
	mov r1, #0x2a
	bl MemZero
	add r1, r4, #0x7f0
	add r0, sp, #0x22
	add r1, r1, #0x1000
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	add r1, sp, #0x22
	str r1, [sp, #0x39c]
	add r0, sp, #0x2cc
	mov r1, #0x98
	bl MemZero
	mov r0, #4
	bl ov01_02337648
	ldr r2, _0233EEDC ; =ov04_0233F56C
	ldr r1, _0233EEE0 ; =ov04_0233F568
	ldr r2, [r2, r0, lsl #3]
	ldr r0, _0233EEE4 ; =0x000037C6
	str r2, [sp, #0x2cc]
	str r1, [sp]
	str r0, [sp, #4]
	add r1, sp, #0x364
	mov r0, #0
	str r1, [sp, #8]
	mov r1, r0
	mov r2, #0x31
	add r3, sp, #0x2cc
	bl ov04_0233CB24
	mov r0, #0
	bl ov01_02337D00
	ldr r0, _0233EEE8 ; =0x00002013
	str r0, [r4]
_0233E4E4:
	bl ov01_02337E0C
	movs r5, r0
	cmpne r5, #0xf
	beq _0233EEB4
	bl ov01_02337C54
	cmp r5, #0xf
	addls pc, pc, r5, lsl #2
	b _0233EEB4
_0233E504: ; jump table
	b _0233EEB4 ; case 0
	b _0233E544 ; case 1
	b _0233EEB4 ; case 2
	b _0233EEB4 ; case 3
	b _0233EEB4 ; case 4
	b _0233E544 ; case 5
	b _0233E544 ; case 6
	b _0233E544 ; case 7
	b _0233E544 ; case 8
	b _0233E544 ; case 9
	b _0233E544 ; case 10
	b _0233E544 ; case 11
	b _0233E544 ; case 12
	b _0233E544 ; case 13
	b _0233E544 ; case 14
	b _0233EEB4 ; case 15
_0233E544:
	bl ov04_0233CAA8
	cmp r0, #0
	moveq r0, #0x3000
	streq r0, [r4]
	beq _0233EEB4
	mov r0, #1
	b _0233EEB8
_0233E560:
	bl ov01_02337C90
	cmp r0, #0
	bne _0233E5F4
	bl ov04_0233CB50
	mov r5, r0
	bl ov04_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #4
	bl ov01_02337658
	cmp r5, #3
	bne _0233E5BC
	mov r0, #1
	add r2, sp, #0xe
	mov r1, r0
	strb r0, [sp, #0xe]
	add r3, r4, #0x1000
	strb r0, [r3, #0x852]
	bl ov01_0232B540
	bl ov01_02337CAC
	ldr r0, _0233E2CC ; =0x00002011
	str r0, [r4]
	b _0233E5F4
_0233E5BC:
	sub r0, r5, #7
	cmp r0, #1
	bhi _0233E5F4
	mov r5, #0
	mov r0, #1
	add r2, sp, #0xd
	mov r1, r0
	strb r5, [sp, #0xd]
	add r3, r4, #0x1000
	strb r5, [r3, #0x852]
	bl ov01_0232B540
	bl ov01_02337CAC
	ldr r0, _0233E2CC ; =0x00002011
	str r0, [r4]
_0233E5F4:
	bl ov01_02337E0C
	movs r5, r0
	cmpne r5, #0xf
	beq _0233EEB4
	bl ov01_02337C54
	cmp r5, #0xf
	addls pc, pc, r5, lsl #2
	b _0233EEB4
_0233E614: ; jump table
	b _0233EEB4 ; case 0
	b _0233E654 ; case 1
	b _0233EEB4 ; case 2
	b _0233EEB4 ; case 3
	b _0233EEB4 ; case 4
	b _0233E654 ; case 5
	b _0233E654 ; case 6
	b _0233E654 ; case 7
	b _0233E654 ; case 8
	b _0233E654 ; case 9
	b _0233E654 ; case 10
	b _0233E654 ; case 11
	b _0233E654 ; case 12
	b _0233E654 ; case 13
	b _0233E654 ; case 14
	b _0233EEB4 ; case 15
_0233E654:
	bl ov04_0233CAA8
	cmp r0, #0
	moveq r0, #0x3000
	streq r0, [r4]
	beq _0233EEB4
	mov r0, #1
	b _0233EEB8
_0233E670:
	bl ov01_02337C90
	cmp r0, #0
	bne _0233E6D4
	bl ov04_0233CBA0
	cmp r0, #8
	bne _0233E6D4
	bl sub_0200FD48
	mov r5, r0
	bl CountNbOfItemsInStorage
	add r1, r4, #0x1800
	ldrh r1, [r1, #0x1c]
	sub r0, r5, r0
	add r2, sp, #0xc
	cmp r1, r0
	movle r1, #0
	strleb r1, [sp, #0xc]
	movgt r1, #1
	strgtb r1, [sp, #0xc]
	add r0, r4, #0x1000
	strb r1, [r0, #0x854]
	mov r0, #1
	mov r1, r0
	bl ov01_0232B540
	cmp r0, #0
	beq _0233EEB4
_0233E6D4:
	bl ov01_02337E0C
	movs r5, r0
	cmpne r5, #0xf
	beq _0233EEB4
	bl ov01_02337C54
	cmp r5, #0xe
	addls pc, pc, r5, lsl #2
	b _0233EEB4
_0233E6F4: ; jump table
	b _0233EEB4 ; case 0
	b _0233E730 ; case 1
	b _0233EEB4 ; case 2
	b _0233EEB4 ; case 3
	b _0233EEB4 ; case 4
	b _0233E730 ; case 5
	b _0233E730 ; case 6
	b _0233E730 ; case 7
	b _0233E730 ; case 8
	b _0233E730 ; case 9
	b _0233E730 ; case 10
	b _0233E730 ; case 11
	b _0233E730 ; case 12
	b _0233E730 ; case 13
	b _0233E730 ; case 14
_0233E730:
	bl ov04_0233CAA8
	cmp r0, #0
	moveq r0, #0x3000
	streq r0, [r4]
	beq _0233EEB4
	mov r0, #1
	b _0233EEB8
_0233E74C:
	bl ov04_0233CBA0
	cmp r0, #8
	bne _0233EEB4
	bl ov01_02337D30
	add r0, r4, #0x1000
	mov r2, #0
	ldr r1, _0233E2CC ; =0x00002011
	strb r2, [r0, #0x853]
	str r1, [r4]
	b _0233EEB4
_0233E774:
	bl ov01_02337E0C
	cmp r0, #0
	beq _0233EEB4
	bl ov01_02337C54
	add r0, r4, #0x1000
	ldrb r1, [r0, #0x854]
	cmp r1, #0
	beq _0233E828
	ldrb r0, [r0, #0x850]
	cmp r0, #0
	beq _0233E7B0
	ldr r1, _0233EEEC ; =0x000037D0
	mov r0, #0x1c
	bl ov04_0233CB84
	b _0233E81C
_0233E7B0:
	add r0, sp, #0x27c
	bl InitPreprocessorArgs
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r5, r0
	bl GetLanguageType
	add r1, r4, #0x1700
	ldrsb r1, [r1, #0xee]
	cmp r1, r0
	bne _0233E7F4
	add r1, r4, #0x7f0
	mov r0, r5
	add r1, r1, #0x1000
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0233E800
_0233E7F4:
	ldr r1, _0233E2D0 ; =0x000038C9
	mov r0, r5
	bl GetStringFromFileVeneer
_0233E800:
	ldr r1, _0233EEF0 ; =0x000037D4
	add r2, sp, #0x27c
	mov r0, #0x1c
	str r5, [sp, #0x2b4]
	bl ov04_02046BE8
	mov r0, r5
	bl MemFree
_0233E81C:
	ldr r0, _0233E260 ; =0x00002020
	str r0, [r4]
	b _0233EEB4
_0233E828:
	add r1, r4, #4
	add r2, r4, #0x3ec
	add r0, sp, #0x22c
	add r7, r1, #0x1800
	add r8, r2, #0x1400
	bl InitPreprocessorArgs
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r5, r0
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	add r1, r4, #0x1000
	ldrb r2, [r1, #0x850]
	mov r6, r0
	cmp r2, #0
	bne _0233E938
	ldrb r0, [r1, #0x92e]
	cmp r0, #0
	beq _0233E890
	add r0, sp, #0x16
	mov r1, #0xb4
	mov r2, #0
	bl InitStandardItem
	b _0233E8A8
_0233E890:
	ldrh r0, [r4, #0x7c]
	strh r0, [sp, #0x16]
	ldrh r0, [r4, #0x7e]
	strh r0, [sp, #0x18]
	ldrh r0, [r4, #0x80]
	strh r0, [sp, #0x1a]
_0233E8A8:
	bl GetLanguageType
	ldrsb r1, [r8, #2]
	cmp r1, r0
	bne _0233E8CC
	mov r0, r5
	add r1, r8, #4
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0233E8D8
_0233E8CC:
	ldr r1, _0233E2D0 ; =0x000038C9
	mov r0, r5
	bl GetStringFromFileVeneer
_0233E8D8:
	mov r3, #0
	str r3, [sp]
	ldr r2, _0233E2D4 ; =ov04_0233F5F8
	add r1, sp, #0x16
	mov r0, r6
	mov r3, #1
	bl sub_0200D310
	str r5, [sp, #0x264]
	str r6, [sp, #0x268]
	ldrh r0, [r4, #0x7a]
	add r2, sp, #0x22c
	str r0, [sp, #0x250]
	ldrh r0, [r4, #0x7a]
	cmp r0, #1
	ldrhi r0, _0233EEF4 ; =0x000037CD
	ldrls r0, _0233E2D8 ; =0x000037CC
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #0x1c
	bl ov04_02046BE8
	bl ov04_0233F534
	mov r0, #0x4000
	str r0, [r4]
	b _0233E9C0
_0233E938:
	bl GetLanguageType
	ldrsb r1, [r7, #2]
	cmp r1, r0
	bne _0233E95C
	mov r0, r5
	add r1, r7, #4
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0233E968
_0233E95C:
	ldr r1, _0233E2D0 ; =0x000038C9
	mov r0, r5
	bl GetStringFromFileVeneer
_0233E968:
	mov r1, #0
	str r1, [sp]
	ldr r2, _0233E2D4 ; =ov04_0233F5F8
	mov r0, r6
	add r1, r4, #0x7c
	mov r3, #1
	bl sub_0200D310
	str r5, [sp, #0x264]
	str r6, [sp, #0x268]
	ldrh r0, [r4, #0x7a]
	add r2, sp, #0x22c
	str r0, [sp, #0x250]
	ldrh r0, [r4, #0x7a]
	cmp r0, #1
	ldrhi r0, _0233EEF8 ; =0x000037CF
	ldrls r0, _0233E2DC ; =0x000037CE
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #0x1c
	bl ov04_02046BE8
	mov r0, #0x5000
	str r0, [r4]
_0233E9C0:
	mov r0, r5
	bl MemFree
	mov r0, r6
	bl MemFree
	b _0233EEB4
_0233E9D4:
	bl ov04_0233CBA0
	cmp r0, #8
	bne _0233EEB4
	add r0, r4, #0x1000
	ldrb r0, [r0, #0x850]
	cmp r0, #0
	movne r0, #1
	bne _0233EEB8
	mov r0, #0x3000
	str r0, [r4]
	b _0233EEB4
_0233EA00:
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r8, r0
	add r0, sp, #0x1dc
	bl InitPreprocessorArgs
	bl ov04_0233CAC8
	cmp r0, #0
	bne _0233EA78
	add r0, r4, #0x1000
	ldrb r0, [r0, #0x92e]
	cmp r0, #0
	beq _0233EA44
	add r0, r4, #0x70
	mov r1, #0xb4
	mov r2, #0
	bl InitStandardItem
_0233EA44:
	ldr r2, _0233E2D4 ; =ov04_0233F5F8
	mov r5, #0
	mov r0, r8
	add r1, r4, #0x70
	mov r3, #1
	str r5, [sp]
	bl sub_0200D310
#ifdef JAPAN
	mov r0, #0x1c
	add r2, sp, #0x1dc
	rsb r1, r0, #0x3500
#else
	ldr r1, _0233EEFC ; =0x000038A6
	add r2, sp, #0x1dc
	mov r0, #0x1c
#endif
	str r8, [sp, #0x214]
	bl ov04_02046BE8
	b _0233EB0C
_0233EA78:
	mov sb, #0
	add r7, r4, #0x7c
	mov r6, #0xb4
	mov r5, sb
	mov sl, #6
	b _0233EAB8
_0233EA90:
	add r0, r4, sb
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x92e]
	cmp r0, #0
	beq _0233EAB4
	mla r0, sb, sl, r7
	mov r1, r6
	mov r2, r5
	bl InitStandardItem
_0233EAB4:
	add sb, sb, #1
_0233EAB8:
	ldrh r0, [r4, #0x7a]
	cmp sb, r0
	blt _0233EA90
	cmp r0, #1
	bls _0233EADC
	ldr r1, _0233EF00 ; =0x000037D5
	mov r0, #0x1c
	bl ov04_0233CB84
	b _0233EB0C
_0233EADC:
	ldr r2, _0233E2D4 ; =ov04_0233F5F8
	mov r5, #0
	mov r0, r8
	add r1, r4, #0x7c
	mov r3, #1
	str r5, [sp]
	bl sub_0200D310
#ifdef JAPAN
	mov r0, #0x1c
	add r2, sp, #0x1dc
	rsb r1, r0, #0x3500
#else
	ldr r1, _0233EEFC ; =0x000038A6
	add r2, sp, #0x1dc
	mov r0, #0x1c
#endif
	str r8, [sp, #0x214]
	bl ov04_02046BE8
_0233EB0C:
	mov r0, r8
	bl MemFree
	ldr r0, _0233EF04 ; =0x00003001
	str r0, [r4]
	b _0233EEB4
_0233EB20:
	bl ov04_0233CBA0
	cmp r0, #8
	bne _0233EEB4
	bl ov04_0233CAC8
	cmp r0, #0
	bne _0233EB50
	add r0, r4, #0x70
	bl AddItemToStorage
	mov r0, #0
	strh r0, [r4, #0x74]
	strh r0, [r4, #0x72]
	b _0233EB8C
_0233EB50:
	mov r8, #0
	add r7, r4, #0x7c
	mov r6, r8
	mov r5, #6
	b _0233EB80
_0233EB64:
	mul sb, r8, r5
	add r0, r7, sb
	bl AddItemToStorage
	add r0, r4, sb
	strh r6, [r0, #0x80]
	strh r6, [r0, #0x7e]
	add r8, r8, #1
_0233EB80:
	ldrh r0, [r4, #0x7a]
	cmp r8, r0
	blt _0233EB64
_0233EB8C:
	ldr r0, _0233E26C ; =0x00003002
	str r0, [r4]
	b _0233EEB4
_0233EB98:
	mov r0, #0
	bl ov04_0233F294
	ldr r0, _0233EF08 ; =0x00003003
	str r0, [r4]
	b _0233EEB4
_0233EBAC:
	bl ov04_0233F2BC
	cmp r0, #1
	moveq r0, #1
	beq _0233EEB8
	cmp r0, #3
	moveq r0, #3
	beq _0233EEB8
	cmp r0, #2
	bne _0233EEB4
	mov r0, #2
	b _0233EEB8
_0233EBD8:
	bl ov04_0233CBA0
	cmp r0, #8
	bne _0233EEB4
	mov r0, #2
	b _0233EEB8
_0233EBEC:
	bl ov04_0233CBA0
	mov r5, r0
	bl ov04_0233CAC8
	cmp r0, #0
	bne _0233EC44
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	cmp r0, #0xb4
	ble _0233EEB4
	bl ov04_0233CAE8
	cmp r0, #0
	beq _0233EC38
	ldrsh r0, [r4, #0x74]
	bl sub_0200D8E4
	cmp r0, #0
	ldrne r0, _0233EF0C ; =0x00005003
	strne r0, [r4]
	bne _0233EEB4
_0233EC38:
	ldr r0, _0233EF10 ; =0x00005005
	str r0, [r4]
	b _0233EEB4
_0233EC44:
	cmp r5, #8
	bne _0233EEB4
	add r0, sp, #0x18c
	bl InitPreprocessorArgs
	ldrh r3, [r4, #0x7a]
	ldr r1, _0233E2E8 ; =0x000037D1
	add r2, sp, #0x18c
	mov r0, #0x1c
	str r3, [sp, #0x1b0]
	bl ov04_02046BE8
	mov r7, #0
	add r6, r4, #0x7c
	mov r5, #6
	b _0233EC88
_0233EC7C:
	mla r0, r7, r5, r6
	bl AddItemToStorage
	add r7, r7, #1
_0233EC88:
	ldrh r0, [r4, #0x7a]
	cmp r7, r0
	blt _0233EC7C
	add r0, r4, #0x1000
	mov r1, #1
	strb r1, [r0, #0x851]
	mov r1, #0
	ldr r0, _0233E2EC ; =0x00005008
	str r1, [r4, #0x10]
	str r0, [r4]
	b _0233EEB4
_0233ECB4:
	add r0, r4, #0x58
	add r0, r0, #0x1800
	bl sub_0206351C
	add r3, r4, #0x1000
	mov r0, #2
	strb r0, [r3, #0x85a]
	ldrsh r2, [r4, #0x74]
	add r1, r4, #0x1800
	add r0, r4, #0x58
	strh r2, [r1, #0x6c]
	ldrh r5, [r4, #0x72]
	mov r2, #1
	add r0, r0, #0x1800
	strh r5, [r1, #0x6a]
	str r2, [r3, #0x864]
	mov r1, #0
	mov r2, #0x10
	str r1, [r3, #0x880]
	bl sub_0203D438
	ldr r0, _0233EF14 ; =0x00005002
	str r0, [r4]
	b _0233EEB4
_0233ED0C:
	bl sub_0203D538
	cmp r0, #1
	bne _0233EEB4
	bl sub_0203EFD4
	ldr r0, _0233EF18 ; =0x00005006
	str r0, [r4]
	b _0233EEB4
_0233ED28:
	add r0, sp, #0x13c
	bl InitPreprocessorArgs
	ldrsh r0, [r4, #0x74]
	str r0, [sp, #0x14c]
	ldrsh r0, [r4, #0x74]
	bl sub_0200D8E4
	strh r0, [r4, #0x74]
	ldrsh r3, [r4, #0x74]
	ldr r1, _0233EF1C ; =0x000037DA
	add r2, sp, #0x13c
	mov r0, #0
	str r3, [sp, #0x150]
	bl ov04_02046BE8
	ldr r1, _0233EF20 ; =0x00005004
	mov r0, #0
	str r1, [r4]
	str r0, [r4, #0x10]
	b _0233EEB4
_0233ED70:
	bl ov04_0233CBA0
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	cmp r0, #0xb4
	ldrgt r0, _0233EF10 ; =0x00005005
	strgt r0, [r4]
	b _0233EEB4
_0233ED90:
	add r0, r4, #0x70
	bl AddItemToStorage
	add r0, r4, #0x1900
	ldrh r2, [r0, #0x2a]
	ldr r1, _0233EF18 ; =0x00005006
	add r2, r2, #1
	strh r2, [r0, #0x2a]
	str r1, [r4]
_0233EDB0:
	bl ov04_0233CAC8
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bl ov04_0233F294
	ldr r0, _0233EF24 ; =0x00005007
	str r0, [r4]
	b _0233EEB4
_0233EDD4:
	bl ov04_0233F2BC
	cmp r0, #1
	bne _0233EE74
	bl ov04_0233CAC8
	cmp r0, #0
	bne _0233EE6C
	ldr r0, _0233E25C ; =ov04_0233F644
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x928]
	bl sub_0204316C
	bl sub_02043380
	cmp r0, #0
	beq _0233EE28
	bl ov01_02337DD0
	mov r1, #1
	add r0, r4, #0x1000
	strb r1, [r0, #0x92c]
	add r0, r1, #0x2000
	str r0, [r4]
	b _0233EEB4
_0233EE28:
	bl sub_02003B5C
	cmp r0, #0
	beq _0233EE50
	bl ov01_02337DD0
	ldr r0, _0233E25C ; =ov04_0233F644
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1000
	strb r1, [r0, #0x92d]
	b _0233EE60
_0233EE50:
	bl ov01_02337D30
	add r0, r4, #0x1000
	mov r1, #0
	strb r1, [r0, #0x853]
_0233EE60:
	ldr r0, _0233E2C4 ; =0x00002001
	str r0, [r4]
	b _0233EEB4
_0233EE6C:
	mov r0, #2
	b _0233EEB8
_0233EE74:
	cmp r0, #3
	moveq r0, #3
	beq _0233EEB8
	cmp r0, #2
	bne _0233EEB4
	mov r0, #2
	b _0233EEB8
_0233EE90:
	bl ov04_0233CBA0
	cmp r0, #8
	bne _0233EEB4
	bl ov04_0233CAC8
	cmp r0, #0
	moveq r0, #2
	beq _0233EEB8
	ldr r0, _0233EF18 ; =0x00005006
	str r0, [r4]
_0233EEB4:
	mov r0, #0
_0233EEB8:
	add sp, sp, #0xa4
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV04_0233D2F8_OFFSET 2
#elif defined(JAPAN)
#define OV04_0233D2F8_OFFSET 0x164
#else
#define OV04_0233D2F8_OFFSET 0
#endif
_0233EEC4: .word 0x000037C9 + OV04_0233D2F8_OFFSET
_0233EEC8: .word 0x00002014
_0233EECC: .word 0x000037CB + OV04_0233D2F8_OFFSET
_0233EED0: .word 0x000037CA + OV04_0233D2F8_OFFSET
_0233EED4: .word 0x00002015
_0233EED8: .word 0x00002016
_0233EEDC: .word ov04_0233F56C
_0233EEE0: .word ov04_0233F568
_0233EEE4: .word 0x000037C6 + OV04_0233D2F8_OFFSET
_0233EEE8: .word 0x00002013
_0233EEEC: .word 0x000037D0 + OV04_0233D2F8_OFFSET
_0233EEF0: .word 0x000037D4 + OV04_0233D2F8_OFFSET
_0233EEF4: .word 0x000037CD + OV04_0233D2F8_OFFSET
_0233EEF8: .word 0x000037CF + OV04_0233D2F8_OFFSET
#ifndef JAPAN
_0233EEFC: .word 0x000038A6 + OV04_0233D2F8_OFFSET
#endif
_0233EF00: .word 0x000037D5 + OV04_0233D2F8_OFFSET
_0233EF04: .word 0x00003001
_0233EF08: .word 0x00003003
_0233EF0C: .word 0x00005003
_0233EF10: .word 0x00005005
_0233EF14: .word 0x00005002
_0233EF18: .word 0x00005006
_0233EF1C: .word 0x000037DA + OV04_0233D2F8_OFFSET
_0233EF20: .word 0x00005004
_0233EF24: .word 0x00005007
	arm_func_end ov04_0233D2F8

	arm_func_start ov04_0233EF28
ov04_0233EF28: ; 0x0233EF28
	ldr r2, _0233EF50 ; =ov04_0233F644
	ldrb r3, [r1]
	ldr r0, [r2]
	mov r1, #1
	add r0, r0, #0x1000
	strb r3, [r0, #0x854]
	ldr r0, [r2]
	add r0, r0, #0x1000
	strb r1, [r0, #0x853]
	bx lr
	.align 2, 0
_0233EF50: .word ov04_0233F644
	arm_func_end ov04_0233EF28

	arm_func_start ov04_0233EF54
ov04_0233EF54: ; 0x0233EF54
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl ov01_02337CAC
	ldr r1, _0233EF84 ; =ov04_0233F644
	ldrb r3, [r4]
	ldr r0, [r1]
	ldr r2, _0233EF88 ; =0x00002011
	add r0, r0, #0x1000
	strb r3, [r0, #0x852]
	ldr r0, [r1]
	str r2, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233EF84: .word ov04_0233F644
_0233EF88: .word 0x00002011
	arm_func_end ov04_0233EF54

	arm_func_start ov04_0233EF8C
ov04_0233EF8C: ; 0x0233EF8C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov04_0233CAA8
	cmp r0, #1
	bne _0233F0A0
	add r0, r4, #4
	mov r1, #0x1a
	bl ov01_02337B3C
	ldrb r1, [r4, #3]
	cmp r0, r1
	movne r0, #3
	ldmneia sp!, {r4, pc}
	ldrb r0, [r4]
	cmp r0, #0xf
	movne r0, #2
	ldmneia sp!, {r4, pc}
	ldrsh r0, [r4, #0x1c]
	cmp r0, #0
	beq _0233F098
	ldrsh r0, [r4, #0x1c]
	bl IsItemValidVeneer
	cmp r0, #0
	beq _0233EFFC
	ldrsh r0, [r4, #0x1c]
	mov r1, #0
	bl CanSendItem
	cmp r0, #0
	bne _0233F004
_0233EFFC:
	mov r0, #6
	ldmia sp!, {r4, pc}
_0233F004:
	ldrsh r0, [r4, #0x1c]
	bl GetItemCategory
	cmp r0, #0xc
	bgt _0233F034
	bge _0233F06C
	cmp r0, #1
	bgt _0233F098
	cmp r0, #0
	blt _0233F098
	cmpne r0, #1
	beq _0233F050
	b _0233F098
_0233F034:
	cmp r0, #0xe
	bgt _0233F098
	cmp r0, #0xd
	blt _0233F098
	cmpne r0, #0xe
	beq _0233F06C
	b _0233F098
_0233F050:
	ldrh r0, [r4, #0x1a]
	cmp r0, #0
	beq _0233F064
	cmp r0, #0x64
	blo _0233F098
_0233F064:
	mov r0, #6
	ldmia sp!, {r4, pc}
_0233F06C:
	ldrsh r0, [r4, #0x1a]
	bl IsItemValidVeneer
	cmp r0, #0
	beq _0233F090
	ldrsh r0, [r4, #0x1a]
	mov r1, #0
	bl CanSendItem
	cmp r0, #0
	bne _0233F098
_0233F090:
	mov r0, #6
	ldmia sp!, {r4, pc}
_0233F098:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0233F0A0:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov04_0233EF8C

	arm_func_start ov04_0233F0A8
ov04_0233F0A8: ; 0x0233F0A8
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #4
	mov r1, #0x16
	bl ov01_02337B3C
	ldrb r1, [r4]
	cmp r1, #0x14
	movne r0, #2
	ldmneia sp!, {r4, pc}
	ldrb r1, [r4, #3]
	cmp r0, r1
	movne r0, #3
	moveq r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov04_0233F0A8

	arm_func_start ov04_0233F0E0
ov04_0233F0E0: ; 0x0233F0E0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r0
	bl ov04_0233CAA8
	cmp r0, #1
	bne _0233F284
	ldr r1, _0233F28C ; =0x00001772
	add r0, r5, #4
	bl ov01_02337B3C
	ldrb r1, [r5, #3]
	cmp r0, r1
	movne r0, #3
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r0, [r5]
	cmp r0, #0x13
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrh r0, [r5, #4]
	cmp r0, #0x3e8
	movhi r0, #6
	ldmhiia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _0233F290 ; =ov04_0233F644
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldrb r1, [r0, #0x852]
	cmp r1, #0
	beq _0233F154
	ldrb r0, [r0, #0x854]
	cmp r0, #0
	beq _0233F188
_0233F154:
	mov r3, #0
	mov r2, r3
	mov r0, #6
	b _0233F170
_0233F164:
	mla r1, r3, r0, r5
	strh r2, [r1, #0xa]
	add r3, r3, #1
_0233F170:
	ldrh r1, [r5, #4]
	cmp r3, r1
	blt _0233F164
	mov r0, #0
	strh r0, [r5, #4]
	b _0233F27C
_0233F188:
	mov r8, #1
	mov r4, #0
	mov r7, r8
	mov r6, #6
	b _0233F270
_0233F19C:
	mla sb, r4, r6, r5
	ldrsh r0, [sb, #0xa]
	cmp r0, #0
	beq _0233F26C
	ldrsh r0, [sb, #0xa]
	bl IsItemValidVeneer
	cmp r0, #0
	beq _0233F1D0
	ldrsh r0, [sb, #0xa]
	mov r1, r8
	bl CanSendItem
	cmp r0, #0
	bne _0233F1D8
_0233F1D0:
	mov r0, #6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0233F1D8:
	ldrsh r0, [sb, #0xa]
	bl GetItemCategory
	cmp r0, #0xc
	bgt _0233F208
	bge _0233F240
	cmp r0, #1
	bgt _0233F26C
	cmp r0, #0
	blt _0233F26C
	cmpne r0, #1
	beq _0233F224
	b _0233F26C
_0233F208:
	cmp r0, #0xe
	bgt _0233F26C
	cmp r0, #0xd
	blt _0233F26C
	cmpne r0, #0xe
	beq _0233F240
	b _0233F26C
_0233F224:
	ldrh r0, [sb, #8]
	cmp r0, #0
	beq _0233F238
	cmp r0, #0x64
	blo _0233F26C
_0233F238:
	mov r0, #6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0233F240:
	ldrsh r0, [sb, #8]
	bl IsItemValidVeneer
	cmp r0, #0
	beq _0233F264
	ldrsh r0, [sb, #8]
	mov r1, r7
	bl CanSendItem
	cmp r0, #0
	bne _0233F26C
_0233F264:
	mov r0, #6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0233F26C:
	add r4, r4, #1
_0233F270:
	ldrh r0, [r5, #4]
	cmp r4, r0
	blt _0233F19C
_0233F27C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0233F284:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0233F28C: .word 0x00001772
_0233F290: .word ov04_0233F644
	arm_func_end ov04_0233F0E0

	arm_func_start ov04_0233F294
ov04_0233F294: ; 0x0233F294
	ldr r2, _0233F2B8 ; =ov04_0233F644
	mov r3, #0
	ldr r1, [r2]
	add r1, r1, #0x1000
	strb r0, [r1, #0x921]
	ldr r0, [r2]
	add r0, r0, #0x1000
	str r3, [r0, #0x924]
	bx lr
	.align 2, 0
_0233F2B8: .word ov04_0233F644
	arm_func_end ov04_0233F294

	arm_func_start ov04_0233F2BC
ov04_0233F2BC: ; 0x0233F2BC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0233F4A4 ; =ov04_0233F644
	ldr r5, [r0]
	add r0, r5, #0x1000
	ldr r0, [r0, #0x924]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0233F49C
_0233F2DC: ; jump table
	b _0233F2F0 ; case 0
	b _0233F308 ; case 1
	b _0233F360 ; case 2
	b _0233F424 ; case 3
	b _0233F460 ; case 4
_0233F2F0:
	ldr r1, _0233F4A8 ; =0x0000023B
	mov r0, #0
	bl ov04_0233CB84
	add r0, r5, #0x1000
	mov r1, #1
	str r1, [r0, #0x924]
_0233F308:
	bl ov04_0233CBA0
	cmp r0, #8
	bne _0233F49C
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	bl sub_02003BEC
	ldr r2, _0233F4A4 ; =ov04_0233F644
	ldr r1, [r2]
	add r1, r1, #0x1000
	strb r0, [r1, #0xd24]
	ldr r0, [r2]
	add r0, r0, #0x1000
	ldrb r0, [r0, #0xd24]
	cmp r0, #0
	beq _0233F350
	bl sub_02003B94
_0233F350:
	add r0, r5, #0x1000
	mov r1, #2
	str r1, [r0, #0x924]
	b _0233F49C
_0233F360:
	mov r0, #3
	bl NoteSaveBase
	ldr r1, _0233F4A4 ; =ov04_0233F644
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x1000
	ldrb r0, [r0, #0xd24]
	cmp r0, #0
	beq _0233F39C
	bl sub_02003BC8
	ldr r0, _0233F4A4 ; =ov04_0233F644
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1000
	strb r1, [r0, #0xd24]
_0233F39C:
	bl sub_02029FBC
	cmp r4, #0
	bne _0233F3E0
	mov r1, #0
	str r1, [r5, #0x10]
	add r0, r5, #0x1000
	ldrb r0, [r0, #0x921]
	cmp r0, #0
	moveq r1, #0x1c
	mov r0, r1, lsl #0x10
#ifdef JAPAN
	ldr r1, _02340D28 ; =0x000004CD
	mov r0, r0, lsr #0x10
#else
	mov r0, r0, lsr #0x10
	mov r1, #0x23c
#endif
	bl ov04_0233CB84
	add r0, r5, #0x1000
	mov r1, #3
	str r1, [r0, #0x924]
	b _0233F49C
_0233F3E0:
	cmp r4, #1
	moveq r0, #3
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	str r1, [r5, #0x10]
	add r0, r5, #0x1000
	ldrb r0, [r0, #0x921]
	cmp r0, #0
	moveq r1, #0x1c
	mov r0, r1, lsl #0x10
	ldr r1, _0233F4AC ; =0x00000239
	mov r0, r0, lsr #0x10
	bl ov04_0233CB84
	add r0, r5, #0x1000
	mov r1, #4
	str r1, [r0, #0x924]
	b _0233F49C
_0233F424:
	bl ov04_0233CBA0
	add r1, r5, #0x1000
	ldrb r1, [r1, #0x921]
	cmp r1, #0
	cmpeq r0, #8
	beq _0233F458
	cmp r1, #0
	beq _0233F49C
	ldr r0, [r5, #0x10]
	add r0, r0, #1
	str r0, [r5, #0x10]
	cmp r0, #0xb4
	ble _0233F49C
_0233F458:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0233F460:
	bl ov04_0233CBA0
	add r1, r5, #0x1000
	ldrb r1, [r1, #0x921]
	cmp r1, #0
	cmpeq r0, #8
	beq _0233F494
	cmp r1, #0
	beq _0233F49C
	ldr r0, [r5, #0x10]
	add r0, r0, #1
	str r0, [r5, #0x10]
	cmp r0, #0xb4
	ble _0233F49C
_0233F494:
	mov r0, #2
	ldmia sp!, {r3, r4, r5, pc}
_0233F49C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0233F4A4: .word ov04_0233F644
#ifdef JAPAN
_0233F4A8: .word 0x000004CC
_02340D28: .word 0x000004CD
_0233F4AC: .word 0x000004CA
#else
_0233F4A8: .word 0x0000023B
_0233F4AC: .word 0x00000239
#endif
	arm_func_end ov04_0233F2BC

	arm_func_start ov04_0233F4B0
ov04_0233F4B0: ; 0x0233F4B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r5, _0233F530 ; =ov04_0233F644
	mov r4, r0
	mov r6, #0
	mov r7, #0x400
_0233F4C4:
	ldr r1, [r5]
	mov r0, r7
	add r1, r1, #0x1000
	ldr r1, [r1, #0xd1c]
	add r8, r1, #2
	ldrsh sb, [r1]
	bl RandInt
	b _0233F4F8
_0233F4E4:
	ldrsh r1, [r8]
	cmp r0, r1
	blt _0233F500
	add r8, r8, #4
	sub sb, sb, #1
_0233F4F8:
	cmp sb, #1
	bgt _0233F4E4
_0233F500:
	ldrsh r1, [r8, #2]
	mov r0, r4
	mov r2, r6
	bl InitStandardItem
	bl ov04_0233CAC8
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrsh r0, [r4, #4]
	bl IsItemInTimeDarkness
	cmp r0, #0
	beq _0233F4C4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0233F530: .word ov04_0233F644
	arm_func_end ov04_0233F4B0

	arm_func_start ov04_0233F534
ov04_0233F534: ; 0x0233F534
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	ldr r4, _0233F564 ; =ov04_0233F644
	b _0233F54C
_0233F544:
	bl IncrementNbSkyGiftsSent
	add r5, r5, #1
_0233F54C:
	ldr r0, [r4]
	add r0, r0, #0x1000
	ldr r0, [r0, #0xd18]
	cmp r5, r0
	blt _0233F544
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0233F564: .word ov04_0233F644
	arm_func_end ov04_0233F534
	; 0x0233F568

	.rodata
	.global ov04_0233F568
ov04_0233F568:
#if defined(EUROPE)
#define OV04_DATA_OFFSET 2
#elif defined(JAPAN)
#define OV04_DATA_OFFSET 0x164
#else
#define OV04_DATA_OFFSET 0
#endif
	.word 0x37C7 + OV04_DATA_OFFSET
	.global ov04_0233F56C
ov04_0233F56C:
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x37C8 + OV04_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov04_0233F580
ov04_0233F580:
	.word 0x37D8 + OV04_DATA_OFFSET
	.global ov04_0233F584
ov04_0233F584:
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x37D9 + OV04_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov04_0233F598
ov04_0233F598:
	.word 0x37BA + OV04_DATA_OFFSET
	.global ov04_0233F59C
ov04_0233F59C:
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x37BB + OV04_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x37BC + OV04_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov04_0233F5B8
ov04_0233F5B8:
	.word 0x37B6 + OV04_DATA_OFFSET
	.global ov04_0233F5BC
ov04_0233F5BC:
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x37B7 + OV04_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x37B8 + OV04_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov04_0233F5D8
ov04_0233F5D8:
	.word 0x37C3 + OV04_DATA_OFFSET
	.global ov04_0233F5DC
ov04_0233F5DC:
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x37C4 + OV04_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x37C5 + OV04_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov04_0233F5F8
ov04_0233F5F8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global ov04_0233F604
ov04_0233F604:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x02, 0x08, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov04_0233F614
ov04_0233F614:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x18, 0x13, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov04_0233F624
ov04_0233F624:
	.byte 0x54, 0x41, 0x42, 0x4C
	.byte 0x45, 0x44, 0x41, 0x54, 0x2F, 0x69, 0x74, 0x65, 0x6D, 0x30, 0x30, 0x2E, 0x64, 0x61, 0x74, 0x00

	.data
	.global ov04_0233F640
ov04_0233F640:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov04_0233F644
ov04_0233F644:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss
	.global ov04_0233F660
ov04_0233F660:
	.space 0x10
	.global ov04_0233F670
ov04_0233F670:
	.space 0x10
