	.include "asm/macros.inc"
	.include "main_02051788.inc"

	.text

	arm_func_start sub_02051788
sub_02051788: ; 0x02051788
	ldr r1, _02051794 ; =_020A20B1
	ldrb r0, [r1, r0, lsl #1]
	bx lr
	.align 2, 0
_02051794: .word _020A20B1
	arm_func_end sub_02051788

	arm_func_start sub_02051798
sub_02051798: ; 0x02051798
	mov ip, #0
	ldr r2, _020517D0 ; =ARM9_UNKNOWN_TABLE__NA_20A20B0
	b _020517C0
_020517A4:
	add r1, r2, ip, lsl #1
	ldrb r1, [r1, #1]
	mov r3, ip, lsl #1
	cmp r0, r1
	ldreqb r0, [r2, r3]
	bxeq lr
	add ip, ip, #1
_020517C0:
	cmp ip, #0x100
	blt _020517A4
	mov r0, #0xff
	bx lr
	.align 2, 0
_020517D0: .word ARM9_UNKNOWN_TABLE__NA_20A20B0
	arm_func_end sub_02051798
