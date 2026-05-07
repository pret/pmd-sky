	.include "asm/macros.inc"
	.include "main_0207BC3C.inc"

	.text

	arm_func_start sub_0207C650 ; MI_UncompressLZ8
sub_0207C650: ; 0x0207C650
	stmdb sp!, {r4, r5, r6, r7, lr}
	ldr r5, [r0], #4
	mov r2, r5, lsr #8
	mov r7, #0
	tst r5, #0xf
	bne _0207C66C
	b _0207C670
_0207C66C:
	mov r7, #1
_0207C670:
	cmp r2, #0
	ble _0207C748
	ldrb lr, [r0], #1
	mov r4, #8
_0207C680:
	subs r4, r4, #1
	blt _0207C670
	tst lr, #0x80
	bne _0207C6A4
	ldrb r6, [r0], #1
	.word 0xE1416096
	add r1, r1, #1
	sub r2, r2, #1
	b _0207C730
_0207C6A4:
	ldrb r5, [r0]
	cmp r7, #0
	beq _0207C6B4
	b _0207C6B8
_0207C6B4:
	mov r6, #3
_0207C6B8:
	beq _0207C6FC
	tst r5, #0xe0
	bne _0207C6C8
	b _0207C6CC
_0207C6C8:
	mov r6, #1
_0207C6CC:
	bne _0207C6FC
	add r0, r0, #1
	and r6, r5, #0xf
	mov r6, r6, lsl #4
	tst r5, #0x10
	beq _0207C6F4
	mov r6, r6, lsl #8
	ldrb r5, [r0], #1
	add r6, r6, r5, lsl #4
	add r6, r6, #0x100
_0207C6F4:
	add r6, r6, #0x11
	ldrb r5, [r0]
_0207C6FC:
	add r3, r6, r5, asr #4
	add r0, r0, #1
	and r5, r5, #0xf
	mov ip, r5, lsl #8
	ldrb r6, [r0], #1
	orr r5, r6, ip
	add ip, r5, #1
	sub r2, r2, r3
_0207C71C:
	ldrb r5, [r1, -ip]
	.word 0xE1415095
	add r1, r1, #1
	subs r3, r3, #1
	bgt _0207C71C
_0207C730:
	cmp r2, #0
	bgt _0207C73C
	b _0207C740
_0207C73C:
	mov lr, lr, lsl #1
_0207C740:
	bgt _0207C680
	b _0207C670
_0207C748:
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_0207C650

