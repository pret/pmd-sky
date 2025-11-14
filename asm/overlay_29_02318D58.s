	.include "asm/macros.inc"
	.include "overlay_29_02318D58.inc"

	.text

	arm_func_start ov29_02318D58
ov29_02318D58: ; 0x02318D58
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__02318D34
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xb4]
	ldrb r0, [r1, #0xd2]
	cmp r0, #1
	cmpne r0, #0xc
	movne r0, #0
	strneb r0, [r1, #0xd2]
#ifdef JAPAN
	strneb r0, [r1, #0x150]
	strneb r0, [r1, #0x10a]
#else
	strneb r0, [r1, #0x154]
	strneb r0, [r1, #0x10b]
#endif
	mov r0, r4
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02318D58

	arm_func_start SetReflectStatus
SetReflectStatus: ; 0x02318D98
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r5, r2
	bl EntityIsValid__02318E4C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	ldr r4, [r6, #0xb4]
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, r5
	bne _02318DEC
	ldr r2, _02318E40 ; =0x00000CF3
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02318DEC:
	mov r0, r6
	bl ov29_022E3F20
	ldrb r0, [r4, #0xd5]
	cmp r0, #4
	cmpne r0, #0xa
	cmpne r0, #0xf
	beq _02318E20
	ldr r1, _02318E44 ; =SET_REFLECT_STATUS_TURN_RANGE
	mov r0, r6
	mov r2, #0
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r4, #0xd6]
_02318E20:
	ldr r2, _02318E48 ; =0x00000CF2
	mov r0, r7
	mov r1, r6
	strb r5, [r4, #0xd5]
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_02318E40: .word 0x00000A33
_02318E44: .word SET_REFLECT_STATUS_TURN_RANGE
_02318E48: .word 0x00000A32
#else
_02318E40: .word 0x00000CF3
_02318E44: .word SET_REFLECT_STATUS_TURN_RANGE
_02318E48: .word 0x00000CF2
#endif
	arm_func_end SetReflectStatus
