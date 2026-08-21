	.include "asm/macros.inc"
	.include "main_02048C5C.inc"

	.text

	arm_func_start sub_02048C5C
sub_02048C5C: ; 0x02048C5C
	stmdb sp!, {r3, lr}
	ldr r0, _02048CA4 ; =_022AAE74
	mov r1, #0
	mov r2, #0x30
	bl MemsetSimple
	ldr r2, _02048CA8 ; =0x09011416
	ldr r1, _02048CAC ; =_022AAE74
	ldr r0, _02048CB0 ; =_022AAE78
	str r2, [r1, #0x24]
	bl ReadStringSave
	ldr r2, _02048CB4 ; =0x000F1206
	ldr r0, _02048CAC ; =_022AAE74
	mov r1, #0xff
	str r2, [r0, #0x28]
	strb r1, [r0, #0x2c]
	mov r1, #0
	strb r1, [r0, #0x2d]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02048CA4: .word _022AAE74
_02048CA8: .word 0x09011416
_02048CAC: .word _022AAE74
_02048CB0: .word _022AAE78
_02048CB4: .word 0x000F1206
	arm_func_end sub_02048C5C
