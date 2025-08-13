	.include "asm/macros.inc"
	.include "get_category_string.inc"

	.text

	arm_func_start GetCategoryString
GetCategoryString: ; 0x0205275C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl AllocateTemp1024ByteBufferFromPool
	mov r4, r0
	mov r0, r5
	mov r1, #0x258
	bl _s32_div_f
#if defined(EUROPE)
	add r0, r1, #0x79
	add r0, r0, #0x2400
#elif defined(JAPAN)
	add r0, r1, #0x1a40
#else
	add r0, r1, #0x77
	add r0, r0, #0x2400
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r2, r0
	ldr r1, _020527A4 ; =_020A3200
	mov r0, r4
	bl SprintfStatic__02052418
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020527A4: .word _020A3200
	arm_func_end GetCategoryString
