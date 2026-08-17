	.include "asm/macros.inc"
	.include "main_0202760C.inc"

	.text

	arm_func_start sub_0202760C
sub_0202760C: ; 0x0202760C
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02027620 ; =_022A88F0
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
#ifdef JAPAN
_02027620: .word _022A88FC
#else
_02027620: .word _022A88F0
#endif
	arm_func_end sub_0202760C

#ifdef JAPAN
	arm_func_start sub_0202796C_JP
sub_0202796C_JP: ; 0x0202796C
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02027980 ; =_022A88F0
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_02027980: .word _022A88F0
	arm_func_end sub_0202796C_JP
#endif

	arm_func_start sub_02027624
sub_02027624: ; 0x02027624
	ldr r2, _02027644 ; =WINDOW_LIST
	mov r1, #0xe0
	mla r2, r0, r1, r2
	ldrb r1, [r2, #6]
	ldrb r0, [r2, #7]
	smulbb r0, r1, r0
	mov r0, r0, lsl #5
	bx lr
	.align 2, 0
_02027644: .word WINDOW_LIST
	arm_func_end sub_02027624

	arm_func_start NewWindowScreenCheck
NewWindowScreenCheck: ; 0x02027648
	stmdb sp!, {r4, lr}
	mov r4, #0
	ldr ip, _020276B8 ; =WINDOW_LIST
	mov lr, r4
	mov r3, r4
_0202765C:
	ldrsb r2, [ip, #0xb6]
	cmp r2, #0
	beq _02027678
	ldrb r2, [ip, #8]
	cmp r2, #0
	addeq lr, lr, #1
	addne r4, r4, #1
_02027678:
	add r2, r3, #1
	mov r2, r2, lsl #0x18
	mov r3, r2, asr #0x18
	cmp r3, #0x14
	add ip, ip, #0xe0
	blt _0202765C
	cmp lr, #0
	ldreq r2, _020276BC ; =_022A7A6C
	moveq r3, #1
	streqh r3, [r2, #8]
	cmp r4, #0
	ldreq r2, _020276BC ; =_022A7A6C
	moveq r3, #1
	streqh r3, [r2, #0xa]
	bl NewWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
_020276B8: .word WINDOW_LIST
_020276BC: .word _022A7A6C
	arm_func_end NewWindowScreenCheck

	arm_func_start NewWindow
NewWindow: ; 0x020276C0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r5, _02027898 ; =WINDOW_LIST
	ldr r6, _0202789C ; =_022A7B1C
	mov r4, #0
	b _020276FC
_020276DC:
	ldrsb r0, [r5, #0xb6]
	cmp r0, #0
	beq _02027704
	add r0, r4, #1
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	add r5, r5, #0xe0
#ifdef JAPAN
	add r6, r6, #0x2c
#else
	add r6, r6, #0x30
#endif
_020276FC:
	cmp r4, #0x14
	blt _020276DC
_02027704:
	ldmia r8, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldrb r0, [r8, #6]
	mov r1, #8
	mov r0, r0, lsl #3
	sub r0, r0, #8
	str r0, [r5, #0x20]
	ldrb r0, [r5, #6]
	ldrb r2, [r5, #7]
	mov r0, r0, lsl #6
	mul r0, r2, r0
	bl MemAlloc
	str r0, [r5, #0x14]
	ldrb r0, [r5, #8]
	ldr lr, _020278A0 ; =_022A7A74
	ldrb r3, [r5, #6]
	mov r8, r0, lsl #1
	ldrh r0, [lr, r8]
	ldrb r2, [r5, #7]
	mvn r1, #8
	mla ip, r3, r2, r0
	strh r0, [r5, #0x12]
	ldrsb r2, [r5, #9]
	strh ip, [lr, r8]
	cmp r2, r1
	orreq r1, r0, #0x1000
	streqh r1, [r5, #0x30]
	strneh r0, [r5, #0x30]
	ldrb r1, [r5, #8]
	cmp r1, #0
	moveq r1, #0x6000000
	movne r1, #0x6200000
	add r0, r1, r0, lsl #6
	str r0, [r5, #0x18]
	str r0, [r5, #0x28]
	ldrb r3, [r5, #6]
	ldrb r2, [r5, #7]
	mov r1, #0
	mov r0, r4
	smulbb r2, r3, r2
	mov r2, r2, lsl #6
	str r2, [r5, #0x1c]
	strb r1, [r5, #0x11]
	bl sub_02027B1C
	strb r4, [r5, #0x10]
	mov r0, #1
	strb r0, [r5, #0xb6]
	strb r0, [r5, #0xb7]
	mov r0, r4
	strb r7, [r5, #0xb4]
	bl sub_020278C4
	mvn r1, #0
	add r0, r5, #0x34
	str r1, [r5, #0xb8]
	bl InitRender3dElement64
	mov r1, #2
	strb r1, [r5, #0x70]
	mov r0, #9
	strh r0, [r5, #0x5e]
	strb r1, [r5, #0x72]
	mov r0, #0x20
	strb r0, [r5, #0x60]
	strb r0, [r5, #0x61]
	strb r0, [r5, #0x62]
	mov r1, #0x90
	add r0, r5, #0x74
	strb r1, [r5, #0x63]
	bl InitRender3dElement64
	ldr r0, _020278A4 ; =_022A7A6C
	mov r1, #0
	ldrh r3, [r0, #0x48]
	mov r2, #0x18
	strh r3, [r5, #0x88]
	strh r1, [r5, #0x8a]
	strh r1, [r5, #0x8c]
	strh r2, [r5, #0x8e]
	strh r2, [r5, #0x90]
	ldr r2, [r0, #0x54]
	str r2, [r5, #0x94]
	ldrsh r0, [r0, #0x58]
	bl GetPaletteBaseAddress__020278A8
	str r0, [r5, #0x98]
	mov r0, #6
	strb r0, [r5, #0xb0]
	mov r0, #0xa
	strh r0, [r5, #0x9e]
	mov r1, #0
	strh r1, [r5, #0x74]
	strh r1, [r5, #0x76]
	strh r1, [r5, #0x78]
	add r0, r5, #0xbc
	strh r1, [r5, #0x7a]
	bl InitWindowTrailer
	mov r0, #0
	strb r0, [r6]
	add r0, r6, #4
	bl sub_02029A50
	ldrb r1, [r5, #8]
	mov r0, r4
	strb r1, [r6, #0x2a]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02027898: .word WINDOW_LIST
_0202789C: .word _022A7B1C
_020278A0: .word _022A7A74
_020278A4: .word _022A7A6C
	arm_func_end NewWindow

	arm_func_start GetPaletteBaseAddress__020278A8
GetPaletteBaseAddress__020278A8: ; 0x020278A8
	ldr r2, _020278C0 ; =_020AFC70
	add r0, r1, r0, lsl #8
	ldr r1, [r2]
	ldr r1, [r1, #0xe0]
	add r0, r1, r0, lsl #1
	bx lr
	.align 2, 0
_020278C0: .word _020AFC70
	arm_func_end GetPaletteBaseAddress__020278A8

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

	arm_func_start sub_02027A08
sub_02027A08: ; 0x02027A08
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl sub_02027974
	mov r0, #0xe0
	mul r4, r6, r0
	ldr r1, _02027A5C ; =_022A8990
	mov r0, r6
	strb r5, [r1, r4]
	bl sub_020278C4
	ldr r1, _02027A60 ; =_022A88E4
	ldr r0, _02027A64 ; =_020AFD4C
	ldrb r3, [r1, r4]
	ldr r2, [r0, #8]
	mov r1, #1
	orr r1, r2, r1, lsl r3
	str r1, [r0, #8]
	cmp r3, #1
	ldmneia sp!, {r4, r5, r6, pc}
	bl sub_02027B88
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02027A5C: .word _022A8990
_02027A60: .word _022A88E4
_02027A64: .word _020AFD4C
	arm_func_end sub_02027A08

	arm_func_start SetScreenWindowsColor
SetScreenWindowsColor: ; 0x02027A68
	ldr r2, _02027A7C ; =_020AFD98
	cmp r1, #2
	moveq r1, #1
	strb r0, [r2, r1]
	bx lr
	.align 2, 0
_02027A7C: .word _020AFD98
	arm_func_end SetScreenWindowsColor
