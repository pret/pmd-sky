	.include "asm/macros.inc"
	.include "main_0205BCC4.inc"

	.text

	arm_func_start sub_0205BCC4
sub_0205BCC4: ; 0x0205BCC4
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0205BCEC
	ldr r0, _0205BD10 ; =_020B0A54
	mov r1, #0
	ldr r0, [r0, #8]
	mov r2, #6
	add r0, r0, #0x44
	bl MemsetSimple
	ldmia sp!, {r3, pc}
_0205BCEC:
	ldr r1, _0205BD10 ; =_020B0A54
	ldrh r2, [r0]
	ldr r3, [r1, #8]
	strh r2, [r3, #0x44]
	ldrh r1, [r0, #2]
	strh r1, [r3, #0x46]
	ldrh r0, [r0, #4]
	strh r0, [r3, #0x48]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205BD10: .word _020B0A54
	arm_func_end sub_0205BCC4
