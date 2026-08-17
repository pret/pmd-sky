	.include "asm/macros.inc"
	.include "main_02027B88.inc"

	.text

	arm_func_start sub_02027B88
sub_02027B88: ; 0x02027B88
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r0, _02027E14 ; =_022A7A6C
#ifdef JAPAN
	ldrsb r2, [r0, #1]
#else
	ldrsb r2, [r0, #3]
#endif
	b _02027E00
_02027B9C:
	ldr r1, _02027E18 ; =WINDOW_LIST
	mov r0, #0xe0
	mla r4, r2, r0, r1
	ldrb r0, [r4, #8]
	cmp r0, #1
	ldreqsb r0, [r4, #0xb6]
	cmpeq r0, #2
	bne _02027DFC
	ldrsb r1, [r4, #9]
	ldr r0, _02027E1C ; =_0209AC64
	rsb r1, r1, #0
	mov r1, r1, lsl #1
	ldrsb r0, [r0, r1]
	cmp r0, #0
	bne _02027DF0
	ldr r0, _02027E20 ; =_020AFD98
	ldrb r1, [r4, #4]
	ldrb r3, [r0, #1]
	ldr r2, _02027E24 ; =_0209ACAC
	sub r6, r1, #1
	ldrb r2, [r2, r3]
	ldrb r0, [r4, #5]
	add r1, sp, #0
	mov r5, r2, lsl #0xc
	sub r3, r0, #1
	orr r0, r5, #2
	mov r2, r0, lsl #0x10
	ldr r0, _02027E28 ; =_022A7AE4
	str r6, [sp]
	mov r2, r2, lsr #0x10
	str r3, [sp, #4]
	bl sub_0200B3FC
	ldr r1, [sp]
	orr r0, r5, #3
	add r1, r1, #1
	mov r0, r0, lsl #0x10
	str r1, [sp]
	mov r6, r0, lsr #0x10
	ldr r8, _02027E28 ; =_022A7AE4
	add r7, sp, #0
	b _02027C5C
_02027C40:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02027C5C:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _02027C40
	orr r0, r5, #4
	mov r2, r0, lsl #0x10
	ldr r0, _02027E28 ; =_022A7AE4
	add r1, sp, #0
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
	ldr r0, [sp, #4]
	orr r1, r5, #5
	add r0, r0, #1
	str r0, [sp, #4]
	orr r0, r5, #1
	orr r2, r5, #6
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r7, r0, lsr #0x10
	mov r8, r1, lsr #0x10
	mov r6, r2, lsr #0x10
	ldr sl, _02027E28 ; =_022A7AE4
	add sb, sp, #0
	b _02027D44
_02027CC8:
	ldrb r2, [r4, #4]
	mov r0, sl
	mov r1, sb
	sub r3, r2, #1
	mov r2, r8
	str r3, [sp]
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	b _02027D10
_02027CF4:
	mov r0, sl
	mov r1, sb
	mov r2, r7
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02027D10:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _02027CF4
	mov r0, sl
	mov r1, sb
	mov r2, r6
	bl sub_0200B3FC
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_02027D44:
	ldrb r1, [r4, #5]
	ldrb r0, [r4, #7]
	ldr r2, [sp, #4]
	add r0, r1, r0
	cmp r2, r0
	blt _02027CC8
	ldrb r1, [r4, #4]
	orr r0, r5, #7
	mov r2, r0, lsl #0x10
	sub r3, r1, #1
	ldr r0, _02027E28 ; =_022A7AE4
	add r1, sp, #0
	str r3, [sp]
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
	ldr r1, [sp]
	orr r0, r5, #8
	add r1, r1, #1
	mov r0, r0, lsl #0x10
	str r1, [sp]
	mov r6, r0, lsr #0x10
	ldr r8, _02027E28 ; =_022A7AE4
	add r7, sp, #0
	b _02027DC0
_02027DA4:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02027DC0:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _02027DA4
	orr r0, r5, #9
	mov r2, r0, lsl #0x10
	ldr r0, _02027E28 ; =_022A7AE4
	add r1, sp, #0
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
_02027DF0:
	ldr r0, _02027E2C ; =_020AFD4C
	mov r1, #1
#ifdef JAPAN
	strb r1, [r0]
#else
	strb r1, [r0, #3]
#endif
_02027DFC:
	ldrsb r2, [r4, #0xb5]
_02027E00:
	mvn r0, #1
	cmp r2, r0
	bne _02027B9C
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02027E14: .word _022A7A6C
_02027E18: .word WINDOW_LIST
_02027E1C: .word _0209AC64
_02027E20: .word _020AFD98
_02027E24: .word _0209ACAC
_02027E28: .word _022A7AE4
_02027E2C: .word _020AFD4C
	arm_func_end sub_02027B88

	arm_func_start sub_02027E30
sub_02027E30: ; 0x02027E30
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r3, _02028070 ; =WINDOW_LIST
	mov r2, #0xe0
	mla r7, r0, r2, r3
	ldrsb r0, [r7, #9]
	ldr r2, _02028074 ; =_0209AC64
	cmp r1, #0
	rsb r0, r0, #0
	add r4, r2, r0, lsl #1
	movne r0, #2
	moveq r0, #3
	strb r0, [r7, #0xb6]
	ldrb r0, [r7, #8]
	cmp r0, #1
	bne _02027F34
	cmp r1, #0
	bne _02027F20
	ldrsb r1, [r7, #0x10]
	ldr r2, _02028070 ; =WINDOW_LIST
	mov r0, #0xe0
	mla r0, r1, r0, r2
	add r0, r0, #0xbc
	bl InitWindowTrailer
	ldrsb r0, [r4]
	cmp r0, #0
	blt _02027F20
	ldrb r0, [r7, #5]
	ldr r6, _02028078 ; =_022A7AE4
	add r5, sp, #0
	sub r0, r0, #1
	str r0, [sp, #4]
	mov r4, #0
	b _02027F08
_02027EB8:
	ldrb r0, [r7, #4]
	sub r0, r0, #1
	str r0, [sp]
	b _02027EE4
_02027EC8:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02027EE4:
	ldrb r1, [r7, #4]
	ldrb r0, [r7, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	ble _02027EC8
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_02027F08:
	ldrb r1, [r7, #5]
	ldrb r0, [r7, #7]
	ldr r2, [sp, #4]
	add r0, r1, r0
	cmp r2, r0
	ble _02027EB8
_02027F20:
	bl sub_02027B88
	ldr r0, _0202807C ; =_020AFD4C
	mov r1, #1
#ifdef JAPAN
	strb r1, [r0]
#else
	strb r1, [r0, #3]
#endif
	b _02028064
_02027F34:
	cmp r1, #0
	beq _0202801C
	ldrb r1, [r7, #4]
	mvn r0, #3
	mov r1, r1, lsl #3
	strh r1, [r7, #0x34]
	ldrb r1, [r7, #5]
	mov r1, r1, lsl #3
	strh r1, [r7, #0x36]
	ldrb r1, [r7, #6]
	mov r1, r1, lsl #3
	strh r1, [r7, #0x38]
	ldrb r1, [r7, #7]
	mov r1, r1, lsl #3
	strh r1, [r7, #0x3a]
	ldrh r1, [r7, #0x34]
	strh r1, [r7, #0x74]
	ldrh r1, [r7, #0x36]
	strh r1, [r7, #0x76]
	ldrh r1, [r7, #0x38]
	strh r1, [r7, #0x78]
	ldrh r1, [r7, #0x3a]
	strh r1, [r7, #0x7a]
	ldrsh r1, [r7, #0x74]
	sub r1, r1, #8
	strh r1, [r7, #0x74]
	ldrsh r1, [r7, #0x76]
	sub r1, r1, #8
	strh r1, [r7, #0x76]
	ldrsh r1, [r7, #0x78]
	add r1, r1, #0x10
	strh r1, [r7, #0x78]
	ldrsh r1, [r7, #0x7a]
	add r1, r1, #0x10
	strh r1, [r7, #0x7a]
	ldrsb r1, [r7, #9]
	cmp r1, r0
	beq _02027FFC
	ldrsh r0, [r7, #0x34]
	sub r0, r0, #1
	strh r0, [r7, #0x34]
	ldrsh r0, [r7, #0x36]
	sub r0, r0, #2
	strh r0, [r7, #0x36]
	ldrsh r0, [r7, #0x38]
	add r0, r0, #2
	strh r0, [r7, #0x38]
	ldrsh r0, [r7, #0x3a]
	add r0, r0, #6
	strh r0, [r7, #0x3a]
_02027FFC:
	ldr r0, _0202807C ; =_020AFD4C
	ldrb r0, [r0, #1]
	cmp r0, #0
	movne r0, #0x90
	strneb r0, [r7, #0x63]
	moveq r0, #0xff
	streqb r0, [r7, #0x63]
	b _02028064
_0202801C:
	ldrsb r1, [r7, #0x10]
	ldr r2, _02028070 ; =WINDOW_LIST
	mov r0, #0xe0
	mla r0, r1, r0, r2
	add r0, r0, #0xbc
	bl InitWindowTrailer
	mov r0, #0
	strh r0, [r7, #0x3a]
	strh r0, [r7, #0x38]
	strh r0, [r7, #0x36]
	strh r0, [r7, #0x34]
	strh r0, [r7, #0x74]
	ldrh r0, [r7, #0x36]
	strh r0, [r7, #0x76]
	ldrh r0, [r7, #0x38]
	strh r0, [r7, #0x78]
	ldrh r0, [r7, #0x3a]
	strh r0, [r7, #0x7a]
_02028064:
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02028070: .word WINDOW_LIST
_02028074: .word _0209AC64
_02028078: .word _022A7AE4
_0202807C: .word _020AFD4C
	arm_func_end sub_02027E30

	arm_func_start sub_02028080
sub_02028080: ; 0x02028080
	stmdb sp!, {r4, lr}
	ldr r3, _020280B8 ; =WINDOW_LIST
	mov r2, #0xe0
	mla r4, r0, r2, r3
	strb r1, [r4, #9]
	ldrsb r0, [r4, #0x10]
	bl UpdateWindow
	ldr r0, _020280BC ; =_020AFD4C
	ldrb r1, [r4, #8]
	ldr r3, [r0, #8]
	mov r2, #1
	orr r1, r3, r2, lsl r1
	str r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020280B8: .word WINDOW_LIST
_020280BC: .word _020AFD4C
	arm_func_end sub_02028080

	arm_func_start sub_020280C0
sub_020280C0: ; 0x020280C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #1
	mov r5, r0
	bl sub_02027E30
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0xe0
	mul r3, r5, r1
	ldr r2, _02028104 ; =_022A88E4
	ldr r1, _02028108 ; =_020AFD4C
	ldrb r2, [r2, r3]
	ldr ip, [r1, #8]
	mov r3, #1
	orr r2, ip, r3, lsl r2
	str r2, [r1, #8]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02028104: .word _022A88E4
_02028108: .word _020AFD4C
	arm_func_end sub_020280C0

	arm_func_start sub_0202810C
sub_0202810C: ; 0x0202810C
	ldr ip, _02028118 ; =sub_020280C0
	mov r1, #1
	bx ip
	.align 2, 0
_02028118: .word sub_020280C0
	arm_func_end sub_0202810C

	arm_func_start sub_0202811C
sub_0202811C: ; 0x0202811C
	ldr ip, _02028128 ; =sub_02027E30
	mov r1, #1
	bx ip
	.align 2, 0
_02028128: .word sub_02027E30
	arm_func_end sub_0202811C

	arm_func_start sub_0202812C
sub_0202812C: ; 0x0202812C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r1, #0xe0
	mul r5, r6, r1
	ldr r1, _02028188 ; =_022A8992
	ldrsb r1, [r1, r5]
	cmp r1, #3
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r1, #0
	bl sub_02027E30
	mov r4, r0
	mov r0, r6
	bl sub_0202836C
	ldr r0, _0202818C ; =_022A88E4
	ldr r1, _02028190 ; =_020AFD4C
	ldrb r0, [r0, r5]
	ldr r3, [r1, #8]
	mov r2, #1
	orr r2, r3, r2, lsl r0
	mov r0, r4
	str r2, [r1, #8]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02028188: .word _022A8992
_0202818C: .word _022A88E4
_02028190: .word _020AFD4C
	arm_func_end sub_0202812C

	arm_func_start DeleteWindow
DeleteWindow: ; 0x02028194
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02028224 ; =WINDOW_LIST
	mov r1, #0xe0
	mla r4, r0, r1, r2
	bl sub_0202812C
	ldrb r5, [r4, #8]
	ldr lr, _02028224 ; =WINDOW_LIST
	mov ip, #1
	mov r3, #0
_020281B8:
	cmp lr, r4
	ldrnesb r0, [lr, #0xb6]
	cmpne r0, #0
	beq _020281EC
	ldrb r0, [lr, #8]
	cmp r5, r0
	bne _020281EC
	ldrh r2, [lr, #0x12]
	ldrb r1, [lr, #6]
	ldrb r0, [lr, #7]
	mla r0, r1, r0, r2
	cmp ip, r0
	movlt ip, r0
_020281EC:
	add r3, r3, #1
	cmp r3, #0x14
	add lr, lr, #0xe0
	blt _020281B8
	ldr r0, [r4, #0x14]
	ldr r1, _02028228 ; =_022A7A74
	mov r2, r5, lsl #1
	strh ip, [r1, r2]
	bl MemFree
	ldrsb r0, [r4, #0x10]
	bl sub_02027974
	mov r0, #0
	strb r0, [r4, #0xb6]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02028224: .word WINDOW_LIST
_02028228: .word _022A7A74
	arm_func_end DeleteWindow

	arm_func_start sub_0202822C
sub_0202822C: ; 0x0202822C
	stmdb sp!, {r4, lr}
	ldr r2, _02028258 ; =WINDOW_LIST
	mov r1, #0xe0
	mla r4, r0, r1, r2
	ldr r0, [r4, #0x14]
	bl MemFree
	ldrsb r0, [r4, #0x10]
	bl sub_02027974
	mov r0, #0
	strb r0, [r4, #0xb6]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02028258: .word WINDOW_LIST
	arm_func_end sub_0202822C
