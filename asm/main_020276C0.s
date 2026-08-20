	.include "asm/macros.inc"
	.include "main_020276C0.inc"

	.text

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
