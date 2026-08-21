	.include "asm/macros.inc"
	.include "main_02048B74.inc"

	.text

	arm_func_start sub_02048B74
sub_02048B74: ; 0x02048B74
	stmdb sp!, {r3, lr}
	ldr r1, _02048BA8 ; =_020AFF38
	ldr r0, _02048BAC ; =_0209CD4C
	ldr r1, [r1, #4]
	mov r2, #0
	bl Debug_Print0
	mov r3, #0
	ldr r1, _02048BA8 ; =_020AFF38
	ldr r0, _02048BB0 ; =_022AAE70
	sub r2, r3, #1
	str r3, [r1, #4]
	str r2, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02048BA8: .word _020AFF38
_02048BAC: .word _0209CD4C
_02048BB0: .word _022AAE70
	arm_func_end sub_02048B74
