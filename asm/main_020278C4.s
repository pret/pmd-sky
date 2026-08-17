	.include "asm/macros.inc"
	.include "main_020278C4.inc"

	.text

	arm_func_start sub_020278C4
sub_020278C4: ; 0x020278C4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r1, #0xe0
	mul r2, r0, r1
	ldr ip, _02027964 ; =_022A7A6C
	ldr r4, _02027968 ; =_022A8990
#ifdef JAPAN
	ldrsb r3, [ip, #1]
#else
	ldrsb r3, [ip, #3]
#endif
	mvn r1, #1
	ldrsb r8, [r4, r2]
	cmp r3, r1
	ldreq r1, _0202796C ; =_022A8991
	mov r7, r3
#ifdef JAPAN
	streqb r0, [ip, #1]
#else
	streqb r0, [ip, #3]
#endif
	streqb r3, [r1, r2]
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov ip, r1
	ldr r5, _02027970 ; =WINDOW_LIST
	mov lr, #0xe0
	b _02027924
_0202790C:
	mla r6, r7, lr, r5
	ldrsb r4, [r6, #0xb4]
	cmp r4, r8
	blt _0202792C
	mov r1, r7
	ldrsb r7, [r6, #0xb5]
_02027924:
	cmp r7, ip
	bne _0202790C
_0202792C:
	mvn ip, #1
	cmp r1, ip
	ldreq ip, _0202796C ; =_022A8991
	ldreq r1, _02027964 ; =_022A7A6C
	streqb r3, [ip, r2]
#ifdef JAPAN
	streqb r0, [r1, #1]
#else
	streqb r0, [r1, #3]
#endif
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r3, #0xe0
	mul r3, r1, r3
	ldr ip, _0202796C ; =_022A8991
	ldrsb r1, [ip, r3]
	strb r0, [ip, r3]
	strb r1, [ip, r2]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02027964: .word _022A7A6C
_02027968: .word _022A8990
_0202796C: .word _022A8991
_02027970: .word WINDOW_LIST
	arm_func_end sub_020278C4

	arm_func_start sub_02027974
sub_02027974: ; 0x02027974
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020279FC ; =_022A7A6C
	mvn r5, #1
#ifdef JAPAN
	ldrsb r4, [r1, #1]
#else
	ldrsb r4, [r1, #3]
#endif
	mov r1, r5
	ldr ip, _02027A00 ; =WINDOW_LIST
	mov r2, #0xe0
	b _020279AC
_02027994:
	mla lr, r4, r2, ip
	ldrsb r3, [lr, #0x10]
	cmp r0, r3
	beq _020279B4
	mov r5, r4
	ldrsb r4, [lr, #0xb5]
_020279AC:
	cmp r4, r1
	bne _02027994
_020279B4:
	mvn ip, #1
	cmp r5, ip
	bne _020279DC
	mov r1, #0xe0
	mul r2, r0, r1
	ldr r3, _02027A04 ; =_022A8991
	ldr r0, _020279FC ; =_022A7A6C
	ldrsb r1, [r3, r2]
#ifdef JAPAN
	strb r1, [r0, #1]
#else
	strb r1, [r0, #3]
#endif
	b _020279F4
_020279DC:
	mov r0, #0xe0
	mul r2, r4, r0
	ldr r3, _02027A04 ; =_022A8991
	mul r0, r5, r0
	ldrsb r1, [r3, r2]
	strb r1, [r3, r0]
_020279F4:
	strb ip, [r3, r2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020279FC: .word _022A7A6C
_02027A00: .word WINDOW_LIST
_02027A04: .word _022A8991
	arm_func_end sub_02027974
