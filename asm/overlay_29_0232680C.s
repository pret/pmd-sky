	.include "asm/macros.inc"
	.include "overlay_29_0232680C.inc"

	.text

	arm_func_start DoMoveSpite
DoMoveSpite: ; 0x0232680C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r1
	ldr r1, [r5, #0xb4]
	mov r4, #0
#ifdef JAPAN
	add lr, r1, #0x120
#else
	add lr, r1, #0x124
#endif
	mov ip, #1
	mov r6, r0
	mov r7, r4
	mov r3, r4
	mov r1, r4
	mov r0, ip
_02326838:
	ldrb r2, [lr, r7, lsl #3]
	add r8, lr, r7, lsl #3
	tst r2, #1
	movne r2, ip
	moveq r2, r3
	tst r2, #0xff
	beq _02326864
	ldrb r2, [r8]
	tst r2, #0x10
	movne r4, r0
	strneb r1, [r8, #6]
_02326864:
	add r7, r7, #1
	cmp r7, #4
	blt _02326838
	mov r1, r5
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	cmp r4, #0
	beq _0232689C
#ifdef JAPAN
	mov r0, r6
	mov r1, r5
	mov r2, #0xc10
#else
	ldr r2, _023268B4 ; =0x00000ECE
	mov r0, r6
	mov r1, r5
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023268AC
_0232689C:
	ldr r2, _023268B8 ; =0x00000ECF
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023268AC:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_023268B8: .word 0x00000C11
#else
_023268B4: .word 0x00000ECE
_023268B8: .word 0x00000ECF
#endif
	arm_func_end DoMoveSpite
