	.include "asm/macros.inc"
	.include "main_0205B5A8.inc"

	.text

	arm_func_start sub_0205B5A8
sub_0205B5A8: ; 0x0205B5A8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc4
	ldr lr, _0205B688 ; =_020A3678
	add ip, sp, #0x14
	mov r4, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	mov r5, #0xb
_0205B5CC:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0205B5CC
	strb r8, [sp, #0x18]
	strb r7, [sp, #0x19]
	bl GetLanguageType
	strb r0, [sp, #0x30]
	mov r0, #2
	strb r6, [sp, #0xc0]
	bl RandInt
	orr r0, r0, #2
	strb r0, [sp, #0xc2]
	bl sub_02063504
	mov r5, r0
	bl Rand16Bit
	orr r0, r0, r5, lsl #16
	bl sub_020510E8
	strb r4, [sp, #0x14]
	bl sub_02051134
	str r0, [sp, #0x2c]
	bl sub_02051134
	str r0, [sp, #0xbc]
	bl sub_02051134
	bic r0, r0, #0xff000000
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0xbc]
	bl sub_020634F4
	ldr r1, _0205B68C ; =0x000038C9
	add r0, sp, #0
	bl GetStringFromFileVeneer
	add r0, sp, #0x31
	add r1, sp, #0
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	cmp r4, #1
	bne _0205B668
	add r0, sp, #0x18
	bl sub_0205BAB0
	b _0205B680
_0205B668:
	cmp r4, #5
	add r0, sp, #0x14
	bne _0205B67C
	bl sub_0205B738
	b _0205B680
_0205B67C:
	bl sub_0205B6EC
_0205B680:
	add sp, sp, #0xc4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205B688: .word _020A3678
#if defined(EUROPE)
_0205B68C: .word 0x000038CB
#elif defined(JAPAN)
_0205B68C: .word 0x00003507
#else
_0205B68C: .word 0x000038C9
#endif
	arm_func_end sub_0205B5A8
