	.include "asm/macros.inc"
	.include "main_0205B738.inc"

	.text

	arm_func_start sub_0205B738
sub_0205B738: ; 0x0205B738
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0205B778 ; =_020B0A54
	mov r5, r0
	ldr r1, [r1]
	mov r4, #0
	ldrb r0, [r1, #0xb0]
	add lr, r1, #0xb0
	mov ip, #0xb
	cmp r0, #0
	movne r4, #1
_0205B760:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0205B760
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205B778: .word _020B0A54
	arm_func_end sub_0205B738
