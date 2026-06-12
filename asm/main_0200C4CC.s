	.include "asm/macros.inc"
	.include "main_0200C4CC.inc"

	.text

	arm_func_start sub_0200C4CC
sub_0200C4CC: ; 0x0200C4CC
	stmdb sp!, {r4, lr}
	ldr lr, _0200C4F8 ; =_02094C18
	mov r4, r0
	mov ip, #0xe
_0200C4DC:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0200C4DC
	ldmia lr, {r0, r1}
	stmia r4, {r0, r1}
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200C4F8: .word _02094C18
	arm_func_end sub_0200C4CC
